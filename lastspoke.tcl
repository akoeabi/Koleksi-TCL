###[INFO OWNER]###
set TCL "Last Spoke Users" 
set owner "abah" 
set country "Indonesia"
set state "Makassar"
set versi "20.10"
set update "09.08.2010"
set mail "abah@ukhuwah.net"

###[SETUP]###
putlog "AssaLamu`aLaikum WarahmatuLLah Please wait... loading $TCL (C) 1978 by abah..."

bind pubm - * spoke_pubm
bind part - * spoke_part
bind pub - !spoke spoke_query
bind pub - !last spoke_query
bind pub - !lastspokes spoke_query
bind pub - !spokeclean spoke_invoke_cleanup

if {![info exists spoke_start]} {
    set spoke_start [clock seconds]
}

proc spoke_pubm {nick uhost handle channel arg} {
    global spoke_time spoke_text
    set spoke_time($nick) [clock seconds]
    set spoke_text($nick) $arg
}

proc spoke_part {nick uhost handle channel {msg ""}} {
    global spoke_time spoke_text

    if { [info exists spoke_time($nick)] } {
    unset spoke_time($nick)
    }
    if { [info exists spoke_text($nick)] } {
    unset spoke_text($nick)
    }
}

proc spoke_timestr {seconds_since} {
    set minutes_since 0
    set hours_since 0
    set days_since 0
    if {$seconds_since > 59} {
    set minutes_since [expr $seconds_since / 60]
    set seconds_since [expr $seconds_since % 60]
    if {$minutes_since > 59} {
        set hours_since [expr $minutes_since / 60]
        set minutes_since [expr $minutes_since % 60]
        if {$hours_since > 23} {
        set days_since [expr $hours_since / 24]
        set hours_since [expr $hours_since % 24]
        }
    }
    }
   
    set msg ""
    if {$days_since > 0} {
    set plural ""
    if {$days_since > 1} { set plural "s" }
    append msg "$days_since day$plural, "
    }
    if {$hours_since > 0} {
    set plural ""
    if {$hours_since > 1} { set plural "s" }
    append msg "$hours_since hour$plural, "
    }
    if {$minutes_since > 0} {
    set plural ""
    if {$minutes_since > 1} { set plural "s" }
    append msg "$minutes_since minute$plural, "
    }
    set plural ""
    if {$seconds_since > 1} { set plural "s" }
    append msg "$seconds_since second$plural"

    return $msg
}

proc spoke_query {nick uhost handle channel arg} {
    global spoke_time spoke_text spoke_start
   
    set speaker [subst -novariables -nocommands $arg]
   
    if { ! [info exists spoke_time($speaker)]} {
    set msg "As far as I know, $speaker hasn't said anything."

    set intended ""
    set members [chanlist $channel]
    foreach member $members {
        if {[string equal -nocase $member $speaker] && ! [string equal $member $speaker]} {
        set intended $member
        set speaker $member
        append msg "  But if you meant $member, then:"
        break
        }
    }

    putserv "PRIVMSG $channel :$msg"

    if {$intended == ""} {
            set msg [spoke_timestr [expr [clock seconds] - $spoke_start]]
            putserv "PRIVMSG $channel :I've been watching for $msg."
        return
    }

    spoke_query $nick $uhost $handle $channel $speaker
    return
    }
   
    set seconds_since [expr [clock seconds] - $spoke_time($speaker)]
    set msg [spoke_timestr $seconds_since]

    putserv "PRIVMSG $channel :$msg ago, $speaker said '$spoke_text($speaker)'."
}

proc spoke_invoke_cleanup {nick uhost handle channel arg} {
    spoke_cleanup
}

proc spoke_cleanup {} {
    global spoke_time spoke_text spoke_timer_id

    if {[info exists spoke_timer_id]} {
    killtimer $spoke_timer_id
    unset spoke_timer_id
    }

    putlog "Cleaning up Last Spoke data..."

    set channel_list [channels]
    set nicks ""
    foreach channel $channel_list {
    set nicks [concat $nicks [chanlist $channel]]
    }

    set num_left 0
    foreach nick [array names spoke_time] {
    if {[lsearch $nicks $nick] == -1} {
        unset spoke_time($nick)
        unset spoke_text($nick)
        putlog "Purged $nick."
    } else {
        incr num_left
    }
    }

    putlog "$num_left nick(s) still in memory."
   
    set spoke_timer_id [timer 60 spoke_cleanup]
}

set spoke_timer_id [timer 60 spoke_cleanup]

###[INFO TCL]###
putlog "TCL Name : $TCL" 
putlog "Oleh : $owner $country $state $versi $update"
putlog "Mailto : $mail"
putlog "Loaded Status : Success Alhamdulillah !!!"