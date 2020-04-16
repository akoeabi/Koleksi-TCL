# Simple *.exe, *.ini, *.vbs, *.bat virus detector

set bantime 10
set cycletime 10
set msg_user 1

timer $cycletime cycle
proc cycle {} {
 global cycletime
 foreach c [channels] {
  putserv "PART $c"; putserv "JOIN $c"; timer $cycletime cycle
 }
}

bind ctcp - DCC got_dcc
proc got_dcc {nick uhost handle dest key arg} {
 global gobtnick bantime msg_user cycletime
 set filename [string tolower [lindex $arg 1]]
 if {[string match "*.exe" $filename] || [string match "*.bat" $filename] || [string match "*.vbs" $filename] || [string match "*.ini" $filename]} {
 set host "*!*[string range $uhost [string first "@" $uhost] end]"
 utimer 15 [newban $host VirusScan "Infected with $filename virus" $bantime]
 foreach c [channels] {
  putkick $c $nick "You're infected with $filename virus"
 } 
 if {$msg_user} {putmsg $nick "You're infected with a virus ($filename) "}
 }
}

putlog "Virus checker by \002Thomas\002"