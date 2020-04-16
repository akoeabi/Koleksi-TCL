## allvoice.tcl
##  - voices everyone in a channel when they join


# What channels should this work on?
#  - note, "" is for all channels
set avchan ""

## Begin the code

bind join - * avjoin

proc avjoin {nick uhost hand chan} {
 global avchan botnick
 if {$nick == $botnick} {return 0}
 if {$avchan == "" && [botisop $chan]} {
  pushmode $chan +v $nick
  return 0
 }
 set chan [string tolower $chan]
 foreach i [string tolower $avchan] {
  if {$i == $chan && [botisop $chan]} {
   pushmode $chan +v $nick
   return 0
  }
 }
}

putlog "Loaded allvoice.tcl by Chaos on IRC.UTChat.Com"
