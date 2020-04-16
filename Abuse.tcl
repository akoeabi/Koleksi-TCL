## -----------------------------------------------------------------------
##           Abuse user Report Ver 1.0 Disign by H@0 (hendra asianto)                               
## -----------------------------------------------------------------------
## my email   		: hendra_asianto@hotmail.com
## my website 		: http://www.snowbot.s5.com/ or http://www.geocities.com/schwarx/
## my channel website	: http://www.geocities.com/schwarx/dalnet
## 
## Abuse user Report Ver 1.0
##
## These are all TCL scripts. I have tried  them in : #mania and #cyborg
## And These TCLs are still used. Want to know other TCLs made by me? You can visit my website or my channels.
##                                           
## Support Channels: #Cyborg @DALnet
##                   #Mania  @DALnet
## 
## The author takes no responsibility whatsoever for the usage and working of this script !
## 


# What channel you wanna the bot repot (ONLY ONE CHANNEL)
set validchannel "#cyborg"

# Makes the bot add abuse messages to a running log file. Put a file name
# here to activate it [such as "abuse.txt"], or leave it blank to kill it.

set abuselogfile "Abuse.txt"

#############################################################################
#############################################################################
############################### STOP EDITING ################################
#############################################################################
#############################################################################

## ----------------------------------------------------------------
## --- Don't change anything below here if you don't know how ! ---
## ----------------------------------------------------------------

if {![info exists validchannel]} {die "ERROR:Check back again in set validchannel settings.."}
set arg.v "Abuse User Report"


bind kick - * bot_abuse_kick
bind pub n !report abuse_user_report

proc bot_abuse_kick {nick host handle chan who excuse} {
    global abuselogfile botnick validchannel
    if {$who != $botnick} {return 0}
    set data "$nick ($handle) kicked me from $chan for: $excuse"
    if {$abuselogfile != ""} {set r [open $abuselogfile a+]; puts $r "[strftime "%d %b %Y, %H:%M %z"]: $data"; close $r}
    putserv "privmsg $validchannel :\[$nick\] (\002$handle\002) kicked me from \002$chan\002 for: \002$excuse\002"
    return 0
}


proc abuse_user_report {nick host handle channel var} {
global abuselogfile botnick validchannel
set fd [open $abuselogfile r]
set abuselist { }
while {![eof $fd]} {
 set tmp [gets $fd]
 if {[eof $fd]} {break}
  set abuselist [lappend abuselist [string trim $tmp]]
 }
 close $fd
 if {[llength $abuselist] == 0} {
     putserv "notice $nick :No such list of abuse in database."
      return 0
 }
 putserv "notice $nick :List Of Abuse\n"
 foreach tmp $abuselist {
   putserv "notice $nick :- $tmp"
 }
putserv "notice $nick : End of Abuselist\n"
 return 0
}
     

## -----------------------------------------------------------------------
putlog "-=-=   PROTECTION  PROSES   =-=-=-=-=-"
putlog "Abuse user Report Ver 1.0:"
putlog "${arg.v} loaded Successfuly..."
##------------------------------------------------------------------------


