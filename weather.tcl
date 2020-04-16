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

        putserv "PRIVMSG $chan :$a: $b Temperature: $c°$d Feels Like: $e°$f Wind(km/h): $g"
        return 0
    }
        putserv "privmsg $chan :Sorry, $text Location not found"

}