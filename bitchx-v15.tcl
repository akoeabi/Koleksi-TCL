#########################################################################
## BitchX Poser   v4 for Eggdrop By: sinkhole (sinkhole@root.edu)      ##
##     Script     v5  - v9       By: blue (blue@tical.net)             ##
##                v10 - v14      By: WoLf (wolf@dscnetworks.com)       ##
##                v15 - v??      By: compudaze (dazed@columbus.rr.com) ##
##                                                                     ##
##    Note: the original bitchx.tcl was wrote by sinkhole with A LOT   ##
##    of help from eRUPT, Thanks man!                                  ##
#########################################################################
## Extract the source file "bitchx-v15.tar.gz" in your bots "scripts"  ##
## directory, then to load this file add the following line to your    ##
## bots config file: source scripts/bitchx-v15/bitchx-v15.tcl          ##
#########################################################################
## *** Read the included Changelog.txt for changes in this script. *** ##
#########################################################################

## System Variable
## suggested by sinkhole, fixed by compudaze
if {[catch {set system "[exec uname -sr]"}]} {set system "Linux 2.2.14"}

## NOTE: A good idea would be to set the system to what the shell
## really is running, in case a IRCop trys to telnet to the shell to
## get the system version and compare it to the cloaked eggdrop reply.
## I have listed a few known operating systems to cloak, check your
## shell providers OS version and set the correct one.

## If you .setlcient 2 or above, you can uncomment the first line below
## and comment out the one that is already uncommented.

## [0/1] Notify Away/Back in Partyline
set notifyaway 1

## Set the maximum ctcps before ignore is triggered
## ctcps: 1min flood ratio, ALL hosts (5 is good)
set ctcps 5

## Client:
## 0 = BitchX-75      - Tcl1.5
## 1 = BitchX-75p1    - Tcl1.5
## 2 = BitchX-75p2-9  - Tcl1.6
## 3 = BitchX-75p2-10 - Tcl1.6
## 4 = BitchX-75p2    - Tcl2.0
## 5 = BitchX-75p3    - Tcl2.0

## Set your default client here.
if {![info exists client]} {
  set client 5
}

## Cloak:
## (these are replies of the raw, unconfigured scripts)
## 0 = plain bitchx
## 1 = crackrock
## 2 = neonapple
## 3 = tunnelvision
## 4 = argon
## 5 = osmosis
## 6 = evolver
## 7 = prevail
## 8 = osiris

## Set your default script here.
if {![info exists cloak]} {
  set cloak 0
}

## Ok, we handle the rest...
set ctcpqueue 0
set aawaymin 0
set aawaysec 0
set ctcp-finger ""
set ctcp-version ""
set ctcp-userinfo ""

bind dcc m bxstats bxstats_dcc

proc bxstats_dcc {hand idx arg} {
  global bxversion tclversion sver system
  putdcc $idx "BitchX-v14.tcl Stats:"
  putdcc $idx " "
  putdcc $idx "Client  -  BitchX-$bxversion"
  putdcc $idx "Tcl     -  $tclversion"
  putdcc $idx "System  -  $system"
  putdcc $idx "Script  -  $sver"
  putdcc $idx " "
  return 1
}

bind dcc m setclient setclient_dcc

proc setclient_dcc {hand idx arg} {
  if {$arg != ""} {
   global client
   set client [lindex $arg 0]
   setclient
   setscript
   return 1
  } {
  putdcc $idx "############## BitchX-v14.tcl ##############"
  putdcc $idx "###             0 - BitchX-75            ###"
  putdcc $idx "### 1 - BitchX-75p1    2 - BitchX-75p2-9 ###"
  putdcc $idx "### 3 - BitchX-75p2-10 4 - BitchX-75p2   ###"
  putdcc $idx "### 5 - BitchX-75p3                      ###"
  putdcc $idx "############################################"
  putdcc $idx "          Usage: .setclient (0-5)"
  return 0
 }
}

proc setclient {} {
  global bxversion tclversion client system
  if {$client == 0} {
   set bxversion "75"
   set tclversion "Tcl1.5"
  } elseif {$client == 1} {
   set bxversion "75p1"
   set tclversion "Tcl1.5"
  } elseif {$client == 2} {
   set bxversion "75p2-9"
   set tclversion "Tcl1.6"
  } elseif {$client == 3} {
   set bxversion "75p2-10"
   set tclversion "Tcl1.6"
  } elseif {$client == 4} {
   set bxversion "75p2"
   set tclversion "Tcl2.0"
  } elseif {$client == 5} {
   set bxversion "75p3"
   set tclversion "Tcl2.0"
  }
 putlog "Cloning Client: BitchX-$bxversion with $tclversion on $system"
}


bind dcc m setscript setscript_dcc

proc setscript_dcc {hand idx arg} {
  if {$arg != ""} {
   global cloak
   set cloak [lindex $arg 0]
   setscript
   return 1
  } {
  putdcc $idx "########### BitchX-v14.tcl ###########"
  putdcc $idx "###        0 - plain bitchx        ###"
  putdcc $idx "### 1 - crackrock    2 - neonapple ###"
  putdcc $idx "### 3 - tunnelvision 4 - argon     ###"
  putdcc $idx "### 5 - osmosis      6 - evolver   ###"
  putdcc $idx "### 7 - prevail      8 - osiris    ###"
  putdcc $idx "######################################"
  putdcc $idx "       Usage: .setscript (0-8)"
  return 0
 }
}

proc setscript {} {
  global bxversion tclversion tclver system cloak ctcpversion ctcpuserinfo autoaway sver aawaymin aawaysec aawaytime notaway bxsetaway kickpub kickbpub
  if {[rand 2]} {
   set tclver "+${tclversion}"
  } {
   set tclver "+"
  }
  set os [lindex $system 0]
  set osver [lindex $system 1]
  set aawaymin 0
  set aawaysec 0
  set aawaytime 0
  set notaway [unixtime]
  set bxsetaway 0
  putserv "AWAY :"
  if {$cloak == 0} {
   set ctcpversion "BitchX-${bxversion}${tclver} by panasync - ${system} : Keep it to yourself!"
   set ctcpuserinfo " "
   set autoaway "is away: (Auto-Away after 10 mins) \[BX-MsgLog Off\]"
   set sver "BitchX-${bxversion}${tclver} by panasync - ${system}"
   set kickpub ""
   set kickbpub ""
  } elseif {$cloak == 1} {
   set ctcpversion "BitchX-${bxversion}${tclver}/${system} :(c)rackrock/bX \[3.0.1á9\] : Keep it to yourself!"
   set ctcpuserinfo "crack addict, help me."
   set autoaway "automatically dead"
   set sver "BitchX-${bxversion}${tclver}/${system} :(c)rackrock/bX \[3.0.1á9\]"
   set kickpub "c/k: "
   set kickbpub "c/kb: "
  } elseif {$cloak == 2} {
   set ctcpversion "bitchx-${bxversion}([string tolower ${system}]): neonapple/v0.4i : dont you wish you had it?"
   set ctcpuserinfo "neon apple"
   set autoaway "automatically away after 10 mins (n/a)"
   set sver "bitchx-${bxversion}([string tolower ${system}]): neonapple/v0.4i"
   set kickpub "\[na(k)\] "
   set kickbpub ""
  } elseif {$cloak == 3} {
   global nick
   set bxverleft [string trimright $bxversion [string index $bxversion [expr [string wordend $bxversion 0] - 1]]]
   set bxveright [string index $bxversion [expr [string wordend $bxversion 0] - 1]]
   set tvversions { "1.0" "1.2" }
   set tvversion [lindex $tvversions [rand [llength $tvversions]]]
   set ctcpversion "bitchx-${bxverleft}${bxveright} :tunnelvision/${tvversion}"
   set ctcpuserinfo "$nick"
   set autoaway "auto-gone"
   set sver "bitchx-${bxverleft}${bxveright} + tunnelvision/${tvversion}"
   set kickpub ""
   set kickbpub ""
  } elseif {$cloak == 4} {
   set ctcpversion "..(argon/1g) :bitchx-${bxversion}"
   set ctcpuserinfo " "
   set autoaway "(ar) auto-away (10m)"
   set sver "..(argon/1g) :bitchx-${bxversion}"
   set kickpub "(ar) "
   set kickbpub "(ar) "
  } elseif {$cloak == 5} {
   set osleft [string tolower [string index $os 0]]
   set osright [string tolower [string index $os [expr [string wordend $os 0] - 1]]]
   set osxtra [string trimright [string trimleft [string tolower $os] $osleft] $osright]
   set ctcpversion "bitchx-${bxversion}: <${osleft}${osxtra}${osright}: [string tolower $osver]>: osmosis <v0.8c> : Keep it to yourself!"
   set ctcpuserinfo " "
   set autoaway "automatically away"
   set sver "bitchx-${bxversion}: <${osleft}${osxtra}${osright}: [string tolower $osver]>: osmosis <v0.8c>"
   set kickpub "os!k: "
   set kickbpub ""
  } elseif {$cloak == 6} {
   set evversions { "02x8" "02x9" }
   set evversion [lindex $evversions [rand [llength $evversions]]]
   set ctcpversion "evolver(${evversion}): bitchx(${bxversion}) í ${os}/${osver} : eye yam pheerable now!"
   set ctcpuserinfo " "
   set autoaway "away: \[idle for \[10 minutes\]\] (l:off, p:off)"
   set sver "evolver(${evversion}): bitchx(${bxversion}) í ${os}/${osver}"
   set kickpub "ev!k "
   set kickbpub "ev!bk "
  } elseif {$cloak == 7} {
    if {$tclver != "+"} {
     set tclver "![string tolower [string trimleft $tclver "+"]]"
    } {
    set tclver ""
   }
   set ctcpversion "[string tolower $os]![string tolower $osver] bitchx-${bxversion}${tclver} - prevail\[0123\] :down with people"
   global realname
   set ctcpuserinfo "$realname"
   set autoaway "idle 10 minutes - gone!"
   set sver "[string tolower $os]![string tolower $osver] bitchx-${bxversion}${tclver} - prevail\[0123\]"
   set kickpub ""
   set kickbpub ""
  } elseif {$cloak == 8} {
   set ctcpversion "osiris-1c/bitchx-${bxversion} : empty"
   set ctcpuserinfo " "
   set autoaway "10 minute autoaway"
   set sver "osiris-1c/bitchx-${bxversion}"
   set kickpub "os(k) "
   set kickbpub "os(bk) "
  }
  putlog "Cloning Script: ${sver}"
}

## BitchX's CTCP Command bindings
bind ctcp - "CLIENTINFO" ctcp_cinfo
bind ctcp - "FINGER" ctcp_finger
bind ctcp - "WHOAMI" ctcp_denied
bind ctcp - "OP" ctcp_op
bind ctcp - "OPS" ctcp_ops
bind ctcp - "INVITE" ctcp_invite
bind ctcp - "UNBAN" ctcp_unban
bind ctcp - "ERRMSG" ctcp_errmsg
bind ctcp - "USERINFO" ctcp_userinfo
bind ctcp - "ECHO" ctcp_echo
bind ctcp - "VERSION" ctcp_version
## End of BitchX's CTCP Command bindings

## The default BitchX mode is +iw
set init-server { putserv "MODE $botnick +iw-s" }

## More efficent version reply (DO NOT CHANGE)
proc ctcp_version {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  global ctcpversion
  putserv "NOTICE $nick :VERSION ${ctcpversion}"
  putlog "BitchX: VERSION CTCP:  from $nick ($uhost)"
  return 1
}

## Clientinfo CTCP Reply
proc ctcp_cinfo {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  set oldbxcmd " "
  set bxcmd [lindex $args 0]
  set oldbxcmd $bxcmd
  set bxcmd "[string toupper $bxcmd]"
  if {$bxcmd=="NONE"} { return 0 }
  if {$bxcmd==""} { set bxcmd NONE }
  switch $bxcmd {
    NONE       { set text "NOTICE $nick :CLIENTINFO SED UTC ACTION DCC CDCC BDCC XDCC VERSION CLIENTINFO USERINFO ERRMSG FINGER TIME PING ECHO INVITE WHOAMI OP OPS UNBAN IDENT XLINK UPTIME  :Use CLIENTINFO <COMMAND> to get more specific information"
                 putlog "BitchX: CLIENTINFO CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    UNBAN      { set text "NOTICE $nick :CLIENTINFO UNBAN unbans the person from channel"
                 putlog "BitchX: CLIENTINFO {UNBAN} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    OPS        { set text "NOTICE $nick :CLIENTINFO OPS ops the person if on userlist"
                 putlog "BitchX: CLIENTINFO {OPS} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    ECHO       { set text "NOTICE $nick :CLIENTINFO ECHO returns the arguments it receives"
                 putlog "BitchX: CLIENTINFO {ECHO} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    WHOAMI     { set text "NOTICE $nick :CLIENTINFO WHOAMI user list information"
                 putlog "BitchX: CLIENTINFO {WHOAMI} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    INVITE     { set text "NOTICE $nick :CLIENTINFO INVITE invite to channel specified"
                 putlog "BitchX: CLIENTINFO {INVITE} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    PING       { set text "NOTICE $nick :CLIENTINFO PING returns the arguments it receives"
                 putlog "BitchX: CLIENTINFO {PING} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    UTC        { set text "NOTICE $nick :CLIENTINFO UTC substitutes the local timezone"
                 putlog "BitchX: CLIENTINFO {UTC} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    XDCC       { set text "NOTICE $nick :CLIENTINFO XDCC checks cdcc info for you"
                 putlog "BitchX: CLIENTINFO {XDCC} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    BDCC       { set text "NOTICE $nick :CLIENTINFO BDCC checks cdcc info for you"
                 putlog "BitchX: CLIENTINFO {BDCC} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    CDCC       { set text "NOTICE $nick :CLIENTINFO CDCC checks cdcc info for you"
                 putlog "BitchX: CLIENTINFO {CDCC} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    DCC        { set text "NOTICE $nick :CLIENTINFO DCC requests a direct_client_connection"
                 putlog "BitchX: CLIENTINFO {DCC} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    ACTION     { set text "NOTICE $nick :CLIENTINFO ACTION contains action descriptions for atmosphere"
                 putlog "BitchX: CLIENTINFO {ACTION} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    FINGER     { set text "NOTICE $nick :CLIENTINFO FINGER shows real name, login name and idle time of user"
                 putlog "BitchX: CLIENTINFO {FINGER} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    ERRMSG     { set text "NOTICE $nick :CLIENTINFO ERRMSG returns error messages"
                 putlog "BitchX: CLIENTINFO {ERRMSG} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    USERINFO   { set text "NOTICE $nick :CLIENTINFO USERINFO returns user settable information"
                 putlog "BitchX: CLIENTINFO {USERINFO} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    CLIENTINFO { set text "NOTICE $nick :CLIENTINFO CLIENTINFO gives information about available CTCP commands"
                 putlog "BitchX: CLIENTINFO {CLIENTINFO} CTCP: from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    SED        { set text "NOTICE $nick :CLIENTINFO SED contains simple_encrypted_data"
                 putlog "BitchX: CLIENTINFO {SED} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    OP         { set text "NOTICE $nick :CLIENTINFO OP ops the person if on userlist"
                 putlog "BitchX: CLIENTINFO {OP} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    VERSION    { set text "NOTICE $nick :CLIENTINFO VERSION shows client type, version and environment"
                 putlog "BitchX: CLIENTINFO {VERSION} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    XLINK      { set text "NOTICE $nick :CLIENTINFO XLINK x-filez rule"
                 putlog "BitchX: CLIENTINFO {XLINK} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    IDENT      { set text "NOTICE $nick :CLIENTINFO IDENT change userhost of userlist"
                 putlog "BitchX: CLIENTINFO {IDENT} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1 }
    TIME       { set text "NOTICE $nick :CLIENTINFO TIME tells you the time on the user's host"
                 putlog "BitchX: CLIENTINFO {TIME} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1} 
    UPTIME     { set text "NOTICE $nick :CLIENTINFO UPTIME my uptime"
                 putlog "BitchX: CLIENTINFO {UPTIME} CTCP:  from $nick ($uhost)"
                 putserv "$text" ; return 1} }
    
    set text "NOTICE $nick :ERRMSG CLIENTINFO: $oldbxcmd is not a valid function"
    putlog "BitchX: CLIENTINFO {$bxcmd} CTCP:  from $nick ($uhost)"
    putserv "$text"
    return 1
}

## FINGER CTCP Reply
proc ctcp_finger {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  global aawaytime notaway realname
  if {$aawaytime != "0"} {
   set fidle [expr [unixtime] - $aawaytime]
  } {
   set fidle [expr [unixtime] - $notaway]
  }
  putserv "NOTICE $nick :FINGER $realname ([exec whoami]@[exec uname -n]) Idle $fidle seconds"
  putlog "BitchX: FINGER CTCP:  from $nick ($uhost)"
  return 1
}

## Userinfo CTCP Reply
proc ctcp_userinfo {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  global ctcpuserinfo
  putserv "NOTICE $nick :USERINFO ${ctcpuserinfo}"
  putlog "BitchX: USERINFO CTCP:  from $nick ($uhost)"
  return 1
}

## ERRMSG CTCP Reply
proc ctcp_errmsg {nick uhost handle dest keyword arg} {
  if {![good_flood_prot]} { return 1 }
  set reply [string range $arg 0 59]
  if {[string match "#*" $dest] != 1} {
   putserv "NOTICE $nick :ERRMSG $reply"
  }
  putlog "BitchX: ERRMSG {$reply} CTCP:  from $nick ($uhost)"
  return 1
}

## ECHO CTCP Reply
proc ctcp_echo {nick uhost handle dest keyword arg} {
  if {![good_flood_prot]} { return 1 }
  set reply [string range $arg 0 59]
  if {[string match "#*" $dest] !=1} {
   putserv "NOTICE $nick :ECHO $reply"
  }
  putlog "BitchX: ECHO {$reply} CTCP:  from $nick ($uhost)"
  return 1
}

## Access Denied CTCP Reply
proc ctcp_denied {nick uhost handle dest keyword args} {
  global botnick
  if {![good_flood_prot]} { return 1 }
  if {[string tolower $dest]!=[string tolower $botnick]} { return 1 }
  putserv "NOTICE $nick :BitchX: Access Denied"
  putlog "BitchX: Denied CTCP:  from $nick ($uhost)"
  return 1
}

## CTCP OP Reply
proc ctcp_op {nick uhost handle dest keyword arg} {
  if {![good_flood_prot]} { return 1 }
  set chn [lindex $arg 0]
  if {$chn==""} {return 1}
  if {[string match "#*" $dest] != 1} {
   putserv "NOTICE $nick :BitchX: I'm not on $chn, or I'm not opped"
  }
  putlog "BitchX: Denied {OP $chn} CTCP:  from $nick ($uhost)"
  return 1
}

## CTCP OPS Reply
proc ctcp_ops {nick uhost handle dest keyword arg} {
  if {![good_flood_prot]} { return 1 }
  set chn [lindex $arg 0]
  if {$chn==""} {return 1}
  if {[string match "#*" $dest] != 1} {
   putserv "NOTICE $nick :BitchX: I'm not on $chn, or I'm not opped"
  }
  putlog "BitchX: Denied {OPS $chn} CTCP:  from $nick ($uhost)"
  return 1
}

## INVITE CTCP Reply
proc ctcp_invite {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  set chn [lindex $args 0]
  if {$chn==""} {return 1}
  if {[string index $chn 0]=="#"} {
   if {[lsearch [string tolower [channels]] [string tolower $chn]] >= 0} {
    if {[string match "#*" $dest] != 1} {
     putserv "NOTICE $nick :BitchX: Access Denied"
    }
    putlog "BitchX: Denied {INVITE $chn} CTCP:  from $nick ($uhost)"
   } else {
   if {[string match "#*" $dest] != 1} {
    putserv "NOTICE $nick :BitchX: I'm not on that channel"
   }
   putlog "BitchX: Denied {INVITE $chn} CTCP:  from $nick ($uhost)"
   return 1
  }
 }
}

## UNBAN CTCP Reply
proc ctcp_unban {nick uhost handle dest keyword args} {
  if {![good_flood_prot]} { return 1 }
  set chn [lindex $args 0]
  if {$chn==""} {return 1}
  if {[string index $chn 0]=="#"} {
   if {[lsearch [string tolower [channels]] [string tolower $chn]] >= 0} {
    if {[string match "#*" $dest] != 1} {
     putserv "NOTICE $nick :BitchX: Access Denied"
    }
    putlog "BitchX: Denied {UNBAN $chn} CTCP:  from $nick ($uhost)"
   } else {
   if {[string match "#*" $dest] != 1} {
    putserv "NOTICE $nick :BitchX: I'm not on that channel"
   }
   putlog "BitchX: Denied {UNBAN $chn} CTCP:  from $nick ($uhost)"
   return 1
  }
 }
}

## Random Auto-AWAY ( Extreme Protection! )
## VASTLY improved by blue
proc do_away {} {
  global aawaymin aawaysec aawaytime autoaway cloak notaway notifyaway bxsetaway
  if {$bxsetaway == 0} {
   set aawaymin [expr [rand 10] + $aawaymin]
   set aawaysec [expr [rand 59] + 1]
   set aawaytime [unixtime]
   set sendauto "$autoaway"
   if {$cloak == 1} {
    append sendauto "  \[${aawaymin}m ${aawaysec}s\]"
   } elseif {$cloak == 3} {
    append sendauto " (${aawaymin}m${aawaysec}s)"
   } elseif {$cloak == 4} {
    append sendauto " ..(${aawaymin}m${aawaysec}s)"
   } elseif {$cloak == 6} {
    append sendauto " \[gone:${aawaymin}m ${aawaysec}s\]"
   } elseif {$cloak == 7} {
    append sendauto "${aawaymin}m${aawaysec}s"
   }
   if {$notifyaway == 1} {
    putlog "BitchX: Auto-Away On"
   }
   putserv "AWAY :${sendauto}"
   set bxsetaway 1
  } else {
   set aawaymin 0
   set aawaysec 0
   set aawaytime 0
   set notaway [unixtime]
   if {$notifyaway == 1} {
    putlog "BitchX: Auto-Away Reset"
   }
   putserv "AWAY :"
   set bxsetaway 0
 }
 utimer [expr [rand 600] + 1] do_away
}

if {![info exists bxaway]} {
  utimer [expr [rand 600] + 1] do_away
}

set bxaway 1

## 'Good' flood protection - blue
proc good_flood_prot {} {
  global ctcpqueue ctcptimer ctcps
  if {$ctcpqueue >= $ctcps} { return 0 }
  set ctcpqueue [expr $ctcpqueue + 1]
  if {[info exists ctcptimer]} {
   if {[string match "*${ctcptimer}*" [timers]]} {
    killtimer $ctcptimer
   }
  }
  set ctcptimer [timer 1 {set ctcpqueue 0}]
  return 1
}

## Fake /sv implemented by blue
bind dcc m sv show_ver
bind dcc m sver show_ver

proc show_ver {hand idx arg} {
  if {$arg != ""} {
   global sver
   set sendto [lindex $arg 0]
   putserv "PRIVMSG $sendto :${sver}"
   return 1
  } {
  putdcc $idx "Usage: .sv (nick/#chan)"
  return 0
 }
}

## .bxk/.bxkb implemented by blue

bind dcc m bxk bxkick
bind dcc m bxkb bxkickb

proc bxkick {hand idx arg} {
  if {[lindex $arg 1] == ""} {
   putdcc $idx "Usage: .bxk \[#channel\] (nick) (reason)"
   return 0
  }
  if {[string index $arg 0] != "#"} {
   set chan [lindex [console $idx] 0]
   set nick [lindex $arg 0]
   set reason [lrange $arg 1 end]
  } {
   set chan [lindex $arg 0]
   set nick [lindex $arg 1]
   set reason [lrange $arg 2 end]
  }
  global kickpub botnick
  if {![isop $botnick $chan]} {
   putlog "I'm not an op in $chan!"
   return 0
  }
  if {![onchan $nick $chan]} {
   putlog "$nick is not on $chan right now."
   return 0
  }
  putlog "Kicked $nick on $chan: ${reason}"
  putserv "KICK $chan $nick :${kickpub}${reason}"
  return 1
}

proc bxkickb {hand idx arg} {
  if {[lindex $arg 1] == ""} {
   putdcc $idx "Usage: .bxkb \[#channel\] (nick) (reason)"
   return 0
  }
  if {[string index $arg 0] != "#"} {
   set chan [lindex [console $idx] 0]
   set nick [lindex $arg 0]
   set reason [lrange $arg 1 end]
   set uh [getchanhost $nick $chan]
   if {$uh == ""} {
    putlog "$nick is not on $chan right now."
    return 0
   }
   regexp {^(.*)@} $uh "" user
   regsub {^~} $user "" user
   if {[regexp {\*$} [maskhost $uh]]} {
    regexp {@(.*)$} [maskhost $uh] "" host
   } {
   if {![regexp {@.*\.(.*\..*)$} $uh "" host]} {
    regexp {@(.*)$} $uh "" host
   } {
   set host "*.${host}"
   }
  }
 } {
 set chan [lindex $arg 0]
 set nick [lindex $arg 1]
 set reason [lrange $arg 2 end]
 set uh [getchanhost $nick $chan]
 if {$uh == ""} {
  putlog "$nick is not on $chan right now."
  return 0
 }
 regexp {^(.*)@} $uh "" user
 regsub {^~} $user "" user
 if {[regexp {\*$} [maskhost $uh]]} {
  regexp {@(.*)$} [maskhost $uh] "" host
 } {
  if {![regexp {@.*\.(.*\..*)$} $uh "" host]} {
   regexp {@(.*)$} $uh "" host
  } {
   set host "*.${host}"
   }
  }
 }
 global kickbpub botnick
 if {![isop $botnick $chan]} {
  putlog "I'm not an op in $chan!"
  return 0
 }
 putlog "Kickbanned $nick on $chan: $reason"
 putserv "MODE $chan -o+b $nick *!*${user}@${host}"
 putserv "KICK $chan $nick :${kickbpub}${reason}"
 return 1
}

bind dcc m bxlk bxlk

proc bxlk {hand idx arg} {
  if {[string index $arg 0] != "#"} {
   putdcc $idx "Usage: .bxlk (#channel) \[reason\]"
   return 0
  }
  set chan [lindex $arg 0]
  set reason [lindex $arg 1]
  global botnick
  if {![isop $botnick $chan]} {
   putlog "I'm not an op in $chan!"
   return 0
  }
  putdcc $idx "Kicking all non-ops and non-voiced in $chan"
  foreach lk [chanlist $chan] {
  if {![isop $lk $chan] && ![isvoice $lk $chan]} {
   putserv "KICK $chan $lk :<BX-LK> $reason"
  }
 }
 return 1
}

putlog "BitchX Poser Script v14 By: seram..."

setclient
setscript

## EOF
