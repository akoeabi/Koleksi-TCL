namespace eval av {
  variable version "2.0.001"
  bind PUB  m|m "*autovoice" [namespace current]::toggle
  bind JOIN -|- *            [namespace current]::join
  bind TIME -|- "?0 * * * *" [namespace current]::time
  bind RAW  -|- "355"        [namespace current]::hidden
  setudef flag avall
  namespace export flush join toggle time hidden clean
}

proc av::flush {nickname channel} {
  if {[onchan $nickname $channel] && [botisop $channel] && ![isvoice $nickname $channel]} {
    pushmode $channel +v $nickname
  }
}

proc av::join {nickname hostname handle channel} {
  if {([channel get $channel avall]) && (![isbotnick $nickname]) && ([botisop $channel])} {
    utimer 9 [list av::flush $nickname $channel]
  }
}

proc av::toggle {nickname hostname handle channel arguments} {
  set arguments [clean $arguments]
  switch [lindex $arguments 0] {
    on {
      channel set $channel +avall
      putquick "NOTICE $nickname :Autovoice activated successfully."
    }
    off {
      channel set $channel -avall
      putquick "NOTICE $nickname :Autovoice deactivated successfully."
    }
    default {
      if {[channel get $channel avall]} {
        putquick "NOTICE $nickname :Autovoice is currently activated."
      } else {
        putquick "NOTICE $nickname :Autovoice is currently deactivated."
      }
    }
  }
}

proc av::time {args} {
  foreach channel [channels] {
    if {![channel get $channel avall] || ![string match -nocase "*d*" [lindex [split [getchanmode $channel]] 0]]} {
      continue
    }
    putquick "NAMES -d $channel"
  }
}

proc av::hidden {server rawid text} {
  if {[regexp -- {^(\S+)\s(=|@)\s(\S+)\s:(.*)$} $text -> * bot channel users]} {
    if {[validchan $channel]} {
      set users [clean $users]
      foreach user [chanlist $channel] {
        if {![isvoice $user $channel]} {
          lappend users $user
        }
      }
      set count 0
      if {[llength $users] >= 1} {
        while {$count < [llength $users]} {
          putquick "MODE $channel +v+v+v+v+v+v [lindex $users $count] [lindex $users [expr $count + 1]] [lindex $users [expr $count + 2]] [lindex $users [expr $count + 3]] [lindex $users [expr $count + 4]] [lindex $users [expr $count + 5]]"
          incr count 6
        }
      }
      return 1
    }
  }
  return 0
}

proc av::clean {i} {
  return [regsub -all -- {([\(\)\[\]\{\}\$\"\\])} $i {\\\1}];
}

putlog "Script loaded: autovoice by perpleXa"
