bind pub - ".dns" dnss
proc dnss {nick uhost hand chan arg} {
set ip [lindex $arg 0]
if {[string match "*:*" $ip]} {
    regsub -all ":" $ip " " ip
    set ip [lindex $ip 0]
}
set query [dns $ip]
if {$query == 0} {
    puthelp "PRIVMSG $chan :[DNS] $ip Can Not Resolved"
} else {
    puthelp "PRIVMSG $chan :[DNS] $ip Resolved To $query"
}
}

#############################
#           CITY            #
#############################
bind pub -|- "!infoip" city:ip
bind pub -|- "!c" city:city
bind pub -|- "!city" city:city

## ADVANCE CITY ##
proc city:ip {nick uhost hand chan arg} {
set ip [lindex $arg 0]
if {[string match "*:*" $ip]} {
    regsub -all ":" $ip " " ip
    set ip [lindex $ip 0]
}
 else {
    if {[isip $ip] == 1} {
        puthelp "PRIVMSG $chan :$ip ([hostip $ip])"
        city:whois $ip $chan
    } else {
        if {[string match "*.*" $ip] && [string length $ip] > 3} {
          set dns [dns $ip]
          if {$dns != 0} {
              puthelp "PRIVMSG $chan :$ip Ip $dns ([hostip $dns])"
              city:whois $dns $chan
          } else {
              puthelp "PRIVMSG $chan :Failed: Unable To Resolve $ip"
          }
        } else {
              puthelp "PRIVMSG $chan :$ip is Not A Valid HostName"
        }
    }
}
}

## SIMPLE CITY ##
proc city:city {nick uhost hand chan arg} {
set ip [lindex $arg 0]
if {[string match "*:*" $ip]} {
    regsub -all ":" $ip " " ip
    set ip [lindex $ip 0]
}
if {$ip == ""} {
    
} else {
    if {[isip $ip] == 1} {
        puthelp "PRIVMSG $chan :$ip ([hostip $ip])"
    } else {
        if {[string match "*.*" $ip] && [string length $ip] > 3} {
          set dns [dns $ip]
          if {$dns != 0} {
              puthelp "PRIVMSG $chan :$ip Ip $dns ([hostip $dns])"
              city:whois $dns $chan
          } else {
              puthelp "PRIVMSG $chan :Failed: Unable To Resolve $ip"
          }
        } else {
              puthelp "PRIVMSG $chan :$ip is Not A Valid HostName"
        }
    }
}
}
proc city:whois {ip chan} {

####### Refeeral Whois #######
putlog "<<WHOIS CITY>>"
set port      43
set ref       "whois.arin.net"
set maxforwad 3
#################### SATU ######################
### RESET ####
set start   0
set changed 0
set infoc   1
set forward 0
set country ""
##############

if {[catch { set socket [socket $ref $port] } error]} {
puthelp   "PRIVMSG $chan : Error: Failed Connectiong To Whois Server - whois://$ref:$port"
set start 3
return
}
fconfigure $socket -buffering line -blocking 0
puts $socket "$ip"
puts $socket ""
flush $socket
set waktu [unixtime]
while {![eof $socket] && $start < 2} {
  if {[expr [unixtime] - $waktu] > 20} {
      set start 4
  }
  set line [gets $socket]
  set linelow [string tolower $line]
  if {[string length $line] > 0} {
    putlog "$line"
  }
  if {[string match "* whois://*" $line]} {
      set awal  [expr [string first " whois://" $line] +9]
      set ref   [string range $line $awal end]
      if {[string match "*:*" $ref]} {
        set akhir [expr [string first ":" $line] -1]
        set port  $ref
        set ref   [string range $ref 0 $akhir]
        set port  [string range $port [expr [string length $ref] +1] end]
      }
      set start 2
  } elseif {[string match "* whois.*.*" $line]} {
      set awal  [string first "whois." $line]
      set ref   [lindex [string range $line $awal end] 0]
      if {[string match "*:*" $ref]} {
        set akhir [expr [string first ":" $line] -1]
        set port  $ref
        set ref   [string range $ref 0 $akhir]
        set port  [string range $port [expr [string length $ref] +1] end]
      }
      set start 2
  } elseif {[string match "* (NET-*" $line]} {
      set awal  [expr [string first " (NET-" $line] +2]
      set net   [string range $line $awal end]
      set akhir [expr [string first ")" $net] -1]
      set net   [string range $net 0 $akhir]
      set start 1
  } elseif {$start == 0} {
      if {[string match "*changed:*" $linelow] || [string match "*status:*" [string tolower $linelow]] || [string match "*source:*" $linelow] || [string match "*remarks:*" $linelow]} {
          set changed 1
      } elseif {[string match "*descr:*" $linelow] && $changed == 0} {
              set info($infoc) $line
              set infoc [expr $infoc +1]
      } elseif {$country == ""} {
          if {[string match "*netname:*" $linelow] || [string match "*city:*" $linelow] || [string match "*stateprov:*" $linelow] || [string match "*orgname:*" $linelow] || [string match "*custname:*" $linelow] || [string match "*address:*" $linelow] || [string match "*postalcode:*" $linelow]} {
             set info($infoc) $line
             set infoc [expr $infoc +1]
          } elseif {[string match "*country:*" $linelow]} {
             set country      $line
          }
      }
  }
}
close $socket

###############################################
################ START DUA ####################
while {$start != 0 && $start < 3} {
if {[catch { set socket [socket $ref $port] } error]} {
puthelp   "PRIVMSG $chan :Error: Failed Connectiong To Whois Server - whois://$ref:$port"
set start 3
return
}
fconfigure $socket -buffering line -blocking 0
if {$start == 1} {
    puts $socket "!$net"
} elseif {$start == 2} {
    puts $socket "$ip"
}
puts $socket ""
flush $socket
### RESET ####
set start   0
set changed 0
set infoc   1
set country ""
##############
set waktu [unixtime]
while {![eof $socket] && $start < 2} {
  if {[expr [unixtime] - $waktu] > 20} {
      set start 4
  }
  set line [gets $socket]
  set linelow [string tolower $line]
  if {[string length $line] > 0} {
    putlog "$line"
  }
  if {[string match "* whois://*" $line]} {
      set awal  [expr [string first " whois://" $line] +9]
      set ref   [string range $line $awal end]
      if {[string match "*:*" $ref]} {
        set akhir [expr [string first ":" $line] -1]
        set port  $ref
        set ref   [string range $ref 0 $akhir]
        set port  [string range $port [expr [string length $ref] +1] end]
      }
      set start 2
  } elseif {[string match "*remarks:* whois.afrinic.net*" $line]} {
      set awal  [string first "whois." $line]
      set ref   [lindex [string range $line $awal end] 0]
      if {[string match "*:*" $ref]} {
        set akhir [expr [string first ":" $line] -1]
        set port  $ref
        set ref   [string range $ref 0 $akhir]
        set port  [string range $port [expr [string length $ref] +1] end]
      }
      set start 2
  } elseif {[string match "* (NET-*" $line]} {
      set awal  [expr [string first " (NET-" $line] +2]
      set net   [string range $line $awal end]
      set akhir [expr [string first ")" $net] -1]
      set net   [string range $net 0 $akhir]
      set start 1
  } elseif {$start == 0} {
      if {[string match "*changed:*" $linelow] || [string match "*status:*" [string tolower $linelow]] || [string match "*source:*" $linelow] || [string match "*remarks:*" $linelow]} {
          set changed 1
      } elseif {[string match "*descr:*" $linelow] && $changed == 0} {
              set info($infoc) $line
              set infoc [expr $infoc +1]
      } elseif {$country == ""} {
          if {[string match "*netname:*" $linelow] || [string match "*city:*" $linelow] || [string match "*stateprov:*" $linelow] || [string match "*orgname:*" $linelow] || [string match "*custname:*" $linelow] || [string match "*address:*" $linelow] || [string match "*postalcode:*" $linelow]} {
             set info($infoc) $line
             set infoc [expr $infoc +1]
          } elseif {[string match "*country:*" $linelow]} {
             set country      $line
          }
      }
  }
}
close $socket
set forward [expr $forward +1]
if {$forward > $maxforwad} {
    set start 5
}
}

################################################
####### Printing #########
if {$start == 0} {
  if {$infoc > 1} {
    set infocnt 1
    while {$infoc > $infocnt} {
        regsub ":" $info($infocnt) ":" infos
        puthelp   "PRIVMSG $chan : $infos"
        set infocnt [expr $infocnt +1]
    }
  } else {
    puthelp "PRIVMSG $chan :Unable Fetch Data"
  }
  if {$country != ""} {
        regsub ":" $country ":" country
        puthelp   "PRIVMSG $chan :$country"
  } else {
      puthelp "PRIVMSG $chan :Country: Unable To Fetch Data"
  }
} elseif {$start == 4} {
puthelp "PRIVMSG $chan :Error: Operation Timeout"
} elseif {$start == 5} {
puthelp "PRIVMSG $chan :Error: Maximum Forward Exceed $forward Times"
}
####### Printing #########
}

#############################################
#             PROC/FUNCTION                 #
#############################################
##########
## isip ##
##########
proc isip {text} {
if {([string compare $text ""]) && (![regexp \[^0-9.\] $text])} then {
  if {[string match "*.*.*.*" $text]} {
      if {[string match "*0*" $text] || [string match "*1*" $text] || [string match "*2*" $text] || [string match "*3*" $text] || [string match "*4*" $text] || [string match "*5*" $text] || [string match "*6*" $text] || [string match "*7*" $text] || [string match "*8*" $text] || [string match "*9*" $text]} {
          return 1
      } else {
          return 0
      }
  } else {
      return 0
  }
}
return 0
}

#########
## DNS ##
#########
proc dns {ip} {
    return [dnslookup $ip resolving $ip]
}
proc resolving {ip host status hostip} {
        if {!$status} {
            return 0
        } elseif {[isip $hostip]} {
            return $host
        } else {
            return $ip
        }
}

################
## hostip.com ##
################
proc hostip {arg} {
if {[catch { set socket [socket "api.hostip.info" 80] } error]} {
return "Cannot Connect"
}
fconfigure $socket -buffering line -blocking 0
puts $socket "GET /get_html.php?ip=$arg HTTP/1.0"
puts $socket "HOST: api.hostip.info"
puts $socket ""
flush $socket
set start 0
set waktu [unixtime]
while {![eof $socket] && $start < 1} {
  set line [gets $socket]
  if {[expr [unixtime] - $waktu] > 20} {
      set start 2
  }
  if {[string match "Country: *" $line]} {
     set country  [string range $line 9 end]
  } elseif {[string match "City: *" $line]} {
     set city     [string range $line 6 end]
     set start 1
  }
}
if {$start == 1} {
    return "$city, $country"
} else {
    return "TimeOut"
}
}