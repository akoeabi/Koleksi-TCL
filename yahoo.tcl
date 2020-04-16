##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set yahooowner "abah" 

# Update
set yahooupdate "09.08.2010"

# location
set yahoocountry "Indonesia"
set yahoostate "Makassar"

# End configuration

bind pub -|- !ym yahoo:status

proc yahoo:status {nick host hand chan arg} {
global yahoo:status
if {![channel get $chan yahoo]} {puthelp "NOTICE $nick :FAILED: Yahoo isn`t set. Try !chanset +yahoo"; return}
set arg [lindex $arg 0]
if {$arg == ""} {
puthelp "NOTICE $nick :Foloseste: !ym <ID Mess>"
return 0 }
set token [http::config -useragent "lynx"]
set token [http::geturl "http://profiles.yahoo.com/$arg?intl=it&os=win&ver=8.1.0.425"]
set html [http::data $token]
putquick "PRIVMSG $chan :10Checking online status for 2$arg10."

if {[string match -nocase *alt="online">* $html]} {
puthelp "PRIVMSG $chan :2$arg is 3OnLine!"
return 0
} elseif {
[string match -nocase "*offline*" $html]} {
puthelp "PRIVMSG $chan :2$arg is 4OffLine!"
return 0
} else {
puthelp "PRIVMSG $chan :2Sorry, but the profile you are looking for 4is not currently available 2or 4YAHOO service is DOWN2!"
return 0
}
}

putlog "TCL Name : TCL Yahoo ID edited by $yahooowner $yahoocountry $yahoostate $yahooupdate"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"
putlog "Loaded Status : Success ...!!!"