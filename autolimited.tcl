# Auto-limit 0.69 by perpleXa.
# This script is actually a clone of Q's auto-limit feature (+c).
# It must not be used in conjunction with chanmode +D (auditorium mode).
# Type $autolimt in a channel for more info..


bind msg  -|- "autolimit"  autolimit:msg
bind join -|- *            autolimit:join

setudef str "autolimit"

proc autolimit:start {} {
  foreach channel [channels] {
    if {[channel get $channel "autolimit"] == ""} {
      channel set $channel "autolimit" "0"
    }
  }
  utimer 60 autolimit
}

proc autolimit:join {nickname hostname handle channel} {
  if {![isbotnick $nickname]} {
    return 0
  }
  if {[channel get $channel "autolimit"] == ""} {
    channel set $channel "autolimit" "0"
  }
}

proc autolimit:msg {nickname hostname handle arguments} {
  global botnick
  set argumentc [llength $arguments]
  regsub -all -- {([\(\)\[\]\{\}\$\"\\])} $arguments {\\\1} arguments
  set channel [lindex $arguments 0]
  set option [lindex $arguments 1]
  if {$channel == ""} {
    putquick "NOTICE $nickname :You forgot the channel parameter"
    putquick "NOTICE $nickname :/msg $botnick AUTOLIMIT #channel        - View current auto-limit"
    putquick "NOTICE $nickname :/msg $botnick AUTOLIMIT #channel #inc   - Set a new auto-limit"
    return 0
  } elseif {![validchan $channel]} {
    putquick "NOTICE $nickname :Channel $channel is unknown."
    return 0
  } elseif {![matchattr $handle n|m $channel]} {
    putquick "NOTICE $nickname :You do not have sufficient access on $channel to use autolimit."
    return 0
  }
  set users [llength [chanlist $channel]]
  if {$argumentc < 2} {
    set currentlimit [channel get $channel "autolimit"]
    if {$currentlimit > 0} {
      putquick "NOTICE $nickname :Current auto-limit is: [channel get $channel "autolimit"]"
    } else {
      putquick "NOTICE $nickname :Argument should start with a '#' and a digit. (eg. #10 or on|off)"
    }
    return 0
  }
  if {([regexp -nocase -- {^(#[0-9]+|off|on)$} $option tmp result])} {
    switch -- $result {
      on {
        channel set $channel "autolimit" "10"
        putquick "MODE $channel +l [expr $users + 10]"
        putquick "NOTICE $nickname :Auto-limit is changed to: 10"
      }
      off {
        channel set $channel "autolimit" "0"
        putquick "MODE $channel -l *"
        putquick "NOTICE $nickname :Done. Auto-limit disabled successfully."
      }
      default {
        set result [string trimleft $result #0]
        if {($result < 2)} {
          set result 2
        } elseif {($result > 500)} {
          set result 500
        }
        channel set $channel "autolimit" "$result"
        putquick "MODE $channel +l [expr $users + $result]"
        putquick "NOTICE $nickname :Auto-limit is changed to: $result"
      }
    }
  } else {
    putquick "NOTICE $nickname :Argument should start with a '#' and a digit. (eg. #10 or on|off)"
  }
}

proc autolimit {} {
  if {![string match *autolimit* [utimers]]} {
    utimer 60 autolimit
  }
  foreach channel [channels] {
    set autolimit [channel get $channel "autolimit"]
    if {(![botisop $channel]) || ($autolimit == "0")} {
      continue
    }
    set users [llength [chanlist $channel]]
    set newlimit [expr $users + $autolimit]
    set chanmodes [getchanmode $channel]
    if {[string match *l* [lindex $chanmodes 0]]} {
      regexp -- {\S\s([0-9]+)} $chanmodes tmp currentlimit
    } else {
      set currentlimit 0
    }
    if {$newlimit == $currentlimit} {continue}
    # raise the limit
    if {$newlimit > $currentlimit} {
      set difference [expr $newlimit - $currentlimit]
    # lower the limit
    } elseif {$newlimit < $currentlimit} {
      set difference [expr $currentlimit - $newlimit]
    }
    if {($difference <= [expr round($autolimit * 0.5)])} {
      continue
    }
    putquick "MODE $channel +l $newlimit"
  }
}

autolimit:start

putlog "Script loaded: auto-limit by perpleXa"
