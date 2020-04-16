###############################################################################
###########       Bad nick Protection by Prince_of_the_net         ############
###############################################################################
#While I am in my channel I have seen quite a few people joining with irrtating
#or offensive nicks.This script will teach thoes lamers a lesson by kicking and
#optionally banning them.Like my other scripts,you need to load my counter
#script (counter.tcl,available at http://www.egghelp.org/tcl.htm) *before* you
#can use this script.Put a line 'set logo "<<$botnick>>"' without the 's in
#your bot config file before you load the script. Load this script by putting a
#line 'source scripts/badnick3.0.tcl' without the 's in your bot config file
#and .rehash the bot.If you are using any previous version of this script then
#I recommend .restart than .rehash as it will clear the old binds.Please submit
#me bug reports at Prince_of_the_net@k.st and if you do some too cool
#modification to this script,please be kind enough to let me know.You can find
#me in #eggdrop and #delhi and sometimes on #dalnethelp on DALNET, in #egghelp
#on EFnet and in #eggdrop on Xnet.You contributions will be included in the
#acknowledgement section of the next official release of the script.Special
#thanks goes out to MC_8 as I got the idea for masking the bans from his script.
#
#This script has been provided "AS IS and with all its "FAULTS" the author will
#not be responsible for any kind of damage caused by the script.However the
#author would like to help with problems the user may face while using this
#script.This script may not suit to your needs but the author can't be held
#responsible in such cases and the author would like to protect this script
#under the GNU Public license.You can get a latest copy of the license at
#http://www.gnu.org.
#
#
###############################################################################
##################         Configuration Section        #######################
###############################################################################
#Set this to all the bad nicks you would like to ban for.Wildcards supported.
set bnick {
  "*fuck*" 
  "*rape*" 
  "*fuk*" 
  "*badwa" 
  "*phudi*" 
  "*fudi" 
  "*pussy*" 
  "*boobs*" 
  "*porn*" 
  "*p0rn*"}

#Set this to the time for which you would like to place a bad nick host on ban.
#0 makes the ban permanent.(Not recommended)
set bnick_bantime 30

#Set this to the time after which you would like to reset the timer for the
#bad nick.
set bnick_reset 60

#Set this to the number of times you want to warn before you would like to
#place ban.0 gives no warnings.
set bnick_warnings 1

#Set this to the reason to be given while kicking the offender the first time.
set bnick_kick "Your nick offends me.Change it and come back."

#Set this to the reason while banning the user after bnick_warnings have expired
set bnick_ban "I think I told you to change ur nick.Now we don't need you."

# How do you want it to mask a ban?  Default == 2
#      0 - *!user@host.domain
#      1 - *!*user@host.domain
#      2 - *!*@host.domain
#      3 - *!*user@*.domain
#      4 - *!*@*.domain
#      5 - nick!user@host.domain
#      6 - nick!*user@host.domain
#      7 - nick!*@host.domain
#      8 - nick!*user@*.domain
#      9 - nick!*@*.domain
#     You can also specify a type of 10 to 19 which correspond to masks 0 to 9, but
#     instead of using a * wildcard to replace portions of the host.domain, it uses ?
#     wildcards to replace the numbers in the address.
set bnick_ban_type 12

###############################################################################
## You can edit below this but dont mail me if things start acting weird :Þ  ##
###############################################################################
bind join - * bnick:check
bind nick - * bnick:check

proc bnick:check {nick uhost hand chan {newnick ""}} {
	global logo bnicks bnick_bantime bnick bnick_reset bnick_warnings bnick_kick bnick_ban bnick_ban_type
	if {$newnick == ""} {set newnick $nick}
	foreach bword [split $bnick "\n"] {		
		if {[regexp -nocase $bword $newnick] && [botisop $chan]} {
			if {![info exists bnicks($uhost)]} {
				set bnicks($uhost) 1
				putkick $chan $newnick "$bnick_kick [count_update 0]  $logo"
				timer $bnick_reset "unset bnicks($uhost)"
				putlog "Warned and kicked $newnick on $chan for using bad nicks."
				puthelp "NOTICE $newnick :Change your nick before you come to $chan.The next time I catch you using bad nicks, I will ban you.  $logo"
				} {
				if {$bnicks($uhost) < $bnick_warnings} {
					incr bnicks($uhost)
					bnick:resettimer "bnicks($uhost)"
					timer $bnick_reset "unset bnicks($uhost)"
					putkick $chan $newnick "Warning $bnicks($uhost) for using bad nicks.Be careful I am watching you... [count_update 0]  $logo"
					puthelp "NOTICE $newnick :Join $chan with a bad nick for [expr $bnick_warnings - $bnick($uhost)] more time(s) and I will make sure you will join no more.  $logo"
					putlog "Warning $bnick($uhost) for $newnick on $chan for using bad nicks."
				} {
					unset bnicks($uhost)
					bnick:resettimer "bnicks($uhost)"
					newchanban $chan [bnick:masktype $nick!$uhost $bnick_ban_type] "Bad Nick Protection" "$bnick_ban [count_update 1]  $logo" $$bnick_bantime
					putkick $chan $newnick "$bnick_ban [count_update 1]  $logo"
				}
				}
		}
	}
}
proc bnick:resettimer {reset} {
	foreach time_check [string tolower [timers]] {
		if {[string match *$reset* $time_check]} {killtimer [lindex [split $time_check] end]}
	}
}

proc bnick:replace {string subs} {
 if {[llength $subs] == "1"} {set subs [lindex $subs 0]}
 for {set i 0} {[lindex $subs $i] != ""} {incr i 2} {
  regsub -all -- [lindex $subs $i] $string [lindex $subs [expr $i+1]] string
 } ; return $string
}

proc bnick:masktype {uhost type} {
 if {![string match "*!*@*.*" $uhost]} {
  set nick [lindex [split $uhost "!"] 0] ; set uhost "$nick![getchanhost $nick]"
  if {$uhost == "$nick!"} {set type "return_nothing"}
 }
 switch -exact $type {
  0 {set ban "*[string range $uhost [string first ! $uhost] e]"}
  1 {set ban "*!*[string trimleft [string range $uhost [expr [string first ! $uhost]+1] e] "~"]"}
  2 {set ban "*!*[string range $uhost [string first @ $uhost] e]"}
  3 {
   set ident [string range $uhost [expr [string first ! $uhost]+1] [expr [string last @ $uhost]-1]]
   set ban "*!*[string trimleft $ident "~"][string range [maskhost $uhost] [string first @ [maskhost $uhost]] e]"
  }
  4 {set ban "*!*[string range [maskhost $uhost] [string last "@" [maskhost $uhost]] e]"}
  5 {set ban $uhost}
  6 {
   set nick [string range $uhost 0 [expr [string first "!" $uhost]-1]]
   set ident [string range $uhost [expr [string first "!" $uhost]+1] [expr [string last "@" $uhost]-1]]
   set ban "$nick!*[string trimleft $ident "~"][string range $uhost [string last "@" $uhost] e]"
  }
  7 {
   set nick [string range $uhost 0 [expr [string first "!" $uhost]-1]]
   set ban "$nick!*[string range $uhost [string last "@" $uhost] e]"
  }
  8 {
   set nick [string range $uhost 0 [expr [string first "!" $uhost]-1]]
   set ident [string range $uhost [expr [string first "!" $uhost]+1] [expr [string last "@" $uhost]-1]]
   set ban "$nick!*[string trimleft $ident "~"][string range [maskhost $uhost] [string last "@" [maskhost $uhost]] e]"
  }
  9 {
   set nick [string range $uhost 0 [expr [string first "!" $uhost]-1]]
   set ban "$nick!*[string range [maskhost $uhost] [string last "@" [maskhost $uhost]] e]"
  }
  10 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set ident [string range $uhost [expr [string first "!" $uhost]+1] [expr [string last "@" $uhost]-1]]
    set ban "*!$ident$host"
   } {set ban [bnick:masktype $uhost 0]}
  }
  11 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set ident [string range $uhost [expr [string first "!" $uhost]+1] [expr [string last "@" $uhost]-1]]
    set ban "*!*[string trimleft $ident "~"]$host"
   } {set ban [bnick:masktype $uhost 1]}
  }
  12 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set ban "*!*$host"
   } {set ban [bnick:masktype $uhost 2]}
  }
  13 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {set ban [bnick:masktype $uhost 11]} {set ban [bnick:masktype $uhost 3]}
  }
  14 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {set ban [bnick:masktype $uhost 12]} {set ban [bnick:masktype $uhost 4]}
  }
  15 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set rest [string range $uhost 0 [expr [string last "@" $uhost]-1]]
    set ban $rest$host
   } {set ban [bnick:masktype $uhost 5]}
  }
  16 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set rest "[string range $uhost 0 [expr [string first "!" $uhost]-1]]!*[string trimleft [string range $uhost [expr [string first "!" $uhost]+1] [expr [string last "@" $uhost]-1]] "~"]"
    set ban $rest$host
   } {set ban [bnick:masktype $uhost 6]}
  }
  17 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {
    set host [bnick:replace $host "1 ? 2 ? 3 ? 4 ? 5 ? 6 ? 7 ? 8 ? 9 ? 0 ?"]
    set rest "[string range $uhost 0 [expr [string first "!" $uhost]-1]]!*"
    set ban $rest$host 
   } {set ban [bnick:masktype $uhost 7]}
  }
  18 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {set ban [bnick:masktype $uhost 16]} {set ban [bnick:masktype $uhost 8]}
  }
  19 {
   set host [string range $uhost [string last "@" $uhost] e]
   if {[bnick:findip [string range $host 1 e]] == "0"} {set ban [bnick:masktype $uhost 17]} {set ban [bnick:masktype $uhost 9]}
  }
  return_nothing {set ban ""}
  default {set ban "*!*[string range $uhost [string first "@" $uhost] e]"}
 }
 set _nick [lindex [split $ban !] 0]
 set _ident [string range $ban [expr [string first ! $ban]+1] [expr [string last @ $ban]-1]]
 set _host [string range $ban [expr [string last @ $ban]+1] e]
 if {$_ident != [set temp [string range $_ident [expr [string length $_ident]-9] e]]} {
  set _ident *[string trimleft $temp *]
 }
 if {$_host != [set temp [string range $_host [expr [string length $_host]-63] e]]} {
  set _host *[string trimleft $temp *]
 } ; return $_nick!$_ident@$_host
}

proc bnick:findip {args} {
 catch {unset bnick_found_ip}
 if {![string match *.*.*.* $args]} {return 0}
 foreach arg $args {
  if {[string match *.*.*.* $arg]} {
   set bnick_testa [split $arg "."] ; set i 0
   while {[llength $bnick_testa] != $i} {
    set bnick_test [lrange $bnick_testa $i end]
    if {[string length [lindex $bnick_test 1]]<4 && [string length [lindex $bnick_test 2]]<4} {
     if {[lindex $bnick_test 1] < 256 && [lindex $bnick_test 2] < 256 && [lindex $bnick_test 1] >= 0 && [lindex $bnick_test 2] >= 0} {
      set first "abcdefghi"
      if {[string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 1]] <= 9 && [string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 1]] >= 0} {
       set first [string range [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 1] end]
       if {[string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 2]] <= 9 && [string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 2]] >= 0} {
        set first [string range [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 2] end]
        if {[string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 3]] <= 9 && [string index [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 3]] >= 0} {
         set first [string range [lindex $bnick_test 0] [expr [string length [lindex $bnick_test 0]] - 3] end]
        }
       }
      }
      set second [lindex $bnick_test 1] ; set third [lindex $bnick_test 2] ; set fourth "abcdefghi"
      if {[string index [lindex $bnick_test 3] 0] <= 9 && [string index [lindex $bnick_test 3] 0] >= 0} {
       set fourth [string index [lindex $bnick_test 3] 0]
       if {[string index [lindex $bnick_test 3] 1] <= 9 && [string index [lindex $bnick_test 3] 1] >= 0} {
        set fourth $fourth[string index [lindex $bnick_test 3] 1]
        if {[string index [lindex $bnick_test 3] 2] <= 9 && [string index [lindex $bnick_test 3] 2] >= 0} {
         set fourth $fourth[string index [lindex $bnick_test 3] 2]
        }
       }
      }
      if {($first < 256) && ($second < 256) && ($third < 256) &&
          ($fourth < 256) && ($first > 0) && ($second > 0) &&
          ($third > 0) && ($fourth > 0) && ([string index $first 0] > 0) &&
          ([string index $second 0] > 0) && ([string index $third 0] > 0) &&
          ([string index $fourth 0] > 0)} {
       if {[info exists bnick_found_ip]} {
        set bnick_found_ip "$bnick_found_ip $first.$second.$third.$fourth"
       } {set bnick_found_ip $first.$second.$third.$fourth}
      }
     }
    } ; incr i +1
   }
  }
 } ; if {[info exists bnick_found_ip]} {return $bnick_found_ip} {return 0}
}

putlog "Bad nick control v3.0 by \002Prince_of_the_net\002 \[Loaded\]"

###############################################################################
########################        END OF SCRIPT        ##########################
###############################################################################
