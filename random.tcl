############################################
#  Command for random fml quote = !fml     #
############################################

bind pub - !fml pub_FML

proc pub_FML {nick uhost handle chan text} {


        package require http
 ## UNCOMMENT FOR HTTPS ##     package require tls       
 ## UNCOMMENT FOR HTTPS ##     http::register https 443 [list ::tls::socket -tls1 1]
        set agent "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko"
        set token [http::config -useragent $agent]
        set token [http::geturl "http://www.fmylife.com/random"]
        set html [http::data $token]
        http::cleanup $token
 ## UNCOMMENT FOR HTTPS ##      http::unregister https

regexp {<p class="block hidden-xs">(.*?)</a>} $html - a
regsub -all {<[^>]*>} $a {} a
regsub -all {[\r\t\n]+} $a "" a
putserv "PRIVMSG $chan : $a"
}

putlog "Random FML loaded!"
