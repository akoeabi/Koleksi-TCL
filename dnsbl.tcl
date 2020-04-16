##############################################################################################
##  ##     dnsbl.tcl for eggdrop by Ford_Lawnmower irc.geekshed.net #Script-Help        ##  ##
##############################################################################################
##############################################################################################
##      ____                __                 ###########################################  ##
##     / __/___ _ ___ _ ___/ /____ ___   ___   ###########################################  ##
##    / _/ / _ `// _ `// _  // __// _ \ / _ \  ###########################################  ##
##   /___/ \_, / \_, / \_,_//_/   \___// .__/  ###########################################  ##
##        /___/ /___/                 /_/      ###########################################  ##
##                                             ###########################################  ##
##############################################################################################
##  ##                             Start Setup.                                         ##  ##
##############################################################################################
namespace eval dnsbl {
## Edit checksite to add or remove dnsbl sites                                              ##
  set checksite {"dnsbl.dronebl.org" "recent.spam.dnsbl.sorbs.net" "bl.blocklist.de" "rbl.efnet.org"}
## Change banmessage to the ban message you want                                            ##  
  set banmessage "\002IP found it dnsbl blacklist\002" 
## Change bantype to the type of ban you want: gzline, zline                                ## 
  set bantype "gzline"
## Change bantime to the length of ban you want                                             ##
  set bantime "10d"
## Change opernick and operpass to reflect the info from the bots oper block                ## 
## If you already have a oper script, comment out the bind at the bottom of this script     ##
  set opernick opernickhere
  set operpass operpasshere
##############################################################################################
##  ##                           End Setup.                                              ## ##
##############################################################################################   
  proc connection {host type text} {
    if {[string match -nocase {*client connecting*} $text]} {
      regexp -- {.*@([^\)]+)} $text null ip
      if {[regexp -- {([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})} $ip null a b c d]} {
        foreach dnsbl $dnsbl::checksite {
          dnslookup "$d.$c.$b.$a.$dnsbl" dnsbl::dronelookup
        }
      } else {
        dnslookup $ip dnsbl::lookup
      }
    } 
  }
  proc dronelookup {ip host status} {
     if {$status == 1} {
         regexp -- {([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.} $host null a b c d
         putnow "$dnsbl::bantype *@$d.$c.$b.$a $dnsbl::bantime :$dnsbl::banmessage"
     } else {
       return ""
     }
  }
  proc lookup {ip host status} {
     if {$status == 1} {
       regexp -- {([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})} $ip null a b c d
       foreach dnsbl $dnsbl::checksite {
         dnslookup "$d.$c.$b.$a.$dnsbl" dnsbl::dronelookup
       }
     } else {
       return ""
     }
  }
  proc operup {type} { 
    putserv "OPER $dnsbl::opernick $dnsbl::operpass" 
  }
}
bind raw - NOTICE dnsbl::connection
## You can comment out the event below if you already have a oper script for this bot.
bind evnt - init-server dnsbl::operup 