## allOP.tcl
##  - OP ( @ ) everyone in a channel when they join


# What channels should this work on?
#  - note, "" is for all channels
set avchan ""

## Begin the code

bind join - * aojoin

proc avjoin {nick uhost hand chan} {
 global aochan botnick
 if {$nick == $botnick} {return 0}
 if {$aochan == "" && [botisop $chan]} {
  pushmode $chan +o $nick
  return 0
 }
 set chan [string tolower $chan]
 foreach i [string tolower $avchan] {
  if {$i == $chan && [botisop $chan]} {
   pushmode $chan +o $nick
   return 0
  }
 }
}

putlog "Loaded allop.tcl by Chaos on irc.utchat.com"