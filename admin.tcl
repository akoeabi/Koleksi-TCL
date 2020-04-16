# -> trigger 
set waffles(cmd) "!admin" 

# -> Admins list 
# can be 1, 2, 3 or 50,000 nicks, there is no limit but your own imagination 
# if more than one, seperate each by a single space. 
set waffles(list) "admin1 admin2 etc etc" 

# -> Message type 
# 0 for private message, or 1 for notice 
set waffles(type) 1 

### end config, changes beyond not advised 

bind pub - $waffles(cmd) pub:needadmin 

proc pub:needadmin { nick host hand chan arg } { 
    global waffles 
    if {$waffles(type) == 0} { 
        set adtype "PRIVMSG" 
    } else { 
        set adtype "NOTICE" 
    } 
    if {$arg != ""} { 
        set adreason " Reason: [join [lrange [split $arg] 0 end]]" 
    } else { 
        set adreason "" 
    } 
    foreach ad [split $waffles(list)] { 
        if {[onchan $ad]} { 
             set flagtrap 1 
             # puthelp is used here because (potentially) we jested above 
             # about putting 50,000 nicks, some people may take that 
             # seriously. puthelp queue can handle it without flooding bot. 
             # changing this to putquick or putserv is ill advised. 
             puthelp "$adtype $ad :\002$nick\002 requires assistance from an admin on $chan.$adreason" 
        } 
    } 
    if {[info exists flagtrap]} { 
        putserv "$adtype $nick :$nick, your request has been sent to the admins, please wait for assistance." 
    } else { 
        putserv "$adtype $nick :Sorry $nick, the admins are unavailable at this time. Try again later." 
    } 
}