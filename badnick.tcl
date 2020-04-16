#--------------------------------------------------------------------------------------#
#                 BAD NICK SCRIPT BY RANA USMAN                                        #
#--------------------------------------------------------------------------------------#
########################################################################################
#- Enter the Bad nicks Below on which you want your bot to BAN  (Wild Cards Supported)-#
########################################################################################
set bnick {
  "peder" 
  "*qifsh*" 
  "*cifsh*" 
  "*fuksa*" 
  "*karin*" 
  "*pidh*" 
  "*pith*"
  "*pajdh*"
  "*pajth*"
  "*nanqim*"
  "*nancim*"
  "*thith*"
  "*cm"
  "*_cm"
}
#########################################################################################################
##                SET The channel on which you want this script to work                                ##
## Channels Separted by space...and if you want this script to work on all channels leave it as ""     ##
#########################################################################################################

set bchan "#AlbaChat"

################
#- Set Reason -#
################

set kickreason "Nick i palejuar - Ndroni nickun tuaj /nick nick-tjeter dhe hyni perseri!"


#--------------------------------------------------------------------------------------------------------------------#
#   SCRIPT STARTS FROM HERE...MAKE IT BETTER WITH YOUR SKILLS IF YOU CAN.I DONT RESTRICT YOU TO NOT TO TOUCH CODE!   #
#--------------------------------------------------------------------------------------------------------------------#


bind join - * join:RanaUsman
proc join:RanaUsman {nick uhost hand chan} {
global bnick bchan kickreason temp
if {(([lsearch -exact [string tolower $bchan] [string tolower $chan]] != -1)  || ($bchan == ""))} {
  set temp 0
	foreach i [string tolower $bnick] {
	if {[string match *$i* [string tolower $nick]]} {
	set temp 1
 	}
 	}
}
	if {!$temp} { return } {
putquick "MODE $chan +b $nick"
putquick "KICK $chan $nick :$kickreason"
 } 
}
putlog "=-\002 Loaded Bad Nick by DeviL (www.zemra.org)\002 -="

#########################################################################
#  	       	  Bad Ident Kicker Script v1.65.b 	            	#
#								                        # 
#							  	                        #
# Author: awyeah					                31st May 2004 #
# Email: awyeah@usa.net				         Build version 1.65.b #
# Copyright © 2004 awyeah All Rights Reserved	 http://www.awyeah.org/ #
#########################################################################
##################################################
### Start editing variables from here onwards! ###
##################################################

#Set the channel(s) you want this script active on.
#This script supports multiple channels.
#Usage: "#channel1 #channel2 #mychannel"
#(To activate on all channels use: "")
set badidentchans "#albachat"

#Set the *bad words* for the script to react on. 
#When users join a channel this script is activated 
#and their idents match this current world list, 
#they will be kicked/banned. (wildcards "*" are accepted)
#(Set/edit these words according to your needs)
#(I have already added some as examples)
set badidents {
  "peder" 
  "*qifsh*" 
  "*cifsh*" 
  "*fuksa*" 
  "*karin*" 
  "*pidh*" 
  "*pith*"
  "*pajdh*"
  "*pajth*"
  "*nanqim*"
  "*nancim*"
  "*thith*"
}


#Set the flags for bot owners, masters, ops
#and users which to exempt from the script.
#(Usage: m, n, o, or "mnf", "fbo" etc)
set badidentexempt "mnof|mnof"

#For how long you wish (in minutes) to ban the 
#user with the bad ident. (mins)
set badidbantime 30


###############################################################################
### Don't edit anything else from this point onwards, even if you know tcl! ###
###############################################################################

bind join - * join:badident

proc join:badident {nick host hand chan} {
 global botnick badidents badidentchans badidentexempt badidbantime
  if {(([lsearch -exact [string tolower $badidentchans] [string tolower $chan]] != -1) || ($badidentchans == "*")) && ($nick != $botnick)} {
    foreach badident [string tolower $badidents] {
     set badidentban1 "*!*$badident*@*"
     set badidentban2 "*!*@[lindex [split $host @] 1]"
     set userident "[string trimleft [string tolower [lindex [split $host "@"] 0]] "~"]"
    if {[string match *$badident* [string tolower $userident]]} {
      if {([botisop $chan]) && (![isop $nick $chan]) && (![isvoice $nick $chan]) && (![matchattr $hand $badidentexempt $chan]) && ([onchan $nick $chan])} {
	  putquick "MODE $chan -o+bb $nick $badidentban1 $badidentban2"
        putquick "KICK $chan $nick :Ident i palejuar - Ju lutem ndroni IDENTIN tuaj dhe hyni perseri."
        timer $badidbantime "pushmode $chan -b $badidentban2"
        return 0
        }
      }
    }
  }
}
# (ain't i an asskicker?...)


putlog "Bad Ident Kicker Script by \002DeviL\002 -=Loaded=-"
putlog "*ENABLED* Bad Ident Kicker Script on:\002 $badidentchans"

return
