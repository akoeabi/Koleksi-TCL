# $Id: badident.tcl, eggdrop-1.6.x 2004/5 awyeah@usa.net Exp $

# Begin - Unacceptable User Ident, Bad Ident Kicker Script v1.65.b
#	Script Version: 1.65.b
#	Built Date: January 2004, Last Updated: 31st May 2004
#	Copyright © 1999-2004 awyeah (awyeah@usa.net)
#	TCL script was designed to use with eggdrop v1.5.x or higher

#########################################################################
#  	       	  Bad Ident Kicker Script v1.65.b 	            	#
#								                        # 
#							  	                        #
# Author: awyeah					                31st May 2004 #
# Email: awyeah@usa.net				         Build version 1.65.b #
# Copyright © 2004 awyeah All Rights Reserved	 http://www.awyeah.org/ #
#########################################################################
#												#
# #######								                  #
# PURPOSE							                        #
# #######											#
#								        			#
# This small nifty script gets rids of people who join channel using	#
# a bad ident. A bad ident, being an ident containing bad words, such	#
# as swear words and etc.								#
#								                        #
# I developed this script on the request of some friends who urged me	#
# to come up with something like this. The main reason being that		#
# people with bad idents are mainly considered bad people, supposingly	#
# being on bad channels and therefore these perverted people would not	#
# be allowed to enter familiy channels.						#
#								                        #
# This script is quite effective and can detect almost any kind of      #
# bad idents. Either dynamic idents (with ~) or normal idents (without	#
# the ~). When bad/swear words are found in the ident the users are	#
# kicked/banned out of the channel.							#
#												#
#########################################################################
#												#
# ###########									      #
# DESCRIPTION							                  #
# ###########										#
#							                              #
# This script will make your eggdrop bot detect any bad words in idents	#
# from people joining in a channel. It would kick/ban the people found	#
# with such idents out of the channel immediately.				#
#						                        		#
# The bad words matching procedure utilizes wildcards, such as (*) 	#
# which give the script a more enhanced pattern matching complexity.	#
# The punishment ban time is a variable value and can be customized 	#
# according to the bot owners needs.						#
# 												#
# This is a very effective script to stop people with bad idents from	#
# entering your channel. (or the channels you bot is opped on)		#
#								                        #
#########################################################################
#								                        #
# ########									      	#
# FEATURES							                  	#
# ########											#
#								                        #
# 1. This script can be utilized on multiple channels.			#
#												#
# 2. User defined and customizable 'bad words' can be added for the	#
#    bad ident pattern matching. (wildcards as "*" are also accepted)	#
#												#
# 3. The bot will exempt any ops/voices (@/+) joining the channel.	#
#								                        #
# 4. The bot will exempt any bot owners, masters, ops, users, etc		#
#    defined in the exempt list of this script.					#
#												#
# 5. The bot will place 2 bans.							#
#												#
#    - One ban on the ident of the user: *!*ident@*				#
#    - The second ban on the IP Adress of the user: *!*@127.0.0.1 	#
#												#
#    The first ban prevents all other users matching the same 		#
#    bad ident from joining the channel it is banned on.			#
#												#
# 6. A customizable ban time (in mins) for banning users with the bad 	#
#    idents can be set by bot owners accordingly.				#
#												#
#########################################################################
#								                        #
# #####										      #
# USAGE								                  #
# #####											#
#								                        #
# - Please unzip the badident.zip zipped file & place the			#
#   'badident.tcl' file in your eggdrops */scripts folder* along 		#
#   with your other tcl scripts.							#
#								                        #
# - Please add a link at the bottom of your eggdrop's .CONF file to     #
#   the path of the badident.tcl, it would be something like:    		#
#								                        #
#   source scripts/badident.tcl							#
#								                        #
#								                        #
# - Then *restart* your eggdrop bot and start kicking ass!			#
#								                        #
#########################################################################
#								                        #
# #######										      #
# CONTACT								                  #
# #######											#
#								                        #
# - If you have any suggestions, comments, questions or if you want to  #
#   report bugs, please feel free to email me at:			      #
#								                        #
#	    awyeah@usa.net / awyeah@awyeah.org				      #
#									                  #
#									                  #
# - You can contact me on 'MSN Messenger' on my ID: awyeah@awyeah.org	#
#								                        #
#								                        #
# - You can also catch me on 'IRC' (The DALnet IRC Network)	            #
#								                        #
#         /server irc.dal.net:6667, Nick: awyeah			      #
#									                  #
#########################################################################
#									                  #
# ########									      	#
# VERSIONS						                  		#
# ########											#
#												#
# v1.65.b - Initial release of the script						#
# (31st May 2004)										#
#									                  #
# Latest released verions of this script which are updated and modified #
# from time to time can be found on:					      #
#									                  #
#        http://www.egghelp.org/  -  http://www.tclscript.com/		#
#									                  #
#########################################################################
#									                  #
# #######									      	#
# CREDITS						                  		#
# #######											#
#												#
#  Thanks to all my friends who and helped me all the way.			#
#  It has really been great working on peoples requests as well.		#
#												#
#  I appreciate all the feedback, suggestions and comments sent by 	#
#  people regarding my scripts.							#
#												#
#												#
# ./awyeah											#
#									                  #
#########################################################################


##################################################
### Start editing variables from here onwards! ###
##################################################

#Set the channel(s) you want this script active on.
#This script supports multiple channels.
#Usage: "#channel1 #channel2 #mychannel"
#(To activate on all channels use: "")
set badidentchans "#modern-gank #vdl #sate #cilandak"

#Set the *bad words* for the script to react on. 
#When users join a channel this script is activated 
#and their idents match this current world list, 
#they will be kicked/banned. (wildcards "*" are accepted)
#(Set/edit these words according to your needs)
#(I have already added some as examples)
set badidents {
"asshole"
"bitch"
"slut"
"cock"
"cunt"
"nigger"
"dickhead"
"hot*guy"
"faggot"
"prostitute"
"whore"
"lesbian"
"naked"
"xxx"
"horny"
"orgasm"
"bastard"
"hooker"
"rapist"
"orgy"
"penis"
"vagina"
"clit"
"cybersex"
"lesbian"
"prick"
"masturbate"
"masturbation"
"jackoff"
"blowjob"
"bigcock"
"bigdick"
"wetpussy"
"blow*job"
"superbitch"
"fuckwit"
"dumbfuck"
"fucknut"
"bisexual"
"transexual"
"transvestite"
"homosexual"
"lesbi"
"testicle"
"sexual"
"asswipe"
"jackass"
"dumbass"
"intercourse"
"clitoris"
"incest"
"nigga"
"nigger"
"molest"
"breast"
"boobs"
"fuck"
"fuckers"
"fucking"
"sexual"
"porno"
"condom"
"erect"
"erection"
"phuck"
"masturbating"
"motherfucker"
"oralsex"
"kontol"
"contol" 
"pepek"
"vevek" 
"ngentot" 
"kentot"
"jembut" 
"zembut" 
"pantat" 
"totong" 
"tetek" 
"vagina" 
"pukimak" 
"bujanginam" 
"cibai" 
"c1b41" 
"lanciau" 
"gigolo"
"peler"
"anjing"
"4nj1ng"
"4njing"
"anj1ng"
"bangsat"
"b4ngs4t"
"b4ngsat"
"bangs4t"
"pantek"
"panteks"
"nenen"
"cibe"
"fukk"
"fuk"
"pler"
"plerr"
"pller"
"p3l3r"
"cip3t"
"cipet"
"c1p3t"
"c1tut"
"citut"
"lonte"
"nonok"
"l0nt3"
"lont3"
"l0nte"
"n0nok"
"n0n0k"
"non0k"
"analsex"
"wtf"
"orgy"
"stfu"
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
        putquick "KICK $chan $nick :Bad User Ident Kick - Unacceptable *User Ident* detected. Please change your 'IDENT' to a suitable one and then rejoin back."
        timer $badidbantime "pushmode $chan -b $badidentban2"
        return 0
        }
      }
    }
  }
}
# (ain't i an asskicker?...)


putlog "Bad Ident Kicker Script v1.65.ab by \002awyeah (awyeah@usa.net)\002 -=Loaded=-"
putlog "*ENABLED* Bad Ident Kicker Script on:\002 $badidentchans"

return


