##################
##  Calculator  ##
##################
bind pub -|- ".calc" pub:hitung

proc pub:hitung {nick uhost hand chan text} {
  global lastbind
  if {[string length [string trim [lindex $text 0]]] == 0} {
    putserv "NOTICE $nick :0,2 Aturan Pakai : $lastbind <math>"
    return 0
  }
  # translate 'x' to '*'
  regsub -all "x" $text "*" math
  # translate 'pi' to the number
  regsub -all "pi" $math "3.1415926535897932" math
  # do not allow brackets!!
  if {![regexp -all {\[} $text] || ![regexp -all {\]} $text]} {
    putserv "PRIVMSG $chan :13»»»4 $text 7=4 [expr $math] 13«««"
  } else {
    putserv "NOTICE $nick :13»»»4 Karakter Error! 13«««"
  } 
  putlog "($lastbind) $nick $uhost in $chan: $text"
}

putlog "+++ U|S|B Calculator TCL Loaded"
