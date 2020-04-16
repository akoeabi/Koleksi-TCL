## allhop.tcl
##  - hop ( % ) everyone in a channel when they join


# What channels should this work on?
#  - note, "" is for all channels
set ahchan ""

## Begin the code

bind join - * ahjoin

proc ahjoin {nick uhost hand chan} {
 global ahchan botnick
 if {$nick == $botnick} {return 0}
 if {$ahchan == "" && [botisop $chan]} {
  pushmode $chan +o $nick
  return 0
 }
 set chan [string tolower $chan]
 foreach i [string tolower $avchan] {
  if {$i == $chan && [botisop $chan]} {
   pushmode $chan +h $nick
   return 0
  }
 }
}

putlog "Loaded allhop.tcl by Chaos on irc.utchat.com"