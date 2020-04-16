# [A]nti[S]lap[S]cript
# kicks users who try to slap your bot
# by Konsument@euIRC.net


# you can define as many kick messages as you want here
# one is randomly choosen
bind ctcp - "ACTION" pub_antislap

set aslapr {
  "wataw"
  "wekz"
  "kEna dech"
  "uHuk uhuk ?"
  "wHat!!!"
}

proc pub_antislap { nick uhost hand dest keyword text } {
     global botnick
     global aslapr
     if {[string index $dest 0] != "#"} { return 0 }
     if {[lindex $text 0] == "slaps"} {
      if {[lindex $text 1] == $botnick} {
        putserv "kick $dest $nick :[lindex $aslapr [rand [llength $aslapr]]]"
#       putchan "#df" "[lindex $ranantislap [rand [llength $ranantislap]]]";
      }
     }
 }


putlog "ASS - AntiSlapScript by oOx loaded"
