# Q auth script v3.2 by cmouse, modifyed by perplexa

#global qscript

### INSTALLATION
## 1. Copy this script to your scripts directory (manual assumes it's scripts)
##
## 2. Edit your eggdrop config file and add the ##following lines to it
##
#
set qscript(auth) authname
set qscript(pass) authpass
set qscript(usermodes) +ix
# source scripts/qauth.tcl
#
##
## 3. Rehash your bot, the script should work.
##
### PROBLEMS
### Contact perplexa on irc.quakenet.org / #perplexa

if {(![info exists qscript(auth)]) || (![info exists qscript(pass)])} {
  error "You have not read [file tail [info script]]. ###Please read the installation hints and configure your ###bot properly"
}

### DO NOT CHANGE THE FOLLOWING VALUES IF NOT NECESSARY (usually not)
### Changing these might cause the script to stop working

set qscript(authtarget) "Q@CServe.quakenet.org"
set qscript(authmask) "Q!TheQBot@CServe.quakenet.org"

# regex
set qscript(authedmask) {^AUTH'd\ssuccessfully\.$}
set qscript(failedmask) ##{Username\sor\spassword\sincorrect|Too\smany\susers\sAUTH'd}


####### NO NEED TO PROCEED ANY FURTHER #######

# initialization

bind evnt -|- "init-server" q:init
bind evnt -|- "disconnect-server" q:fini
bind raw -|- "NOTICE" q:notice

if {![info exists qscript(usermodes)]} {
  set qscript(usermodes) ""
}

if {![info exists qscript(authed)]} {
  set qscript(authed) 0
}

proc q:notice {from keyw args} {
 global qscript
  regexp -- {^.*?:(.*)$} [join $args "\x20"] -> args
  if {$qscript(authed) == 0} {
    if {[string match -nocase $qscript(authmask) $from]} {
      if {[regexp -nocase -- $qscript(authedmask) $args]} {
        set qscript(authed) 1
        putlog "Authenticated with network service."
        return 1
      } elseif {[regexp -nocase -- $qscript(failedmask) $args]} {
        set qscript(authed) 0
        putlog "Authentication with network service failed. ($args)"
        return 0
      }
    }
  }
}

proc q:check {from keyw args} {
 global qscript
  set args [lindex [split [join $args]] 1]
  if {$args != ""} {
    putquick "PRIVMSG $qscript(authtarget) :AUTH $qscript(auth) $qscript(pass)"
    unbind raw -|- "302" q:check
  }
}

proc q:checkifauthed {} {
 global qscript
  if {!($qscript(authed))} {
    bind raw -|- "302" q:check
    putquick "USERHOST Q"
    if {![string match *q:checkifauthed* [timers]]} {
     timer 5 q:checkifauthed
    }
  }
}

proc q:fini {evnt} {
 global qscript
  set qscript(authed) 0
  if {![string match *q:checkifauthed* [timers]]} {
    timer 5 q:checkifauthed
  }
}

proc q:init {evnt} {
 global qscript botnick
  if {$qscript(authed)} {return 0}
  set qscript(authed) 0
  if {![string match *q:checkifauthed* [timers]]} {
    timer 5 q:checkifauthed
  }
  if {$qscript(usermodes) != ""} {
    putquick "MODE $botnick $qscript(usermodes)" -next
  }
  putquick "PRIVMSG $qscript(authtarget) :AUTH $qscript(auth) $qscript(pass)" -next
}