set whois(acc) "o|o"

bind pub $whois(acc) ".whois" whois:nick
bind pub $whois(acc) "!whois" whois:nick

proc whois:nick { nickname hostname handle channel arguments } {
global whois notc
set target [lindex [split $arguments] 0]
if {$target == ""} {
putquick "PRIVMSG $channel :Maaf kakak perintahya !whois nicknya siapa kakak."
return 0
}
if {[string length $target] >= "31"} {
putquick "PRIVMSG $channel :kakak $nickname kakak $target terlalu panjang kakak."; return
}
putquick "WHOIS $target $target"
set ::whoischannel $channel
set ::whoistarget $target
bind RAW - 401 whois:nosuch
bind RAW - 311 whois:info
bind RAW - 319 whois:channels
bind RAW - 301 whois:away
bind RAW - 312 whois:server
bind RAW - 313 whois:ircop
bind RAW - 330 whois:auth
bind RAW - 317 whois:idle
}

proc whois:putmsg { channel arguments } {
putquick "PRIVMSG $channel :$arguments"
}

proc whois:info { from keyword arguments } {
set channel $::whoischannel
set nickname [lindex [split $arguments] 1]
set ident [lindex [split $arguments] 2]
set host [lindex [split $arguments] 3]
set realname [string range [join [lrange $arguments 5 end]] 1 end]
whois:putmsg $channel "\[4Whois\] Informasi untuk kakak 4$nickname 12:"
whois:putmsg $channel "\[4Whois\] Nickname 12: 14$nickname"
whois:putmsg $channel "\[4Whois\] Identd 12: 14$ident"
whois:putmsg $channel "\[4Whois\] Hostname 12: 14$host"
whois:putmsg $channel "\[4Whois\] Realname 12: 14$realname"
unbind RAW - 311 whois:info
}

proc whois:server { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
whois:putmsg $channel "\[4Whois\] status 12: 14$server"
unbind RAW - 312 whois:server
}

proc whois:ircop { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
whois:putmsg $channel "\[4Whois\] status 12: IRC Operator"
unbind RAW - 313 whois:ircop
}

proc whois:away { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
set awaymessage [string range [join [lrange $arguments 2 end]] 1 end]
whois:putmsg $channel "\[4Whois\] Set away 12: 14$awaymessage"
unbind RAW - 301 whois:away
}

proc whois:channels { from keyword arguments } {
set channel $::whoischannel
set channels [string range [join [lrange $arguments 2 end]] 1 end]
set target $::whoistarget
whois:putmsg $channel "\[4Whois\] Channels 12: 14$channels"
unbind RAW - 319 whois:channels
}

proc whois:auth { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
set authname [lindex [split $arguments] 2]
whois:putmsg $channel "\[4Whois\] login 12: 14$authname"
unbind RAW - 330 whois:auth
}

proc whois:nosuch { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
whois:putmsg $channel "nggak online nickname 14$target kakak."
unbind RAW - 401 whois:nosuch
}

proc whois:idle { from keyword arguments } {
set channel $::whoischannel
set target $::whoistarget
set idletime [lindex [split $arguments] 2]
set signon [lindex [split $arguments] 3]
whois:putmsg $channel "\[4Whois\] Idle 12: 14[duration $idletime]. signon time [ctime $signon]"
unbind RAW - 317 whois:idle
}