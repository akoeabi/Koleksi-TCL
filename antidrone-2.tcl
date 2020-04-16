proc clone:check {nick uhost hand chan} {

if {![channel get $chan dronecheck]} {return}
if { [matchattr $hand f|f $chan]} {return}
  global punished
  puthelp "PRIVMSG $nick :\00305-ATENTIE-\003 Sunt un bot oficial al canalului $chan si verific ai SIDA :)) sau daca faci reclama pe privat luatear dreaq de mircar =))! \002\00304Nu\002\003 raspunde la acest mesaj deoarece vei fi considerat virusat si vei primi ban buhahaha :))! "
  puthelp "PRIVMSG $nick :\00305-ATENTIE-\003 Pe acest canal nu poti face reclama cacat cu ochi ce esti, injura sau face abuse ( flood, join-part, etc ). Pentru orice problema, neclaritate sau pura curiozitate intreaba pe $chan iar cineva te va ajuta. Multumim si iti uram un chat placut! "
  set punished($nick,$uhost) "$chan"
  timer 1 [list unset punished($nick,$uhost)]

}
proc pub:clone:execute {nick uhost hand arg} {
  
  global punished botnick
  if {[info exists punished($nick,$uhost)] } {
        set ban "*!*@[lindex [split $uhost @] 1]"
        newchanban $punished($nick,$uhost) $ban $botnick "Pe acest canal nu pot sta persoanele care fac reclama pe privat sau sunt virusate. Tocmai ai fost banat pentru 5 minute. Multumim pt intelegere." 5m amsg

    }
}