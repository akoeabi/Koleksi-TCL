set trigger "!advertise"
set header "\[\002Advertise\002\]"
set adv_time "00:00 23:59"
set adv_days "Sunday"
set adv_file "/home/deejay/eggdrop/advertise.db"
set adv_chans "#VPS"
set adv_timer "90"
set no_adv "#makmur"

bind pub m $trigger send:adv

proc adv:timer {} {
  global adv_timer
  if {[timerexists adv:do] == ""} { timer $adv_timer adv:do }
}

adv:timer

proc send:adv {nick chan host handle text} {
  global no_adv adv_chans header
  set schan [string trim $chan "#+&!"]
  set msg "[advmsg]"
  if {[string tolower $adv_chans] == "all"} {
    foreach channel [channels] {
      if {![string match *[lindex $channel 0]* $no_adv]} {
        if {$header == ""} {
          putserv "PRIVMSG $channel :$msg"
        } else { putserv "PRIVMSG $channel :$header $msg" }
      }
    }
  } else {
    foreach channel $adv_chans {
      if {![string match *[lindex $channel 0]* $no_adv]} {
        if {$header == ""} {
          putserv "PRIVMSG $channel :$msg"
        } else { putserv "PRIVMSG $channel :$header $msg" }
      }
    }
  }
}

proc adv:do {} {
  global adv_chans adv_timer adv_time no_adv header
  set msg "[advmsg]"
  if {[string tolower $adv_chans] == "all"} {
    foreach channel [channels] {
      if {![string match *[lindex $channel 0]* $no_adv]} { putserv "PRIVMSG $channel :$header $msg" }
    }
  } else {
    foreach channel $adv_chans {
      if {![string match *[lindex $channel 0]* $no_adv]} { putserv "PRIVMSG $channel :$header $msg" }
    }
  }
  adv:timer
}

proc advmsg {} {
  global adv_file adv_from adv_to adv_time
  set first "[lindex [split "$adv_time"] 0]"
  set second "[lindex [split "$adv_time"] 1]"
  set time [strftime %H%M]
  if {$time <= "[string map {{:} {}} $second]" || $time >= "[string map {{:} {}} $first]"} {
    set x ""
    while {$x == ""} {
      set f [open $adv_file]
      set l [split [read $f] \n]
      close $f
      set n [rand [llength $l]]
      if {[set x [lindex $l $n]]!=""} {return "$x"}
    }
  }
}