set service(name) "BadChan.eLiXiR.net"
set service(serveur) "127.0.0.1"
set service(port) "4400"
set service(pass) "link"
set service(info) "BadChan Searcher"
set service(chan) "#BadChan"
set service(version) "1.0"
set service(debug) "0"
set service(nick) "ChanCleaner"

bind dcc X +badchan pbc:dcc
proc pbc:dcc {nick idx arg} {
global service botnick
set fichier [open badchan.txt a]
set addchan [lindex [string tolower $arg] 0]
if {$addchan==""} {
putdcc $idx "\002Erreur!\002 Vous devez spécifier un salon à ajouter à la liste!"
return 0
}
if {[isin $arg $fichier]=="1"} {
putdcc $idx "Le Salon\002 $addchan \002est déjà dans la liste des BadChan."
return 0
}
puts $fichier "$addchan"
close $fichier
putdcc $idx "Le Salon\002 $addchan \002a été ajouté à la liste des BadChan"
return 0
}

proc isin {text file} {
catch {open badchan.txt r} db
set found -1
while {![eof $db]} {
gets $db y
if {"$y"=="$text"} {
set found 1
break
}
}
catch {close $db}
return $found
}

proc delchr {text} {
set z {}
catch {open badchan.txt r} dat
while {![eof $dat]} {
set stdin [string tolower [gets $dat]]
if {$stdin!="$text" && $stdin != ""} {
lappend z "$stdin"
}
}
catch {close $dat}
set g [open badchan.txt w+]
foreach q $z {
puts $g "$q"
}
close $g
}

bind dcc X leave leave:dcc
proc leave:dcc {nick idx arg} {
global service botnick
set cleave [lindex $arg 0]
putdcc $service(idx) ":$service(nick) PART $cleave"
return 0
}

bind dcc X -badchan mbc:dcc
proc mbc:dcc {nick idx arg} {
global service botnick
set fichier [open badchan.txt a]
set delchan [lindex [string tolower $arg] 0]
if {$delchan==""} {
putdcc $idx "\002Erreur!\002 Vous devez spécifier un salon à supprimer de la liste!"
return 0
}
if {![isin $delchan $fichier]=="-1"} {
putdcc $idx "\002Erreur!\002 Le Salon\002 $delchan \002n'est pas dans la liste!"
return 0
}
delchr $delchan
putdcc $idx "Le Salon\002 $delchan \002 a été supprimé de la liste des BadChan."
return 0
}

bind dcc X bconnect services_dcc
proc services_dcc {arg idx} {
  global service
  set service(idx) [connect $service(serveur) $service(port)]
  putdcc $service(idx) "PASS $service(pass)"
  putdcc $service(idx) "SERVER $service(name) 1 [unixtime] [unixtime] J09 :$service(info)"
  putdcc $service(idx) ":$service(name) NICK $service(nick) 1 1 $service(nick) $service(name) $service(name) :BadChan Searcher"
  putdcc $service(idx) ":$service(nick) MODE $service(nick) +owsgzi"
  putdcc $service(idx) ":$service(nick) JOIN $service(chan)"
  putdcc $service(idx) ":$service(nick) MODE $service(chan) +o $service(nick) 0"
  putdcc $service(idx) ":$service(nick) MODE $service(chan) +isnt 0"
  utimer 30 check_connect
}


proc services_control {idx arg} {
  global service
  if {$service(debug)=="0"} { putdcc $service(idx) ":$service(nick) privmsg $service(chan) :$arg" }

    regsub -all {\\} $arg {\\\\} arg
    regsub -all {\{} $arg {\{} arg
    regsub -all {\}} $arg {\}} arg
    regsub -all {\]} $arg {\]} arg
    regsub -all {\[} $arg {\[} arg
    regsub -all {\"} $arg {\"} arg
    regsub -all {\`} $arg {\`} arg

  set fichier [open badchan.txt a]
  set arg1 [lindex $arg 0]
  set arg2 [lindex $arg 1]
  set arg3 [lindex $arg 2]

  if {$arg2=="PRIVMSG"} {
  }
  if {$arg2=="315"} {
  }
  if {$arg2=="TOPIC"} {
  }
  if {$arg2=="NOTICE"} {
  }
  if {$arg2=="MOTD"} {
  }
  if {$arg2=="KILL"} {
  }
  if {$arg2=="SILENCE"} {
  }
  if {$arg2=="NICK"} {
  }
  if {$arg2=="MODE"} {
  }
  if {$arg2=="KICK"} {
  }
  if {$arg2=="SETIDENT"} {
  }
  if {$arg2=="SETHOST"} {
  }
  if {$arg2=="PART"} {
  }
  if {$arg2=="JOIN"} {
  if {[isin $arg3 $fichier]=="1"} {
  set temp [string trim $arg1 :]
  set defraison "Salon à accès non-autorisé! Merci d'en choisir un autre."
putdcc $service(idx) ":$service(nick) JOIN $arg3"
putdcc $service(idx) ":$service(nick) MODE $arg3 +ois $service(nick) 0"
putdcc $service(idx) ":$service(nick) MODE $arg3 +b *!*@*"
putdcc $service(idx) ":$service(nick) KICK $arg3 $temp :Salon à accès non-autorisé! Merci de ne plus joindre ce salon."
close $fichier
return 0
  }
  }
  if {$arg2=="LUSERS"} {
  }
  if {$arg2=="TRACE"} {
  }
  if {$arg2=="VERSION"} {
  }
  if {$arg2=="NAMES"} {
  }
  if {$arg2=="STATS"} {
  }
  if {$arg2=="315"} {
  }
  if {$arg2=="352"} {
  }
  if {$arg2=="SQUIT"} {
  }
  if {$arg2=="SERVER"} {
  }
  if {$arg2=="MODE"} {
  }
  if {$arg1=="PING"} {
    putdcc $idx "PONG $arg2"
    return 0
  }
}


proc do_connect {} {
  global service
  set service(idx) [connect $service(serveur) $service(port)]
  putdcc $service(idx) "PASS $service(pass)"
  putdcc $service(idx) "SERVER $service(name) 1 [unixtime] [unixtime] J09 :$service(info)"
  control $service(idx) services_control
  putdcc $service(idx) ":$service(name) NICK $service(nick) 1 1 $service(nick) $service(name) $service(name) :BadChan Searcher"
  putdcc $service(idx) ":$service(nick) MODE $service(nick) +owsgiz"
  putdcc $service(idx) ":$service(nick) JOIN $service(chan)"
  putdcc $service(idx) ":$service(nick) MODE $service(chan) +ontis $service(nick)"
  putdcc $service(idx) ":$service(nick) WALLOPS :Hello world"
  utimer 30 check_connect
}


proc check_connect {} {
  global service
  putdcc $service(idx) ":$service(nick) JOIN $service(chan)"
  if {[valididx $service(idx)]} {
    utimer 30 check_connect
    return 0
  }
  do_connect
}

proc valididx {idx} {
  set r 0
  foreach j [dcclist] {
    if {[lindex $j 0] == $idx} {
      set r 1
    }
  }
  return $r
}
if {![info exists service(idx)]} {do_connect}


putlog "BadChan.tcl by X-SlydEr"
