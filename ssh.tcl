set portc(flag) ""
set portc(read) 1
bind pub $portc(flag) !ssh portscanpub
bind pub $portc(flag) ssh portscanpub
bind pub $portc(flag) .ssh portscanpub
bind msg $portc(flag) !ssh portscanmsg
bind msg $portc(flag) ssh portscanmsg
bind msg $portc(flag) .ssh portscanmsg
setudef flag portc
proc portscanpub {nick uhost hand chan text} {
global portc notc
set host [lindex [split $text] 0]
set port [lindex [split $text] 1]
if {$port == ""} {
putquick "NOTICE $nick :$notc !ssh <ip atau host> <port>"
} else {
if {[catch {set sock [socket -async $host $port]} error]} {
putquick "PRIVMSG $chan :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 7Refushed"
} else {
set timerid [utimer 15 [list porttimeoutpub $chan $sock $host $port]]
fileevent $sock writable [list portconnectedpub $chan $sock $host $port $timerid]
}
}
}
proc portconnectedpub {chan sock host port timerid} {
killutimer $timerid
set error [fconfigure $sock -error]
if {$error != ""} {
close $sock
putquick "PRIVMSG $chan :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 4[string totitle $error]"
} else {
fileevent $sock writable {}
fileevent $sock readable [list portreadpub $chan $sock $host $port]
putquick "PRIVMSG $chan :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 3Accepted"
}
}
proc porttimeoutpub {chan sock host port} {
close $sock
putquick "PRIVMSG $chan :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 4Timed Out"
}
proc portreadpub {sock} {
global portc
if {!$portc(read)} {
close $sock
} elseif {[gets $sock read] == -1} {
putquick "PRIVMSG $chan :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 7Socket Closed"
close $sock
}
}
proc portscanmsg {nick uhost hand text} {
global portc notc
set host [lindex [split $text] 0]
set port [lindex [split $text] 1]
if {$port == ""} {
putquick "NOTICE $nick :$notc !port <host> <port>"
} else {
if {[catch {set sock [socket -async $host $port]} error]} {
putquick "PRIVMSG $nick :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 12Refushed"
} else {
set timerid [utimer 15 [list porttimeoutmsg $nick $sock $host $port]]
fileevent $sock writable [list portconnectedmsg $nick $sock $host $port $timerid]
}
}
}
proc portconnectedmsg {nick sock host port timerid} {
killutimer $timerid
set error [fconfigure $sock -error]
if {$error != ""} {
close $sock
putquick "PRIVMSG $nick :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 4[string totitle $error]"
} else {
fileevent $sock writable {}
fileevent $sock readable [list portreadmsg $nick $sock $host $port]
putquick "PRIVMSG $nick :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 3Accepted"
}
}
proc porttimeoutmsg {nick sock host port} {
close $sock
putquick "PRIVMSG $nick :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 4Timed Out"
}
proc portreadmsg {sock} {
global portc
if {!$portc(read)} {
close $sock
} elseif {[gets $sock read] == -1} {
putquick "PRIVMSG $nick :\[4SSH\] ip atau vhost : 14$host port : 14$port status : 7Socket Closed"
close $sock
}
}