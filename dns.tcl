set dnshost(cmdchar) "!"

bind pub - [string trim $dnshost(cmdchar)]dns dns:res
bind pub n|n [string trim $dnshost(cmdchar)]amsg pub:amsg
bind pub - [string trim $dnshost(cmdchar)]User@host pub:host
bind pub - [string trim $dnshost(cmdchar)]persi pub:persi
bind pub - [string trim $dnshost(cmdchar)]dnsnick dns:nick
bind raw * 311 raw:host
bind raw * 401 raw:fail

set dns_chan ""
set dns_host ""
set dns_nick ""
set dns_bynick ""

proc pub:host {nick uhost hand chan arg} {
global dns_chan
set dns_chan "$chan"
putserv "WHOIS [lindex $arg 0]"
}

proc raw:host {from signal arg} {
global dns_chan dns_nick dns_host dns_bynick
set dns_nick "[lindex $arg 1]"
set dns_host "[lindex $arg 2]@[lindex $arg 3]"
foreach dns_say $dns_chan { puthelp "PRIVMSG $dns_say :\[4DNS Nick\] $dns_nick 12adalah $dns_host " }
if {$dns_bynick == "oui"} {
                set hostip [split [lindex $arg 3] ]
                dnslookup $hostip resolve_rep $dns_chan $hostip
                set dns_bynick "non"
}
}

proc raw:fail {from signal arg} {
global dns_chan
set arg "[lindex $arg 1]"
foreach dns_say $dns_chan { puthelp "PRIVMSG $dns_say :Nick $arg Tidak online keknya kakak." }
}

proc pub:persi {nick uhost hand chan text} {
putserv "PRIVMSG $chan :Dns Resolver 3.1 oleh $botnick"
}

proc dns:res {nick uhost hand chan text} {
 if {$text == ""} {
            puthelp "privmsg $chan :Syntax: [string trim $dnshost(cmdchar)]dns <host or ip>"
        } else {
                set hostip [split $text]
                dnslookup $hostip resolve_rep $chan $hostip
        }
}

proc dns:nick {nick uhost hand chan arg} {
global dns_chan dns_bynick dnshost
 if {$arg == ""} {
 puthelp "privmsg $chan :Syntax: [string trim $dnshost(cmdchar)]dnsnick <nick>"
        } else {
set dns_chan "$chan"
set dns_bynick "oui"
putserv "WHOIS [lindex $arg 0]"
        }
}

proc resolve_rep {ip host status chan hostip} {
        if {!$status} {
                puthelp "privmsg $chan :\[4DNS\] Maaf tidak bisa resolve 14$hostip"
        } elseif {[regexp -nocase -- $ip $hostip]} {
                puthelp "privmsg $chan :\[4DNS\] Resolve 14$ip 12adalah 14$host"
        } else {
                puthelp "privmsg $chan :\[4DNS\] Resolve 14$host 12adalah 14$ip"
        }
}