#################################################################################
######################## BadChannelProtection.tcl ############################### 
#################################################################################
# v1.2.6                                                                      ###
#Paragod <paragod2002 [at] yahoo [dot] com>                                   ###
#Paragod on Undernet                                                          ###
# no website                                                                  ###
#################################################################################


#################################################################################
######################### License Agreement  ####################################
#################################################################################
# This program is free software: you can redistribute it and/or modify        ###
#    it under the terms of the GNU General Public License as published by     ###
#    the Free Software Foundation, either version 3 of the License, or        ###
#    (at your option) any later version.                                      ###
#									      ###
#    This program is distributed in the hope that it will be useful,          ###
#    but WITHOUT ANY WARRANTY; without even the implied warranty of           ###
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            ###
#    GNU General Public License for more details.                             ###
#                                                                             ###
#    You should have received a copy of the GNU General Public License        ###
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.    ###
#                                                                             ###
#################################################################################

#################################################################################
############################## Description: #####################################
#################################################################################
# Performs a whois on every nick that joins the protected channel and places ####
# a *!*@host ban if it matches a banned channel.                             ####
#									     ####
# Please Note, this checks a nick once when they join. It will not prevent   ####
# someone from joining a banned channel after they have joined your channel  ####
#################################################################################


#################################################################################
###################### Change Log ###############################################
#################################################################################
# 12/2009     Release of v1.2.6    (first public rel)                         ###
# 12/2009     Release of v1.1 beta (not public)                               ###
#################################################################################

#################################################################################
############################## Release Notes for v1.2.6    ######################
#################################################################################
#	From v1.1beta                     				      ### 
# 									      ###
#	1: Wrote or Rewrote: license agreement, description, change log       ###
#	   Release notes, Command list, Installation and User Variables       ###
#	   documentation.						      ### 
#	2: Added putlog entries when bot kicks/bans for bad channels          ###
#	3: Modified the kick reason string to allow for the actual channel    ###
#		name being kicked for.					      ###
#	4: Changed some processing characterists.			      ###
#									      ###
#################################################################################

#################################################################################
#########################  Command List  ######################################## 
#################################################################################
#  There are no /msg(MSG) or !Public(PUB) Commands available.                 ###   
#									      ###
#	DCC/Telnet Commands						      ###
#	1: Bot Owner ( n|n ) Only                                             ###
#	2: Syntax:                                                            ###
#	 Use .chanset to set channel protection from bad channels.            ###
#           To turn on protection -  .chanset #yourchan +bcpro                ###
#           To turn off protection - .chanset #yourchan -bcpro                ###
# 									      ###
#   Channels can be individually protected. If you have 3 channels and you    ###
#	only want two protected, load script and type this.                   ###
#		.chanset #YourChanToProtect +bcpro                            ###
#		.chanset #YourChanToProtect2 +bcpro                           ###
##		.chanset #ChanToLeaveAlone -bcpro                             ###
#									      ###
#									      ###
#  By default the channel flag (bcpro) is disabled. Enable it on the          ###
#  channels you wish.							      ###
#									      ###
# For those interested: This script sets a new channel flag to use with the   ###
# .chanset feature.  this flag is 'bcpro'.				      ###
#									      ###
#################################################################################

#################################################################################
########################### Installation ########################################
#################################################################################
#									      ###	
#  1: Edit the Needed User information below and save file.                   ###
#  2: Add this line to your bots conf file..                                  ###
#         source scripts/bannedchannelpro.tcl                                 ###
#  3: Upload bannedchanpro.tcl to your /scripts/ directory                    ###
#  4: Start, .Restart or .Rehash your bot.                                    ###
#  5: See Command List above                                                  ###
#                                                                             ###
#################################################################################


#################################################################################
#####  Begin Editing Here ##### Begin Editing Here ##### Begin editing Here #####
#################################################################################
########################### User Variables ######################################
#################################################################################


#################################################################################
#       List of Bad/Banned Channel - Place each with a space between them     ###
#################################################################################
# Known Bug Notice:  When placing a ban on #foobar, if someone joins and is   ###
#	       in channel #foo, this script will kick/ban.  		      ###
#   Until I fix this, Please choose your banned channels carefully.           ###
#                   Wildcards "*" are NOT valid                               ###
#################################################################################

set bcp(chans) { #*dads4sons #incest #familysex #0!!!!!!!!!!younggirlsex #dogsex #snuffsex #childrapetorturebrutality #daringdarlings #buddingblossoms #zooplay #0!!!!!!!ltlgirlsexchat #0!!!!!momdaughtersex #0!!!!!!!dad&daughtersex #!!!!!pedosnuffsex #pedophilia #baby&toddlerlove #boylovers #man&boy4chat_uncensored #teen #childslavesex #childtoiletsex #rapesex #0!!!!!!!!!!pedomoms }



#######################################################################################
#            Ban reason and the ban time (in minutes):			            ### 
#######################################################################################
# You can use the example below which should be good for most channels.  If you     ###
# want/need to change anything, Make sure you keep ALL double quotes (") in         ###
# thier exact place.                                                                ###
# $bla = The banned channel that the script kicked for.  It only uses the first     ###
#        matching channel. 							    ###
# $chan = The channel the bot is protecting and the user was kicked from.           ###
#######################################################################################

#######################################################################################
#				Kick Message 					    ###
#######################################################################################

# Set your preamble here. Whatever you want to say before the channel that is being banned for is listed.
set pre1 " Unallowed Channel - "

# $bla (The channel kicked for) is called next.

#Set the middle of your message next.  after the channel they are being kicked for
set mid1 " is not allowed while in "

# $chan is The channel the bot is kicking the user from

#If you would like to post further information such as rules or start a pointer to your website.
set post1 " - Detailed Rules at "

# If you have a website where a list of rules are available list it here, otherwise leave empty
set website "http://www.yoursite.com/"

#Grammar is a good thing. :o) This just ends your kick message with a period.
set post2 "."

# Set Ban time here - in minutes - Default is 60 minutes. (1 hours)
set bcp(bantime) {60}




#######################################################################################
#                    Prevent Flooding the Bot 					    ###
#######################################################################################
# 	Number of joins in seconds to do a delayed whois.			    ###
#######################################################################################
# 	Format - n of Joins : in n seconds : delay n seconds                        ###
#   This setting should be fine for most channels				    ###
#######################################################################################
#
set bcp(flood) "5:3:5"

## This is here to make sure you've configured Banned Channel Protection completely.
## Uncomment this to make the bot work. Double check *all* the settings! 
die "Bot Stopped - Please make sure you edit bannedchanpro.tcl completely."

#######################################################################################
##########   END Editing Here ##### END Editing Here ##### END editing Here ###########
#######################################################################################
################################# End User Variables ##################################
#######################################################################################
###############  Don't edit past here unless you know TCL! ############################
#######################################################################################


set bcp(version) "1.2.6"
setudef flag bcpro


#  binds to call procs

bind join * * bcpro:join
bind part - * bcpro:part
bind raw - 319 bcpro:chans


# Kick reason construction

lappend bcp(bc) $pre1 $mid1 $post1 $website $post2


# Process that does the whois on join

proc bcpro:join {nick uhost hand chan} { 
  global bflood bcp
  if {![channel get $chan bcpro] || [isbotnick $nick ] || [matchattr $hand f|f $chan]} {
    return
  } 
  if {![info exists bflood($chan)]} {
    set bflood($chan) 0
  }
  incr bflood($chan)
  utimer [lindex [set bla [split $bcp(flood) ":"]] 1] [list incr bflood($chan) -1]
  if {$bflood($chan) >= [lindex $bla 0]} {
    puthelp "WHOIS $nick"
        } else {
    utimer [lindex $bla 2] [puthelp "WHOIS $nick"]
  }
  lappend bcp(whois) "$nick:$chan:*!*@[lindex [split $uhost @] 1]"
}


# Process that checks the users channels against the banned channel array/list

proc bcpro:chans {from key txt} { 
  global bcp
  if {[isbotnick [set nick [lindex [split $txt] 1]]] || [validuser [nick2hand $nick]]} {
    return
  }
  if {[set position [lsearch $bcp(whois) "*$nick:*"]] != -1} {
    foreach bla [lrange $txt 2 e] {
      if {[string match -nocase "*[string trimleft $bla ":@+"]*" $bcp(chans)]} {
        if {[botisop [set chan [lindex [set t [split [lindex $bcp(whois) $position] :]] 1]]]} {
          putquick "KICK $chan [lindex $t 0] :[lindex $bcp(bc) 0] $bla [lindex $bcp(bc) 1] $chan [lindex $bcp(bc) 2] [lindex $bcp(bc) 3] [lindex $bcp(bc) 4]" -next
	  putlog "Banned Channel Protection kicking $nick for co-channeling in $bla ."
        }
        newchanban $chan [lindex $t 2] BCP [lindex $bcp(bc) 0] [lindex $bcp(bantime) 0]
        set bcp(whois) [lreplace $bcp(whois) $position $position]
        break
      }
    }
  }
}


# Removes Arrays when a nick parts the channel so it won't use a lot of memory for info that just sits there.

proc bcpro:part {nick uhost hand chan msg} {
  global bflood
  if {[isbotnick $nick] && [string match -nocase "*$chan*" [array names bflud]]} {
    array unset bflood $chan
  }
}

putlog "Banned Channel Protection v$bcp(version) by Paragod loaded."
putlog "(C) Copyright 2009 Paragod Under GNU GPLv3"

##  For debugging purposes

# putlog "Banning Channels: $bwhois(chans) ."
# putlog "part of the kick msg :[lindex $bwhois(bc) 0] [lindex $bwhois(bc) 1] [lindex $bwhois(bc) 2] [lindex $bwhois(bc) 3] [lindex $bwhois(bc) 4]"
