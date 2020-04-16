set chanvoice "#lovenet"
bind join - * voice
proc voice {nick uhost hand chan} {
  global chanvoice
  if {$chan == $chanvoice} {
    putserv "MODE $chanvoice +v $nick"
  }
  return 1
}
putlog "+++ Yaya AutoVoice TCL Loaded"
