# Anti CTCP Flood (antictcpflood.tcl)
# By jinho (www.baganbatu.com)
# 1.2.4 (06 Jan 2002)
# 

# Requires eggdrop 1.6.7

# Please configure accordingly:

set ctcp_chk_t1   9     ;# Set the number of CTCPs before flood triggers
set ctcp_chk_t2   2     ;# Set the lifetime in seconds of $ctcp_chk_t1
set ctcp_chk_t3 300     ;# Set the time in seconds of channel moderation

# Note: If flood-ctcp on a channel is set to "0:0", this script will not work on it.

# Do not change anything below.

proc acfcheckversion {} {
 global version
 set i 0
 foreach e [split [lindex $version 0] "."] {
  incr i
  if {$i == 1 && $e < 1} {return 1}
  if {$i == 2 && $e < 6} {return 1}
  if {$i == 3 && $e < 7} {return 1}
 }
 return 0
}

if {[acfcheckversion]} {
 putlog "\2Warning!\2 Eggdrop version is too old for Anti CTCP Flood. This script will not work."
} {
 putlog "\2Loaded\2 Anti CTCP Flood (by jinho)."
}

catch {unset ctcpschan}

proc resetctcpschan {c} {
 global ctcpschan
 if {[info exists ctcpschan($c)]} {unset ctcpschan($c)}
 foreach ut [utimers] {
  if {[lindex $ut 1] == "resetctcpschan $c"} {killutimer [lindex $ut 2]}
 }
}

# bind raw - privmsg raw_ctcpchk
# proc raw_ctcpchk {f k a} {
#  set n [lindex [split $f "!"] 0]
#  set u [lindex [split $f "!"] 1]
#  set h [nick2hand $n]
#  set c [lindex $a 0]
#  set t [lindex $a 1]
#  if {![string match *\1* $t]} {return 0}
#  ctcp_chk $n $u $h $c [string trimright [string range [lindex $t 0] 2 end] "\1"] ""
#  return 0
# }

bind ctcp - * ctcp_chk

proc ctcp_chk {n u h d k a} {
 if {![validchan $d] || ![botisop $d] || [matchattr $h mf|mf $d] || [lindex [channel info $d] 10] == "0:0"} {return 0}
 global ctcpschan ctcp_chk_t1 ctcp_chk_t2 ctcp_chk_t3
 if {![info exists ctcp_chk_t1]} {set ctcp_chk_t1 9}
 if {![info exists ctcp_chk_t2]} {set ctcp_chk_t2 2}
 if {![info exists ctcp_chk_t3]} {set ctcp_chk_t3 300}
 set k [string toupper $k]
 set c [string tolower $d]
 if {$k == "PING" || $k == "VERSION" || $k == "FINGER" || $k == "TIME" || $k == "DCC" || $k == "CHAT" || $k == "SEND" || $k == "CLIENTINFO" || $k == "USERINFO"} {
  if {[info exists ctcpschan($c)] && $ctcpschan($c) == 999} {return 0}
  if {![info exists ctcpschan($c)]} {set ctcpschan($c) 0}
  incr ctcpschan($c)
  foreach ut [utimers] {
   if {[lindex $ut 1] == "resetctcpschan $c"} {killutimer [lindex $ut 2]}
  }
  utimer $ctcp_chk_t2 "resetctcpschan $c"
  if {[info exists ctcpschan($c)] && $ctcpschan($c) > $ctcp_chk_t1} {
   if {[string match *m* [lindex [getchanmode $c] 0]] || $ctcpschan($c) == 999} {return 0}
   putquick "mode $c +m"
   putlog "CTCP Flood detected on $c, setting +m for [duration $ctcp_chk_t3]."
   puthelp "notice @$c :CTCP Flood detected; setting +m for [duration $ctcp_chk_t3]."
   set ctcpschan($c) 999
   utimer $ctcp_chk_t3 "putserv {mode $c -m}"
   foreach ut [utimers] {
    if {[lindex $ut 1] == "resetctcpschan $c"} {killutimer [lindex $ut 2]}
   }
   utimer $ctcp_chk_t3 "resetctcpschan $c"
   return 0
  }
 }
 return 0
}

