
bind pub - !ping ping_me
bind pub - ping! ping_me
bind pub - ping ping_me
bind ctcr - PING ping_me_reply

proc ping_me {nick uhost hand chan arg} {
  global pingchan     
     putserv "PRIVMSG $nick :\001PING [unixtime]\001"
     set pingwho 1
     set pingchan $chan
     return 1     
}
proc ping_me_reply {nick uhost hand {dest ""} key arg} {
  global botnick pingchan  
    if {$dest == ""} {set dest $botnick}

    if {$dest == $botnick} {
    puthelp "NOTICE $nick  :\002\0032b\002\00314\002\037d\037\002\003 \002Your\002 ping reply : \002[expr [unixtime] - $arg]\002 secs ($nick)"
    }
}
putlog "bdping - loaded"
