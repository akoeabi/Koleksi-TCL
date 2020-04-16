###[INFO OWNER]###
set TCL "ChanStats Users" 
set owner "abah" 
set country "Indonesia"
set state "Makassar"
set versi "20.10"
set update "09.08.2010"
set mail "abah@ukhuwah.net"

###[SETUP]###
putlog "AssaLamu`aLaikum WarahmatuLLah Please wait... loading $TCL (C) 1978 by abah..."

set vChanstatsTrigger "!"
set vChanstatsStatus(rank) 1
set vChanstatsStatus(stats) 1
set vChanstatsStatus(top10) 1
set vChanstatsStatus(top20) 1
set vChanstatsStatus(tstats) 1
set vChanstatsStatus(zapstats) 9
set vChanstatsColor(arrow) 03
set vChanstatsColor(compliance) 10
set vChanstatsColor(dimmed) 14
set vChanstatsColor(errors) 04
set vChanstatsColor(events) 07
set vChanstatsAuto 1
set vChanstatsZapAllowed 1
set vChanstatsEventsSave 20
set vChanstatsScheduleSave 10
set vChanstatsIdleDays 2
set vChanstatsPutlog 1
set vChanstatsGuest 0

if {![regexp {^[-,.!$&?~;:'%^*]{1}$} $vChanstatsTrigger]} {
  die "configuration error in chanstats.tcl - illegal command trigger character"
}

foreach status [array names vChanstatsStatus] {
  if {![string is integer -strict $vChanstatsStatus($status)]} {
    die "configuration error in chanstats.tcl - illegal user status value (not an integer)"
  } else {
    if {($vChanstatsStatus($status) < 1) || ($vChanstatsStatus($status) > 9)} {
      die "configuration error in chanstats.tcl - illegal user status value (out of permitted range)"
    }
  }
}

foreach color [array names vChanstatsColor] {
  if {![string is integer -strict $vChanstatsColor($color)]} {
    die "configuration error in chanstats.tcl - illegal text color value (not an integer)"
  } else {
    if {($vChanstatsColor($color) < 0) || ($vChanstatsColor($color) > 15)} {
      die "configuration error in chanstats.tcl - illegal text colour value (out of permitted range)"
    }
  }
}

if {![string is boolean -strict $vChanstatsAuto]} {
  die "configuration error in chanstats.tcl - illegal auto channel setting variable (not boolean)"
}

if {![string is boolean -strict $vChanstatsZapAllowed]} {
  die "configuration error in chanstats.tcl - illegal reset allowed variable (not boolean)"
}

if {![string is integer -strict $vChanstatsEventsSave]} {
  die "configuration error in chanstats.tcl - illegal events save value (not an integer)"
} else {
  if {($vChanstatsEventsSave < 10) || ($vChanstatsEventsSave > 50)} {
    die "configuration error in chanstats.tcl - illegal events save value (out of permitted range)"
  }
}

if {![string is integer -strict $vChanstatsScheduleSave]} {
  die "configuration error in chanstats.tcl - illegal events save value (not an integer)"
} else {
  if {($vChanstatsScheduleSave < 5) || ($vChanstatsScheduleSave > 25)} {
    die "configuration error in chanstats.tcl - illegal events save value (out of permitted range)"
  }
}

if {![string is integer -strict $vChanstatsIdleDays]} {
  die "configuration error in chanstats.tcl - illegal events save value (not an integer)"
} else {
  if {($vChanstatsIdleDays < 2) || ($vChanstatsIdleDays > 10)} {
    die "configuration error in chanstats.tcl - illegal events save value (out of permitted range)"
  }
}

if {![string is boolean -strict $vChanstatsPutlog]} {
  die "configuration error in chanstats.tcl - illegal putlog variable (not boolean)"
}

if {![string is boolean -strict $vChanstatsGuest]} {
  die "configuration error in chanstats.tcl - illegal guest accrue variable (not boolean)"
}

set vChanstatsVersion 1.3.0

utimer 3 [list channel set #medan +chanstats]

proc pChanstatsTrigger {} {
  global vChanstatsTrigger
  return $vChanstatsTrigger
}

array set vChanstatsFlag {
  2 p|
  3 o|o
  4 o|
  5 m|m
  6 m|
  7 n|n
  8 n|
}

array set vChanstatsName {
  2 "partyline"
  3 "channel operator"
  4 "global operator"
  5 "channel master"
  6 "global master"
  7 "channel owner"
  8 "global owner"
}

set vChanstatsCount 0

bind EVNT - connect-server pChanstatsLoad
bind EVNT - disconnect-server pChanstatsSave
bind EVNT - init-server pChanstatsInit
bind JOIN - * pChanstatsJoinAuto

bind CTCP - ACTION pChanstatsCtcpInput
bind KICK - * pChanstatsKickInput
bind MODE - "#*+b" pChanstatsModeInput
bind JOIN - * pChanstatsJoinInput
bind NICK - * pChanstatsNickInput
bind PART - * pChanstatsPartInput
bind PUBM - * pChanstatsPubmInput
bind REJN - * pChanstatsRejnInput
bind SIGN - * pChanstatsSignInput
bind SPLT - * pChanstatsSpltInput

bind PUB - [pChanstatsTrigger]rank pChanstatsOutputRank
bind PUB - [pChanstatsTrigger]stats pChanstatsOutputStats
bind PUB - [pChanstatsTrigger]top10 pChanstatsOutputTop10
bind PUB - [pChanstatsTrigger]top20 pChanstatsOutputTop20
bind PUB - [pChanstatsTrigger]tstats pChanstatsOutputTstats
bind PUB - [pChanstatsTrigger]zapstats pChanstatsZapstats

proc pChanstatsColor {chan type number} {
  global vChanstatsColor
  if {[regexp -- {^\+[a-zA-Z]*c} [getchanmode $chan]]} {
    return ""
  } else {
    switch -- $number {
      1 {
        switch -- $type {
          0 {return "\003$vChanstatsColor(errors)"}
          1 {return "\003$vChanstatsColor(compliance)"}
          2 {return "\003$vChanstatsColor(events)"}
        }
      }
      3 {return "\003$vChanstatsColor(dimmed)"}
      5 {return "\003$vChanstatsColor(arrow)"}
      2 - 4 - 6 {return "\003"}
    }
  }
}

proc pChanstatsCompliance {number command snick tnick schan tchan text1 text2 text3 text4 text5 text6} {
  for {set loop 1} {$loop <= 6} {incr loop} {set col($loop) [pChanstatsColor $schan 1 $loop]}
  set output1 "$col(1)Compliance$col(2) ($col(3)$snick$col(4)) $col(5)-->$col(6)"
  switch -- $number {
    001 {set output2 "$text1 $col(3)$text2$col(4) logged for $col(3)$tchan$col(4) $col(5)-->$col(6) [regsub -all {\)} [regsub -all {\(} [join [join $text3 ", "]] "($col(3)"] "$col(4))"]"}
    002 {set output2 "chanstats data for $col(3)$tnick$col(4) in $col(3)$tchan$col(4) $col(5)-->$col(6) [regsub -all {\)} [regsub -all {\(} $text1 "($col(3)"] "$col(4))"] $col(5)-->$col(6) \
                      last event logged was $col(3)$text2$col(4) ago"}
    003 {set output2 "chanstats data for $col(3)$tchan$col(4) has been reset"}
    004 {set output2 "total chanstats data for $col(3)$tchan$col(4) $col(5)-->$col(6) [regsub -all {\)} [regsub -all {\(} $text1 "($col(3)"] "$col(4))"]"}
    005 {set output2 "$col(3)$tnick$col(4) is ranked $col(3)$text2$col(4) out of $col(3)$text4$col(4) record(s) for $col(3)$text1$col(4) logged in $col(3)$tchan$col(4) with a score of\
                      $col(3)$text3$col(4) which represents $col(3)[format %.2f [expr {(double($text3) / double($text5)) * 100}]]%$col(4) of $col(3)$text5$col(4) total"}
  }
  putserv "PRIVMSG $schan :$output1 $output2"
  return 0
}

proc pChanstatsCtcpInput {nick uhost hand dest keyword text} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $dest] 4 1
  return 0
}

proc pChanstatsDataAccrue {nick chan position number} {
  global vChanstatsCount
  global vChanstatsData
  global vChanstatsEventsSave
  global vChanstatsGuest
  if {![isbotnick $nick]} {
    if {(!$vChanstatsGuest) && ([regexp {^guest.+[0-9]{4}$} [string tolower $nick]])} {return 0}
    if {[channel get $chan chanstats]} {
      incr vChanstatsCount
      if {![info exists vChanstatsData($nick\@$chan)]} {set vChanstatsData($nick\@$chan) "$nick\@$chan [unixtime] 0 0 0 0 0 0 0 0 0 0"}
      set oldvalue [join [lindex [split $vChanstatsData($nick\@$chan)] $position]]
      set newvalue [expr {$oldvalue + $number}]
      set vChanstatsData($nick\@$chan) [join [lreplace [split $vChanstatsData($nick\@$chan)] 1 1 [unixtime]]]
      set vChanstatsData($nick\@$chan) [join [lreplace [split $vChanstatsData($nick\@$chan)] $position $position $newvalue]]
      if {[expr {$vChanstatsCount >= $vChanstatsEventsSave}]} {
        pChanstatsSave events
        set vChanstatsCount 0
      }
    }
  }
  return 0
}

proc pChanstatsError {number command snick tnick schan tchan text1 text2 text3 text4 text5 text6} {
  global vChanstatsStatus
  for {set loop 1} {$loop <= 6} {incr loop} {set col($loop) [pChanstatsColor $schan 0 $loop]}
  set output1 "$col(1)Error$col(2) ($col(3)$snick$col(4)) $col(5)-->$col(6)"
  switch -- $number {
    001 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]top10 <option> ?#chan?$col(4)"}
    002 {set output2 "valid $col(3)<option>$col(4) arguments are $col(3)lines, words, actions, kicks, bans, joins, parts, splits, quits, nicks$col(4)"}
    003 {set output2 "$col(3)$tchan$col(4) is not a valid channel name"}
    004 {set output2 "I do not have a channel record for $col(3)$tchan$col(4)"}
    005 {set output2 "there has been no chanstats data logged yet for any of my channels"}
    006 {set output2 "there have been no $col(3)$text1$col(4) logged for $col(3)$tchan$col(4) yet"}
    007 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]stats <nick> ?#chan?$col(4)"}
    008 {set output2 "$col(3)$tnick$col(4) is not a valid nick"}
    009 {set output2 "there has been no chanstats data logged for nick $col(3)$tnick$col(4) in $col(3)$tchan$col(4) yet"}
    010 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]zapstats ?#chan?$col(4)"}
    011 {set output2 "chanstats are not currently being maintained for $col(3)$tchan$col(4)"}
    012 {set output2 "there are no records for $col(3)$tchan$col(4) to delete"}
    013 {set output2 "the $col(3)[pChanstatsTrigger]$command$col(4) command has been disabled in the script's configuration"}
    014 {set output2 "I do not log chanstats for myself"}
    015 {set output2 "permanent owner bot access is required to use the command $col(3)[pChanstatsTrigger]$command$col(4)"}
    016 {set output2 "a minimum of [pChanstatsName $vChanstatsStatus($command)] bot access is required to use the command $col(3)[pChanstatsTrigger]$command$col(4)"}
    017 {set output2 "I only have $text1 record(s) for $col(3)$text2$col(4) in $col(3)$tchan$col(4)"}
    018 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]top20 <option> ?#chan?$col(4)"}
    019 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]total ?#chan?$col(4)"}
    020 {set output2 "there has been no chanstats data logged for $col(3)$tchan$col(4) yet"}
    021 {set output2 "correct syntax is $col(3)[pChanstatsTrigger]rank <nick> <option> ?#chan?$col(4)"}
    022 {set output2 "$col(3)$tnick$col(4) has not yet logged any $col(3)$text1$col(4) in $col(3)$tchan$col(4)"}
  }
  putserv "PRIVMSG $schan :$output1 $output2"
  return 0
}

proc pChanstatsEvent {number command snick tnick schan tchan text1 text2 text3 text4 text5 text6} {
  for {set loop 1} {$loop <= 6} {incr loop} {set col($loop) [pChanstatsColor $tchan 2 $loop]}
  set output1 "$col(1)Event$col(2) ($col(3)zapstats$col(4)) $col(5)-->$col(6)"
  switch -- $number {
    001 {set output2 "chanstats data for $col(3)$tchan$col(4) has been reset by $col(3)$tnick$col(4)"}
  }
  putserv "PRIVMSG $tchan :$output1 $output2"
  return 0
}

proc pChanstatsFlag {nick chan} {
  global owner
  global vChanstatsFlag
  set owners [split [string tolower [regsub -all -- {,} $owner ""]]]
  set handle [string tolower [nick2hand $nick]]
  if {[lsearch -exact $owners $handle] != -1} {return 9}
  for {set loop 8} {$loop >= 2} {incr loop -1} {
    if {[matchattr [nick2hand $nick] $vChanstatsFlag($loop) $chan]} {return $loop}
  }
  return 1
}

proc pChanstatsInit {type} {
  global vChanstatsPutlog
  if {$vChanstatsPutlog} {putlog "\00314<chanstats>\003 initialising time bind (\00314$type\003)"}
  pChanstatsSchedule
  return 0
}

proc pChanstatsJoinAuto {nick uhost hand chan} {
  global vChanstatsAuto
  if {[isbotnick $nick]} {
    if {$vChanstatsAuto} {
     if {![channel get $chan chanstats]} {
        channel set $chan +chanstats
        savechannels
      }
    }
  }
  return 0
}

proc pChanstatsJoinInput {nick uhost hand chan} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 7 1
  return 0
}

proc pChanstatsKickInput {nick uhost hand chan target reason} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 5 1
  pChanstatsDataAccrue [string tolower $target] [string tolower $chan] 8 1
  return 0
}

proc pChanstatsLoad {type} {
  global vChanstatsData
  global vChanstatsPutlog
  if {[file exists chanstats.txt]} {
    set count 0
    set id [open chanstats.txt r]
    set data [read -nonewline $id]
    close $id
    if {[array size vChanstatsData] != 0} {unset vChanstatsData}
    foreach record [split $data \n] {
      if {[llength [split $record]] == 12} {
        set vChanstatsData([join [lindex [split $record] 0]]) $record
      } else {
        incr count
      }
    }
    if {$vChanstatsPutlog} {putlog "\00314<chanstats>\003 loading data (\00314$type\003) --> loaded (\00314[array size vChanstatsData]\003), discarded (\00314$count\003)"}
  }
  return 0
}

proc pChanstatsModeInput {nick uhost hand chan mc target} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 6 1
  return 0
}

proc pChanstatsName {number} {
  global vChanstatsName
  switch -- $number {
    1 {return "public"}
    9 {return "permanent owner"}
    default {return $vChanstatsName($number)}
  }
}

proc pChanstatsNickInput {nick uhost hand chan newnick} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 11 1
  return 0
}

proc pChanstatsOutputRank {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  if {[channel get $chan chanstats]} {
    set command rank
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      switch -- [llength [split [string trim $text]]] {
        2 {set tnick [join [lindex [split [string tolower [string trim $text]]] 0]]; set tchan [string tolower $chan]}
        3 {set tnick [join [lindex [split [string tolower [string trim $text]]] 0]]; set tchan [join [lindex [split [string tolower [string trim $text]]] 2]]}
        default {
          pChanstatsError 021 0 $nick 0 $chan 0 0 0 0 0 0 0
          return 0
        }
      }
      if {[array size vChanstatsData] != 0} {
        if {[regexp -- {^[\x41-\x7D][-\d\x41-\x7D]*$} $tnick]} {
          if {![isbotnick $tnick]} {
            if {[string equal [string index $tchan 0] "#"]} {
              if {[validchan $tchan]} {
                if {[info exists vChanstatsData($tnick\@$tchan)]} {
                  set opt [join [lindex [split [string trim [string tolower $text]]] 1]]
                  switch -- $opt {
                    lines {set name lines; set position 2}
                    words {set name words; set position 3}
                    actions {set name actions; set position 4}
                    kicks {set name kicks; set position 5}
                    bans {set name bans; set position 6}
                    joins {set name joins; set position 7}
                    parts {set name parts; set position 8}
                    splits {set name splits; set position 9}
                    quits {set name quits; set position 10}
                    nicks {set name "nick changes"; set position 11}
                    default {
                      pChanstatsError 002 0 $nick 0 $chan 0 0 0 0 0 0 0
                      return 0
                    }
                  }
                  foreach {key record} [array get vChanstatsData] {
                    if {[string equal $tchan [join [lindex [split $key @] 1]]]} {
                      if {![string equal [join [lindex [split $record] $position]] 0]} {
                        lappend data [list [lindex [split $key @] 0] [join [lindex [split $record] $position]]]
                        if {[info exists total]} {
                          set total [incr total [join [lindex [split $record] $position]]]
                        } else {set total [join [lindex [split $record] $position]]}
                      }
                    }
                  }
                  if {[info exists data]} {
                    set sorted [lsort -integer -decreasing -index 1 $data]
                    set events [join [lindex [split $vChanstatsData($tnick\@$tchan)] $position]]
                    set count [llength $sorted]
                    if {![string equal $events 0]} {
                      set rank [expr {[lsearch $sorted $tnick*] + 1}]
                      pChanstatsCompliance 005 0 $nick $tnick $chan $tchan $opt $rank $events $count $total 0
                    } else {pChanstatsError 022 0 $nick $tnick $chan $tchan $opt 0 0 0 0 0}
                  } else {pChanstatsError 006 0 $nick 0 $chan $tchan $name 0 0 0 0 0}
                } else {pChanstatsError 009 0 $nick $tnick $chan $tchan 0 0 0 0 0 0}
              } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
            } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
          } else {pChanstatsError 014 0 $nick 0 $chan 0 0 0 0 0 0 0}
        } else {pChanstatsError 008 0 $nick $tnick $chan 0 0 0 0 0 0 0}
      } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

proc pChanstatsOutputStats {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  if {[channel get $chan chanstats]} {
    set command stats
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      switch -- [llength [split [string trim $text]]] {
        1 {set tnick [string tolower [string trim $text]]; set tchan [string tolower $chan]}
        2 {set tnick [join [lindex [split [string tolower [string trim $text]]] 0]]; set tchan [join [lindex [split [string tolower [string trim $text]]] 1]]}
        default {
          pChanstatsError 007 0 $nick 0 $chan 0 0 0 0 0 0 0
          return 0
        }
      }
      if {[array size vChanstatsData] != 0} {
        if {[regexp -- {^[\x41-\x7D][-\d\x41-\x7D]*$} $tnick]} {
          if {![isbotnick $tnick]} {
            if {[string equal [string index $tchan 0] "#"]} {
              if {[validchan $tchan]} {
                if {[info exists vChanstatsData($tnick\@$tchan)]} {
                  set elapsed [duration [expr {[unixtime] - [join [lindex [split $vChanstatsData($tnick\@$tchan)] 1]]}]]
                  set lines [join [lindex [split $vChanstatsData($tnick\@$tchan)] 2]]
                  set words [join [lindex [split $vChanstatsData($tnick\@$tchan)] 3]]
                  set actions [join [lindex [split $vChanstatsData($tnick\@$tchan)] 4]]
                  set kicks [join [lindex [split $vChanstatsData($tnick\@$tchan)] 5]]
                  set bans [join [lindex [split $vChanstatsData($tnick\@$tchan)] 6]]
                  set joins [join [lindex [split $vChanstatsData($tnick\@$tchan)] 7]]
                  set parts [join [lindex [split $vChanstatsData($tnick\@$tchan)] 8]]
                  set splits [join [lindex [split $vChanstatsData($tnick\@$tchan)] 9]]
                  set quits [join [lindex [split $vChanstatsData($tnick\@$tchan)] 10]]
                  set nicks [join [lindex [split $vChanstatsData($tnick\@$tchan)] 11]]
                  set output "lines ($lines), words ($words), actions ($actions), kicks ($kicks), bans ($bans), joins ($joins), parts ($parts), splits ($splits), quits ($quits), nick changes ($nicks)"
                  pChanstatsCompliance 002 0 $nick $tnick $chan $tchan $output $elapsed 0 0 0 0
                } else {pChanstatsError 009 0 $nick $tnick $chan $tchan 0 0 0 0 0 0}
              } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
            } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
          } else {pChanstatsError 014 0 $nick 0 $chan 0 0 0 0 0 0 0}
        } else {pChanstatsError 008 0 $nick $tnick $chan 0 0 0 0 0 0 0}
      } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

proc pChanstatsOutputTop10 {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  if {[channel get $chan chanstats]} {
    set command top10
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      switch -- [llength [split [string trim $text]]] {
        1 {set tchan [string tolower $chan]}
        2 {set tchan [join [lindex [split [string tolower [string trim $text]]] 1]]}
        default {
          pChanstatsError 001 0 $nick 0 $chan 0 0 0 0 0 0 0
          return 0
        }
      }
      if {[array size vChanstatsData] != 0} {
        if {[string equal [string index $tchan 0] "#"]} {
          if {[validchan $tchan]} {
            switch -- [join [lindex [split [string trim [string tolower $text]]] 0]] {
              lines {set name lines; set position 2}
              words {set name words; set position 3}
              actions {set name actions; set position 4}
              kicks {set name kicks; set position 5}
              bans {set name bans; set position 6}
              joins {set name joins; set position 7}
              parts {set name parts; set position 8}
              splits {set name splits; set position 9}
              quits {set name quits; set position 10}
              nicks {set name "nick changes"; set position 11}
              default {
                pChanstatsError 002 0 $nick 0 $chan 0 0 0 0 0 0 0
                return 0
              }
            }
            foreach {key record} [array get vChanstatsData] {
              if {[string equal $tchan [join [lindex [split $key @] 1]]]} {
                if {[expr {[join [lindex [split $record] $position]] != 0}]} {
                  lappend data [list [lindex [split $key @] 0] [join [lindex [split $record] $position]]]
                }
              }
            }
            if {[info exists data]} {
              set sorted [lrange [lsort -integer -decreasing -index 1 $data] 0 9]
              set count 1
              foreach element $sorted {
                lappend output [list $count\. [lindex $element 0] ([lindex $element 1])]
                incr count
              }
              pChanstatsCompliance 001 0 $nick 0 $chan $tchan "top 10" $name $output 0 0 0
            } else {pChanstatsError 006 0 $nick 0 $chan $tchan $name 0 0 0 0 0}
          } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
        } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
      } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

proc pChanstatsOutputTop20 {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  if {[channel get $chan chanstats]} {
    set command top20
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      switch -- [llength [split [string trim $text]]] {
        1 {set tchan [string tolower $chan]}
        2 {set tchan [join [lindex [split [string tolower [string trim $text]]] 1]]}
        default {
          pChanstatsError 018 0 $nick 0 $chan 0 0 0 0 0 0 0
          return 0
        }
      }
      if {[array size vChanstatsData] != 0} {
        if {[string equal [string index $tchan 0] "#"]} {
          if {[validchan $tchan]} {
            switch -- [join [lindex [split [string trim [string tolower $text]]] 0]] {
              lines {set name lines; set position 2}
              words {set name words; set position 3}
              actions {set name actions; set position 4}
              kicks {set name kicks; set position 5}
              bans {set name bans; set position 6}
              joins {set name joins; set position 7}
              parts {set name parts; set position 8}
              splits {set name splits; set position 9}
              quits {set name quits; set position 10}
              nicks {set name "nick changes"; set position 11}
              default {
                pChanstatsError 002 0 $nick 0 $chan 0 0 0 0 0 0 0
                return 0
              }
            }
            foreach {key record} [array get vChanstatsData] {
              if {[string equal $tchan [join [lindex [split $key @] 1]]]} {
                if {[expr {[join [lindex [split $record] $position]] != 0}]} {
                  lappend data [list [lindex [split $key @] 0] [join [lindex [split $record] $position]]]
                }
              }
            }
            if {[info exists data]} {
              set sorted [lrange [lsort -integer -decreasing -index 1 $data] 10 19]
              if {[llength $sorted] != 0} {
                set count 11
                foreach element $sorted {
                  lappend output [list $count\. [lindex $element 0] ([lindex $element 1])]
                  incr count
                }
                pChanstatsCompliance 001 0 $nick 0 $chan $tchan "top 20" $name $output 0 0 0
              } else {pChanstatsError 017 0 $nick 0 $chan $tchan [llength $data] $name 0 0 0 0}
            } else {pChanstatsError 006 0 $nick 0 $chan $tchan $name 0 0 0 0 0}
          } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
        } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
      } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

proc pChanstatsOutputTstats {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  if {[channel get $chan chanstats]} {
    set command tstats
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      switch -- [llength [split [string trim $text]]] {
        0 {set tchan [string tolower $chan]}
        1 {set tchan [string tolower [string trim $text]]}
        default {
          pChanstatsError 019 0 $nick 0 $chan 0 0 0 0 0 0 0
          return 0
        }
      }
      if {[array size vChanstatsData] != 0} {
        if {[string equal [string index $tchan 0] "#"]} {
          if {[validchan $tchan]} {
            set tlines 0; set twords 0; set tactions 0; set tkicks 0; set tbans 0; set tjoins 0; set tparts 0; set tsplits 0; set tquits 0; set tnicks 0
            foreach {name value} [array get vChanstatsData] {
              if {[string equal $tchan [join [lindex [split $name @] 1]]]} {
                incr tlines [join [lindex [split $value] 2]]
                incr twords [join [lindex [split $value] 3]]
                incr tactions [join [lindex [split $value] 4]]
                incr tkicks [join [lindex [split $value] 5]]
                incr tbans [join [lindex [split $value] 6]]
                incr tjoins [join [lindex [split $value] 7]]
                incr tparts [join [lindex [split $value] 8]]
                incr tsplits [join [lindex [split $value] 9]]
                incr tquits [join [lindex [split $value] 10]]
                incr tnicks [join [lindex [split $value] 11]]
              }
            }
            if {[expr {$tlines + $twords + $tactions + $tkicks + $tbans + $tjoins + $tparts + $tsplits + $tquits + $tnicks}] == 0} {
              pChanstatsError 020 0 $nick 0 $chan $tchan 0 0 0 0 0 0
            } else {
              set output "lines ($tlines), words ($twords), actions ($tactions), kicks ($tkicks), bans ($tbans), joins ($tjoins), parts ($tparts), splits ($tsplits), quits ($tquits), nick changes ($tnicks)"
              pChanstatsCompliance 004 0 $nick 0 $chan $tchan $output 0 0 0 0 0
            }
          } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
        } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
      } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

proc pChanstatsPartInput {nick uhost hand chan msg} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 8 1
  return 0
}

proc pChanstatsPubmInput {nick uhost hand chan text} {
  global vChanstatsPutlog
  if {![catch {set arguments [split [string trim [string trimleft [stripcodes bcruag $text] \"]]]}]} {
    if {![catch {set choice [string range [join [lindex $arguments 0]] 1 end]}]} {
      switch -- $choice {
        top10 - top20 - stats - tstats - zapstats {return 0}
        default {
          pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 2 1
          pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 3 [llength $arguments]
        }
      }
    } else {if {$vChanstatsPutlog} {putlog "<\00314chanstats\003> unable to split line of text <\00314$nick\003> <\00314$chan\003> skipped"}}
  } else {if {$vChanstatsPutlog} {putlog "<\00314chanstats\003> unable to split line of text <\00314$nick\003> <\00314$chan\003> skipped"}}
  return 0
}

proc pChanstatsRejnInput {nick uhost hand chan} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 7 1
  return 0
}

proc pChanstatsSave {type} {
  global vChanstatsData
  global vChanstatsIdleDays
  global vChanstatsPutlog
  if {[array size vChanstatsData] != 0} {
    set count 0
    foreach {key record} [array get vChanstatsData] {
      if {![validchan [join [lindex [split $key @] 1]]]} {
        lappend erase $key
        incr count
        continue
      }
      if {[join [lindex [split $record] 1]] <= [expr {[unixtime] - ($vChanstatsIdleDays * 86400)}]} {
        lappend erase $key
        incr count
        continue
      }
      lappend data $record
    }
    if {[info exists erase]} {
      foreach item $erase {
        unset vChanstatsData($item)
      }
    }
    if {[info exists data]} {
      set id [open chanstats.txt w]
      puts $id "[join $data \n]"
      close $id
    } else {
      set data {}
      if {[file exists chanstats.txt]} {
        file delete chanstats.txt
      }
    }
    if {$vChanstatsPutlog} {putlog "\00314<chanstats>\003 saving data (\00314$type\003) --> saved (\00314[llength $data]\003), discarded (\00314$count\003)"}
  }
  return 0
}

proc pChanstatsSchedule {} {
  global vChanstatsScheduleSave
  foreach schedule [binds time] {
    if {[string equal pChanstatsTimedSave [join [lindex $schedule 4]]]} {
      set minute [join [lindex [lindex $schedule 2] 0]]
      set hour [join [lindex [lindex $schedule 2] 1]]
      unbind TIME - "$minute $hour * * *" pChanstatsTimedSave
    }
  }
  set minute [strftime %M [expr {[unixtime] + ($vChanstatsScheduleSave * 60)}]]
  set hour [strftime %H [expr {[unixtime] + ($vChanstatsScheduleSave * 60)}]]
  bind TIME - "$minute $hour * * *" pChanstatsTimedSave
  return 0
}

proc pChanstatsSignInput {nick uhost hand chan reason} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 10 1
  return 0
}

proc pChanstatsSpltInput {nick uhost hand chan} {
  pChanstatsDataAccrue [string tolower $nick] [string tolower $chan] 9 1
  return 0
}

proc pChanstatsTimedSave {minute hour day month year} {
  pChanstatsSave schedule
  pChanstatsSchedule
  return 0
}

proc pChanstatsZapstats {nick uhost hand chan text} {
  global vChanstatsData
  global vChanstatsStatus
  global vChanstatsZapAllowed
  if {[channel get $chan chanstats]} {
    set command zapstats
    if {[pChanstatsFlag $nick $chan] >= $vChanstatsStatus($command)} {
      if {$vChanstatsZapAllowed} {
        if {[array size vChanstatsData] != 0} {
          switch -- [llength [split [string trim $text]]] {
            0 {set tchan [string tolower $chan]}
            1 {set tchan [string tolower [string trim $text]]}
            default {
              pChanstatsError 010 0 $nick 0 $chan 0 0 0 0 0 0 0
              return 0
            }
          }
          if {[string equal [string index $tchan 0] "#"]} {
            if {[validchan $tchan]} {
              if {[channel get $tchan chanstats]} {
                if {[array names vChanstatsData "*@$tchan"] != ""} {
                  foreach {key record} [array get vChanstatsData "*$tchan"] {
                    set vChanstatsData($key) [join [lreplace [split $record] 1 1 0]]
                  }
                  pChanstatsSave zapstats
                  pChanstatsCompliance 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0
                  if {![string equal -nocase $chan $tchan]} {
                    pChanstatsEvent 001 0 0 $nick 0 $tchan 0 0 0 0 0 0
                  }
                } else {pChanstatsError 012 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
              } else {pChanstatsError 011 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
            } else {pChanstatsError 004 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
          } else {pChanstatsError 003 0 $nick 0 $chan $tchan 0 0 0 0 0 0}
        } else {pChanstatsError 005 0 $nick 0 $chan 0 0 0 0 0 0 0}
      } else {pChanstatsError 013 $command $nick 0 $chan 0 0 0 0 0 0 0}
    } else {
      switch -- $vChanstatsStatus($command) {
        9 {pChanstatsError 015 $command $nick 0 $chan 0 0 0 0 0 0 0}
        default {pChanstatsError 016 $command $nick 0 $chan 0 0 0 0 0 0 0}
      }
    }
  }
  return 0
}

###[INFO TCL]###
putlog "TCL Name : $TCL" 
putlog "Oleh : $owner $country $state $versi $update"
putlog "Mailto : $mail"
putlog "Loaded Status : Success Alhamdulillah !!!"