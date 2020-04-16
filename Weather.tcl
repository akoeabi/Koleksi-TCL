##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set weather(owner) "abah" 

# location
set weather(country) "Indonesia"
set weather(state) "Makassar"

# Update
set weather(update) "09.08.2010"

# Version
set weather(version) "20.10"

# End configuration

#
# Settings
#

package require http 2.4

bind pub -!- !weather weather
proc weather {nick uhost hand chan text} {
	set weather(page) http://www.wunderground.com/cgi-bin/findweather/getForecast?query=
	set t [::http::geturl "$weather(page)$text" -timeout 30000]
	set data [::http::data $t]
	set text [lindex [split $text] 0] 
		::http::cleanup $t
   
   set l [regexp -all -inline -- {<h1 id="locationName" class=".*?">(.*?)</h1>.*?<div id="curCond">(.*?)</div>.*?<div class="titleSubtle">Temperature</div>.*?<span class="nobr"><span class="b">(.*?)</span>(.*?)</span>.*?<span class="nobr"><span class="b">(.*?)</span>(.*?)</span>.*?<span id="windCompassSpeed" class=".*?" pwsid=".*?" pwsunit=".*?" pwsvariable=".*?" english="" metric="">(.*?)</span>} $data]
 
   foreach {black a b c d e f g} $l {

 	   set a [string trim $a " \n"]
 	   set b [string trim $b " \n"]
	   set c [string trim $c " \n"]
	   set d [string trim [string map {{&deg;} {} {&nbsp;} {} {\n} {}} $d]]
	   set e [string trim $e " \n"]
	   set f [string trim [string map {{&deg;} {} {&nbsp;} {} {\n} {}} $f]]
	   set g [string trim $g " \n"]	   
	   
		putserv "PRIVMSG $chan :$a: $b Temperature: $c°$d Feels Like: $e°$f Wind(km/h): $g"
		return 0
	}
		putserv "privmsg $chan :Sorry, $text Location not found"
	
}

putlog "TCL Name : TCL Weather edited by $weather(owner) $weather(country) $weather(state) version $weather(version) update $weather(update)"
putlog "Running : Server $network"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"