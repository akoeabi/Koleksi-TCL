#                     __    
#                    / /    
#               ____/ /_____
#              / __  // ___/
#             / /_/ // /___ 
#             \____/ \____/ 

# This script will check the Yahoo Messenger status (available/invisible/online). Script active on all eggdrop channels.
# Nothing to set. Just load the script and enjoy.
# Commands:
# !id <the_id>
# or
# !ym <the_id>
# This is the one and only version. Nothing to upgrade.
# Contact: dc@rock.com


package require http

bind pub -|- !id yahoo:status
bind pub -|- !ym yahoo:status

proc yahoo:status {nick host hand chan arg} {

        set yahooid [join [lindex [split $arg] 0]]
        set token [http::config -useragent "lynx"]
        set token [http::geturl "http://persiangap.com/?yids=$yahooid"]
        set html [http::data $token]
      
   putlog "Checking online status for $yahooid."
   
   if {[string match "*Online*" $html]} {
                puthelp "PRIVMSG $chan :$yahooid is Online!"
          return 0
        }

   if {[string match "*Offline*" $html]} {
                puthelp "PRIVMSG $chan :$yahooid is Offline!"
          return 0
        }

   if {[string match "*Invisible*" $html]} {
                puthelp "PRIVMSG $chan :$yahooid is Invisible!"
          return 0
        }

        if {[string match "*Server is busy*" $html]} {
                puthelp "PRIVMSG $chan :Server is busy, try later!"
          return 0
        }

}

putlog "Yahoo Messenger Status Checker loaded sucessfully."

#                     __    
#                    / /    
#               ____/ /_____
#              / __  // ___/
#             / /_/ // /___ 
#             \____/ \____/ 
