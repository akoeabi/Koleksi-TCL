############################[ ALL PROTECTION 4.5 ]###########################
#                                                                           #
# Author  : Opposing (Fz@nexushells.net) - #nexushells @ DALnet             #
# Version : 4.5                                                             #
# Released: December 05, 2005                                               #
# Source  : http://hub.nexushells.net/~Fz/index.htm                         #
##                                                                          #
# Description: Has all kinds of channel protections + Botnet channel flood  #
#              protections and private protections.                         #
#                                                                           #
# Commands:                                                                 #
#          DCC:                                                             #
#              .ap:import <oldchan> <newchan> (This sets the AP settings of #
#               	<oldchan> on <newchan> - Owners only)                   #
#              .ap:reset <chan> (This will reset the AP settings of <chan>  #
#               	to the default settings.                                #
#                                                                           #
#          All Protections are enabled via .chanset DCC command.            #
#          Use: .chaninfo to know AllProtection's settings (ap:<setting>)   #
#          NOTE: .chanset * <setting> <value> will set the setting on all   #
#          channels.                                                        #
#                                                                           #
# Credits:                                                                  #
#         - Thanks to www.nexushells.net which is the only company that I   #
#         used and ran my eggdrop (Shrider) on. it is my first and probably #
#         last company (since 2003).                                        #
#         - Thanks to http://forum.egghelp.org which was and still is my    #
#         tcl toutor, I've learned tcl through this community.              #
#         - Thanks to Silence, Marcel and dotslasher for reporting bugs     #
#         which was an important step for the developement of this script.  #
#         - Thanks to slennox for adding a link on the main page of         #
#         www.egghelp.org to the topic of AllProtection, and for hosting    #
#         the script on his site when my site went down.                    #
#         - Thanks to De Kus from the egghelp forum for suggesting an       #
#         important idea for the repeat protection which was also applied   #
#         on some other protections.                                        #
#         - Used maskhost & ctrl:filter procs by user & ppslim from the     #
#         egghelp forum with slight modifications to the ctrl:filter proc   #
#         by me.                                                            #
#         - Used checkbcd:join proc by Marcel which allows the bot to check #
#         for bad nicks/idents, clones and drones when the bot first joins  #
#         a channel and gets ops.                                           #
#                                                                           #
# History:                                                                  #
#         - 4.5: Public release. Fixed the bugs with the text and notice    #
#           (chars) protections and changed the limit function.             #
#         - 4.4b20: Little fix to the codes kicker, now skips ctrl+o codes. #
#           Improved drones kicker, less innocents affected now. Added      #
#           codes checking for part messages, now you can check for excess  #
#           codes in part msgs instead of length (or both). + Few fixes to  #
#           the kick infos in text and notice (chars) flood protections.    #
#           Now all protections can have a default value & bot will not un- #
#           ban none-existing bans.                                         #
#         - 4.4b19: Improved the drone detecting mechanism (less innocents  #
#           will be affected), improved the codes detecting mechanism +     #
#           fixed the mode lock, you can use "+mR-k type.flood" now.        #
#         - 4.4b18: Few bug fixes, added the ap:reset dcc command to reset  #
#           AP settings on a channel.                                       #
#         - 4.4b17: Fixed bug in join-flood (disabling) + added ability to  #
#           show the time of offences in milliseconds.                      #
#         - 4.4b16: Updated the drones kicker (now catches more lame random #
#           drones). Enhanced the clone join flood and excess clones prots. #
#         - 4.4b15: Fixed repeatc (again) + added codes check to notices +  #
#           fixes to codes checking, also added a new feature into drones   #
#           protection.                                                     #
#         - 4.4b14: Enhanced the second counting in offenses (for info).    #
#         - 4.4b13: Added the ability to state the triggered offense in the #
#           kick messages + fixed the consecutive letter repeat protection. #
#         - 4.4b12: Enhancement to the codes protection, now checks for the #
#           number of chars affected by the code instead of number of codes #
#           and mode locks now support "-k <key>" (for lamers) + made a few #
#           adjustments to the code.                                        #
#         - 4.4b11: Performance enhancements + tweak in the caps kick proc. #
#         - 4.4b10: Fixed ap:repeatc (wasn't working) + enhanced the follow #
#           proc to achieve better performance.                             #
#         - 4.4b9: Enhancement to the code + several bug fixes.             #
#         - 4.4b8: Beta version 8, all protections are set via .chanset DCC #
#           command.                                                        #
#         - 4.4b: Major upgrade. Performance improvements all around the    #
#           script, less use of utimers and fixed several bugs. New info    #
#           can now be displayed in the kick messages. New feature in the   #
#           repeat flood prot. Fixes in the mass kick/ban/deop procs. New   #
#           handling of private floods without using the ignore feature.    #
#           Added new ban types + serveral major bug fixes. Script renamed  #
#           to AllProtection.tcl                                            #
#         - 4.3: Fixed the "logical" error in the mass kick, ban and deop   #
#           protections. Also fixed a bug in the nick binds procs and added #
#           the ability to use "*" for chans if you want the script to work #
#           on all channels.                                                #
#         - 4.2: Changed back to the old drone:kick proc, added private     #
#           flood protection and a new configurable requested feature.      #
#         - 4.1: Fixed a bug reported by Marcel. Also, replaced the old     #
#           drone kick with a newer one which might be more effective but   #
#           also more harmful at the same time. (more percentage of kicking #
#           innocent users.                                                 #
#         - 4.0: Fixed the 'ctcp unknown variable' bug.                     #
#         - 3.9: First complete bug free release. fixed some bugs and       #
#           logical erros, now all protections function efficiently. Also   #
#           Made some functionality improvements suggested by De Kus from   #
#           the egghelp.org forum.                                          #
#           + Added the ability to choose types of additional exempting and #
#           support for exempting halfops as well.                          # 
#         - 3.8b: Added the ability to make the bot check for clones,bad    #
#           nicks/idents and drones when it first joins a channel and gets  #
#           ops. Feature requested by Marcel. Made some improvements to the #
#           code with a few bug fixes. Also added a new feature to the      #
#           clones protection suggested by Marcel.                          #
#         - 3.7b: Fixed a syntax error reported by Silence.                 #
#         - 3.6b: Fixed a major logical error in the punish:method proc.    #
#         - 3.5b: Tweaked the code for a faster performance.                #
#         - 3.4b: Added Botnet part msg flood protection, made some fixes   #
#           to the botnet revolving foor protection, and added a kick       #
#           counter feature (display number of kicks in the kick message).  #
#         - 3.3b: Fixed an error in the ban of the badnick protection. Bug  #
#           reported by Marcel.                                             #
#         - 3.2b: Fixed a bug in the notice flood (chars) protection.       #
#         - 3.1b: Fixed a few bugs and added some features (reported by     #
#           Marcel. Also added a note notification when the bot locks a     #
#           channel after a mass flood.                                     #
#         - 3.0b: Added the ability to set the kline command of your own    #
#           (depends on your ircd). And removed some repetetive code.       #
#         - 2.9b: Changed the kline mask type as it was user@host instead   #
#           of nick!user@host, and fixed the kline command (used a wrong    #
#           syntax). Thanx to CosmicD and ^DooM^ (egghelp forum).           #
#         - 2.8b: Fixed a bug, and made some improvements to the kill/kline #
#           methods. Reported by CosmicD.                                   #
#         - 2.7b: Fixed several bugs, and added support for punishment      #
#           methods for other different flood types.                        #
#         - 2.6b: Added new punishment methods that allow the bot to kill   #
#           or kline the offender.                                          #
#         - 2.5b: Fixed a little bug in the putlog line of nosense:ban.     #
#         - 2.4b: Fixed a major error in the punish:method proc. Reported   #
#           by silence.                                                     #
#         - 2.3b: Added a new feature which allowes the user to choose how  #
#           he wants the bot to punish offenders (i.e. punishment steps).   #
#           Also, made improvements on the locking/unlocking system.        #
#         - 2.2b: Fixed bug in botnet notice (chars) protection and drones  #
#           kicker. Bugs reported by Silence.                               #
#         - 2.1b: Improved some flood protection algorythms.                #
#         - 2.0b: Changed and updated some channel protection patterns.     #
#         - 1.9b: Fixed several fatal errors reported by Silence.           #
#         - 1.8b: Fixed several fatal errors reported by Silence.           #
#         - 1.7b: Added private spam protection (requested by Silence).     #
#         - 1.6b: Fixed a missing close-brace error reported by Silence.    #
#         - 1.5b: Added Part msg flood protection (requested by Silence).   #
#         - 1.4b: Fixed some bugs reported by Silence. Also removed some    #
#           redundant code.                                                 #
#         - 1.3b: Added protection from random drones.(translated from mirc #
#           addon: Oz Nosense Nick Removal)                                 #
#         - 1.2b: Some code improvements.                                   #
#         - 1.1b: Added channel limit.                                      #
#         - 1.0b: First beta version.                                       #
#                                                                           #
# Report bugs/suggestions to Fz@nexushells.net                              #
#                                                                           #
# Copyright © 2005 Opposing (aka Sir_Fz)                                    #
#                                                                           #
# This program is free software; you can redistribute it and/or modify      #
# it under the terms of the GNU General Public License as published by      #
# the Free Software Foundation; either version 2 of the License, or         #
# (at your option) any later version.                                       #
#                                                                           #
# This program is distributed in the hope that it will be useful,           #
# but WITHOUT ANY WARRANTY; without even the implied warranty of            #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
# GNU General Public License for more details.                              #
#                                                                           #
# You should have received a copy of the GNU General Public License         #
# along with this program; if not, write to the Free Software               #
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA #
#                                                                           #
#############################################################################
#
##############################
# Configurations start here: #
# __________________________ #


########################
#   SETTINGS & iNFO    #
########################

### READ THIS FIRST:
# * AllProtection exempts channel ops, friends (+f) and masters (+mo) from protection by default.
# That means users with the +f or +mo flags will not be affected by any protection.
# (You can add hosts to the +f handle if you don't want the bot to ban them). To prevent from banning
# ChanServ, add chanserv to your bot with the +f or +mo flag.
#
# * AllProtection does not use the internal banlist of the bot so you will not have to worry
# about other ops not being able to remove the bans, they can! (feature or bug, I dont care :P)
#
# * AllProtection will not trigger protection on a channel where the bot is not oped, so your
# bot will not send redundant commands to the server. (good for the lag)
#
# * AllProtection strips control-codes (i.e. bold, underline, colors...etc) from text when checking for
# repeats, bad words or advertising.
#
# * All settings are enabled via .chanset DCC command. Example: .chanset #channel ap:textl 5:2, this will
# enable the text flood (lines) protection on #channel (punish on 5 lines or more in 2 seconds)
#
# * You can use mode locks such as "mR-k type.flood" which will work fine with AllProtection.
#
# * Read all the information provided below so you won't miss any important info for configuring.
### Enjoy configuring...

# Set here any additional exempts, you can use one of the following:
# 0: Neither voices nor halfops are exempted from punishment
# 1: Voices are exempted from punishment
# 2: Halfops are exempted from punishment
# 3: Both halfops and voices are exempted from punishment 
set exmptype 3

# Set here the handles of the users you want to notify when the bots locks a channel
# for mass (botnet) flood.
# example: set notifyusers "TheOwner LamerDude"
set notifyusers "Bj0rk"

# Set here the notice to be sent to the channel when the bot locks the channel because of a
# Botnet flood. leave "" if you don't wish the notice to be sent.
set btclocked(lnotc) "Channel has been locked due to flood, sorry for any inconvenience this may have caused."

# What info do you wanna add to your kick message?
# After setting this variable, you can use $kckcount(form) to add a these info to the bot's
# kick msg.
### NOTE:
## %kcount = number of kicks.
## %btime = ban time
## %chan = channel name
## %date = kick date
## %rate = offenses in seconds, bad words/nicks/idents/ads or clone/clones (depends on type of offense)
### PS: You can use the above directly in the kick message (not only here)
set kckcount(form) "(%rate) :: \[%date\] - Banned %btime minutes ·%kcount·"

# Set the file in which the number of kicks will be stored.
set kckcount(file) "scripts/kcount.txt"

# Do you want the bot to check for bad nicks/idents and clones when it first joins the channels
# and gains op ? (0: no , 1: yes)
# NOTE: This may be CPU intensive if your bot is on big channels or on alot of channels.
set cbcd(check) 0 

# If cbcd(check) is set to 1, change this if you want the bot to only check for certain types
# of protection in the nicklist.
# nosense:kick: check for random drones
# clones:kick : check for excess clones and kick them
# bnick:kick  : kick bad nicks
# bident:kick : Kick users with bad idents.
set cbcd(procs) {nosense:kick clones:kick bnick:kick bident:kick}

# If cbcd(check) is set to 1, on what channels do you want it to be applied ? (use "*" to make it work on all chans)
# example: set cbcd(chans) "#chan1 #chan2"
set cbcd(chans) "*"

# Your service's chanserv nick.
# example: set serv(nick) "ChanServ" or "PRIVMSG X@channels.dal.net"
set serv(nick) "ChanServ"

# Chanserv deop command.
# use %nick for the nick you want to deop and %chan for the channel name.
# example: set serv(deop) "deop %chan %nick"
set serv(command) "deop %chan %nick"

# Set the time in seconds to wait before reseting the punishment monitor:
# Note: this setting means the bot will apply the punishment steps on each nick
# within this period of time, otherwise it'll trigger steps from the beginning.
# Most recommended value is between: 60-90
set pwait 60

# Edit this only if your bot is an ircop and will use the kline command:
# Set here the kline command used on your server.
# for example some ircds user:
# kline %mask %time %reason
# others use:
# kline %time %mask %reason
## NOTE: 
# %mask = the klined mask.
# %time = the kline time. 
# %reason = the kline reason.
##
set kline(cmd) "kline %time %mask :%reason"

# set the default kline time. (seconds or minutes depends on your ircd)
set kline(time) 30

## Available punishment methods:
# 1: warn - kick - kickban 
# 2: warn - kick 
# 3: warn - kickban 
# 4: kick - kickban 
# 5: kickban 
## the following methods should only be chosen if your bot is an ircop (opered up):
# 6: warn - kick - kline 
# 7: warn - kline 
# 8: kick - kill - kline 
# 9: kill - kline 
# 10: kline
#
## For example if you set this to 1 for text flood:
#
# ** nick triggers text flood
# ** bot warns nick
# ** nick triggers text flood again
# ** bot kicks nick
# ** nick triggers text flood yet again
# ** bot bankicks nick
## these steps will be triggered if the offences happend during <pwait> seconds.
# NOTE: These methods are not applicable on all flood types. I only applied this
# feature on the flood types I think they're needed.

## Available ban types:
# 0 : *!user@full.host.tld 
# 1 : *!*user@full.host.tld 
# 2 : *!*@full.host.tld 
# 3 : *!*user@*.host.tld 
# 4 : *!*@*.host.tld 
# 5 : nick!user@full.host.tld 
# 6 : nick!*user@full.host.tld 
# 7 : nick!*@full.host.tld 
# 8 : nick!*user@*.host.tld 
# 9 : nick!*@*.host.tld
# 10: *!user@*
# 11: nick!*@*

## Available kline mask types:
# 0 : user@full.host.tld 
# 1 : *user@full.host.tld 
# 2 : *@full.host.tld 
# 3 : *user@*.host.tld 
# 4 : *@*.host.tld 
# 5 : user@full.host.tld 
# 6 : *user@full.host.tld 
# 7 : *@full.host.tld 
# 8 : *user@*.host.tld 
# 9 : *@*.host.tld
# 10: user@*

##########################
#      TEXT FLOOD        #
##########################

#
## 1 ## Text flood (lines)
#

# use .chanset #channel ap:textl <lines>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:textl 5:2}

# Text flood (lines) punishment method:
set textl(pmeth) 4

# Text flood (lines) bantype.
set textl(btype) 1

# Text flood (lines) ban time in minutes. (0 for no ban time)
set textl(btime) 2

# Text flood (lines) kick msg.
set textl(kmsg) "Text flood detected. $kckcount(form)"

# Text flood (lines) warn msg.
set textl(wmsg) "Warning: You've triggered text flood (lines) protection, slow down your typing."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text flood (lines) kline mask type.
set textl(ktype) 1

# Text flood (lines) kline/kill reason.
set textl(klmsg) "Text flooding is not permissable on this network."

# Text flood (lines) kline time (seconds or minutes depends on your ircd).
set textl(ktime) 0

#
## 2 ## Text flood (chars)
#

# Use .chanset #channel ap:textc <chars>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:textc 215:3}

# Text flood (chars) punishment method:
set textc(pmeth) 5

# Text flood (chars) bantype.
set textc(btype) 1

# Text flood (chars) ban time in minutes. (0 for no ban time)
set textc(btime) 10

# Text flood (chars) kick msg.
set textc(kmsg) "Excess chars detected. $kckcount(form)"

# Text flood (chars) warning msg.
set textc(wmsg) "Warning: You've triggered text flood (chars) protection, decrease your text legnth."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text flood (chars) kline mask type.
set textc(ktype) 1

# Text flood (chars) kline/kill reason.
set textc(klmsg) "Text flooding (chars) is not permissable on this network."

# Text flood (chars) kline time (seconds or minutes depends on your ircd).
set textc(ktime) 0

#
## 3 ## Notice flood (lines)
#

# Use .chanset #channel ap:notcl <lines>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:notcl 1:3}

# Notice flood (lines) punishment method:
set noticel(pmeth) 5

# Notice flood (lines) ban tpye.
set noticel(btype) 1

# Notice flood (lines) ban time in minutes. (0 for no ban time)
set noticel(btime) 10

# Notice flood (lines) kick msg.
set noticel(kmsg) "Notice not allowed. $kckcount(form)"

# Notice flood (lines) warn msg.
set noticel(wmsg) "Warning: you've triggered notice flood (lines) protection, slow down your notices."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Notice flood (lines) kline mask type.
set noticel(ktype) 1

# Notice flood (lines) kline/kline reason.
set noticel(klmsg) "Notice flooding is not permissable on this network."

# Notice flood (lines) kline time in reason.
set noticel(ktime) 0

#
## 4 ## Notice flood (chars)
#

# Use .chanset #channel ap:notcc <chars>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:notcc 200:3}

# Notice flood (chars) punishment method:
set noticec(pmeth) 5

# Notice flood (chars) ban type.
set noticec(btype) 1

# Notice flood (chars) ban time in minutes. (0 for no ban time)
set noticec(btime) 10

# Notice flood (chars) kick msg.
set noticec(kmsg) "Excess chars (notice) detected. $kckcount(form)"

# Notice flood (chars) warn msg.
set noticec(wmsg) "Warning: you've triggered notice flood (chars) protection, decrease your text length."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Notice flood (chars) kline mask type.
set noticec(ktype) 1

# Notice flood (chars) kline/kill reason.
set noticec(klmsg) "Notice flooding (chars) is not permissable on this network."

# Notice flood (chars) kline time (seconds or minutes depends on your ircd).
set noticec(ktime) 0

###################
#      TEXT       #
###################

#
## 5 ## Caps flood.
#

# Use .chanset #channel ap:caps <percent>:<line-length> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:caps 60:90}

# Caps flood punishment method:
set capsp(pmeth) 5

# Caps flood ban type.
set capsp(btype) 1

# Caps flood ban time in minutes. (0 for no ban time)
set capsp(btime) 2

# Caps flood kick msg.
set capsp(kmsg) "Excess CAPS detected. $kckcount(form)"

# Caps flood warn msg.
set capsp(wmsg) "Warning: You've triggered caps flood protection, release your caps."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Caps flood kline mask type.
set capsp(ktype) 1

# Caps flood kline/kill reason.
set capsp(klmsg) "Caps flooding is not permissable on this network."

# Caps flood kline time (seconds or minutes depends on your ircd).
set capsp(ktime) 0

#
## 6 ## Text repeating.
#

# use .chanset #channel ap:repeatl <repeats>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:repeatl 3:10}

## Text repeating Kick on how many consecutive repeated letters?
## Example: if this is set to 5 then the bot will kick any user who types (example):
# Hellooooo (5 consecutive o's)
# Hello!!!!!!!!! (5 and more consecutive ! marks)
## Use .chanset #channel ap:repeatc <number-of-letters> (in DCC, 0 to disable)
# Set default value here:
lappend ap:udefs {ap:repeatc 25}

# Text repeating punishment method:
set repeatf(pmeth) 4

# Text repeating ban type.
set repeatf(btype) 1

# Text repeating ban time in minutes. (0 for no ban time)
set repeatf(btime) 2

# Text repeating kick msg.
set repeatf(kmsg) "Text repeating detected. $kckcount(form)"

# Text repeating letter repeats kick msg.
set repeatf(kslmsg) "Letter repeats detected, do not use excess consecutive letters. $kckcount(form)"

# Text repeating warn msg.
set repeatf(wmsg) "Warning: You've triggered text repeating protection, stop repeating."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text repeating kline mask type.
set repeatf(ktype) 1

# Text repeating kline/kill reason.
set repeatf(klmsg) "Constant repeating is not permissable on this network."

# Text repeating kline time (seconds or minutes depends on your ircd).
set repeatf(ktime) 0

#
## 7 ## Control codes.
#

# Use .chanset #channel ap:codes r:<n> b:<n> u:<n> c:<n> (in DCC)
# Example: If you set ap:codes to: r:35 b:35 u:35 c:35
# Then 35 (or more) characters affected by Reverse or Bold or Underline or Color
# will be considered an offence.
# Set default rate here:
lappend ap:udefs {ap:codes "r:35 b:35 u:35 c:35"}

# Control codes punishment method:
set codesf(pmeth) 5

# Control codes ban type.
set codesf(btype) 1

# control codes ban time in minutes. (0 for no ban time)
set codesf(btime) 5

# Control codes kick msg.
set codesf(kmsg) "Excess codes detected. $kckcount(form)"

# Control codes warn msg.
set codesf(wmsg) "Warning: You've triggered control codes protection, release your msgs from codes."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Control codes kline mask type.
set codesf(ktype) 1

# Control codes kline/kill reason.
set codesf(klmsg) "Excess use of control codes is not permissable on this network."

# Control codes kline time (seconds or minutes depends on your ircd).
set codesf(ktime) 0

#
## 8 ## Advertising.
#

# NOTE: This protection also works for private advertising.

# Use .chanset #channel ap:adv + (in DCC to enable)
# set default value here: (+ enabled, - disabled)
lappend ap:udefs {ap:adv +}

# Advertising triggers.
set adv(words) {
  "* #*"
  "*ftp://*"
  "*http://*"
  "*/server*"
  "* www.*"
  "*//write*"
}

# Advertising punishment method:
set adv(pmeth) 5

# Advertising ban type.
set adv(btype) 1

# Advertising ban time in minutes. (0 for no ban time)
set adv(btime) 5

# Advertising kick msg.
set adv(kmsg) "Advertising detected. $kckcount(form)"

# Advertising warn msg.
set adv(wmsg) "Warning: You've triggered adverting protection, advertisements are not allowed."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Advertising kline mask type.
set adv(ktype) 1

# Advertising kline/kill reason.
set adv(klmsg) "Constant advertising is not permissable on this network."

# Advertising kline time (seconds or minutes depends on your ircd).
set adv(ktime) 0

#
## 9 ## Swearing.
#

# Use .chanset #channel ap:swear + (in DCC to enable)
# Set default value here: (+ enabled, - disabled)
lappend ap:udefs {ap:swear +}

# Swearing triggers.
set swear(words) {
 "*fuck*"
 "*bastard *"
 "*cock*"
 "* cunt *"
 "*ommak*"
 "*fag*"
 "* shit*"
 "*asshole*"
 "*bitch*"
 "*pussy*"
 "* whore *"
 "* slut *"
 "*dickhead*"
 "*horny*"
 "* shithead *"
 "*fagget*"
 "* dick? *"
 "* fag? *"
 "* fuker *"
 "*penis*"
 "* fuk *"
 "*jancok*"
 "*cok*"
 "*dancok*"
 "*tempek*"
 "*poke*"
 "*itil*"
 "*vagina*"
 "*toket*"
 "*kontol*"
 "*dancox*"
 "*jembut*"
 "*jiembut*"
 "*giatel*"
 "*peli*"
 "*entot*"
 "*seks*"
 "*sex*"
 "*asu*"
 "*jancik*"
 "*dancik*"
 "*meki*"
 "*memek*"
 "*horny*"
 "*silet*"
}

# Swearing punishment method:
set swear(pmeth) 5

# Swearing ban type.
set swear(btype) 1

# Swearing ban time in minutes. (0 for no ban time)
set swear(btime) 2

# Swearing kick msg.
set swear(kmsg) "Bad word detected. $kckcount(form)"

# Swearing warn msg.
set swear(wmsg) "Warning: You've triggered swearing protection, cussing is prohibited."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Swearing kline mask type.
set swear(ktype) 1

# Swearing kline/kill reason.
set swear(klmsg) "Swearing is not permissable on this network."

# Swearing kline time (seconds or minutes depends on your ircd).
set swear(ktime) 0

###################
#      CTCP       #
###################

#
## 10 ## CTCP/CTCR flood
#

# Use .chanset #channel ap:ctcps <ctcps>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:ctcps 2:30}

# CTCP/CTCR flood punishment method:
set ctcpf(pmeth) 5

# CTCP/CTCR flood ban type.
set ctcpf(btype) 1

# CTCP/CTCR ban time in minutes. (0 for no ban time)
set ctcpf(btime) 10

# CTCP/CTCR flood kick msg.
set ctcpf(kmsg) "CTCP flood detected. $kckcount(form)"

# CTCP/CTCR flood warn msg.
set ctcpf(wmsg) "Warning: You've triggered CTCP/CTCR flood protection, decrease your ctcps."

## Edit the following only if you choose a punish method above 5 (oper commands):

# CTCP/CTCR flood kline mask type.
set ctcpf(ktype) 1

# CTCP/CTCR flood kline/kill reason.
set ctcpf(klmsg) "CTCP/CTCR floods are not permissable on this network."

# CTCP flood kline time (seconds or minutes depends on your ircd).
set ctcpf(ktime) 0

###################
#    TAKEOVER     #
###################

#
## 11 ## Mass deop.
#

# Use .chanset #channel ap:massd <deops>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:massd 5:1}

# Mass deop: deop abuser ? (0: no , 1: yes)
set massdeop(deop) 1

# Mass deop punishment method:
set massdeop(pmeth) 5

# Mass deop ban type.
set massdeop(btype) 1

# Mass deop ban time in minutes. (0 for no ban time)
set massdeop(btime) 10

# Mass deop kick msg.
set massdeop(kmsg) "Mass deop detected. $kckcount(form)"

# Mass deop warn msg.
set massdeop(wmsg) "Warning: You've triggered the mass deop protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass deop kline type (same as bantype).
set massdeop(ktype) 1

# Mass deop kline/kill reason.
set massdeop(klmsg) "Mass deops are not allowed on this network."

# Mass deop kline time (seconds or minutes depends on your ircd).
set massdeop(ktime) 0

#
## 12 ## Mass kick.
#

# Use .chanset #channel ap:massk <kicks>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:massk 8:2}

# Mass kick: deop abuser ? (0: no , 1: yes)
set masskick(deop) 1

# Mass kick punishment method:
set masskick(pmeth) 5

# Mass kick ban type.
set masskick(btype) 1

# Mass kick ban time in minutes. (0 for no ban time)
set masskick(btime) 10

# Mass kick kick msg.
set masskick(kmsg) "Mass kick detected. $kckcount(form)" 

# Mass kick warn msg.
set masskick(wmsg) "Warning: You've triggered mass kick protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass kick kline mask type.
set masskick(ktype) 1

# Mass kick kline/kill reason.
set masskick(klmsg) "Mass kicks are prohibited on this network."

# Mass kick kline time (seconds or minutes depends on your ircd).
set masskick(ktime) 0

#
## 13 ## Mass ban (bans).
#

# Use .chanset #channel ap:massb <bans>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:massb 18:2}

# Mass ban (bans) deop abuser ? (1: yes , 0: no)
set massb(deop) 1

# Mass ban (bans) punishment method:
set massb(pmeth) 5

# Mass ban (bans) ban type.
set massb(btype) 1

# Mass ban (bans) ban time in minutes. (0 for no ban time)
set massb(btime) 30

# Mass ban (bans) kick msg.
set massb(kmsg) "Mass ban is not allowed. $kckcount(form)"

# Mass ban (bans) warning msg.
set massb(wmsg) "Warning: You've triggered mass ban protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass ban (bans) kline mask type.
set massb(ktype) 1

# Mass ban (bans) kline/kill reason.
set massb(klmsg) "Mass banning (bans) is prohibited on this network."

# Mass ban (bans) kline time (seconds or minutes depends on your ircd).
set massb(ktime) 0

#
## 14 ## Channel limit.
#

# Use .chanset #channel ap:limit <limit> (in DCC, 0 to disable)
# Note: this be the number that will be added to the channel's limit.
# Set default limit here:
lappend ap:udefs {ap:limit 8}

###################
#  MISCELLANEOUS  #
###################

#
## 15 ## Join flood.
#

# Use .chanset #channel ap:cjoin <joins>:<seconds> (in DCC, 0:0 to disable)
# NOTE: This triggers on clone join flood, not mass join.
# Set default rate here:
lappend ap:udefs {ap:cjoin 3:2}

# Join flood punishment method.
set joinflood(pmeth) 5

# Join flood ban type.
set joinflood(btype) 1

# Join flood ban time in minutes. (0 for no ban time)
set joinflood(btime) 10

# Join flood: Lock channel when triggered ? (1: yes , 0: no)
set joinflood(lockchan) 1

# Join flood: If lock channel is enable, what modes ?
set joinflood(lockmode) "mR-k clone.join.flood"

# Join flood: lock time in seconds.
set joinflood(locktime) 45

# Join flood kick msg.
set joinflood(kmsg) "Join flood detected. $kckcount(form)"

# Join flood warn msg.
set joinflood(wmsg) "Warning: you've triggered join flood protection, further offence will cause harsher actions."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Join flood kline mask type.
set joinflood(ktype) 1

# Join flood kline/kill reason.
set joinflood(klmsg) "Join floods are not permissable on this network."

# Join flood kline time (seconds or minutes depends on your ircd).
set joinflood(ktime) 0

#
## 16 ## Part msg flood.
#

# Use .chanset #channel ap:partmsgs <message-length> (in DCC, 0 to disable)
# Set default value here:
lappend ap:udefs {ap:partmsgs 180}

# Also, you can ban if excess codes are used in a part msg:
# Use .chanset #channel ap:partmsgc r:<n> b:<n> u:<n> c:<n> (in DCC)
# Note: check codes protection to understand how codes checking work.
# r = reverse, b = bold, u = underline and c = colors.
# Set default rate here:
lappend ap:udefs {ap:partmsgc "r:35 b:35 u:35 c:35"}

# Part msg flood punishment method:
set pmsgf(pmeth) 5

# Part msg flood ban type.
set pmsgf(btype) 1

# Part msg flood ban time in minutes. (0 for no bantime)
set pmsgf(btime) 10

# Part msg flood kick msg. (incase the offender managed to rejoin before being banned)
set pmsgf(kmsg) "Part msg flood detected. $kckcount(form)"

# Part msg flood warn msg.
set pmsgf(wmsg) "Warning: You've triggered part msg flood protection, decrease text in your part reason."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Part msg flood kline mask type.
set pmsgf(ktype) 1

# Part msg flood kline/kill reason.
set pmsgf(klmsg) "Part msg floods are not permissable on this network."

# Part msg flood kline time (seconds or minutes depends on your ircd).
set pmsgf(ktime) 0

#
## 17 ## Revolving door.
#

# Use .chanset #channel ap:revdoor <seconds> (in DCC)
# example: setting this to 3 will make the bot ban whoever joins and parts/quits in 3 or less seconds.
# Set default value here:
lappend ap:udefs {ap:revdoor 3}

# Revolving door ban type.
set revdoor(btype) 1

# Revolving door kick msg.
set revdoor(kmsg) "Join-part revolving door attempt detected. $kckcount(form)"

# Revolving door ban time in minutes. (0 for no ban time)
set revdoor(btime) 30

#
## 18 ## Nick flood.
#

# Use .chanset #channel ap:nickf <nick-changes>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:nickf 4:12}

# Nick flood punishment method:
set nickflood(pmeth) 3

# Nick flood ban type.
set nickflood(btype) 1

# Nick flood ban time in minutes. (0 for no ban time)
set nickflood(btime) 2

# Nick flood kick msg.
set nickflood(kmsg) "Nick flood detected. $kckcount(form)"

# Nick flood warn msg.
set nickflood(wmsg) "Warning: You've triggered nick flood protection, slow down your nick changes."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Nick flood kline mask type.
set nickflood(ktype) 1

# Nick flood kline/kill reason.
set nickflood(klmsg) "Nick floods are not permissable on this network."

# Nick flood kline time (seconds or minutes depends on your ircd).
set nickflood(ktime) 0

#
## 19 ## Clones.
#

# Use .chanset #channel ap:clones <clones-number> (in DCC)
# Note: This will be the number of clones that triggers punishment.
# Set default value here:
lappend ap:udefs {ap:clones 8}

# Clones punishment method:
set eclones(pmeth) 5

# Clones ban type.
set eclones(btype) 1

# Clones ban time in minutes. (0 for no ban time)
set eclones(btime) 10

# Clones kick msg.
set eclones(kmsg) "Excess clones detected. $kckcount(form)"

# Clones warning msg.
set eclones(wmsg) "Warning: You've exceeded the maximum number of clones, remove your clones now."

# Do you want to check if the clones are still excess after warn?
# if yes then set this to the number of seconds to wait before checking again. (0 to disable)
# NOTE: This is preffered to be less than <pwait> (at the beginning of the configuration).
set eclones(cagain) 40

## Edit the following only if you choose a punish method above 5 (oper commands):

# Clones kline mask type.
set eclones(ktype) 1

# Clones kline/kill reason.
set eclones(klmsg) "Excess clones are not allowed on this network."

# Clones kline time (seconds or minutes depends on your ircd).
set eclones(ktime) 0

#
## 20 ## Bad nick.
#

# Use .chanset #channel ap:bnicks + (in DCC to enable)
# Set default value here: (+ enabled, - disabled)
lappend ap:udefs {ap:bnicks +}

# Bad nick triggers.
set bnick(nicks) {
 "*porno*"
 "*horny*"
 "*horney*"
 "*fuck*"
 "*asshole*"
 "*dick*"
 "*bitch*"
 "*fagget*"
 "*shithead*"
 "*shitter*"
 "*penis*"
 "*pussy*"
 "*fukker*"
 "*ml*"
 "*mesum*"
 "*sex*"
}

# Bad nick ban type. (-1 to disable banning)
set bnick(btype) 2

# Bad nick kick msg
set bnick(kmsg) "Bad nick detected. $kckcount(form)"

# Bad nick ban time in minutes. (0 for no ban time)
set bnick(btime) 10

#
## 21 ## Random drones.
#

# Use .chanset #channel ap:drones + (in DCC to enable)
# Set default value here: (+ enabled, - disabled)
lappend ap:udefs {ap:drones +}

# Random drones: Do you want the bot to check for drones on op ? (1: yes , 0: no)
set nosense(conop) 1

# Random drones: What masks to exempt?
set nosense(exempt) { "*example1*!*@*" "*!*example2*@*" "*!*@example3.net" }

# Random drones ban type.
set nosense(btype) 1

# Random drones punishment method:
# If you set this to 0 then the bot will only kick the drone once.
# So if the drone rejoins it will not be kicked again.
set nosense(pmeth) 5

# If nosense(pmeth) is set to 0, how long do you want the bot to wait for the drone to rejoin
# before starting to kick it again? (in seconds)
set nosense(dwait) 45

# Random drones ban time in minutes. (0 for no bantime)
set nosense(btime) 30

# Random drones kick msg.
set nosense(kmsg) "Possible random drone detected. $kckcount(form)"

# Random drones warning msg.
set nosense(wmsg) "Warning: You've triggered random drones protection, change your nick now."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Random drones kline mask type.
set nosense(ktype) 1

# Random drones kline/kill reason.
set nosense(klmsg) "Random drones are not allowed on this network."

# Random drones kline time (seconds or minutes depends on your ircd).
set nosense(ktime) 0

#
## 22 ## Bad ident.
#

# Use .chanset #channel ap:bidents + (in DCC to enable)
# Set default value here: (+ enabled, - disabled)
lappend ap:udefs {ap:bidents +}

# Bad ident triggers.
set bident(idents) {
 "*porno*"
 "*horny*"
 "*horney*"
 "*fuck*"
 "*asshole*"
 "*dick*"
 "*bitch*"
 "*fagget*"
 "*shithead*"
 "*shitter*"
 "*penis*"
 "*pussy*"
 "*fukker*"
 "*ml*"
 "*seks*"
 "*sex*"
}

# Bad ident ban type. (-1 to disable ban)
set bident(btype) 2

# Bad ident kick msg.
set bident(kmsg) "Bad ident detected. $kckcount(form)"

# Bad ident ban time. (0 for no ban time)
set bident(btime) 10

#########################################
# BOTNET FLOOD PROTECTION (MASS FLOODS) #
#########################################

#
## 1 ## Botnet Text flood (lines).
#

# Use .chanset #channel ap:btextl <lines>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:btextl 15:7}

# Botnet Text flood (lines) lock modes.
set btextl(lockmode) "mR-k lines.flood"

# Botnet Text flood (lines) lock time in seconds. (0 for no lock time)
set btextl(locktime) 60

#
## 2 ## Botnet Text flood (chars).
#

# Use .chanset #channel ap:btextc <chars>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:btextc 550:3}

# Botnet Text flood (chars) lock modes.
set btextc(lockmode) "mR-k chars.flood"

# Botnet Text flood (chars) lock time in seconds. (0 for no lock time)
set btextc(locktime) 60

#
## 3 ## Botnet Notice flood (lines).
#

# Use .chanset #channel ap:bnotcl <lines>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:bnotcl 4:2}

# Botnet Notice flood (lines) lock modes.
set bnotil(lockmode) "mR-k lines.flood"

# Botnet Notice flood (lines) lock time in seconds. (0 for no lock time)
set bnotil(locktime) 60

#
## 4 ## Botnet Notice flood (chars).
#

# Use .chanset #channel ap:bnotcc <chars>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:bnotcc 500:3}

# Botnet Notice flood (chars) lock modes.
set bnotic(lockmode) "mR-k chars.flood"

# Botnet Notice flood (chars) lock time in seconds. (0 for no lock time)
set bnotic(locktime) 60

#
## 5 ## Botnet CTCP/CTCR flood.
#

# Use .chanset #channel ap:bctcp <ctcps>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:bctcp 4:60}

# BOTNET CTCP/CTCR flood lock modes.
set bctcpf(lockmode) "mR-k ctcp.flood"

# BOTNET CTCP/CTCR flood lock time in seconds. (0 for no lock time)
set bctcpf(locktime) 60

#
## 6 ## Botnet join flood.
#

# Use .chanset #channel ap:massjoin <joins>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:massjoin 9:3}

# Botnet join flood lock modes.
set bjoinf(lockmode) "mR-k join.flood"

# Botnet join flood lock time in seconds. (0 for no lock time)
set bjoinf(locktime) 60

#
## 7 ## Botnet revolving door flood.
#

# Use .chanset #channel ap:brevdoor <revdoors>:<seconds> (in DCC, 0:0 to disable)
## Note: ap:revdoor must be set for this to work.
# Set default rate here:
lappend ap:udefs {ap:brevdoor 5:3}

# Botnet revolving door flood lock modes.
set brevdoor(lockmode) "mR-k revdoor.flood"

# Botnet revolving door flood lock time in seconds. (0 for no lock time)
set brevdoor(locktime) 60

#
## 8 ## Botnet part msg flood.
#

# Use .chanset #channel ap:bpartmsg <partmsgs>:<seconds> (in DCC, 0:0 to disable)
## Note: ap:partmsgs or ap:partmsgc (or both) must be enabled for this to work.
# Set default rate here:
lappend ap:udefs {ap:bpartmsg 5:3}

# Botnet Part msg flood lock modes.
set bpmsgf(lockmode) "mR-k partmsg.flood"

# Botnet Part msg flood lock time in seconds. (0 for no lock time)
set bpmsgf(locktime) 60

#
## 9 ## Botnet Nick flood.
#

# Use .chanset #channel ap:bnickf <nick-changes>:<seconds> (in DCC, 0:0 to disable)
# Set default rate here:
lappend ap:udefs {ap:bnickf 5:30}

# Botnet Nick flood lock modes.
set bnickf(lockmode) "mR-k nick.flood"

# Botnet Nick flood lock time in seconds. (0 for no lock time)
set bnickf(locktime) 60

###########################
#   PRIVATE PROTECTIONS   #
###########################

# Set here if you want the bot to set a restriction mode on itself when flooded.
# example: +R is used on DALnet so only registered users can send to the bot.
# set this to "" if you don't wish to change your bot's modes during a flood.
# NOTE: Maximum 1 mode, less or more means it's disabled.
set apfp(rmode) R

# Set here the time you want to keep the restriction mode in seconds.
set apfp(rtime) 30

# How many seconds do you want to stop answering data from server?
set apfp(itime) 45

#
## 1 ## Private text floods.
#

# Private text (lines) flood <lines>:<seconds>. (0:0 to disable)
set ptextl(punish) 12:6

# Private text (chars) flood <chars>:<seconds>. (0:0 to disable)
set ptextc(punish) 750:6

#
## 2 ## Private notice floods.
#

# Private notice (lines) flood <lines>:<seconds>. (0:0 to disable)
set pnotil(punish) 6:3

# Private notice (chars) flood <chars>:<seconds>. (0:0 to disable)
set pnotic(punish) 600:4

#
## 3 ## Private CTCP/CTCR flood.
#

# Private CTCP/CTCR flood <ctcps>:<seconds>. (0:0 to disable)
set pctcpf(punish) 4:20

# Configurations end here. #
############################
#
######################################################################
# Code starts here, please do not edit anything unless you know TCL: #
# __________________________________________________________________ #

proc ap:istimer {arg {t timers}} {
 set a ""
 foreach rt [$t] {
  if {[string equal -nocase $arg [lindex $rt 1]]} {
   set a [lindex $rt 2] ; break
  }
 }
 set a
}

if {![info exists NumKicks]} {
 if {![file exists $kckcount(file)]} {
  set NumKicks 0
 } {
  set kcfopened [open $kckcount(file) r]
  set NumKicks [read -nonewline $kcfopened]
  close $kcfopened
  if {![string is integer $NumKicks]} { set NumKicks 0 }
 }
}

if {$cbcd(check)} {
 if {[set cbcd(timer) [ap:istimer checkbcd:join]]!=""} { killtimer $cbcd(timer) }
 timer 3 checkbcd:join
}

if {![string match -nocase "* Opposing *" ${ctcp-version}]} {
 set ctcp-version "${ctcp-version} - Using \002A\002ll\002P\002rotection v4.5 by Opposing (aka Sir_Fz) http://hub.nexushells.net/~Fz/"
}

set bred 0
set sfluds 0
setudef str ap:textl
setudef str ap:textc
setudef str ap:notcl
setudef str ap:notcc
setudef str ap:caps
setudef str ap:repeatl
setudef str ap:repeatc
setudef str ap:codes
setudef str ap:adv
setudef str ap:swear
setudef str ap:ctcps
setudef str ap:massd
setudef str ap:massk
setudef str ap:massb
setudef str ap:limit
setudef str ap:cjoin
setudef str ap:partmsgs
setudef str ap:partmsgc
setudef str ap:revdoor
setudef str ap:nickf
setudef str ap:clones
setudef str ap:bnicks
setudef str ap:drones
setudef str ap:bidents
setudef str ap:btextl
setudef str ap:btextc
setudef str ap:bnotcl
setudef str ap:bnotcc
setudef str ap:bctcp
setudef str ap:massjoin
setudef str ap:brevdoor
setudef str ap:bpartmsg
setudef str ap:bnickf

bind join - * cjoin:kick
bind pubm - * text:line
bind ctcp - ACTION text:action
bind pubm - * text:char
bind ctcp - ACTION char:action
bind notc - * notc:lines
bind notc - * notc:chars
bind pubm - * caps:kick
bind ctcp - ACTION caps:action
bind pubm - * repeat:kick
bind ctcp - ACTION repeat:action
bind pubm - * codes:kick
bind notc - * codes:notc
bind ctcp - ACTION codes:action
bind pubm - * adv:kick
bind ctcp - ACTION adv:action
bind msgm - * adv:private
bind pubm - * swear:kick
bind ctcp - ACTION swear:action
bind part - * rev:door
bind sign - * rev:door
bind join - * clones:kick
bind join - * bnick:kick
bind nick - * bnick:kick
bind join - * bident:kick
bind mode - "* +b" mass:ban
bind pubm - * btext:line
bind ctcp - ACTION btext:action
bind pubm - * btext:chars
bind ctcp - ACTION bchars:action
bind notc - * bnotc:line
bind notc - * bnotc:chars
bind ctcp - * ctcp:kick
bind ctcp - * bctcp:lock
bind ctcr - * ctcr:knl
bind join - * bjoinf:lock
bind nick - * bnickf:lock
bind join - * nosense:kick
bind part - * pmsgf:ban
bind mode - "* -o" massd:kick
bind kick - * massk:kick
bind nick - * nickf:kick
bind part - * config:lim
bind sign - * config:lim
bind msgm - * priv:texti
bind ctcp - ACTION priv:acti
bind notc - * priv:notci
bind ctcp - * priv:ctcpi
bind ctcr - * priv:ctcri
bind flud - * priv:flud
bind mode - "* +o" cdrone:onop
bind mode - "* -b" ap:remubt
bind time - * ap:control
bind dcc n|n ap:import ap:import
bind dcc n|n ap:reset ap:reset

proc ap:init c {
 global ap:udefs
 foreach u ${ap:udefs} {
  if {[channel get $c [lindex $u 0]] == ""} { channel set $c [lindex $u 0] [lindex $u 1] }
 }
}

proc cjoin:kick {nick uhost hand chan} {
 global joinflood btclocked notifyusers apjoinf apjoinfn
 if {![botisop $chan] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {![info exists btclocked([set chan [string tolower $chan]])]} { set btclocked($chan) 0 }
 foreach {j s} [channel get $chan ap:cjoin] {break}
 if {[invalid:apf $j $s]} {return 0}
 Nfollow $s apjoinfn([set h [string tolower [lindex [split $uhost @] 1]:$chan]]) $nick
 if {[set ts [follow $s apjoinf($h) $j]] != -1} {
  if {$joinflood(lockchan)} {
   if {!($btclocked($chan))} {
    ap:lockc $chan $joinflood(lockmode)
    if {$joinflood(locktime) > 0} {
     utimer $joinflood(locktime) [list btcunlock $chan $joinflood(lockmode) btclocked($chan)]
    } {
     utimer 90 [list reset:btc b b b $chan b b]
    }
    set btclocked($chan) 1
    if {[string length $btclocked(lnotc)] > 0} {
     puthelp "NOTICE $chan :$btclocked(lnotc)"
    }
    putlog "\002AP\002: Locked $chan due to join flood from [set jfi [lindex [split $uhost @] 1]]."
    if {[llength $notifyusers]} {
     foreach notfuser $notifyusers {
      sendnote AP $notfuser "Join flood detected on $chan from $jfi."
     }
    }
   }
  }
  punish:method2 $joinflood(pmeth) $apjoinfn($h) $nick $uhost $chan [ap:mapr $joinflood(kmsg) "$j joins in $ts secs"] $joinflood(wmsg) $joinflood(btype) $joinflood(btime) $joinflood(klmsg) $joinflood(ktime) $joinflood(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:joinflood
 }
}

proc text:line {nick uhost hand chan arg} {
 global textl txtf
 foreach {o s} [split [channel get $chan ap:textl] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nick $hand $chan]} {return 0}
 if {[set ts [follow $s txtf([string tolower $uhost:$chan]) $o]] != -1} {
  punish:method $textl(pmeth) $nick $uhost $chan [ap:mapr $textl(kmsg) "$o lines in $ts secs"] $textl(wmsg) $textl(btype) $textl(btime) $textl(klmsg) $textl(ktime) $textl(ktype) [string tolower $uhost]:textl
 }
}

proc text:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 text:line $nick $uhost $hand $chan $arg
}

proc text:char {nick uhost hand chan arg} {
 global textc txtc
 foreach {o s} [split [channel get $chan ap:textc] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nick $hand $chan]} {return 0}
 if {[info exists txtc([set uhc [string tolower $uhost:$chan]])]} { set myo [lindex $txtc($uhc) 0] }
 if {[set ts [follow $s txtc($uhc) $o [set sl [string length $arg]]]] != -1} {
  if {![info exists myo]} { set myo $sl } { incr myo $sl }
  punish:method $textc(pmeth) $nick $uhost $chan [ap:mapr $textc(kmsg) "$myo chars in $ts secs"] $textc(wmsg) $textc(btype) $textc(btime) $textc(klmsg) $textc(ktime) $textc(ktype) [string tolower $uhost]:textc
 }
}

proc char:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 text:char $nick $uhost $hand $chan $arg
}

proc notc:lines {nick uhost hand arg chan} {
 global noticel notclf
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 foreach {o s} [split [channel get $chan ap:notcl] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nick $hand $chan]} {return 0}
 if {[set ts [follow $s notclf([string tolower $uhost:$chan]) $o]] != -1} {
  punish:method $noticel(pmeth) $nick $uhost $chan [ap:mapr $noticel(kmsg) "$o lines in $ts secs"] $noticel(wmsg) $noticel(btype) $noticel(btime) $noticel(klmsg) $noticel(ktime) $noticel(ktype) [string tolower $uhost]:noticel
 }
}

proc notc:chars {nick uhost hand arg chan} {
 global noticec notccf
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 foreach {o s} [split [channel get $chan ap:notcc] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nick $hand $chan]} {return 0}
 if {[info exists notccf([set uhc [string tolower $uhost:$chan]])]} { set myo $notccf($uhc) }
 if {[set ts [follow $s notccf($uhc) $o [set sl [string length $arg]]]] != -1} {
  if {![info exists myo]} { set myo $sl } { incr myo $sl }
  punish:method $noticec(pmeth) $nick $uhost $chan [ap:mapr $noticec(kmsg) "$myo chars in $ts secs"] $noticec(wmsg) $noticec(btype) $noticec(btime) $noticec(klmsg) $noticec(ktime) $noticec(ktype) [string tolower $uhost]:noticec
 }
}

proc caps:kick {nick uhost hand chan arg} {
 global capsp
 set linelen [string length [set arg [ap:cf $arg]]]
 foreach {p l} [split [channel get $chan ap:caps] :] {break}
 if {[invalid:apf $p $l] || [invalid:apc $nick $hand $chan] || $linelen < $l} {return 0} 
 if {[set caps [regexp -all -- {[A-Z]} $arg]] > 0} {
  if {[set pl [expr {$caps * 100 / $linelen}]] >= $p} {
   punish:method $capsp(pmeth) $nick $uhost $chan [ap:mapr $capsp(kmsg) "${pl}% of $linelen chars"] $capsp(wmsg) $capsp(btype) $capsp(btime) $capsp(klmsg) $capsp(ktime) $capsp(ktype) [string tolower $uhost]:capsp
  }
 }
}

proc caps:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 caps:kick $nick $uhost $hand $chan $arg
}

proc repeat:kick {nick uhost hand chan arg} {
 global repeatf rptvar
 foreach {o s} [split [channel get $chan ap:repeatl] :] {break}
 set arg [ap:cf $arg]
 if {[invalid:apc $nick $hand $chan]} {return 0}
 if {[string is integer [set i [channel get $chan ap:repeatc]]] && $i > 0} {
  set cl "abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&"
  for {set c 0} {$c < [string length $cl]} {incr c} {
   if {[string match -nocase *[string repeat [string index $cl $c] $i]* $arg]} {
    set kmsg [ap:mapr $repeatf(kslmsg) "${i}+ consecutive [string index $cl $c]'s"] ; break
   }
  }
 }
 if {![info exists kmsg] && ![invalid:apf $o $s]} {
  if {[set ts [follow $s rptvar([md5 [string tolower $uhost:$arg:$chan]]) $o]] != -1} {
   set kmsg [ap:mapr $repeatf(kmsg) "$o repeats in $ts secs"]
  }
 }
 if {[info exists kmsg]} {
  punish:method $repeatf(pmeth) $nick $uhost $chan $kmsg $repeatf(wmsg) $repeatf(btype) $repeatf(btime) $repeatf(klmsg) $repeatf(ktime) $repeatf(ktype) [string tolower $uhost]:repeatf 
 }
}

proc repeat:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 repeat:kick $nick $uhost $hand $chan $arg
}

proc codes:kick {nick uhost hand chan arg} {
 global codesf
 if {[invalid:apc $nick $hand $chan]} {return 0}
 if {[string is integer [set cc [ap:ccodes $chan $arg ap:codes]]] && $cc > 0} {
  punish:method $codesf(pmeth) $nick $uhost $chan [ap:mapr $codesf(kmsg) "$cc chars affected"] $codesf(wmsg) $codesf(btype) $codesf(btime) $codesf(klmsg) $codesf(ktime) $codesf(ktype) [string tolower $uhost]:codesf
 }
}

proc codes:notc {nick uhost hand arg chan} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 codes:kick $nick $uhost $hand $chan $arg
}

proc codes:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 codes:kick $nick $uhost $hand $chan $arg
}

proc adv:kick {nick uhost hand chan arg} {
 global adv
 if {[channel get $chan ap:adv] != "+" || [invalid:apc $nick $hand $chan]} {return 0}
 set rest [ap:cf $arg]
 foreach advword $adv(words) {
  if {[string match -nocase $advword $rest]} {
   punish:method $adv(pmeth) $nick $uhost $chan [ap:mapr $adv(kmsg) $advword] $adv(wmsg) $adv(btype) $adv(btime) $adv(klmsg) $adv(ktime) $adv(ktype) [string tolower $uhost]:adv
   break
  }
 }
}

proc adv:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 adv:kick $nick $uhost $hand $chan $arg
}

proc adv:private {nick uhost hand arg} {
 foreach chan [channels] {
  if {[onchan $nick $chan]} {
   adv:kick $nick $uhost $hand $chan $arg
  }
 }
}

proc swear:kick {nick uhost hand chan arg} {
 global swear
 if {[channel get $chan ap:swear] != "+" || [invalid:apc $nick $hand $chan]} {return 0}
 set rest [ap:cf $arg]
 foreach badword $swear(words) {
  if {[string match -nocase $badword $rest]} {
   punish:method $swear(pmeth) $nick $uhost $chan [ap:mapr $swear(kmsg) $badword] $swear(wmsg) $swear(btype) $swear(btime) $swear(klmsg) $swear(ktime) $swear(ktype) [string tolower $uhost]:swear
   break
  }
 }
}

proc swear:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 swear:kick $nick $uhost $hand $chan $arg
}

proc rev:door {nick uhost hand chan rsn} {
 global revdoor brevdoor brevdc btclocked notifyusers
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]]} {return 0}
 if {![string is integer [set r [channel get $chan ap:revdoor]]] || $r <= 0} {return 0}
 if {[set gcj [getchanjoin $nick $chan]] >= [set ut [unixtime]]-$r} {
  foreach {o s} [split [channel get $chan ap:brevdoor] :] {break}
  if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
  if {![invalid:apf $o $s]} {
   if {[follow $s brevdc($chan) $o] != -1} {
    if {!($btclocked($chan))} {
     ap:lockc $chan $brevdoor(lockmode)
     if {$brevdoor(locktime) > 0} {
      utimer $brevdoor(locktime) [list btcunlock $chan $brevdoor(lockmode) btclocked($chan)]
     } {
      utimer 90 [list reset:btc bla bla bla $chan bla bla]
     }
     set btclocked($chan) 1
     if {[string length $btclocked(lnotc)] > 0} {
      puthelp "NOTICE $chan :$btclocked(lnotc)"
     }
     putlog "\002AP\002: Locked $chan due to botnet revolving door flood."
     if {[llength $notifyusers]} {
      foreach notfuser $notifyusers {
       sendnote AP $notfuser "Mass revolving door flood detected on $chan."
      }
     }
    }
   }
  }
  if {$revdoor(btype) >= 0} {
   putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $revdoor(btype)]]"
   if {($revdoor(btime) > 0) && ([ap:istimer "pushmode $chan -b $bmask"] == "")} {
    timer $revdoor(btime) [list pushmode $chan -b $bmask]
   }
  }
  if {[onchan $nick $chan]} {
   putquick "KICK $chan $nick :[ap:mapr [mapall $revdoor(kmsg) $chan $revdoor(btime)] "[expr {$ut-$gcj}] sec(s) revolution"]"
  }
 }
}

proc clones:kick {nick uhost hand chan} {
 global eclones
 config:lim $nick $uhost $hand $chan
 if {[isbotnick $nick]} { ap:init $chan ; return 0 }
 if {![botisop $chan]} {return 0}
 if {![string is integer [set cl [channel get $chan ap:clones]]] || $cl <= 0 || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 set c 0
 foreach ccheck [chanlist $chan] {
  if {[string equal -nocase [scan $uhost %*\[^@\]@%s] [scan [getchanhost $ccheck $chan] %*\[^@\]@%s]]} {
   incr c ; lappend cn $ccheck
  }
 }
 if {$c >= $cl} {
  if {$eclones(cagain) > 0} {
   set eclones([string tolower $chan]) 1
   utimer 10 [list followrem eclones([string tolower $chan])]
  }
  punish:method2 $eclones(pmeth) $cn $nick $uhost $chan [ap:mapr $eclones(kmsg) %ic/$c] $eclones(wmsg) $eclones(btype) $eclones(btime) $eclones(klmsg) $eclones(ktime) $eclones(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:eclones
 }
}

proc bnick:kick {nick uhost hand chan {nn ""}} {
 global bnick
 if {$nn == ""} { set nn $nick }
 if {[string first # $chan] != 0} {return 0}
 if {[channel get $chan ap:bnicks] != "+" || [invalid:apc $nn $hand $chan]} {return 0}
 foreach badnick $bnick(nicks) {
  if {[string match -nocase $badnick $nn]} {
   putquick "KICK $chan $nn :[ap:mapr [mapall $bnick(kmsg) $chan $bnick(btime)] $badnick]"
   if {$bnick(btype) >= 0} {
    putquick "MODE $chan +b [set bmask [masktype $nn!$uhost $bnick(btype)]]"
    if {($bnick(btime) > 0) && ([ap:istimer "pushmode $chan -b $bmask"] == "")} {
     timer $bnick(btime) [list pushmode $chan -b $bmask]
    }
   }
   break
  }
 }
}

proc bident:kick {nick uhost hand chan} {
 global bident
 if {[channel get $chan ap:bidents] != "+" || [invalid:apc $nick $hand $chan]} {return 0}
 scan $uhost %\[^@\] ident
 foreach bid $bident(idents) {
  if {[string match -nocase $bid $ident]} {
   putquick "KICK $chan $nick :[ap:mapr [mapall $bident(kmsg) $chan $bident(btime)] $bid]"
   if {$bident(btype) >= 0} {
    putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $bident(btype)]]"
    if {($bident(btime) > 0) && ([ap:istimer "pushmode $chan -b $bmask"] == "")} {
     timer $bident(btime) [list pushmode $chan -b $bmask]
    }
   }
   break
  }
 }
}

proc mass:ban {nick uhost hand chan mc ban} {
 global massb massbc serv
 foreach {o s} [split [channel get $chan ap:massb] :] {break}
 if {($nick == "") || [invalid:apf $o $s] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {[set ts [follow $s massbc([string tolower $uhost:$chan]) $o]] != -1} {
  if {$massb(deop)} {
   putquick "MODE $chan -o $nick"
   putquick "$serv(nick) :[string map [list %nick $nick %chan $chan] $serv(command)]"
  }
  punish:method $massb(pmeth) $nick $uhost $chan [ap:mapr $massb(kmsg) "$o bans in $ts secs"] $massb(wmsg) $massb(btype) $massb(btime) $massb(klmsg) $massb(ktime) $massb(ktype) [string tolower $uhost]:massb
 }
}

proc massd:kick {nick uhost hand chan mc targ} {
 global massdeop mssdeop serv
 foreach {o s} [split [channel get $chan ap:massd] :] {break}
 if {($nick == "") || ($nick == $targ) || [invalid:apf $o $s] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {[set ts [follow $s mssdeop([string tolower $uhost:$chan]) $o]] != -1} {
  if {$massdeop(deop)} {
   putquick "$serv(nick) :[string map [list %chan $chan %nick $nick] $serv(command)]"
   if {[botisop $chan]} {
    putquick "MODE $chan -o $nick"
   }
  }
  punish:method $massdeop(pmeth) $nick $uhost $chan [ap:mapr $massdeop(kmsg) "$o deops in $ts secs"] $massdeop(wmsg) $massdeop(btype) $massdeop(btime) $massdeop(klmsg) $massdeop(ktime) $massdeop(ktype) [string tolower $uhost]:massdeop
 }
}

proc massk:kick {nick uhost hand chan targ rsn} {
 global masskick msskick serv
 config:lim $nick $uhost $hand $chan $targ $rsn
 foreach {o s} [split [channel get $chan ap:massk] :] {break}
 if {($nick == $targ) || [invalid:apf $o $s] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {[set ts [follow $s msskick([string tolower $uhost:$chan]) $o]] != -1} {
  if {$masskick(deop)} {
   putquick "$serv(nick) :[string map [list %chan $chan %nick $nick] $serv(command)]"
   if {[botisop $chan]} {
    putquick "MODE $chan -o $nick"
   }
  }
  punish:method $masskick(pmeth) $nick $uhost $chan [ap:mapr $masskick(kmsg) "$o kicks in $ts secs"] $masskick(wmsg) $masskick(btype) $masskick(btime) $masskick(klmsg) $masskick(ktime) $masskick(ktype) [string tolower $uhost]:masskick
 }
}

proc nickf:kick {nick uhost hand chan nn} {
 global nickflood nckflood
 if {[string first # $chan] != 0} {return 0}
 foreach {o s} [split [channel get $chan ap:nickf] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nn $hand $chan]} {return 0}
 if {[set ts [follow $s nckflood([string tolower $uhost:$chan]) $o]] != -1} {
  punish:method $nickflood(pmeth) $nn $uhost $chan [ap:mapr $nickflood(kmsg) "$o changes in $ts secs"] $nickflood(wmsg) $nickflood(btype) $nickflood(btime) $nickflood(klmsg) $nickflood(ktime) $nickflood(ktype) [string tolower $uhost]:nickflood
 }
}

proc config:lim {nick uhost hand chan args} {
 global clim
 if {[string is integer [set l [channel get $chan ap:limit]]] && $l > 0 && [botisop $chan]} {
  if {[string match *l* [lindex [split [getchanmode $chan]] 0]]} {
   if {abs($l - ([set cl [lindex [split [getchanmode $chan]] end]] - [set ccl [llength [chanlist $chan]]])) > ceil($l * 30 / 100.0)} {
    pushmode $chan +l [expr {$ccl + $l}]
   }
  } {
   pushmode $chan +l [expr {[llength [chanlist $chan]] + $l}]
  }
 }
}

proc nosense:kick {nick uhost hand chan} {
 global nosense
 set Nod 0
 foreach e $nosense(exempt) { if {[string match -nocase $e $nick!$uhost]} {set Nod 1 ; break} }
 if {$Nod} {return 0}
 set id [string trimleft [lindex [split $uhost @] 0] ~]
 if {![info exists nosense(pause)]} { set nosense(pause) 0 }
 if {[channel get $chan ap:drones] != "+" || ([ap:dcount 2 nosense(pause)] > 3) || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {[botisop $chan] && ([string length $nick] > 3) && ([string length $id] > 3) && [string is lower $nick] && [string is lower $id]} {
  if {![string match {*[aeiou]*} $nick]} {
   set Nod 1
  } elseif {[regexp {^[^aeiouy]{4}|[aeiou]{4}|q[^ua]|[^aeioux]x[^aeiouyx]} $nick]} { 
   set Nod 1
  }
  if {$Nod} { nosense:ban $nick $uhost $chan }
 }
}

proc nosense:ban {nick uhost chan} {
 global nosense nosensek
 if {$nosense(pmeth) != 0} {
  punish:method $nosense(pmeth) $nick $uhost $chan [ap:mapr $nosense(kmsg) "random string"] $nosense(wmsg) $nosense(btype) $nosense(btime) $nosense(klmsg) $nosense(ktime) $nosense(ktype) [string tolower $uhost]:nosense
 } {
  if {![info exists nosensek([set nick [string tolower $nick]])]} {
   putquick "KICK $chan $nick :[mapall [ap:mapr $nosense(kmsg) "random string"] $chan nosense(btime)]"
   set nosensek($nick) 1
   utimer $nosense(dwait) [list followrem nosensek($nick)]
  }
 }
 putlog "\002AP\002: Detected \002$nick\002!\002[scan $uhost %\[^@\]]\002 on \002$chan\002."
}

proc cdrone:onop {nick uhost hand chan mc targ} {
 global nosense
 if {[channel get $chan ap:drones] != "+"} {return 0}
 if {[isbotnick $targ] && $nosense(conop)} {
  foreach cdrone [chanlist $chan] {
   if {[invalid:apc $cdrone [set h [nick2hand $cdrone $chan]] $chan]} { continue }
   nosense:kick $cdrone [getchanhost $cdrone $chan] $h $chan
  }
 }
}

proc ctcp:kick {nick uhost hand chan kw arg} {
 global ctcpf ctcpc
 if {[isbotnick [lindex [split $chan "@"] 0]] || ([lindex [split $chan "@"] 1] != "") || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 foreach {o s} [split [channel get $chan ap:ctcps] :] {break}
 if {[invalid:apf $o $s] || [invalid:apc $nick $hand $chan]} {return 0}
 if {[set ts [follow $s ctcpc([string tolower $uhost:$chan]) $o]] != -1} {
  punish:method $ctcpf(pmeth) $nick $uhost $chan [ap:mapr $ctcpf(kmsg) "$o ctcps in $ts secs"] $ctcpf(wmsg) $ctcpf(btype) $ctcpf(btime) $ctcpf(klmsg) $ctcpf(ktime) $ctcpf(ktype) [string tolower $uhost]:ctcpf
 }
}

proc btext:line {nick uhost hand chan arg} {
 global btextl btxtl btclocked notifyusers
 foreach {o s} [split [channel get $chan ap:btextl] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $s btxtl($chan) $o] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $btextl(lockmode)
   if {$btextl(locktime) > 0} {
    utimer $btextl(locktime) [list btcunlock $chan $btextl(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet text (lines) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass text flood (lines) detected on $chan."
    }
   }
  }
 }
}

proc btext:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 btext:line $nick $uhost $chan $chan $arg
}

proc btext:chars {nick uhost hand chan arg} {
 global btextc btxtc btclocked notifyusers
 foreach {o s} [split [channel get $chan ap:btextc] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if ![info exists btclocked($chan)] { set btclocked($chan) 0 }
 if {[follow $s btxtc($chan) $o [string length $arg]] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $btextc(lockmode)
   if {$btextc(locktime) > 0} {
    utimer $btextc(locktime) [list btcunlock $chan $btextc(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet text (chars) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass text flood (chars) detected on $chan."
    }
   }
  }
 }
}

proc bchars:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 btext:chars $nick $uhost $chan $chan $arg
}

proc bnotc:line {nick uhost hand arg chan} {
 global bnotil bnotcl btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 foreach {o s} [split [channel get $chan ap:bnotcl] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $s bnotcl($chan) $o] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $bnotil(lockmode)
   if {$bnotil(locktime) > 0} {
    utimer $bnotil(locktime) [list btcunlock $chan $bnotil(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet notice (lines) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass notice flood (lines) detected on $chan."
    }
   }
  }
 }
}

proc bnotc:chars {nick uhost hand arg chan} {
 global bnotic bnotcc btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 foreach {o s} [split [channel get $chan ap:bnotcc] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if ![info exists btclocked($chan)] { set btclocked($chan) 0 }
 if {[follow $s bnotcc($chan) $o [string length $arg]] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $bnotic(lockmode)
   if {$bnotic(locktime) > 0} {
    utimer $bnotic(locktime) [list btcunlock $chan $bnotic(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet notice (chars) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass notice flood (chars) detected on $chan."
    }
   }
  }
 }
}

proc bctcp:lock {nick uhost hand chan kw arg} {
 global bctcpf bctcpc btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || ([lindex [split $chan "@"] 1] != "") || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 foreach {o s} [split [channel get $chan ap:bctcp] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $s bctcpc($chan) $o] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $bctcpf(lockmode)
   if {$bctcpf(locktime) > 0} {
    utimer $bctcpf(locktime) [list btcunlock $chan $bctcpf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet ctcp flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass CTCP flood detected on $chan."
    }
   }
  }
 }
}

proc ctcr:knl {nick uhost hand chan kw arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 bctcp:lock $nick $uhost $hand $chan $kw $arg
 ctcp:kick $nick $uhost $hand $chan $kw $arg
}
  
proc bjoinf:lock {nick uhost hand chan} {
 global bjoinf cjoinf btclocked notifyusers
 foreach {o s} [split [channel get $chan ap:massjoin] :] {break}
 if {![botisop $chan] || [invalid:apf $o $s] || [matchattr $hand f|f $chan] || [matchattr $hand m|m $chan] || [isbotnick $nick]} {return 0}
 if {![info exists btclocked([set chan [string tolower $chan]])]} { set btclocked($chan) 0 }
 if {[follow $s cjoinf($chan) $o] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $bjoinf(lockmode)
   if {$bjoinf(locktime) > 0} {
    utimer $bjoinf(locktime) [list btcunlock $chan $bjoinf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet join flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass join flood detected on $chan."
    }
   }
  }
 }
}

proc bnickf:lock {nick uhost hand chan nn} {
 global bnickf bnickc btclocked notifyusers
 if {[string first # $chan] != 0} {return 0}
 foreach {o s} [split [channel get $chan ap:bnickf] :] {break}
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]] || [invalid:apf $o $s]} {return 0}
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $s bnickc($chan) $o] != -1} {
  if {!($btclocked($chan))} {
   ap:lockc $chan $bnickf(lockmode)
   if {$bnickf(locktime) > 0} {
    utimer $bnickf(locktime) [list btcunlock $chan $bnickf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "\002AP\002: Locked $chan due to botnet nick flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AP $notfuser "Mass nick flood detected on $chan."
    }
   }
  }
 }
}

proc pmsgf:ban {nick uhost hand chan arg} {
 global pmsgf bpmsgf bpmsgc btclocked notifyusers
 if {[invalid:apc $nick $hand [set chan [string tolower $chan]]]} {return 0}
 foreach {o s} [split [channel get $chan ap:bpartmsg] :] {break}
 if {([set ml [channel get $chan ap:partmsgs]] > 0 && [set al [string length $arg]] >= $ml) || [set cl [ap:ccodes $chan $arg ap:partmsgc]] > 0} {
  if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
  if {![invalid:apf $o $s]} {
   if {[follow $s bpmsgc($chan) $o] != -1} {
    if {!($btclocked($chan))} {
     ap:lockc $chan $bpmsgf(lockmode)
     if {$bpmsgf(locktime) > 0} {
      utimer $bpmsgf(locktime) [list btcunlock $chan $bpmsgf(lockmode) btclocked($chan)]
     } {
      utimer 90 [list reset:btc bla bla bla $chan bla bla]
     }
     set btclocked($chan) 1
     if {[string length $btclocked(lnotc)] > 0} {
      puthelp "NOTICE $chan :$btclocked(lnotc)"
     }
     putlog "\002AP\002: Locked $chan due to botnet part msg flood."
     if {[llength $notifyusers]} {
      foreach notfuser $notifyusers {
       sendnote AP $notfuser "Mass part msg flood detected on $chan."
      }
     }
    }
   }
  }
  if {[info exists cl]} { set kmsg [ap:mapr $pmsgf(kmsg) "$cl chars affected by codes"] } {
   set kmsg [ap:mapr $pmsgf(kmsg) "$al chars"]
  }
  punish:method $pmsgf(pmeth) $nick $uhost $chan $kmsg $pmsgf(wmsg) $pmsgf(btype) $pmsgf(btime) $pmsgf(klmsg) $pmsgf(ktime) $pmsgf(ktype) [string tolower $uhost]:pmsgf
 }
}

proc ap:remubt {nick uhost hand chan mc ban} {
 if {[set t [ap:istimer "pushmode $chan -b $ban"]]!=""} { killtimer $t }
}

proc ap:ccodes {ch a f} {
 if {[ap:icodes [set c [channel get $ch $f]]]} {return 0}
 set p 0
 foreach cg [split $c] {
  scan $cg %\[^:\]:%s t v
  if {$v <= 0} {continue}
  set t [string map {r \026 b \002 u \037 c \003} $t]
  if {![info exists fc($t)]} { set fc($t) 0 }
  foreach l [lrange [split $a $t] 1 end] {
   set l [ap:cf $l] ; set l [string range $l 0 [string first \017 $l]]
   if {$t == "\003"} { 
    if {[regsub {^\d(\d?)(,?)(\d?)(\d?)} $l "" l]} {
     if {[incr fc($t) [string length $l]] >= $v} { set p 1 ; break }
     continue
    }
   }
   if {![info exists cc($t)]} { set cc($t) 0 }
   if {!($cc($t) % 2)} {
    if {[incr fc($t) [string length $l]] >= $v} { set p 1 ; break }
   }
   incr cc($t)
  }
  if {$p} {break}
 }
 if {$p} {
  return $fc($t)
 }
 return 0
}

proc ap:import {h i arg} {
 if {[llength [split $arg]] != 2} {
  putdcc $i "\002AP\002: SYNTAX: .ap:import <oldchan> <newchan>" ; return 0
 }
 foreach {oc nc} [split $arg] {break}
 if {[validchan $oc] && [validchan $nc]} {  
  foreach ci [channel info $oc] {
   if {[string match ap:* [lindex $ci 0]]} {
    channel set $nc [lindex $ci 0] [lindex $ci 1]
   }
  }
  putdcc $i "\002AP\002: Imported all AllProtection settings from $oc to $nc."
 } {
  putdcc $i "\002AP\002: Failed! Make sure that $oc and $nc are valid channels."
 }
}

proc ap:reset {h i arg} {
 global ap:udefs
 if {[set c [lindex [split $arg] 0]] == ""} { 
  putdcc $i "\002AP\002: SYNTAX: .ap:reset <#channel>"
  return 0
 }
 if {[string first # $c]!=0} {
  putdcc $i "\002AP\002: $c is invalid, should include \002#\002 in channel name."
  return 0
 }
 if {[validchan $c]} {
  foreach u ${ap:udefs} {
   channel set $c [lindex $u 0] [lindex $u 1]
  }
  putdcc $i "\002AP\002: Reset all AllProtection settings on $c."
 } {
  putdcc $i "\002AP\002: Failed! Make sure that $c is a valid channel."
 }
}
 
foreach {ptextl(lim) ptextl(secs)} [split $ptextl(punish) :] {break}
foreach {ptextc(lim) ptextc(secs)} [split $ptextc(punish) :] {break}

proc priv:texti {nick uhost hand arg} {
 global apfp ptextl ptxtl ptextc ptxtc botnick bred sfluds
 if {[matchattr $hand f] || [matchattr $hand mo]} { return 0 }
 if {([follow $ptextl(secs) ptxtl $ptextl(lim)] == -1) && ([follow $ptextc(secs) ptxtc $ptextc(lim) [string length $arg]] == -1)} {return 0}
 if {!$sfluds} {
  if {[string length $apfp(rmode)]==1} {
   if {!$bred} {
    putquick "MODE $botnick +$apfp(rmode)" -next
    if {$apfp(rtime) > 0} {
     utimer $apfp(rtime) "remr:bot"
    }
    set bred 1
    putlog "\002AP\002: Set mode +$apfp(rmode) on me. (MSG Flood on me!)"
   }
  }
  set sfluds 1
  utimer $apfp(itime) [list set sfluds 0]
  putlog "\002AP\002: Private botnet flood detected. Temporarly stopped answering recieved data."
 }
}

proc priv:acti {nick uhost hand dest keyword arg} {
 if {[isbotnick [lindex [split $dest @] 0]]} {
  priv:texti $nick $uhost $hand $arg
 }
}

foreach {pnotil(lim) pnotil(secs)} [split $pnotil(punish) :] {break}
foreach {pnotic(lim) pnotic(secs)} [split $pnotic(punish) :] {break}

proc priv:notci {nick uhost hand arg dest} {
 global apfp pnotil pnotl pnotic pnotc botnick bred sfluds
 if {[isbotnick [lindex [split $dest @] 0]]} {
  if {[matchattr $hand f] || [matchattr $hand mo]} { return 0 }
  if {([follow $pnotil(secs) pnotl $pnotil(lim)] == -1) && ([follow $pnotic(secs) pnotc $pnotic(lim) [string length $arg]] == -1)} {return 0}
  if {!$sfluds} {
   if {[string length $apfp(rmode)]==1} {
    if {!$bred} {
     putquick "MODE $botnick +$apfp(rmode)" -next
     if {$apfp(rtime) > 0} {
      utimer $apfp(rtime) remr:bot
     }
     set bred 1
     putlog "\002AP\002: Set mode +$apfp(rmode) on me. (NOTICE Flood on me!)"
    }
   }
   set sfluds 1
   utimer $apfp(itime) [list set sfluds 0]
   putlog "\002AP\002: Private botnet flood detected. Temporarly stopped answering recieved data."
  }
 }
}

foreach {pctcpf(lim) pctcpf(secs)} [split $pctcpf(punish) :] {break}

proc priv:ctcpi {nick uhost hand dest kw arg} {
 global apfp pctcpf pfctcp botnick bred sfluds
 if {![isbotnick [lindex [split $dest "@"] 0]] || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 if {[matchattr $hand f] || [matchattr $hand mo]} {return 0}
 if {[follow $pctcpf(secs) pfctcp $pctcpf(lim)] != -1} {
  if {!$sfluds} {
   if {[string length $apfp(rmode)]==1} {
    if {!$bred} {
     putquick "MODE $botnick +$apfp(rmode)" -next
     if {$apfp(rtime) > 0} {
      utimer $apfp(rtime) "remr:bot"
     }
     set bred 1
     putlog "\002AP\002: Set mode +$apfp(rmode) on me. (CTCP Flood on me!)"
    }
   }
   set sfluds 1
   utimer $apfp(itime) [list set sfluds 0]
   putlog "\002AP\002: Private botnet flood detected. Temporarly stopped answering received data."
  }
 }
}

proc priv:ctcri {nick uhost hand dest kw arg} {
 if {![isbotnick [lindex [split $dest "@"] 0]]} {return 0}
 priv:ctcpi $nick $uhost $hand $dest $kw $arg
}

proc priv:flud {nick uhost hand type chan} {
 global sfluds
 if {($chan == "*") && $sfluds} { return 1 }
}

proc remr:bot {} {
 global bred apfp botnick
 puthelp "MODE $botnick -$apfp(rmode)"
 putlog "\002AP\002: Removed +$apfp(rmode) from me."
 set bred 0
}

proc ap:lockc {c lm} {
 if {[llength [split $lm]] == 1} {
  putquick "MODE $c +$lm" -next
 } elseif {[llength [split $lm]] == 2} {
  foreach {a b} [split $lm] {break}
  putquick "MODE $c +$a $b" -next
 }
}
  
append ourlockmodes [lindex [split $btextl(lockmode)] 0]
append ourlockmodes [lindex [split $btextc(lockmode)] 0]
append ourlockmodes [lindex [split $bnotil(lockmode)] 0]
append ourlockmodes [lindex [split $bnotic(lockmode)] 0]
append ourlockmodes [lindex [split $joinflood(lockmode)] 0]
append ourlockmodes [lindex [split $bctcpf(lockmode)] 0]
append ourlockmodes [lindex [split $bjoinf(lockmode)] 0]
append ourlockmodes [lindex [split $brevdoor(lockmode)] 0]
append ourlockmodes [lindex [split $bpmsgf(lockmode)] 0]
append ourlockmodes [lindex [split $bnickf(lockmode)] 0]
foreach btcmode [lsort -unique [split $ourlockmodes ""]] {
 bind mode - "* -$btcmode" reset:btc
}

proc reset:btc {nick uhost hand chan mc targ} {
 global btclocked
 if {[info exists btclocked([set chan [string tolower $chan]])]} {
  if {$btclocked($chan)} {
   set btclocked($chan) 0
  }
 } else {
  set btclocked($chan) 0
 }
}

proc btcunlock {chan modes lockvar} {
 upvar $lockvar locked
 if {[info exists locked]} {
  if {$locked} {
   set locked 0
  }
 } else {
  set locked 0
 }
 foreach mode [split $modes ""] {
  if {[string equal - $mode]} {break}
  if {[string match "*$mode*" [lindex [split [getchanmode $chan]] 0]]} {
   pushmode $chan -$mode
  }
 }
}

proc follow {secs fvar pun {value 1}} {
 upvar $fvar follow
 if {![info exists follow]} {
  set o $value ; set t [clock clicks -milliseconds]
 } {
  foreach {o t} $follow {break} ; incr o $value
 }
 if {[set z [expr {([clock clicks -milliseconds]-$t)/1000.0}]] > $secs} {
  set o $value ; set t [clock clicks -milliseconds]
 } {
  if {$o >= $pun} { followrem $fvar ; return $z }
 }  
 set follow [list $o $t]
 return -1
}

proc ap:pcount {v var} {
 upvar $var p
 foreach {o t} $p {break}
 if {[unixtime]-$t <= $v} { 
  set p [list [incr o] [unixtime]]
 } {
  set p [list 1 [unixtime]]
 }
}

proc ap:dcount {secs fvar} {
 upvar $fvar follow
 incr follow 1
 utimer $secs [list unfollow $fvar]
 set follow
}

proc unfollow fvar {
 upvar $fvar unfollow
 if {[info exists unfollow]} {
  if {$unfollow > 0} {
   incr unfollow -1
  }
  utimer 20 [list followrem $fvar]
 }
}

proc followrem fvar {
 upvar $fvar frem
 if {[info exists frem]} {
  unset frem
 }
}

proc Nfollow {t tl n} {
 upvar $tl bl
 lappend bl $n
 utimer $t [list Nfollowrem $tl $n]
}

proc Nfollowrem {tl n} {
 upvar $tl bl
 if {[info exists bl]} {
  set bl [lreplace $bl [lsearch -exact $bl $n] [lsearch -exact $bl $n]]
  if {![llength $bl]} {unset bl}
 }
}

proc punish:method {method nick uhost chan kmsg wmsg btype btime klmsg ktime ktype fvar} {
 global pwait kline ptrig warnrelay
 if {$ktime < 0} { set ktime $kline(time) }
 if {![info exists ptrig($fvar)]} {
  set ptrig($fvar) [list 0 [unixtime]] 
 } elseif {[unixtime]-[lindex $ptrig($fvar) 1] > $pwait} {
  set ptrig($fvar) [list 0 [unixtime]]
 }
 set o [lindex $ptrig($fvar) 0]
 switch -- $method {
  5 {
   set p kb
  }
  4 {
   if {!$o} { set p k ; ap:pcount $pwait ptrig($fvar) } {
    set p kb
   }
  }
  3 {
   if {!$o} { set p w ; ap:pcount $pwait ptrig($fvar) } {
    set p kb
   }
  }
  2 {
   if {!$o} { set p w ; ap:pcount $pwait ptrig($fvar) } {
    set p k
   }
  }
  1 {
   if {!$o} { set p w ; ap:pcount $pwait ptrig($fvar) } elseif {$o == 1} {
    set p k ; ap:pcount $pwait ptrig($fvar)
   } {
    set p kb
   }
  }
  6 {
   if {!$o} { set p w ; ap:pcount $pwait ptrig($fvar) } elseif {$o == 1} {
    set p k ; ap:pcount $pwait ptrig($fvar)
   } {
    set p kl
   }
  }
  7 {
   if {!$o} { set p w ; ap:pcount $pwait ptrig($fvar) } {
    set p kl
   }
  }
  8 {
   if {!$o} { set p k ; ap:pcount $pwait ptrig($fvar) } elseif {$o == 1} {
    set p kil ; ap:pcount $pwait ptrig($fvar)
   } {
    set p kl
   }
  }
  9 {
   if {!$o} { set p kil ; ap:pcount $pwait ptrig($fvar) } {
    set p kl
   }
  }
  10 {
   set p kl
  }
  default {
   error "Invalid punishment method: $method - use a method from 1 to 10 only."
   return 0
  }
 }
 if {[info exists p]} {
  do:p $p $nick $uhost $chan $kmsg $wmsg $btype $btime $klmsg $ktime $ktype
 }
 return 0
}

proc punish:method2 {method nlist nick uhost chan kmsg wmsg btype btime klmsg ktime ktype fvar} {
 global pwait kline ptrig eclones warnrelay
 if {$ktime < 0} { set ktime $kline(time) }
 if {![info exists ptrig($fvar)]} {
  set ptrig($fvar) [list 0 [unixtime]] 
 } elseif {[unixtime]-[lindex $ptrig($fvar) 1] > $pwait} {
  set ptrig($fvar) [list 0 [unixtime]]
 }
 set o [lindex $ptrig($fvar) 0]
 switch -- $method {
  5 {
   set p kb
  }
  4 {
   if {!$o} { set p k ; ap:pcount $pwait ptrig($fvar) } {
    set p kb
   }
  }
  3 {
   if {!$o} {
    set p w
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    ap:pcount $pwait ptrig($fvar)
   } {
    set p kb
   }
  }
  2 {
   if {!$o} {
    set p w
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    ap:pcount $pwait ptrig($fvar)
   } {
    set p k
   }
  }
  1 {
   if {!$o} {
    set p w
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    ap:pcount $pwait ptrig($fvar)
   } elseif {$o == 1} { set p k ; ap:pcount $pwait ptrig($fvar) } {
    set p kb
   }
  }
  6 {
   if {!$o} {
    set p w
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    ap:pcount $pwait ptrig($fvar)
   } elseif {$o == 1} { set p k ; ap:pcount $pwait ptrig($fvar) } {
    set p kl
   }
  }
  7 {
   if {!$o} {
    set p w
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    ap:pcount $pwait ptrig($fvar)
   } {
    set p kl
   }
  }
  8 {
   if {!$o} { set p k ; ap:pcount $pwait ptrig($fvar) } elseif {$o == 1} {
    set p kil ; ap:pcount $pwait ptrig($fvar)
   } {
    set p kl
   }
  }
  9 {
   if {!$o} { set p kil ; ap:pcount $pwait ptrig($fvar) } {
    set p kl
   }
  }
  10 {
   set p kl
  }
  default {
   error "Invalid punishment method: $method - use a method from 1 to 10 only."
   return 0
  }
 }
 if {[info exists p]} {
  do:p2 $p $nlist $nick $uhost $chan $kmsg $wmsg $btype $btime $klmsg $ktime $ktype
 }
 return 0
}

proc do:p {p n u c km wm bty bti klm kti kty} {
 global kline
 switch -- $p {
  "kb" {
   putquick "KICK $c $n :[mapall $km $c $bti]"
   putquick "MODE $c +b [set bm [masktype $n!$u $bty]]"
   if {($bti > 0) && ([ap:istimer "pushmode $c -b $bm"] == "")} {
    timer $bti [list pushmode $c -b $bm]
   }
   return 0
  }
  "k" {
   putquick "KICK $c $n :[mapall $km $c 0]"
   return 0
  }
  "w" {
   puthelp "NOTICE $n :$wm"
   putlog "Warned $n :$wm"
   return 0
  }
  "kl" {
   putquick [string map [list %mask [scan [masktype $n!$u $kty] %*\[^!\]!%s] %time $kti %reason $klm] $kline(cmd)]
   return 0
  }
  "kil" {
   putquick "KILL $n $klm"
   return 0
  }
 }
}

proc do:p2 {p nl n u c km wm bty bti klm kti kty} {
 global kline
 set cc 0
 switch -- $p {
  "kb" {
   foreach jn $nl {
    putquick "KICK $c $jn :[clonemap [mapall $km $c $bti] [incr cc]]"
    if {![info exists arb([set bm [masktype $jn![getchanhost $jn $c] $bty]])]} {
     putquick "MODE $c +b $bm"
     if {($bti > 0) && ([ap:istimer "pushmode $c -b $bm"] == "")} {
      timer $bti [list pushmode $c -b $bm]
     }
     set arb($bm) 1
    }
   }
   return 0
  }
  "k" {
   foreach jn $nl {
    putquick "KICK $c $jn :[clonemap [mapall $km $c 0] [incr cc]]"
   }
   return 0
  }
  "w" {
   foreach jn $nl {
    puthelp "NOTICE $jn :$wm"
    lappend offenders $jn
   }
   putlog "Warned [join $offenders \002,\002] :$wm"
   return 0
  }
  "kl" {
   foreach jn $nl {
    if {![info exists ark([set klmask [scan [masktype $jn![getchanhost $jn $c] $kty] %*\[^!\]!%s]])]} {
     putquick [string map [list %mask $klmask %time $kti %reason $klm] $kline(cmd)]
     set ark($klmask) 1
    }
   }
   return 0
  }
  "kil" {
   foreach jn $nl {
    putquick "kill $jn $klm"
   }
   return 0
  }
 }
}

proc mapall {s c b} {
 set d [ctime [unixtime]]
 set kc [getkcount]
 string map [list %date $d %chan $c %kcount $kc %btime $b] $s
}

proc clonemap {k c} {
 string map [list %ic $c] $k
}

proc ap:mapr {m r} {
 string map [list %rate $r] $m
}

proc getkcount {} {
 global NumKicks
 incr NumKicks
}

proc checkbcd:join {} {
 global cbcd
 foreach chan [channels] {
  if {[nap:chan $chan $cbcd(chans)]} {continue}
  foreach nick [chanlist $chan] {
   foreach sc $cbcd(procs) {
    $sc $nick [getchanhost $nick $chan] [nick2hand $nick $chan] $chan
   }
  }
 }
}

proc ap:control {m args} {
 global NumKicks kckcount ptrig pwait
 if {![string match ?\[02468\] $m]} {return 0}
 foreach {pn pe} [array get ptrig] {
  if {[unixtime]-[lindex $pe 1] > $pwait} {
   unset ptrig($pn)
  }
 }
 if {[string match ?0 $m]} {
  set kc [open $kckcount(file) w]
  puts $kc $NumKicks
  close $kc
  set l {
   ::txtf ::txtc ::notclf ::notccf ::rptvar ::brevdc ::massbc ::btxtl
   ::btxtc ::bnotcl ::bnotcc ::bctcpc ::ctcpc ::cjoinf ::bnickc 
   ::bpmsgc ::mssdeop ::msskick ::nckflood
  }
  foreach e $l {
   foreach {an ae} [array get $e] {
    if {([clock clicks -milliseconds]-[lindex $ae 1])/1000 > $pwait} {
     array unset $e $an
    }
   }
  }
 }
}

proc invalid:apf {o s} {
 if {![string is integer $o] || $o == "" || $o <= 0} {return 1}
 if {![string is integer $s] || $s == "" || $s <= 0} {return 1}
 return 0
}

proc ap:icodes str {
 if {[regexp {r:\d(\d?)(\d?)\sb:\d(\d?)(\d?)\su:\d(\d?)(\d?)\sc:\d(\d?)(\d?)} $str]} {
  return 0
 }
 return 1
}

proc invalid:apc {nick hand chan} {
 global exmptype
 if {[isbotnick $nick] || ![botisop $chan] || [isop $nick $chan] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 1}
 switch -- $exmptype {
  3 {
   if {[isvoice $nick $chan] || [ishalfop $nick $chan]} {return 1}
  }
  2 {
   if {[ishalfop $nick $chan]} {return 1}
  }
  1 {
   if {[isvoice $nick $chan]} {return 1}
  }
  0 {
   return 0
  }
  default {
   error "Invalid exempt type ($exmptype) must be an integer from 0 to 3"
  }
 }
 return 0
}
 
proc nap:chan {chan chanlist} {
 if {($chanlist == "*") || ([lsearch -exact [split [string tolower $chanlist]] [string tolower $chan]] != -1)} {
  return 0
 }
 return 1
}
  
proc masktype {name {type 3}} { 
 if {[scan $name {%[^!]!%[^@]@%s} nick user host]!=3} { 
  error "Usage: masktype <nick!user@host> \[type\]" 
 }
 if {$type == 10} { return *!$user@* }
 if {$type == 11} { return $nick!*@* }
 if [string match {[3489]} $type] { 
  if [string match {*[0-9]} $host] { 
   set host [join [lrange [split $host .] 0 2] .].* 
  } elseif {[string match *.*.* $host]} { 
   set host *.[join [lrange [split $host .] end-1 end] .] 
  } 
 } 
 if [string match {[1368]} $type] { 
  set user *[string trimleft $user ~] 
 } elseif {[string match {[2479]} $type]} { 
  set user * 
 } 
 if [string match {[01234]} $type] { 
  set nick * 
 } 
 set name $nick!$user@$host 
}

proc ap:cf str {
 return [stripcodes bcruag $str]
}

putlog "\002A\002ll \002P\002rotection v4.5 by Opposing Loaded..."