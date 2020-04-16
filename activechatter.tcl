##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set autovoice(owner) "abah" 

# location
set autovoice(country) "Indonesia"
set autovoice(state) "Makassar"

# Update
set autovoice(update) "09.08.2010"

# Version
set autovoice(version) "20.10"

# End configuration

putlog "## ..:: Initializing activevoice TCL ::... ##"

##############################################
### Start configuring variables from here! ###
##############################################

#Set the channels you would like this script to work on.
#USAGE: [1/2] (1=User defined channels, 2=All channels the bot is on)
set autovoice(chantype) "2"

#SET THIS ONLY IF YOU HAVE SET THE PREVIOUS SETTING TO '1'.
#USAGE: set autovoice(channels) "#channel1 #channel2 #mychannel"
set autovoice(chans) "#mychannel #yourchannel"

#Set the 'number of lines' here after which a user will be voiced for being
#an ACTIVE CHATTER. Only channel messages will be counted for activity.
set autovoice(lines) "3"

#Set the time here in 'minutes' after which you would like to devoice idlers (UNACTIVE
#CHATTERs). Users idling for more than this number of minute(s) will be devoiced.
#If you wish yo disable this setting, set it to: "0"
#USAGE: Any numerical integer value.
set autovoice(dvtime) "30"

#SET THIS ONLY IF YOU HAVE ENABLED (UNACTIVE CHATTER) DEVOICING FOR IDLERS
#Set the time here in 'minutes' after which you would continuously like to check
#channel voices for idling. It is better to set this value low for good accuracy.
#USAGE: Any numerical integer value.
set autovoice(dvcheck) "3"

#ACTIVE-CHATTER (VOICE) EXEMPT NICKS 
#Set the list of nicks here which you would like to be exempted from being
#autovoiced by the script. Place separate each entry by placing it in a new line.
set autovoice(avexempt) {
nick1:#channel1
nick2:#channel2
nick3:#channel3
}

#UNACTIVE-CHATTER (DEVOICE) EXEMPT NICKS
#Set the list of nicks here which you would like to be exempted from being
#devoiced by the script. Place separate each entry by placing it in a new line.
set autovoice(dvexempt) {
nick1:#channel1
nick2:#channel2
nick3:#channel3
}

#SET THE TEXT TO DISPLAY IN THE +V (VOICING) MODE
#Set the text to display while voicing the active chatters. This text will be
#displayed when removing the channel key (mode: -k). Control codes such as
set autovoice(voicemode) "9ActiveChatter"

#SET THE TEXT TO DISPLAY IN THE -V (DE-VOICING) MODE 
#Set the text to display while devoicing the idle chatters. This text will be
#displayed when removing the channel key (mode: -k). Control codes such as
set autovoice(devoicemode) "4UnActiveChatter"

#############################################################
### Congratulations! Script configuration is now complete ###
#############################################################

set autovoice(auth) "\x61\x77\x79\x65\x61\x68"
set autovoice(ver) "v3.80.b"

bind pubm - "*" autovoice:users
bind join - "*" autovoice:erase:record
if {$autovoice(dvtime) > 0} {bind time - "*" autovoice:devoice:idlers}

proc autovoice:users {nick uhost hand chan text} {
 global autovoice voice
 if {($autovoice(chantype) == 1) && ([lsearch -exact [split [string tolower $autovoice(chans)]] [string tolower $chan]] == -1)} { return 0 }
 if {[isbotnick $nick] || [isop $nick $chan] || [isvoice $nick $chan]} { return 0 }
 set exemptlist [list]
 foreach nickchan $autovoice(avexempt) {
  lappend exemptlist $nickchan
 }
 if {[llength $exemptlist] > 0} {
  foreach nickchan $exemptlist {
   if {[string equal -nocase $nickchan $nick] || ([string equal -nocase [lindex [split $nickchan :] 0] $nick] && [string equal -nocase [lindex [split $nickchan :] 1] $chan])} {
     return 0
     }
   }
 }
 set user [split [string tolower $nick:$chan]]
 if {![info exists voice($user)] && ![isvoice $nick $chan] && ![isop $nick $chan]} {
   set voice($user) 0
 } elseif {[info exists voice($user)] && ([expr $voice($user) + 1] >= $autovoice(lines)) && ![isop $nick $chan] && ![isvoice $nick $chan]} {
   utimer 3 [list autovoice:delay $nick $chan]
   unset voice($user)
 } elseif {[info exists voice($user)]} {
   incr voice($user)
  }
}

proc autovoice:delay {nick chan} {
 global autovoice voice
 set user [split [string tolower $nick:$chan]]
 if {[botisop $chan] && [onchan $nick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
  pushmode $chan +v $nick
  set voiced($user) 1
 }
 if {[info exists voiced($user)]} {
  pushmode $chan -k $autovoice(voicemode)
  flushmode $chan
  }
}

proc autovoice:erase:record {nick uhost hand chan} {
 global autovoice voice
 if {($autovoice(chantype) == 1) && ([lsearch -exact [split [string tolower $autovoice(chans)]] [string tolower $chan]] == -1)} { return 0 }
 if {[isbotnick $nick]} { return 0 }
 set user [split [string tolower $nick:$chan]]
 if {[info exists voice($user)]} { unset voice($user) }
}

proc autovoice:devoice:idlers {m h d mo y} {
 global autovoice voice
 if {([scan $m %d]+([scan $h %d]*60)) % $autovoice(dvcheck) == 0} {
 switch -exact $autovoice(chantype) {
  1 { set chans [split $autovoice(chans)] }
  2 { set chans [channels] }
  default { return 0 }
 }
 foreach chan $chans {
  set chan [string tolower $chan]
  foreach user [chanlist $chan] {
   set user [split [string tolower $user]]
   if {[info exists exempt]} { unset exempt }
   if {[botonchan $chan] && ![isbotnick $user] && ![isop $user $chan] && [isvoice $user $chan]} {
   set exemptlist [list]
   foreach nickchan $autovoice(dvexempt) {
    lappend exemptlist $nickchan
   }
   if {[llength $exemptlist] > 0} {
    foreach nickchan $exemptlist {
     if {[string equal -nocase $nickchan $user] || ([string equal -nocase [lindex [split $nickchan :] 0] $user] && [string equal -nocase [lindex [split $nickchan :] 1] $chan])} {
      set exempt 1; break
      }
     }
    }
    if {[botonchan $chan] && ![info exists exempt] && ([getchanidle $user $chan] >= $autovoice(dvtime))} {
     pushmode $chan -v $user
     if {![info exists devoice($chan)]} {
      set devoice($chan) 1
      }
    } else {
     continue
    }
   } else {
    continue
    }
  }
  if {[info exists devoice($chan)]} {
   pushmode $chan -k $autovoice(devoicemode)
   flushmode $chan
   }
  }
 }
}

putlog "TCL Name : TCL Activevoice edited by $autovoice(owner) $autovoice(country) $autovoice(state) version $autovoice(version) update $autovoice(update)"
putlog "Running : Server $network"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"