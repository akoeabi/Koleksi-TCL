#########################################
# 			    						#
# ReLease Date   : 30 Januari 2010  	#                 
# 							   			#
# DediCateD      : Ukhuwahnet@DALnet	#
#                                   	#  
#########################################

##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set whois(owner) "abah" 

# location
set whois(country) "Indonesia"
set whois(state) "Makassar"

# Update
set whois(update) "09.08.2010"

# Version
set whois(version) "20.10"

# Config:
# What is the minimum access someone needs to perform a whois with the bot?
# o = global op, m = global master, n = global owner
# |o = channel op, |m = channel master, |n = channel owner
set whois(acc) ""
	
# End configuration
	
bind pub $whois(acc) "!whois" whois:nick

proc whois:nick { nickname hostname handle channel arguments } {
global whois
    set target [lindex [split $arguments] 0]
if {$target == ""} {

return 0
}
	
# if {[string length $target] >= "14"} {
# putquick "PRIVMSG $channel :Maaf, Karakter terlalu panjang kalau bisa kurang dari 14 characters."; return
# }
# if {[regexp -all -- {[~\[\]\{\}\|\_\\]} $target]} {
# putquick "PRIVMSG $channel :Maaf, Kayla nggak menemukannya."; return
# }
putquick "WHOIS $target $target"
    set ::whoischannel $channel
	set ::whoistarget $target
bind RAW - 401 whois:nosuch
bind RAW - 311 whois:info
bind RAW - 319 whois:channels
bind RAW - 301 whois:away
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
	whois:putmsg $channel "$nickname - $ident@$host * $realname"
	unbind RAW - 311 whois:info
}

proc whois:ircop { from keyword arguments } {
	set channel $::whoischannel
	set target $::whoistarget
	whois:putmsg $channel "$target is an IRC Operator"
	unbind RAW - 313 whois:ircop
}

proc whois:away { from keyword arguments } {
	set channel $::whoischannel
	set target $::whoistarget
	set awaymessage [string range [join [lrange $arguments 2 end]] 1 end]
	whois:putmsg $channel "$target is away: $awaymessage"
	unbind RAW - 301 whois:away
}

proc whois:channels { from keyword arguments } {
	set channel $::whoischannel
	set channels [string range [join [lrange $arguments 2 end]] 1 end]
	set target $::whoistarget
	whois:putmsg $channel "$target on $channels"
	unbind RAW - 319 whois:channels
}

proc whois:auth { from keyword arguments } {
	set channel $::whoischannel
	set target $::whoistarget
	set authname [lindex [split $arguments] 2]
	whois:putmsg $channel "$target is authed as $authname"
	unbind RAW - 330 whois:auth
}

proc whois:idle { from keyword arguments } {
	set channel $::whoischannel
	set target $::whoistarget
	set idletime [lindex [split $arguments] 2]
	set signon [lindex [split $arguments] 3]
	whois:putmsg $channel "$target has been idle for [duration $idletime]. signon time [ctime $signon]"
	unbind RAW - 317 whois:idle
}

putlog "TCL Name : TCL Whois edited by $whois(owner) $whois(country) $whois(state) $whois(version) $whois(update)"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"
putlog "Loaded Status : Success ...!!!"