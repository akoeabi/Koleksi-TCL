bind ctcp - "ACTION" pub_antislap
set slapampun {
  "ready boss, there someone i have to fack ?"
  "Keske tu Fait !?!"
  "what up boss !!, why you slap me dont you know that i have a date ?"
  "i am here, is there a pretty girl ?"
  "Qui est-ce qui me dérange ?"
}
set slapkick {
  "Never slap me"
  "Ta vu ! ... dont slap me"
  "yeeeeaaaaahhhhhhhhhh."
  }
set slapbos {
  "«15,19Héhé ! what are you trying to do ?15»"
  "«15,19Relaxxxxxxx....15»"
  "«15,19NeVer Try This ...15»"
  "«15,19Damned my boss still have a date dont disturb15»"
  "«15,19Site On The Corner ....15»"
  "«15,19My Eyes On You !15»"
}
proc pub_antislap { nick uhost hand dest keyword text } {
     global botnick slapampun slapkick slapbos
     set text [string tolower $text]

     if {[string index $dest 0] != "#"} { return 0 }
     if {[lindex $text 0] == "slaps" || [lindex $text 0] == "slap"} {
       if {$nick == "kermit" || $nick == "voltage"} {
         if {[lindex $text 1] == $botnick} {
           putserv "privmsg $dest :[lindex $slapampun [rand [llength $slapampun]]]"
           return 0
         }
         return 0
       }
       if {[lindex $text 1] == $botnick} {
          putserv "kick $dest $nick :1[lindex $slapkick [rand [llength $slapkick]]]"
          return 0
       }
       if {[lindex $text 1] == "kermit" || [lindex $text 1] == "voltage"} {
          putserv "kick $dest $nick :1[lindex $slapbos [rand [llength $slapbos]]]"
          return 0
       }
       return 0
     }
 }
putlog "niponslap loaded"