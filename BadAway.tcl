########################################################################
# Bad Away vers 1.0
#
#This script banes users onjoin who have in their away the words that #are set in the script as forbidden.
#
#To activate this script just type in DCC .chanset #channel +badaway
#
#                                BLaCkShaDoW Productions
#######################################################################


#Here you can set the reason for Ban

set away(reason) "You have been banned because your AWAY contains forbidden caracters"

#Here you can set the words that are forbidden

set away(words) {
"*#*"
"*www.*"
"*http://*"
}

#Here you can set the ban time (minutes)

set away(bantime) "120"

#Here you can set the flags that are excepted

set away(flags) "nm|OASM"


#######################################################################

setudef flag badaway

bind join - * badaway

proc badaway {nick host hand chan args} {
global botnick away
set ::awaychan $chan
set ::awayhost $host
set handle [nick2hand $nick]
if {[channel get $chan badaway]} {
if {[matchattr $handle $away(flags) $chan]} { return 0 } 
putquick "WHOIS $nick $nick"
bind RAW - 301 awaycheck

}
}


proc awaycheck {from keyword arguments} {
global botnick away
set chan $::awaychan
set host $::awayhost
set awaymessage [string range [join [lrange $arguments 2 end]] 1 end]
set banmask "*!*@[lindex [split $host @] 1]"
foreach aways $away(words) {
if {[string match -nocase $aways $awaymessage]} {
newchanban $chan $banmask $botnick $away(reason) [expr $away(bantime)]

}
}
}

putlog "Bad Away 1.0 Tcl by BLaCkShaDoW Loaded"


