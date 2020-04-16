##------------------------------------ IN THE NAME OF ALLAH THE MOST MERCIFUL --------------------------------------##
#--------------------------------------------------------------------------------------------------------------------#
#                                    ADVERTISE/PRIVATE/DCC SPAM KICK SCRIPT BY RANA USMAN                            #
#--------------------------------------------------------------------------------------------------------------------#
#AUTHOR : RANA USMAN
#Email : coolguy_rusman@yahoo.com
#URL : www.ranausman.tk
#Version : 3.5
#If you have any suggestion about my script or any way to make it better kindly let me know i will be glad to look forward
#Server : Catch me on *UNDERNET* my nickname is ^Rana^Usman
#if you find any bugs kindly report them at coolguy_rusman@yahoo.com O-R usmanrana33@hotmail.com

###########
# HISTORY #
###########
#  BUG FIXED VERSION thanks to Someone from #egghelp @ Undernet for reporting i forgot his nick :)
#  BUG FIXED : Bot was not cycling the channel at the time specified in script which is fixed now after a huge effort, thanks #to iamdeath for finding out that multiple timer problem and thanks to Arfer @ #tcl dalnet to correct it.
# In this new version , I have made an option for user to whether send msg to chan to detect spam or not.
# Warning System Setuped !


###############
# DESCRIPTION #
###############
#Assalam O Aleikum n hello everyone here's another script which will gonna kick the users who advertise different URLs
#and sends invitation to join their channel.This script is effective because there is a option for bot to cycle channel
#after a specific time you will set in the bot configuration.This script will not only kick on channel advertisement 
#but also on the private advertisement and it will check for DCC spam too.INSHALLAH you will like it :).This script will
#Also send a message after every 15 minutes to detect spam as there are a lot of IRC scripts which spam on detecting any
#Sort of MSG on main of channel.
#For DCC spam bot will check for following files :- .zip .exe .vbs .rar .ini .htm .html .txt .com .bat .org .net  
###################### Special Thanks to arfer and MysticMan of #TCL @ Dalnet :)  #######################################

###############################
# HOW TO ENABLE CHANNEL CYCLE #
###############################
## To enable bot to cycle channel after specific time DCC to the bot and give the command below
# COMMAND  : .chanset #your_chan +advertisecycle  (TO ENABLE)
# COMMAND  : .chanset #your_chan -advertisecycle  (TO DISABLE)
## The channel cycling wont work untill you will not enable it

######################################################
# HOW TO ENABLE BOT TO MSG AT CHANNEL TO DETECT SPAM #
######################################################
## To enable bot to msg channel after specific time DCC to the bot and give the command below
# COMMAND  : .chanset #your_chan +msgchan  (TO ENABLE)
# COMMAND  : .chanset #your_chan -msgchan  (TO DISABLE)
## The channel messaging wont work untill you will not enable it


#########################
# CONFIGURATION SECTION #
#########################

## Set the channels here on which you want this script to work 
# Seperate channels by Space like "#channel1 #channel2 #channel3"
# If you want this script to work on all the channels where ur bot is parked leave it as ""
 
set advertisechans ""

##Set Advertising words here on which you want your bot to kick user
#You can manually add advertising words in the way mentioned below ( *WILD CARDS SUPPORTED* )
# set advertisingword {
# "*word1*"
# "*word2*"
# }

set advertisingword {
  "*#*" 
  "*.com"
  "*.net"

}

#Set how many times you want the bot to warn the user advertising before baning him out of channel
## To Disable set it to 0
#Set it to 0 if you want to ban the user without giving warning.
set uwarn 0

#set the Warning MSG you want bot to deliver
#It will not work if the above setting is set to zero

set warnmsg "Donot Advertise."

#Set time Below after which you want your bot to cycle the channel (in Minutes)
#After this time bot will cycle the channel and will detect advertisements if found will kick out
set advcycletime "15"

#Set the time after which you want to msg the channel for which you enabled +msgchan
#After this time bot will msg that channel to detect spam
set spammsg "25"

#Set the Msg you want bot to post to the channel [Would work only if enabled through partylines]

set mspam "Detecting Spam"

#Set the message below you want to give while bot parting channel
set partspam "-= Detecting Spam =-"

# Set the banmask type to use in banning the User who Advertises.
# Currently BAN Type is set to 1 (*!*@some.domain.com),
# BAN Types are given below;
# 1 - *!*@some.domain.com 
# 2 - *!*@*.domain.com
# 3 - *!*ident@some.domain.com
# 4 - *!*ident@*.domain.com
# 5 - *!*ident*@some.domain.com
# 6 - *nick*!*@*.domain.com
# 7 - *nick*!*@some.domain.com
# 8 - nick!ident@some.domain.com
# 9 - nick!ident@*.host.com
set advbantype "1"

#Set the Users Mode you want to Exempt
#The Bot will not kick the user who had the modes you will define below
#You can leave it as it is , if you dont know about it
#Recommended : of
set advusers "of"

###################
# SET KICK REASON #
###################

## Set Kick Reason for spam on channel or Advertise on channel
# The user will be kicked using this reason when someone advertise / Spam on the main of channel
set advertisekick "Spam Kick - For further help join #pakadmins"

## Set the kick Reason for DCC spam
# After cycling or if bot detects someone sending file to it the bot will kick the user using this reason
set dccspamkick "DCC spam Detected - For Help join #pakadmins"

## Set kick reason for Private Spam
# The user will be kicked using this reason when someone advertise / spam in the private of bot
set pvtspamkick "Pvt Spam detected - For help join #pakadmins"

###########################
# CONFIGURATION ENDS HERE #
###########################

######################################################################################################################
#--------------------------------------------------------------------------------------------------------------------#
#  SCRIPT STARTS FROM HERE.YOU CAN MAKE MODIFICATIONS AT UR OWN RISK, I DONT RESTRICT YOU TO NOT TO TOUCH THE CODE!  # 
#         MAKE THIS SCRIPT BETTER WITH YOU SKILLS.NO MORE CONFIGURATION REQUIRED BEYOND THIS POINT                   # 
#--------------------------------------------------------------------------------------------------------------------#
######################################################################################################################

# ALL THE BINDS #

setudef flag advertisecycle
setudef flag msgchan
bind msgm - * privatespam:RanaUsman
bind ctcp - DCC RanaUsman:dcc
bind pubm - * advertising:RanaUsman
bind EVNT - init-server pStartTimer
bind EVNT - init-server pmsgchan

# ALL THE PROCEDURES #
#This proc is to detect channel advertisements
proc advertising:RanaUsman {nick uhost hand chan text} {
global advertisingword advertisechans advertisekick banmask advusers adver warnmsg uwarn
#This checks for enabled channels for advertisescript 
if {(([lsearch -exact [string tolower $advertisechans] [string tolower $chan]] != -1)  || ($advertisechans == ""))} {
set text [advertise:filter $text]
set banmask "[advs:banmask $uhost $nick]" 
#this detects if there is some advertising word found :-)
foreach advertising [string tolower $advertisingword] {
if {[string match -nocase $advertising $text] || [string match -nocase "* $advertising *" $text] || [string match -nocase "$advertising *" $text] || [string match -nocase "* $advertising" $text]} {
if {[matchattr $hand $advusers] || [isbotnick $nick]} { return 0 } else {
# doing counter
if { ![info exists adver($uhost)] } {
         set adver($uhost) "0"
         } else {
         incr adver($uhost)
         }
         if { $adver($uhost) < $uwarn } {
         putserv "privmsg $chan :\002$nick\002 : $warnmsg"
         return
         } 
putquick "MODE $chan +bb $banmask"
putquick "KICK $chan $nick :$advertisekick"
    }
   }
  }
 }
}
# this proc will detect for pvt spam
proc privatespam:RanaUsman {nick uhost hand text} {
global spampvt advertisingword advertisechans pvtspamkick banmask advusers
set text [advertise:filter $text]
set banmask "[advs:banmask $uhost $nick]"
foreach advertising [string tolower $advertisingword] {
if {[string match -nocase $advertising $text] || [string match -nocase "* $advertising *" $text] || [string match -nocase "$advertising *" $text] || [string match -nocase "* $advertising" $text]} {
#below is the action bot will take against spammer and detects it if he is in channel
foreach onchans [channels] {
if {[onchan $nick $onchans]} {
if {[matchattr $hand $advusers] || [isbotnick $nick]} { return 0 } else {
utimer 2 [list putquick "MODE $onchans +bb $banmask"] 
utimer 3 [list putquick "KICK $onchans $nick :$pvtspamkick"]
     }
    } 
   }
  }
 } 
}
# This proc will check for DCC spam 

proc RanaUsman:dcc {nick uhost handle dest key arg} {
 global dccspamkick rusman onechans banmask advertisechans advusers dccspamword
 set banmask "[advs:banmask $uhost $nick]"
 set rusman [string tolower [lindex $arg 1]]
 if {[string match "*.exe" $rusman] || [string match "*.bat" $rusman] || [string match "*.vbs" $rusman] || [string match "*.html" $rusman] || [string match "*.htm" $rusman] || [string match "*.com" $rusman] || [string match "*.net" $rusman] || [string match "*.org" $rusman] || [string match "*.ini" $rusman] || [string match "*.zip" $rusman] || [string match "*.rar" $rusman]} {
 foreach onchans [channels] {
 if {[onchan $nick $onchans]} {
 if {[matchattr $handle $advusers] || [isbotnick $nick]} { return 0 } else {
 utimer 2 [list putquick "MODE $onchans +bb $banmask"] 
 utimer 3 [list putquick "KICK $onchans $nick :$dccspamkick"]
    } 
   }
  }
 }
}

#Here is the proc which will let bot towards cycling channel - Thanks to arfer #tcl @dalnet for correcting it
 
proc pStartTimer {type} {
  pScheduleTimer
}
 
proc pScheduleTimer {} {
  global advcycletime
  foreach item [timers] {
    if {[string equal "RanaUsman:cycle" [lindex $item 1]]} {
      killtimer [lindex $item 2]
    }
  }
  timer $advcycletime RanaUsman:cycle
}
 
proc RanaUsman:cycle {} {
  global advcycletime
  global partspam
  foreach chan [channels] { 
    if {[channel get $chan advertisecycle]} {
      putserv "PART $chan :$partspam"
    }  
  }
  pScheduleTimer
}
 
#It will msg channel after every 15 mins to detect spam

proc pmsgchan {type} {
  pmsgtimer
}
 
proc pmsgtimer {} {
  global spammsg
  foreach item [timers] {
    if {[string equal "RanaUsman:checkspam" [lindex $item 1]]} {
      killtimer [lindex $item 2]
    }
  }
  timer $spammsg RanaUsman:checkspam
}
 
proc RanaUsman:checkspam {} {
  global advcycletime
  global partspam mspam
  foreach chan [channels] { 
    if {[channel get $chan msgchan]} {
      putserv "PRIVMSG $chan :$mspam"
    }  
  }
  pmsgtimer
}





#Thanks to someone for this control code removing filter i dont remember his name :-)
proc advertise:filter {str} {
  regsub -all -- {\003([0-9]{1,2}(,[0-9]{1,2})?)?|\017|\037|\002|\026|\006|\007} $str "" str
  return $str
}
# Different types of BAN for bot to do :-)

proc advs:banmask {uhost nick} {
 global advbantype
  switch -- $advbantype {
   1 { set banmask "*!*@[lindex [split $uhost @] 1]" }
   2 { set banmask "*!*@[lindex [split [maskhost $uhost] "@"] 1]" }
   3 { set banmask "*!*$uhost" }
   4 { set banmask "*!*[lindex [split [maskhost $uhost] "!"] 1]" }
   5 { set banmask "*!*[lindex [split $uhost "@"] 0]*@[lindex [split $uhost "@"] 1]" }
   6 { set banmask "*$nick*!*@[lindex [split [maskhost $uhost] "@"] 1]" }
   7 { set banmask "*$nick*!*@[lindex [split $uhost "@"] 1]" }
   8 { set banmask "$nick![lindex [split $uhost "@"] 0]@[lindex [split $uhost @] 1]" }
   9 { set banmask "$nick![lindex [split $uhost "@"] 0]@[lindex [split [maskhost $uhost] "@"] 1]" }
   default { set banmask "*!*@[lindex [split $uhost @] 1]" }
   return $banmask
  }
}
# Ever seen such simple coding ? 
# I Completed this script at 11:27 AM on October 14 2005 
# 
##########################################################################################################
#--------------------------------------------------------------------------------------------------------#
putlog "\002=- *Anti Advertis Script* by *Rana Usman* (www.ranausman.tk) has been successfully LOADED -="
#--------------------------------------------------------------------------------------------------------#
##########################################################################################################


