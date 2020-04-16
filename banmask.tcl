######################################################################
#                  banmask.tcl v.1.2 by Algol (Jun 2001)
#                          algol@undernet.org
######################################################################
# Allows to define a set of nick!user@host masks that will get a
# *!*@host ban and a specific ban message, will also send a note to a
# specified user of the bot when activated. Useful, for instance,
#  to keep annoying users banned by nick, including variations of it, 
# without adding dozens of bans in the bot.
# Tested on eggdrop 1.6.4
######################################################################

# n!u@h masks that will be get a *!*@host ban
set banmask "*!*someuserid@*.some.host *somenick*!*@1.2.3.*"

# The channels you want this active on
set bmask_chans "#channel_1 #channel_2"

# Ban duration in minutes
set bmask_time 15

# Ban reason
set bmask_reason "Sample ban reason"

# Handle of the bot user that shoud be sent a note
set bmask_notify "somehandle"

##### DON'T edit anything below this line unless you know what you're doing #####

bind nick - * bmask:nick
bind join - * bmask:join
bind raw - 315 bmask:chansynch
bind mode - *+o* bmask:botoped

proc bmask:nick {nick uhost hand chan newnick} {
   global bmask_chans
   set chan [string tolower $chan]
   if {[lsearch -exact $bmask_chans $chan] == -1} {return 1}
   set bmask_check $newnick!$uhost
   set bmask_host "*!*@[lindex [split $uhost @] 1]"
   bmask:ban $newnick $bmask_check $bmask_host $chan
}

proc bmask:join {nick uhost hand chan} {
   global bmask_chans botnick
   set chan [string tolower $chan]
   if {[lsearch -exact $bmask_chans $chan] == -1} {return 1}
   if {$nick == $botnick} {
      return 1
   } else {
      set bmask_check $nick!$uhost
      set bmask_host "*!*@[lindex [split $uhost @] 1]"
      bmask:ban $nick $bmask_check $bmask_host $chan
   }
}


proc bmask:chansynch {from keyw arglist} {
   global bmask_chans
   set chan [string tolower [lindex $arglist 1]]
   if {[lsearch -exact $bmask_chans $chan] == -1} {return 0}
   putlog "synched channel $chan"
   bmask:checknicks $chan
}

proc bmask:botoped {opingnick uhost hand chan mdechg opednick} {
   global bmask_chans
   set chan [string tolower $chan]
   if {[lsearch -exact $bmask_chans $chan] == -1} {return 1}
   bmask:checknicks $chan
}

proc bmask:checknicks {chan} {
   if {![validchan $chan]} {return 0}
   if {[botonchan $chan]} {
      foreach channick [chanlist $chan] {
         set bmask_check $channick![getchanhost $channick $chan]
         set bmask_host "*!*@[lindex [split [getchanhost $channick $chan] @] 1]"
         bmask:ban $channick $bmask_check $bmask_host $chan
      }
   }
}

proc bmask:ban {nick bmask_check bmask_host chan} {
   global banmask bmask_chans bmask_time bmask_reason bmask_notify
   foreach bmask $banmask {
      if {[string match [string tolower $bmask] [string tolower $bmask_check]]} {
          newchanban $chan $bmask_host BanMask "$bmask_reason" $bmask_time
          sendnote BanMask $bmask_notify "÷ banned $bmask_check on $chan, [ctime [unixtime]] ÷"
          if {[botisop $chan]} {
            putserv "MODE $chan -o+b $nick $bmask_host"
            putserv "KICK $chan $nick :$bmask_reason"
          }
          break
      }
   }   
}

putlog "÷ banmask.tcl -v1.2 by Algol- Active: $bmask_chans ÷ Loaded ÷"
set bmask_chans [string tolower $bmask_chans ]
