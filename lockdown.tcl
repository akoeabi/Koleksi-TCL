#################################################################################################################################################################
#THIS IS SCRIPT IS MADE BY COMPUTERTECH#                                                                                                                                                  
#################################################################################################################################################################
#Have A Script Request Use The Contact Options Below#
#####################################################
#CONTACT OPTIONS                                    
#
#ComputerTech
#IRC IRC.FREENODE.NET ##COMPUTERTECH123             
#EMAIL COMPUTERTECH312@GMAIL.COM                    
#GitHub page : https://github.com/computertech312
#
#####################################################
#ComputerTech Productions                           #
#####################################################
#Commands
#
# +999 To Activate The LockMode
# -999 To DeActivate The LockMode
# .clonescan to activate kickban scan
# !masskick  kicks everyone not oped off the channel
#
#################################################################################################################################################################
# START OF EDITING
#################################################################################################################################################################

Here you set the maximum number of clones to which the bot will act according to the configuration

set scn(maxclone) "3"

# Here you set the time frame in which the bot will scan the clone channel

set scn(time) "1"

#Set here what flags the clone scan command can activate. ( .clonescan )

set scn(flags) "o|o"

#Set to 1 for kickban 
#Set to 0 for notify

set scn(what) "0"

#If you set to scn (what) "1" set the reason for the kickban here.

set scn(reason) "This host% host% has exceeded the number of clones accepted on %chan%. For more info contact Operators."

#If you have set to scn (what) "1" set here the duration of the money. (minute)

set scn(btime) "30"
#################################################################################################################################################################
#END OF EDITING # NO EDTING NEEDED BELOW
#################################################################################################################################################################


bind pub  -  "+999"  do_lock_mode

bind pub  -  "-999"  do_unlock_mode

bind pub $scn(flags) .clonescan scanner
setudef flag clonescan


bind pub n|m !masskick massk



proc do_lock_mode {nick ushost handle chan text} {

if {![botisop $chan]} {
		putserv "privmsg $chan :/<pssst!/>  I'm not op'd  "
		return 0
	}

if {![isop $nick $chan]} {
		putserv "privmsg $chan :Sorry $nick, but you are not op'd in $chan right now"
		return 0
	}

           

putserv "mode $chan +imVk lock"


                         }


proc do_unlock_mode {nick ushost handle chan text} {

if {![botisop $chan]} {
		putserv "privmsg $chan :/<pssst!/>  I'm not op'd  "
		return 0
	}

if {![isop $nick $chan]} {
		putserv "privmsg $chan :Sorry $nick, but you are not op'd in $chan right now"
		return 0
	}

           
putserv "mode $chan -imVk lock"
                        
                   }


if {![info exists clonescanner_running]} {
	timer $scn(time) clonescan:timer
	set clonescanner_running 1
}


proc scanner {nick host hand chan arg} {
	global scn
	array set clones [list]
	clonescan:act $chan $nick $hand 0 0
}

proc clonescan:timer {} {
	global scn
	set type 1
	set channels ""
	foreach chan [channels] {
		if {[validchan $chan] && [channel get $chan clonescan]} {
			lappend channels $chan
		}
	}
	if {$channels != ""} {
		clonescan:act $channels "nick" "chan1" 1 0
	}
}

proc clonescan:act {channels nick hand type counter} {
	global scn botnick
	set chan [lindex $channels $counter]
	set cc [expr $counter + 1]
	set found_clones 0
	set found_mask ""
	set theclones ""
	array set clones [list]
	if {$chan != ""} {
		set replace(%chan%) $chan
		foreach user [chanlist $chan] {
			set host [string tolower [lindex [split [getchanhost $user $chan] @] 1]]
			if {[string match "*undernet.org*" $host]} {
				continue
			}
			set replace(%host%) $host
			lappend clones($host) $user
		}
		foreach clone [array names clones] {
			set userlist [join $clones($clone)]
			if {[llength [split $userlist]] >= $scn(maxclone)} {
				set found_clones 1
				lappend found_mask $clone
				lappend theclones $clones($clone)
				if {$type == "0"} {
					putserv "PRIVMSG $nick :We Found [llength [split $userlist]] clone on $chan from the host $clone. these are9: [join $clones($clone) ", "]"
				}
			}
		}
		if {$found_clones == "1"} {
			if {$type == "1"} {
				putserv " @$chan :[llength [split $theclones]] $found_mask. These are: [join $theclones " ,"]"
			}
			if {$scn(what) == "1"} {
				foreach m $found_mask {
					set mask "*!*@$m"
					set replace(%chan%) $chan
					set reason [string map [array get replace] $scn(reason)]
					newchanban $chan $mask $botnick $reason $scn(btime)
				}
			}
		}
	}
	if {([lindex $channels $cc] != "") && ($type == "1")} {
		utimer 5 [list clonescan:act $channels $nick $hand $type $cc]
	}
	if {($type == "0") && ($found_clones == "0")} {
		putserv "PRIVMSG $chan :\005\[BT\]\005 We didn't find clones on $chan."
	}
}


proc massk {nick host hand chan var} {
 global botnick
 if {$var != ""} { set reason $var } else { set reason "cleaning up channel" }
 if {[isop $botnick $chan]} {
  putlog "masskick activated on $chan by $nick!"
  putquick "MODE $chan +im"
  timer 2 "puthelp \"MODE $chan -im\""
  foreach user [chanlist $chan] { 
   if {![isop $user $chan] && ![matchattr [nick2hand $user $chan] b|b $chan] && ![matchattr [nick2hand $user $chan] o|o $chan]} {
    putkick $chan $user $reason 
   } 
  }
 } else { puthelp "NOTICE $nick :Gimme ops first!" }
}

putlog "lockdown.tcl Created By ComputerTech Loaded Successfully" 

#################################################################################################################################################################
#CREATED BY COMPUTERTECH
#################################################################################################################################################################

