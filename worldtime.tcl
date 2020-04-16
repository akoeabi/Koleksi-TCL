bind pub - .time worldntime

package require http

setudef flag wtime

proc worldntime {nick uhost hand chan text} {
   if {![channel get $chan wtime]} { return 0 }
   if {![llength $text]} { puthelp "privmsg $chan :Usage: $::lastbind <location>"; return 0 }
   set token [http::geturl http://localtimes.mobi/search/?s=[join $text +]&x=0&y=0 -timeout 9000]
   set data [http::data $token]
   ::http::cleanup $token
   if {[regexp -- {Home</a>(.+?)</span>.+?<div class="timeinfo">(.+?)</div>.+?<div class="tz_container">(.+?)</li>} $data - loc t1 t2]} {
      puthelp "privmsg $chan :\00304[cleanup $loc]\003: [cleanup $t1]"
      puthelp "privmsg $chan :[cleanup $t2]"
   } else { puthelp "privmsg $chan :No any information found for \"$text\". Please be more specific!"; return }
   return 0
}

proc cleanup str {
   regsub -all -- {(?:<label>|</label>)} $str \002 str
   regsub -all -- "<.+?>" $str " " str
   regsub -all -- {&raquo;} $str \003\u00bb\00304 str
   regsub -all -- {&nbsp;} $str { } str
   regsub -all -- {\s+} $str { } str
   return $str
}