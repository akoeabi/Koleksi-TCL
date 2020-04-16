##########################[ ALL FLOOD PROTECTION ]###########################
#                                                                           #
# Author  : Opposing (Fz@nexushells.net) - #nexushells @ DALnet             #
# Version : 4.3                                                             #
# Released: July 26, 2005                                                   #
# Source  : http://hub.nexushells.net/~Fz/                                  #
##                                                                          #
# Description: Has all kinds of channel protections + Botnet channel flood  #
#              protections and private protections.                         #
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
#         www.egghelp.org to the topic of AllFloodProtection, and for       #
#         hosting the script on his site when my site went down.            #
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
# * AllFloodProtection exempts channel ops, friends (+f) and masters (+mo) from protection by default.
# That means users with the +f or +mo flags will not be affected by any protection except for mass
# kick/deop/ban protections.  (You can add hosts to the +f handle if you don't want the bot to ban them).
#
# * AllFloodProtection does not use the internal banlist of the bot so you will not have to worry
# about other ops not being able to remove the bans, they can! (feature or bug, I dont care :P)
#
# * AllFloodProtection will not trigger protection on a channel where the bot is not oped, so your
# bot will not send redundant commands to the server. (good for the lag)
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
set notifyusers "Eyash"

# Set here the notice to be sent to the channel when the bot locks the channel because of a
# Botnet flood. leave "" if you don't wish the notice to be sent.
set btclocked(lnotc) "Channel has been locked due to flood, sorry for any inconvenience this may have caused."

# Set the form of the kick counter:
# After setting this variable, you can use $kcform to add a kick counter to the bot's
# kick msg.
# NOTE: %kcount = number of kicks.
set kckcount(form) "·%kcount·"

# Set the file in which the number of kicks will be stored.
set kckcount(file) "scripts/kcount.txt"

# Do you want the bot to check for bad nicks/idents and clones when it first joins the channels
# and gains op ? (0: no , 1: yes)
# NOTE: This may be CPU intensive if your bot is on big channels or on alot of channels.
set cbcd(check) 1 

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
# example: set serv(nick) "CHANSERV" or "PRIVMSG chanserv@services.dal.net"
set serv(nick) "CHANSERV"

# Chanserv deop command.
# use %nick for the nick you want to deop and %chan for the channel name.
# example: set serv(deop) "deop %chan %nick"
set serv(command) "deop %chan %nick"

# Set the time in seconds to wait before reseting the punishment monitor:
# Note: this setting means the bot will apply the punishment steps on each nick
# within this period of time, otherwise it'll trigger steps from the beginning.
# Most recommended value is between: 60-90
set pwait 60

# When Warning a user, do you want the bot to say in the channel that it warned the user?
# 0 means no, 1 means yes.
set warnrelay 0

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
# 0: *!user@full.host.tld 
# 1: *!*user@full.host.tld 
# 2: *!*@full.host.tld 
# 3: *!*user@*.host.tld 
# 4: *!*@*.host.tld 
# 5: nick!user@full.host.tld 
# 6: nick!*user@full.host.tld 
# 7: nick!*@full.host.tld 
# 8: nick!*user@*.host.tld 
# 9: nick!*@*.host.tld

## Available kline mask types:
# 0: user@full.host.tld 
# 1: *user@full.host.tld 
# 2: *@full.host.tld 
# 3: *user@*.host.tld 
# 4: *@*.host.tld 
# 5: user@full.host.tld 
# 6: *user@full.host.tld 
# 7: *@full.host.tld 
# 8: *user@*.host.tld 
# 9: *@*.host.tld

##########################
#      TEXT FLOOD        #
##########################

#
## 1 ## Text flood (lines)
#

# Text flood (lines) monitored channels. (use "*" to make it work on all chans)
# example: set textl(chans) "#chan1 #chan2"
set textl(chans) "*"

# Text flood (lines) <number of msgs>:<in number of secs>
set textl(punish) 5:2

## Text flood (lines) punishment method:
set textl(pmeth) 4

# Text flood (lines) bantype. (-1 to disable ban)
set textl(btype) 2

# Text flood (lines) ban time in minutes. (0 for no ban time)
set textl(btime) 15

# Text flood (lines) kick msg.
set textl(kmsg) "Text flood detected. $kckcount(form)"

# Text flood (lines) warn msg.
set textl(wmsg) "Warning: You've triggered text flood (lines) protection, slow down your typing."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text flood (lines) kline mask type.
set textl(ktype) 2

# Text flood (lines) kline/kill reason.
set textl(klmsg) "Text flooding is not permissable on this network."

# Text flood (lines) kline time (seconds or minutes depends on your ircd).
set textl(ktime) 0

#
## 2 ## Text flood (chars)
#

# Text flood (chars) monitor channels. (use "*" to make it work on all chans)
# example: set textc(chans) "#chan1 #chan2"
set textc(chans) "*"

# Text flood (chars) <chars>:<in how many seconds>.
set textc(punish) 215:3

# Text flood (chars) punishment method:
set textc(pmeth) 5

# Text flood (chars) bantype. (-1 to disable ban)
set textc(btype) 2

# Text flood (chars) ban time in minutes. (0 for no ban time)
set textc(btime) 30

# Text flood (chars) kick msg.
set textc(kmsg) "Excess chars detected. $kckcount(form)"

# Text flood (chars) warning msg.
set textc(wmsg) "Warning: You've triggered text flood (chars) protection, decrease your text legnth."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text flood (chars) kline mask type.
set textc(ktype) 2

# Text flood (chars) kline/kill reason.
set textc(klmsg) "Text flooding (chars) is not permissable on this network."

# Text flood (chars) kline time (seconds or minutes depends on your ircd).
set textc(ktime) 0

#
## 3 ## Notice flood (lines)
#

# Notice flood (lines) monitor channels. (use "*" to make it work on all chans)
# example: set noticel(chans) "#chan1 #chan2"
set noticel(chans) "*"

# Notice flood (lines) lines:seconds.
set noticel(punish) 1:3

# Notice flood (lines) punishment method:
set noticel(pmeth) 5

# Notice flood (lines) ban tpye. (-1 to disable ban)
set noticel(btype) 2

# Notice flood (lines) ban time in minutes. (0 for no ban time)
set noticel(btime) 30

# Notice flood (lines) kick msg.
set noticel(kmsg) "Notice not allowed. $kckcount(form)"

# Notice flood (lines) warn msg.
set noticel(wmsg) "Warning: you've triggered notice flood (lines) protection, slow down your notices."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Notice flood (lines) kline mask type.
set noticel(ktype) 2

# Notice flood (lines) kline/kline reason.
set noticel(klmsg) "Notice flooding is not permissable on this network."

# Notice flood (lines) kline time in reason.
set noticel(ktime) 0

#
## 4 ## Notice flood (chars)
#

# Notice flood (chars) monitor channels. (use "*" to make it work on all chans)
# example: set noticec(chans) "#chan1 #chan2"
set noticec(chans) "*"

# Notice flood (chars) <chars>:<in how many seconds>.
set noticec(punish) 200:3

# Notice flood (chars) punishment method:
set noticec(pmeth) 5

# Notice flood (chars) ban type. (-1 to disable ban)
set noticec(btype) 2

# Notice flood (chars) ban time in minutes. (0 for no ban time)
set noticec(btime) 30

# Notice flood (chars) kick msg.
set noticec(kmsg) "Excess chars (notice) detected. $kckcount(form)"

# Notice flood (chars) warn msg.
set noticec(wmsg) "Warning: you've triggered notice flood (chars) protection, decrease your text length."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Notice flood (chars) kline mask type.
set noticec(ktype) 2

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

# Caps flood monitor channels. (use "*" to make it work on all chans)
# example: set capsp(chans) "#chan1 #chan2"
set capsp(chans) "*"

# Caps flood minimum percentage:charlength.
set capsp(punish) 60:90

# Caps flood punishment method:
set capsp(pmeth) 5

# Caps flood ban type. (-1 to disable ban)
set capsp(btype) 2

# Caps flood ban time in minutes. (0 for no ban time)
set capsp(btime) 15

# Caps flood kick msg.
set capsp(kmsg) "Excess CAPS detected. $kckcount(form)"

# Caps flood warn msg.
set capsp(wmsg) "Warning: You've triggered caps flood protection, release your caps."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Caps flood kline mask type.
set capsp(ktype) 2

# Caps flood kline/kill reason.
set capsp(klmsg) "Caps flooding is not permissable on this network."

# Caps flood kline time (seconds or minutes depends on your ircd).
set capsp(ktime) 0

#
## 6 ## Text repeating.
#

# Text repeating monitor channels. (use "*" to make it work on all chans)
# example: set repeatf(chans) "#chan1 #chan2"
set repeatf(chans) "*"

# Text repeating repeats:seconds.
set repeatf(punish) 3:10

# Text repeating punishment method:
set repeatf(pmeth) 4

# Text repeating ban type. (-1 to disable ban)
set repeatf(btype) 2

# Text repeating ban time in minutes. (0 for no ban time)
set repeatf(btime) 15

# Text repeating kick msg.
set repeatf(kmsg) "Text repeating detected. $kckcount(form)"

# Text repeating warn msg.
set repeatf(wmsg) "Warning: You've triggered text repeating protection, stop repeating."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Text repeating kline mask type.
set repeatf(ktype) 2

# Text repeating kline/kill reason.
set repeatf(klmsg) "Constant repeating is not permissable on this network."

# Text repeating kline time (seconds or minutes depends on your ircd).
set repeatf(ktime) 0

#
## 7 ## Control codes.
#

# Control codes monitor channels. (use "*" to make it work on all chans)
# example: set codesf(chans) "#chan1 #chan2"
set codesf(chans) "*"

# Control codes minimum number of codes allowed.
set codesf(lim) 35

# Control codes punishment method:
set codesf(pmeth) 5

# Control codes ban type. (-1 to disable ban)
set codesf(btype) 2

# control codes ban time in minutes. (0 for no ban time)
set codesf(btime) 30

# Control codes kick msg.
set codesf(kmsg) "Excess codes detected. $kckcount(form)"

# Control codes warn msg.
set codesf(wmsg) "Warning: You've triggered control codes protection, release your msgs from codes."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Control codes kline mask type.
set codesf(ktype) 2

# Control codes kline/kill reason.
set codesf(klmsg) "Excess use of control codes is not permissable on this network."

# Control codes kline time (seconds or minutes depends on your ircd).
set codesf(ktime) 0

#
## 8 ## Advertising.
#

# NOTE: This protection also works for private advertising.

# Advertising channels monitored. (use "*" to make it work on all chans)
# example: set adv(chans) "#chan1 #chan2"
set adv(chans) "*"

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

# Advertising ban type. (-1 to disable ban)
set adv(btype) 2

# Advertising ban time in minutes. (0 for no ban time)
set adv(btime) 15

# Advertising kick msg.
set adv(kmsg) "Advertising detected. $kckcount(form)"

# Advertising warn msg.
set adv(wmsg) "Warning: You've triggered adverting protection, advertisements are not allowed."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Advertising kline mask type.
set adv(ktype) 2

# Advertising kline/kill reason.
set adv(klmsg) "Constant advertising is not permissable on this network."

# Advertising kline time (seconds or minutes depends on your ircd).
set adv(ktime) 0

#
## 9 ## Swearing.
#

# Swearing monitored channels. (use "*" to make it work on all chans)
# example set swear(chans) "#chan1 #chan2"
set swear(chans) "*"

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
}

# Swearing punishment method:
set swear(pmeth) 5

# Swearing ban type. (-1 to disable ban)
set swear(btype) 2

# Swearing ban time in minutes. (0 for no ban time)
set swear(btime) 15

# Swearing kick msg.
set swear(kmsg) "Bad word detected. $kckcount(form)"

# Swearing warn msg.
set swear(wmsg) "Warning: You've triggered swearing protection, cussing is prohibited."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Swearing kline mask type.
set swear(ktype) 2

# Swearing kline/kill reason.
set swear(klmsg) "Swearing is not permissable on this network."

# Swearing kline time (seconds or minutes depends on your ircd).
set swear(ktime) 0

###################
#      CTCP       #
###################

#
## 10 ## CTCP flood
#

# CTCP flood monitored channels. (use "*" to make it work on all chans)
# example: set ctcpf(chans) "#chan1 #chan2"
set ctcpf(chans) "*"

# CTCP flood <number of ctcps>:<in number of secs>
set ctcpf(punish) 2:30

# CTCP flood punishment method:
set ctcpf(pmeth) 5

# CTCP flood ban type. (-1 to disable ban)
set ctcpf(btype) 2

# CTCP ban time in minutes. (0 for no ban time)
set ctcpf(btime) 30

# CTCP flood kick msg.
set ctcpf(kmsg) "CTCP flood detected. $kckcount(form)"

# CTCP flood warn msg.
set ctcpf(wmsg) "Warning: You've triggered CTCP flood protection, decrease your ctcps."

## Edit the following only if you choose a punish method above 5 (oper commands):

# CTCP flood kline mask type.
set ctcpf(ktype) 2

# CTCP flood kline/kill reason.
set ctcpf(klmsg) "CTCP floods are not permissable on this network."

# CTCP flood kline time (seconds or minutes depends on your ircd).
set ctcpf(ktime) 0

###################
#    TAKEOVER     #
###################

#
## 11 ## Mass deop.
#

# Mass deop monitored channels. (use "*" to make it work on all chans)
# example: set massdeop(chans) "#chan1 #chan2"
set massdeop(chans) "*"

# Mass deop <deops>:<in how many seconds>.
set massdeop(punish) 5:1

# Mass deop: deop abuser ? (0: no , 1: yes)
set massdeop(deop) 1

# Mass deop ban type. (-1 to disable ban)
set massdeop(btype) 2

# Mass deop punishment method:
set massdeop(pmeth) 5

# Mass deop ban time in minutes. (0 for no ban time)
set massdeop(btime) 10

# Mass deop kick msg.
set massdeop(kmsg) "Mass deop detected. $kckcount(form)"

# Mass deop warn msg.
set massdeop(wmsg) "Warning: You've triggered the mass deop protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass deop kline type (same as bantype).
set massdeop(ktype) 2

# Mass deop kline/kill reason.
set massdeop(klmsg) "Mass deops are not allowed on this network."

# Mass deop kline time (seconds or minutes depends on your ircd).
set massdeop(ktime) 0

#
## 12 ## Mass kick.
#

# Mass kick monitored channels. (use "*" to make it work on all chans)
# example: set masskick(chans) "#chan1 #chan2"
set masskick(chans) "*"

# Mass kick <kicks>:<in how many seconds>
set masskick(punish) 8:2

# Mass kick: deop abuser ? (0: no , 1: yes)
set masskick(deop) 1

# Mass kick ban type. (-1 to disable ban)
set masskick(btype) 2

# Mass kick punishment method:
set masskick(pmeth) 5

# Mass kick ban time in minutes. (0 for no ban time)
set masskick(btime) 10

# Mass kick kick msg.
set masskick(kmsg) "Mass kick detected. $kckcount(form)" 

# Mass kick warn msg.
set masskick(wmsg) "Warning: You've triggered mass kick protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass kick kline mask type.
set masskick(ktype) 2

# Mass kick kline/kill reason.
set masskick(klmsg) "Mass kicks are prohibited on this network."

# Mass kick kline time (seconds or minutes depends on your ircd).
set masskick(ktime) 0

#
## 13 ## Mass ban (bans).
#

# Mass ban (bans) monitored channels. (use "*" to make it work on all chans)
# example: set massb(chans) "#chan1 #chan2" 
set massb(chans) "*"

# Mass ban (bans) <bans>:<seconds>
set massb(punish) 18:2

# Mass ban (bans) deop abuser ? (1: yes , 0: no)
set massb(deop) 1

# Mass ban (bans) ban type. (-1 to disable ban)
set massb(btype) 2

# Mass ban (bans) punishment method:
set massb(pmeth) 5

# Mass ban (bans) ban time in minutes. (0 for no ban time)
set massb(btime) 30

# Mass ban (bans) kick msg.
set massb(kmsg) "Mass ban is not allowed. $kckcount(form)"

# Mass ban (bans) warning msg.
set massb(wmsg) "Warning: You've triggered mass ban protection, do not repeat this action."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Mass ban (bans) kline mask type.
set massb(ktype) 2

# Mass ban (bans) kline/kill reason.
set massb(klmsg) "Mass banning (bans) is prohibited on this network."

# Mass ban (bans) kline time (seconds or minutes depends on your ircd).
set massb(ktime) 0

#
## 14 ## Channel limit.
#

# Channel limit monitored channels. (use "*" to make it work on all chans)
# example clim(chans) "#chan1 #chan2"
set clim(chans) "*"

# Channel limit: Set this to 0 if you want to use seconds for checking limit.
set clim(ctype) 1

# Channel limit: Check limit every x minutes/seconds.
# NOTE: if clim(ctype) is set to 1 it means this timer is in MINUTES.
set clim(ctime) 1

# Channel limit: limit to add over the channel's current user count.
set clim(alim) 6

# channel limit: The maximum joins allowed before setting a new limit.
# example: Suppose this is set to 1. If the channel has 10 users and the bot sets
# limit 16 then a user joins the channel, the bot will not increase the limit
# unless another user joins (i.e. the number of users became 12 so the bot sets a new limit).
## 0 to disable) ##
set clim(ulim) 1

###################
#  MISCELLANEOUS  #
###################

#
## 15 ## Join flood.
#

# Use '.chanset #channel flood-join <joins>:<seconds>' in partyline to enable. (0:0 to disable)
# NOTE: This triggers on clone join flood, not mass join.

# Join flood ban type. (-1 to disable ban)
set joinflood(btype) 2

# Join flood ban time in minutes. (0 for no ban time)
set joinflood(btime) 30

# Join flood punishment method.
set joinflood(pmeth) 5

# Join flood: Lock channel when triggered ? (1: yes , 0: no)
set joinflood(lockchan) 1

# Join flood: If lock channel is enable, what modes ?
set joinflood(lockmode) mR

# Join flood: lock time in seconds.
set joinflood(locktime) 45

# Join flood kick msg.
set joinflood(kmsg) "Join flood detected. $kckcount(form)"

# Join flood warn msg.
set joinflood(wmsg) "Warning: you've triggered join flood protection, further offence will cause harsher actions."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Join flood kline mask type.
set joinflood(ktype) 2

# Join flood kline/kill reason.
set joinflood(klmsg) "Join floods are not permissable on this network."

# Join flood kline time (seconds or minutes depends on your ircd).
set joinflood(ktime) 0

#
## 16 ## Part msg flood.
#

# Part msg flood monitored channels. (use "*" to make it work on all chans)
# example: set pmsgf(chans) "#chan1 #chan2" (in lowecase)
set pmsgf(chans) "*"

# Part msg flood minimum reason length to ban on.
set pmsgf(lim) 180

# Part msg flood ban type. (-1 to disable ban)
set pmsgf(btype) 2

# Part msg flood punishment method:
set pmsgf(pmeth) 5

# Part msg flood ban time in minutes. (0 for no bantime)
set pmsgf(btime) 30

# Part msg flood kick msg. (incase the offender managed to rejoin before being banned)
set pmsgf(kmsg) "Part msg flood detected. $kckcount(form)"

# Part msg flood warn msg.
set pmsgf(wmsg) "Warning: You've triggered part msg flood protection, decrease text in your part reason."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Part msg flood kline mask type.
set pmsgf(ktype) 2

# Part msg flood kline/kill reason.
set pmsgf(klmsg) "Part msg floods are not permissable on this network."

# Part msg flood kline time (seconds or minutes depends on your ircd).
set pmsgf(ktime) 0

#
## 17 ## Revolving door.
#

# Revolving door monitored channels. (use "*" to make it work on all chans)
# example: set revdoor(chans) "#chan1 #chan2"
set revdoor(chans) "*"

# Revolving door: trigger on part after how many seconds (or less) from join ?
set revdoor(punish) 3

# Revolving door ban type. (-1 to disable ban)
set revdoor(btype) 2

# Revolving door kick msg.
set revdoor(kmsg) "Join-part revolving door attempt detected. $kckcount(form)"

# Revolving door ban time in minutes. (0 for no ban time)
set revdoor(btime) 30

#
## 18 ## Nick flood.
#

# Nick flood monitored channels. (use "*" to make it work on all chans)
# example: set nickflood(chans) "#chan1 #chan2)
set nickflood(chans) "*"

# Nick flood <nick changes>:<in how many seconds>
set nickflood(punish) 4:12

# Nick flood punishment method:
set nickflood(pmeth) 3

# Nick flood ban type. (-1 to disable ban)
set nickflood(btype) 2

# Nick flood ban time in minutes. (0 for no ban time)
set nickflood(btime) 30

# Nick flood kick msg.
set nickflood(kmsg) "Nick flood detected. $kckcount(form)"

# Nick flood warn msg.
set nickflood(wmsg) "Warning: You've triggered nick flood protection, slow down your nick changes."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Nick flood kline mask type.
set nickflood(ktype) 2

# Nick flood kline/kill reason.
set nickflood(klmsg) "Nick floods are not permissable on this network."

# Nick flood kline time (seconds or minutes depends on your ircd).
set nickflood(ktime) 0

#
## 19 ## Clones.
#

# Clones monitored chans. (use "*" to make it work on all chans)
# example: set eclones(chans) "#chan1 #chan2" (in lower case)
set eclones(chans) "*"

# Clones max allowed.
set eclones(lim) 6

# Clones ban type. (-1 to disable ban)
set eclones(btype) 2

# Clones punishment method:
set eclones(pmeth) 5

# Clones ban time in minutes. (0 for no ban time)
set eclones(btime) 30

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
set eclones(ktype) 2

# Clones kline/kill reason.
set eclones(klmsg) "Excess clones are not allowed on this network."

# Clones kline time (seconds or minutes depends on your ircd).
set eclones(ktime) 0

#
## 20 ## Bad nick.
#

# Bad nick monitored chans. (use "*" to make it work on all chans)
# example: set bnick(chans) "#chan1 #chan2"
set bnick(chans) "*"

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
}

# Bad nick ban type. (-1 to disable ban)
set bnick(btype) 2

# Bad nick kick msg
set bnick(kmsg) "Bad nick detected. $kckcount(form)"

# Bad nick ban time in minutes. (0 for no ban time)
set bnick(btime) 15

#
## 21 ## Random drones.
#

# Random drones monitored channels. (use "*" to make it work on all chans)
# example: set nosense(chans) "#chan1 #chan2"
set nosense(chans) "*"

# Random drones: Do you want the bot to check for drones on op ? (1: yes , 0: no)
set nosense(conop) 1

# Random drones exempted masks. (These masks will not be effected)
set nosense(exempt) { "*hunt*!*@*" "*kork*!*@*" "*flash*!*@*" "*!*nika@*" "*ight*!*@*" "*!*ask*@*" "*gurl*!*@*" "*girl*!*@*"
 "*!*Ging*@*" "*control*!*@*" "*!*street*@*" "*freind*!*@*" "*!*phone*@*" "*farah*!*@*" "*!*April@*" "*Erik*!*@*" 
 "all*!*@*" "*!all*@*" "*!~all*@*" "*!*berry*@*" "*!*talking*@*" "template*!*@*" }

# Random drones ban type. (-1 to disable ban)
set nosense(btype) 2

# Random drones punishment method:
set nosense(pmeth) 5

# Random drones ban time in minutes. (0 for no bantime)
set nosense(btime) 30

# Random drones kick msg.
set nosense(kmsg) "Possible random drone detected. $kckcount(form)"

# Random drones warning msg.
set nosense(wmsg) "Warning: You've triggered random drones protection, change your nick now."

## Edit the following only if you choose a punish method above 5 (oper commands):

# Random drones kline mask type.
set nosense(ktype) 2

# Random drones kline/kill reason.
set nosense(klmsg) "Random drones are not allowed on this network."

# Random drones kline time (seconds or minutes depends on your ircd).
set nosense(ktime) 0

#
## 22 ## Bad ident.
#

# Bad ident monitored chans. (use "*" to make it work on all chans)
# example: set bident(chans) "#chan1 #chan2"
set bident(chans) "*"

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
}

# Bad ident ban type. (-1 to disable ban)
set bident(btype) 2

# Bad ident kick msg.
set bident(kmsg) "Bad ident detected. $kckcount(form)"

# Bad ident ban time. (0 for no ban time)
set bident(btime) 15

#########################################
# BOTNET FLOOD PROTECTION (MASS FLOODS) #
#########################################

#
## 1 ## Botnet Text flood (lines).
#

# Botnet Text flood (lines) monitored channels. (use "*" to make it work on all chans)
# example btextl(chans) "#chan1 #chan2"
set btextl(chans) "*"

# Botnet Text flood (lines) <lines>:<seconds>.
set btextl(punish) 15:7

# Botnet Text flood (lines) lock modes.
set btextl(lockmode) mR

# Botnet Text flood (lines) lock time in seconds. (0 for no lock time)
set btextl(locktime) 60

#
## 2 ## Botnet Text flood (chars).
#

# Botnet Text flood (chars) monitored channels. (use "*" to make it work on all chans)
# example btextc(chans) "#chan1 #chan2"
set btextc(chans) "*"

# Botnet Text flood (chars) <chars>:<seconds>.
set btextc(punish) 550:3

# Botnet Text flood (chars) lock modes.
set btextc(lockmode) mR

# Botnet Text flood (chars) lock time in seconds. (0 for no lock time)
set btextc(locktime) 60

#
## 3 ## Botnet Notice flood (lines).
#

# Botnet Notice flood (lines) monitored channels. (use "*" to make it work on all chans)
# example bnotil(chans) "#chan1 #chan2"
set bnotil(chans) "*"

# Botnet Notice flood (lines) <lines>:<seconds>.
set bnotil(punish) 4:2

# Botnet Notice flood (lines) lock modes.
set bnotil(lockmode) mR

# Botnet Notice flood (lines) lock time in seconds. (0 for no lock time)
set bnotil(locktime) 60

#
## 4 ## Botnet Notice flood (chars).
#

# Botnet Notice flood (chars) monitored channels. (use "*" to make it work on all chans)
# example bnotic(chans) "#chan1 #chan2"
set bnotic(chans) "*"

# Botnet Notice flood (chars) <chars>:<seconds>.
set bnotic(punish) 500:3

# Botnet Notice flood (chars) lock modes.
set bnotic(lockmode) mR

# Botnet Notice flood (chars) lock time in seconds. (0 for no lock time)
set bnotic(locktime) 60

#
## 5 ## Botnet CTCP flood.
#

# Botnet CTCP flood monitored chans. (use "*" to make it work on all chans)
# example: set bctcpf(chans) "#chan1 #chan2"
set bctcpf(chans) "*"

# Botnet CTCP flood <ctcps>:<seconds>.
set bctcpf(punish) 4:60

# BOTNET CTCP flood lock modes.
set bctcpf(lockmode) mR

# BOTNET CTCP flood lock time in seconds. (0 for no lock time)
set bctcpf(locktime) 60

#
## 6 ## Botnet join flood.
#

# Botnet join flood monitored channels. (use "*" to make it work on all chans)
# example: set bjoinf(chans) "#chan1 #chan2"
set bjoinf(chans) "*"

# Botnet join flood <join>:<seconds>.
set bjoinf(punish) 9:3

# Botnet join flood lock modes.
set bjoinf(lockmode) mR

# Botnet join flood lock time in seconds. (0 for no lock time)
set bjoinf(locktime) 60

#
## 7 ## Botnet revolving door flood.
#

# Botnet revolving door flood monitored channels. (use "*" to make it work on all chans)
# example: set brevdoor(chans) "#chan1 #chan2"
set brevdoor(chans) "*"

# Botnet revolving door flood <revolutions>:<seconds>
set brevdoor(punish) 5:3

# Botnet revolving door flood lock modes.
set brevdoor(lockmode) mR

# Botnet revolving door flood lock time in seconds. (0 for no lock time)
set brevdoor(locktime) 60

#
## 8 ## Botnet part msg flood.
#

# Botnet part msg flood monitored channels. (use "*" to make it work on all chans)
# example: set bpmsgf(chans) "#chan1 #chan2"
set bpmsgf(chans) "*"

# Botnet Part msg flood <part msg floods>:<in how many seconds>.
set bpmsgf(punish) 5:3

# Botnet Part msg flood lock modes.
set bpmsgf(lockmode) mR

# Botnet Part msg flood lock time in seconds. (0 for no lock time)
set bpmsgf(locktime) 60

#
## 9 ## Botnet Nick flood.
#

# Botnet Nick flood monitored channels. (use "*" to make it work on all chans)
# example: set bnickf(chans) "#chan1 #chan2"
set bnickf(chans) "*"

# Botnet Nick flood <nick-changes>:<seconds>.
set bnickf(punish) 5:30

# Botnet Nick flood lock modes.
set bnickf(lockmode) mR

# Botnet Nick flood lock time in seconds. (0 for no lock time)
set bnickf(locktime) 60

###########################
#   PRIVATE PROTECTIONS   #
###########################

# Set here if you want the bot to set a restriction mode on itself when flooded.
# example: +R is used on DALnet so only registered users can send to the bot.
# set this to "" if you don't wish to change your bot's modes during a flood.
# NOTE: Maximum 1 mode, less or more means it's disabled.
set afpfp(rmode) R

# Set here the time you want to keep the restriction mode in seconds.
set afpfp(rtime) 30

# How many minutes do you want to ignore the flooders ?
set afpfp(itime) 30

#
## 1 ## Private text floods.
#

# Private text (lines) flood <lines>:<seconds>. (0:0 to disable)
set ptextl(punish) 15:6

# Private text (chars) flood <chars>:<seconds>. (0:0 to disable)
set ptextc(punish) 1000:6

#
## 2 ## Private notice floods.
#

# Private notice (lines) flood <lines>:<seconds>. (0:0 to disable)
set pnotil(punish) 8:3

# Private notice (chars) flood <chars>:<seconds>. (0:0 to disable)
set pnotic(punish) 700:4

#
## 3 ## Private CTCP flood.
#

# Private CTCP flood <ctcps>:<seconds>. (0:0 to disable)
set pctcpf(punish) 4:20

# Configurations end here. #
############################
#
######################################################################
# Code starts here, please do not edit anything unless you know TCL: #
# __________________________________________________________________ #

if {$clim(ctype)} {
 if {[timerexists config:lim] == ""} {
  timer $clim(ctime) [list config:lim]
 }
} {
 if {[utimerexists config:lim] == ""} {
  utimer $clim(ctime) [list config:lim]
 }
}

if {([lindex [split $version {., }] 2] >= 17) || ([lindex [split $version {., }] 0] > 1) || ([lindex [split $version {., }] 1] > 6)} {
 set eggver17 1
} {
 set eggver17 0
}

if {![info exists NumKicks]} {
 if {![file exists $kckcount(file)]} {
  set NumKicks 0
 } {
  set kcfopened [open $kckcount(file) r]
  set NumKicks [read -nonewline $kcfopened]
  close $kcfopened
 }
}

if {$cbcd(check)} {
 if {[set cbcd(timer) [timerexists checkbcd:join]]!=""} { killtimer $cbcd(timer) }
 timer 3 checkbcd:join
}

if {![string match -nocase "* Opposing *" ${ctcp-version}]} {
 set ctcp-version "${ctcp-version} - Using \002A\002ll\002F\002lood\002P\002rotection v4.3 by Opposing (aka Sir_Fz) http://hub.nexushells.net/~Fz/"
}

set bred 0

bind flud - join join:flud
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
bind join - * bjoinf:lock
bind nick - * bnickf:lock
bind join - * nosense:kick
bind part - * pmsgf:ban
bind mode - "* -o" massd:kick
bind kick - * massk:kick
bind nick - * nickf:kick
bind msgm - * priv:texti
bind ctcp - ACTION priv:acti
bind notc - * priv:notci
bind ctcp - * priv:ctcpi
bind mode - "* +o" cdrone:onop
bind mode - "* -b" rem:btimer
bind time - "?0 *" store:kcount

proc join:flud {nick uhost hand type chan} {
 global joinflood btclocked
 if {[matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} { return 1 }
 if {![info exists btclocked([set chan [string tolower $chan]])]} { set btclocked($chan) 0 }
 if {$joinflood(lockchan)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$joinflood(lockmode)" -next
   if {!($joinflood(locktime) <= 0)} {
    utimer $joinflood(locktime) [list btcunlock $chan $joinflood(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to join flood from [lindex [split $uhost @] 1]."
  }
 }
 punish:method2 $joinflood(pmeth) $nick $uhost $chan $joinflood(kmsg) $joinflood(wmsg) $joinflood(btype) $joinflood(btime) $joinflood(klmsg) $joinflood(ktime) $joinflood(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:joinflood
 return 1
}

set textl(lim) [scan $textl(punish) %\[^:\]]
set textl(secs) [scan $textl(punish) %*\[^:\]:%s]

proc text:line {nick uhost hand chan arg} {
 global textl txtf
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $textl(chans)]} {return 0}
 if {![info exists txtf([set nickchan [string tolower $uhost:$chan]])]} { set txtf($nickchan) 0 }
 if {[follow $textl(secs) txtf($nickchan)] >= $textl(lim)} {
  punish:method $textl(pmeth) $nick $uhost $chan $textl(kmsg) $textl(wmsg) $textl(btype) $textl(btime) $textl(klmsg) $textl(ktime) $textl(ktype) [string tolower $nick]:textl
 }
}

proc text:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 text:line $nick $uhost $hand $chan $arg
}

set textc(lim) [scan $textc(punish) %\[^:\]]
set textc(secs) [scan $textc(punish) %*\[^:\]:%s]

proc text:char {nick uhost hand chan arg} {
 global textc txtc
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $textc(chans)]} { return 0 }
 if {![info exists txtc([set nickchan [string tolower $uhost:$chan]])]} { set txtc($nickchan) 0 }
 if {[follow $textc(secs) txtc($nickchan) [string length $arg]] >= $textc(lim)} {
  punish:method $textc(pmeth) $nick $uhost $chan $textc(kmsg) $textc(wmsg) $textc(btype) $textc(btime) $textc(klmsg) $textc(ktime) $textc(ktype) [string tolower $nick]:textc
 }
}

proc char:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 text:char $nick $uhost $hand $chan $arg
}

set noticel(lines) [scan $noticel(punish) %\[^:\]]
set noticel(secs) [scan $noticel(punish) %*\[^:\]:%s]

proc notc:lines {nick uhost hand arg chan} {
 global noticel notclf
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $noticel(chans)]} {return 0}
 if {![info exists notclf([set nickchan [string tolower $uhost:$chan]])]} { set notclf($nickchan) 0 }
 if {[follow $noticel(secs) notclf($nickchan)] >= $noticel(lines)} {
  punish:method $noticel(pmeth) $nick $uhost $chan $noticel(kmsg) $noticel(wmsg) $noticel(btype) $noticel(btime) $noticel(klmsg) $noticel(ktime) $noticel(ktype) [string tolower $nick]:noticel
 }
}

set noticec(lim) [scan $noticec(punish) %\[^:\]]
set noticec(secs) [scan $noticec(punish) %*\[^:\]:%s]

proc notc:chars {nick uhost hand arg chan} {
 global noticec notccf
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $noticec(chans)]} {return 0}
 if {![info exists notccf([set nickchan [string tolower $uhost:$chan]])]} { set notccf($nickchan) 0 }
 if {[follow $noticec(secs) notccf($nickchan) [string length $arg]] >= $noticec(lim)} {
  punish:method $noticec(pmeth) $nick $uhost $chan $noticec(kmsg) $noticec(wmsg) $noticec(btype) $noticec(btime) $noticec(klmsg) $noticec(ktime) $noticec(ktype) [string tolower $nick]:noticec
 }
}

set capsp(min) [scan $capsp(punish) %\[^:\]]
set capsp(len) [scan $capsp(punish) %*\[^:\]:%s]

proc caps:kick {nick uhost hand chan arg} {
 global capsp
 set linelen [string length $arg]
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $capsp(chans)] || ($linelen < $capsp(len))} {return 0} 
 if {[set caps [regexp -all -- {[A-Z]} $arg]] > 0} {
  if {[expr {($caps * 100) / $linelen}] >= $capsp(min)} {
   punish:method $capsp(pmeth) $nick $uhost $chan $capsp(kmsg) $capsp(wmsg) $capsp(btype) $capsp(btime) $capsp(klmsg) $capsp(ktime) $capsp(ktype) [string tolower $nick]:capsp
  }
 }
}

proc caps:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 caps:kick $nick $uhost $hand $chan $arg
}

set repeatf(lines) [scan $repeatf(punish) %\[^:\]]
set repeatf(secs) [scan $repeatf(punish) %*\[^:\]:%s]

proc repeat:kick {nick uhost hand chan arg} {
 global repeatf rptvar
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $repeatf(chans)]} {return 0}
 if {[string length [set arg [fzctrl:filter $arg]]] > 32} { set arg [md5 $arg] }
 if {![info exists rptvar([set nickargchan [string tolower $uhost:$arg:$chan]])]} { set rptvar($nickargchan) 0 }
 if {[follow $repeatf(secs) rptvar($nickargchan)] >= $repeatf(lines)} {
  punish:method $repeatf(pmeth) $nick $uhost $chan $repeatf(kmsg) $repeatf(wmsg) $repeatf(btype) $repeatf(btime) $repeatf(klmsg) $repeatf(ktime) $repeatf(ktype) [string tolower $nick]:repeatf
 }
}

proc repeat:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 repeat:kick $nick $uhost $hand $chan $arg
}

proc codes:kick {nick uhost hand chan arg} {
 global codesf
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $codesf(chans)]} {return 0}
 if {[regexp -all -- {[\003\037\002\026\006\007]} $arg] >= $codesf(lim)} {
  punish:method $codesf(pmeth) $nick $uhost $chan $codesf(kmsg) $codesf(wmsg) $codesf(btype) $codesf(btime) $codesf(klmsg) $codesf(ktime) $codesf(ktype) [string tolower $nick]:codesf
 }
}

proc codes:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 codes:kick $nick $uhost $hand $chan $arg
}

proc adv:kick {nick uhost hand chan arg} {
 global adv
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $adv(chans)]} {return 0}
 set rest [fzctrl:filter $arg]
 foreach advword $adv(words) {
  if {[string match -nocase $advword $rest]} {
   punish:method $adv(pmeth) $nick $uhost $chan $adv(kmsg) $adv(wmsg) $adv(btype) $adv(btime) $adv(klmsg) $adv(ktime) $adv(ktype) [string tolower $nick]:adv
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
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $swear(chans)]} {return 0}
 set rest [fzctrl:filter $arg]
 foreach badword $swear(words) {
  if {[string match -nocase $badword $rest]} {
   punish:method $swear(pmeth) $nick $uhost $chan $swear(kmsg) $swear(wmsg) $swear(btype) $swear(btime) $swear(klmsg) $swear(ktime) $swear(ktype) [string tolower $nick]:swear
   break
  }
 }
}

proc swear:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 swear:kick $nick $uhost $hand $chan $arg
}

set brevdoor(lim) [scan $brevdoor(punish) %\[^:\]]
set brevdoor(secs) [scan $brevdoor(punish) %*\[^:\]:%s]

proc rev:door {nick uhost hand chan rsn} {
 global revdoor brevdoor brevdc btclocked notifyusers
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]]} {return 0}
 if {[getchanjoin $nick $chan] >= [clock seconds]-$revdoor(punish)} {
  if {![info exists brevdc($chan)]} { set brevdc($chan) 0 }
  if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
  if {![nafp:chan $chan $brevdoor(chans)]} {
   if {[follow $brevdoor(secs) brevdc($chan)] >= $brevdoor(lim)} {
    if {!($btclocked($chan))} {
     putquick "MODE $chan +$brevdoor(lockmode)" -next
     if {!($brevdoor(locktime) <= 0)} {
      utimer $brevdoor(locktime) [list btcunlock $chan $brevdoor(lockmode) btclocked($chan)]
     } {
      utimer 90 [list reset:btc bla bla bla $chan bla bla]
     }
     set btclocked($chan) 1
     if {[string length $btclocked(lnotc)] > 0} {
      puthelp "NOTICE $chan :$btclocked(lnotc)"
     }
     putlog "AFP: Locked $chan due to botnet revolving door flood."
     if {[llength $notifyusers]} {
      foreach notfuser $notifyusers {
       sendnote AFP $notfuser "Mass revolving door flood detected on $chan."
      }
     }
    }
   }
  }
  if {[nafp:chan $chan $revdoor(chans)]} {return 0}
  if {!($revdoor(btype) < 0)} {
   putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $revdoor(btype)]]"
   if {!($revdoor(btime) <= 0)} {
    timer $revdoor(btime) [list pushmode $chan -b $bmask]
   }
  }
  if {[onchan $nick $chan]} {
   putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $revdoor(kmsg)]"
  }
 }
}

proc clones:kick {nick uhost hand chan} {
 global eclones
 if {![botisop $chan] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan] || [nafp:chan $chan $eclones(chans)]} {return 0}
 set clones 0
 foreach ccheck [chanlist $chan] {
  if {[string equal -nocase [scan $uhost %*\[^@\]@%s] [scan [getchanhost $ccheck $chan] %*\[^@\]@%s]]} {
   incr clones
  }
 }
 if {$clones > $eclones(lim)} {
  if {!($eclones(cagain) <= 0)} {
   set eclones([string tolower $chan]) 1
   utimer 10 [list followrem eclones([string tolower $chan])]
  }
  punish:method2 $eclones(pmeth) $nick $uhost $chan $eclones(kmsg) $eclones(wmsg) $eclones(btype) $eclones(btime) $eclones(klmsg) $eclones(ktime) $eclones(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:eclones
 }
}

proc bnick:kick {nick uhost hand chan {nn ""}} {
 global bnick
 if {$nn == ""} { set nn $nick }
 if {[string first # $chan] != 0} {return 0}
 if {![all:checks:valid $nn $hand $chan] || [nafp:chan $chan $bnick(chans)]} {return 0}
 foreach badnick $bnick(nicks) {
  if {[string match -nocase $badnick $nn]} {
   putquick "KICK $chan $nn :[string map [list %kcount [getkcount]] $bnick(kmsg)]"
   if {!($bnick(btype) < 0)} {
    putquick "MODE $chan +b [set bmask [masktype $nn!$uhost $bnick(btype)]]"
    if {!($bnick(btime) <= 0)} {
     timer $bnick(btime) [list pushmode $chan -b $bmask]
    }
   }
   break
  }
 }
}

proc bident:kick {nick uhost hand chan} {
 global bident
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $bident(chans)]} {return 0}
 scan $uhost %\[^@\] ident
 foreach bid $bident(idents) {
  if {[string match -nocase $bid $ident]} {
   putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $bident(kmsg)]"
   if {!($bident(btype) < 0)} {
    putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $bident(btype)]]"
    if {!($bident(btime) <= 0)} {
     timer $bident(btime) [list pushmode $chan -b $bmask]
    }
   }
   break
  }
 }
}

set massb(lim) [scan $massb(punish) %\[^:\]]
set massb(secs) [scan $massb(punish) %*\[^:\]:%s]

proc mass:ban {nick uhost hand chan mc ban} {
 global massb massbc serv
 if {($nick == "") || [nafp:chan $chan $massb(chans)]} { return 0 }
 if ![info exists massbc([set nickchan [string tolower $uhost:$chan]])] { set massbc($nickchan) 0 }
 if {[follow $massb(secs) massbc($nickchan)] >= $massb(lim)} {
  if {$massb(deop)} {
   pushmode $chan -o $nick
   putquick "$serv(nick) :[string map [list %nick $nick %chan $chan] $serv(command)]"
  }
  punish:method $massb(pmeth) $nick $uhost $chan $massb(kmsg) $massb(wmsg) $massb(btype) $massb(btime) $massb(klmsg) $massb(ktime) $massb(ktype) [string tolower $nick]:massb
 }
}

set btextl(lim) [scan $btextl(punish) %\[^:\]]
set btextl(secs) [scan $btextl(punish) %*\[^:\]:%s]

proc btext:line {nick uhost hand chan arg} {
 global btextl btxtl btclocked notifyusers
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $btextl(chans)]} {return 0}
 if {![info exists btxtl($chan)]} { set btxtl($chan) 0 }
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $btextl(secs) btxtl($chan)] >= $btextl(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$btextl(lockmode)" -next
   if {!($btextl(locktime) <= 0)} {
    utimer $btextl(locktime) [list btcunlock $chan $btextl(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet text (lines) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass text flood (lines) detected on $chan."
    }
   }
  }
 }
}

proc btext:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 btext:line $nick $uhost $chan $chan $arg
}

set btextc(lim) [scan $btextc(punish) %\[^:\]]
set btextc(secs) [scan $btextc(punish) %*\[^:\]:%s]

proc btext:chars {nick uhost hand chan arg} {
 global btextc btxtc btclocked notifyusers
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $btextc(chans)]} {return 0}
 if ![info exists btxtc($chan)] { set btxtc($chan) 0 }
 if ![info exists btclocked($chan)] { set btclocked($chan) 0 }
 if {[follow $btextc(secs) btxtc($chan) [string length $arg]] >= $btextc(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$btextc(lockmode)" -next
   if {!($btextc(locktime) <= 0)} {
    utimer $btextc(locktime) [list btcunlock $chan $btextc(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet text (chars) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass text flood (chars) detected on $chan."
    }
   }
  }
 }
}

proc bchars:action {nick uhost hand chan keyword arg} {
 if {[isbotnick [lindex [split $chan "@"] 0]] || [lindex [split $chan "@"] 1] != ""} {return 0}
 btext:chars $nick $uhost $chan $chan $arg
}

set bnotil(lim) [scan $bnotil(punish) %\[^:\]]
set bnotil(secs) [scan $bnotil(punish) %*\[^:\]:%s]

proc bnotc:line {nick uhost hand arg chan} {
 global bnotil bnotcl btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $bnotil(chans)]} {return 0}
 if {![info exists bnotcl($chan)]} { set bnotcl($chan) 0 }
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $bnotil(secs) bnotcl($chan)] >= $bnotil(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$bnotil(lockmode)" -next
   if {!($bnotil(locktime) <= 0)} {
    utimer $bnotil(locktime) [list btcunlock $chan $bnotil(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet notice (lines) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass notice flood (lines) detected on $chan."
    }
   }
  }
 }
}

set bnotic(lim) [scan $bnotic(punish) %\[^:\]]
set bnotic(secs) [scan $bnotic(punish) %*\[^:\]:%s]

proc bnotc:chars {nick uhost hand arg chan} {
 global bnotic bnotcc btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || [string index $chan 0] == "@"} {return 0}
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $bnotic(chans)]} {return 0}
 if ![info exists bnotcc($chan)] { set bnotcc($chan) 0 }
 if ![info exists btclocked($chan)] { set btclocked($chan) 0 }
 if {[follow $bnotic(secs) bnotcc($chan) [string length $arg]] >= $bnotic(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$bnotic(lockmode)" -next
   if {!($bnotic(locktime) <= 0)} {
    utimer $bnotic(locktime) [list btcunlock $chan $bnotic(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet notice (chars) flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass notice flood (chars) detected on $chan."
    }
   }
  }
 }
}

set bctcpf(lim) [scan $bctcpf(punish) %\[^:\]]
set bctcpf(secs) [scan $bctcpf(punish) %*\[^:\]:%s]

proc bctcp:lock {nick uhost hand chan kw arg} {
 global bctcpf bctcpc btclocked notifyusers
 if {[isbotnick [lindex [split $chan "@"] 0]] || ([lindex [split $chan "@"] 1] != "") || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $bctcpf(chans)]} {return 0}
 if {![info exists bctcpc($chan)]} { set bctcpc($chan) 0 }
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $bctcpf(secs) bctcpc($chan)] >= $bctcpf(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$bctcpf(lockmode)" -next
   if {!($bctcpf(locktime) <= 0)} {
    utimer $bctcpf(locktime) [list btcunlock $chan $bctcpf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet ctcp flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass CTCP flood detected on $chan."
    }
   }
  }
 }
}

set ctcpf(lim) [scan $ctcpf(punish) %\[^:\]]
set ctcpf(secs) [scan $ctcpf(punish) %*\[^:\]:%s]

proc ctcp:kick {nick uhost hand chan kw arg} {
 global ctcpf ctcpc
 if {[isbotnick [lindex [split $chan "@"] 0]] || ([lindex [split $chan "@"] 1] != "") || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 if {![all:checks:valid $nick $hand $chan] || [nafp:chan $chan $ctcpf(chans)]} {return 0}
 if {![info exists ctcpc([set nickchan [string tolower $uhost:$chan]])]} { set ctcpc($nickchan) 0 }
 if {[follow $ctcpf(secs) ctcpc($nickchan)] >= $ctcpf(lim)} {
  punish:method $ctcpf(pmeth) $nick $uhost $chan $ctcpf(kmsg) $ctcpf(wmsg) $ctcpf(btype) $ctcpf(btime) $ctcpf(klmsg) $ctcpf(ktime) $ctcpf(ktype) [string tolower $nick]:ctcpf
 }
}
  

set bjoinf(lim) [scan $bjoinf(punish) %\[^:\]]
set bjoinf(secs) [scan $bjoinf(punish) %*\[^:\]:%s]

proc bjoinf:lock {nick uhost hand chan} {
 global bjoinf cjoinf btclocked notifyusers
 if {![botisop $chan] || [matchattr $hand f|f $chan] || [matchattr $hand m|m $chan] || [isbotnick $nick] || [nafp:chan $chan $bjoinf(chans)]} {return 0}
 if {![info exists cjoinf([set chan [string tolower $chan]])]} { set cjoinf($chan) 0 }
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $bjoinf(secs) cjoinf($chan)] >= $bjoinf(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$bjoinf(lockmode)" -next
   if {!($bjoinf(locktime) <= 0)} {
    utimer $bjoinf(locktime) [list btcunlock $chan $bjoinf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet join flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass join flood detected on $chan."
    }
   }
  }
 }
}

set bnickf(lim) [scan $bnickf(punish) %\[^:\]]
set bnickf(secs) [scan $bnickf(punish) %*\[^:\]:%s]

proc bnickf:lock {nick uhost hand chan nn} {
 global bnickf bnickc btclocked notifyusers
 if {[string first # $chan] != 0} {return 0}
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]] || [nafp:chan $chan $bnickf(chans)]} {return 0}
 if {![info exists bnickc($chan)]} { set bnickc($chan) 0 }
 if {![info exists btclocked($chan)]} { set btclocked($chan) 0 }
 if {[follow $bnickf(secs) bnickc($chan)] >= $bnickf(lim)} {
  if {!($btclocked($chan))} {
   putquick "MODE $chan +$bnickf(lockmode)" -next
   if {!($bnickf(locktime) <= 0)} {
    utimer $bnickf(locktime) [list btcunlock $chan $bnickf(lockmode) btclocked($chan)]
   } {
    utimer 90 [list reset:btc bla bla bla $chan bla bla]
   }
   set btclocked($chan) 1
   if {[string length $btclocked(lnotc)] > 0} {
    puthelp "NOTICE $chan :$btclocked(lnotc)"
   }
   putlog "AFP: Locked $chan due to botnet nick flood."
   if {[llength $notifyusers]} {
    foreach notfuser $notifyusers {
     sendnote AFP $notfuser "Mass nick flood detected on $chan."
    }
   }
  }
 }
}

proc config:lim {} {
 global clim
 foreach chan [channels] {
  if {![botisop $chan] || [nafp:chan $chan $clim(chans)]} { continue }
  if {[string match *l* [getchanmode $chan]]} {
   if {[expr {[lindex [split [getchanmode $chan]] end] - [set thislim [llength [chanlist $chan]]]}] != [expr {$clim(alim) - $clim(ulim)}]} {
    if {[set mylim [expr {$thislim + $clim(alim)}]] != [lindex [split [getchanmode $chan]] end]} {
     putserv "MODE $chan +l $mylim"
    }
   }
  } {
   putserv "MODE $chan +l [expr {[llength [chanlist $chan]] + $clim(alim)}]"
  }
 }
 if {$clim(ctype)} {
  timer $clim(ctime) [list config:lim]
 } {
  utimer $clim(ctime) [list config:lim]
 }
}

proc nosense:kick {nick uhost hand chan} {
 global nosense
 set stopnc 0
 foreach exempt $nosense(exempt) {
  if {[string match -nocase $exempt $nick!$uhost]} {
   set stopnc 1
   break
  }
 }
 if {$stopnc} { return 0 }
 scan $uhost %\[^@\] ident
 if {![info exists nosense(pause)]} { set nosense(pause) 0 }
 if {[nafp:chan $chan $nosense(chans)] || ($nosense(pause) > 3) || ([string match -nocase *[set sident [string trimleft $ident ~]]* $nick]) || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 if {([botisop $chan]) && ([string length $nick] > 3) && ([string is alpha $nick]) && ([string is lower $nick]) && ([string is alpha $sident]) && ([string is lower $sident])} {
  if {![string match *\[aeiou\]* $nick]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {qb|qc|qd|qf|qg|qh|qk|qn|qp|qq|qr|qs|qt|jwm} $nick]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {xd|xf|xg|xh|xk|xm|xn|xq|xr|xt|xv|xz|qw|qz|gz} $nick]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {zb|zc|zd|zf|zh|zm|zq|zr|zt|zv|zx|qx|qv|kz} $nick]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {vb|vf|vg|vh|vk|vm|vn|vq|vx|vw|bgb|gv|wj|lx} $nick]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {qb|qc|qd|qf|qg|qh|qk|qm|qn|qp|qq|qr|qs|qt} $ident]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {xd|xf|xg|xh|xk|xm|xn|xq|xr|xt|xv|xz|qw|qz} $ident]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {zb|zc|zd|zf|zh|zm|zq|zr|zt|zv|zx|qx|qv|kz} $ident]} { nosense:ban $nick $uhost $chan ; return 0 }
  if {[regexp {vb|vf|vg|vh|vk|vm|vn|vq|vx|vw|bgb|gv|wj|lx} $ident]} { nosense:ban $nick $uhost $chan ; return 0 }
 }
}

proc nosense:ban {nick uhost chan} {
 global nosense
 punish:method $nosense(pmeth) $nick $uhost $chan $nosense(kmsg) $nosense(wmsg) $nosense(btype) $nosense(btime) $nosense(klmsg) $nosense(ktime) $nosense(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:nosense
 putlog "\002Nosense:\002 Detected \002$nick\002!\002[scan $uhost %\[^@\]]\002 on \002$chan\002."
 follow 2 nosense(pause)
}

proc cdrone:onop {nick uhost hand chan mc targ} {
 global nosense
 if {[nafp:chan $chan $nosense(chans)]} {return 0}
 if {[isbotnick $targ] && $nosense(conop)} {
  foreach cdrone [chanlist $chan] {
   if {[isop $cdrone $chan] || [isvoice $cdrone $chan] || [isbotnick $cdrone]} { continue }
   nosense:kick $cdrone [getchanhost $cdrone $chan] [nick2hand $cdrone $chan] $chan
  }
 }
}

set bpmsgf(lim) [scan $bpmsgf(punish) %\[^:\]]
set bpmsgf(secs) [scan $bpmsgf(punish) %*\[^:\]:%s]

proc pmsgf:ban {nick uhost hand chan arg} {
 global pmsgf bpmsgf bpmsgc btclocked notifyusers
 if {![all:checks:valid $nick $hand [set chan [string tolower $chan]]]} {return 0}
 if {![info exists bpmsgc($chan)]} { set bpmsgc($chan) 0 }
 if {[string length $arg] >= $pmsgf(lim)} {
  if {![nafp:chan $chan $pmsgf(chans)]} {
   if {[follow $bpmsgf(secs) bpmsgc($chan)] >= $bpmsgf(lim)} {
    if {!($btclocked($chan))} {
     putquick "MODE $chan +$bpmsgf(lockmode)" -next
     if {!($bpmsgf(locktime) <= 0)} {
      utimer $bpmsgf(locktime) [list btcunlock $chan $bpmsgf(lockmode) btclocked($chan)]
     } {
      utimer 90 [list reset:btc bla bla bla $chan bla bla]
     }
     set btclocked($chan) 1
     if {[string length $btclocked(lnotc)] > 0} {
      puthelp "NOTICE $chan :$btclocked(lnotc)"
     }
     putlog "AFP: Locked $chan due to botnet part msg flood."
     if {[llength $notifyusers]} {
      foreach notfuser $notifyusers {
       sendnote AFP $notfuser "Mass part msg flood detected on $chan."
      }
     }
    }
   }
  }
  if {[nafp:chan $chan $pmsgf(chans)]} {return 0}
  punish:method $pmsgf(pmeth) $nick $uhost $chan $pmsgf(kmsg) $pmsgf(wmsg) $pmsgf(btype) $pmsgf(btime) $pmsgf(klmsg) $pmsgf(ktime) $pmsgf(ktype) [string tolower [scan $uhost %*\[^@\]@%s]]:pmsgf
 }
}

set massdeop(lim) [scan $massdeop(punish) %\[^:\]]
set massdeop(secs) [scan $massdeop(punish) %*\[^:\]:%s]

proc massd:kick {nick uhost hand chan mc targ} {
 global massdeop mssdeop serv
 if {($nick == "") || ($nick == $targ) || [nafp:chan $chan $massdeop(chans)]} {return 0}
 if {![info exists mssdeop([set nickchan [string tolower $uhost:$chan]])]} { set mssdeop($nickchan) 0 }
 if {[follow $massdeop(secs) mssdeop($nickchan)] >= $massdeop(lim)} {
  if {$massdeop(deop)} {
   putquick "$serv(nick) :$serv(command)"
   if {[botisop $chan]} {
    putquick "MODE $chan -o $nick"
   }
  }
  punish:method $massdeop(pmeth) $nick $uhost $chan $massdeop(kmsg) $massdeop(wmsg) $massdeop(btype) $massdeop(btime) $massdeop(klmsg) $massdeop(ktime) $massdeop(ktype) [string tolower $nick]:massdeop
 }
}

set masskick(lim) [scan $masskick(punish) %\[^:\]]
set masskick(secs) [scan $masskick(punish) %*\[^:\]:%s]

proc massk:kick {nick uhost hand chan targ rsn} {
 global masskick msskick serv
 if {($nick == $targ) || [nafp:chan $chan $masskick(chans)]} {return 0}
 if {![info exists msskick([set nickchan [string tolower $uhost:$chan]])]} { set msskick($nickchan) 0 }
 if {[follow $masskick(secs) msskick($nickchan)] >= $masskick(lim)} {
  if {$masskick(deop)} {
   putquick "$serv(nick) :$serv(command)"
   if {[botisop $chan]} {
    putquick "MODE $chan -o $nick"
   }
  }
  punish:method $masskick(pmeth) $nick $uhost $chan $masskick(kmsg) $masskick(wmsg) $masskick(btype) $masskick(btime) $masskick(klmsg) $masskick(ktime) $masskick(ktype) [string tolower $nick]:masskick
 }
}

set nickflood(lim) [scan $nickflood(punish) %\[^:\]]
set nickflood(secs) [scan $nickflood(punish) %*\[^:\]:%s]

proc nickf:kick {nick uhost hand chan nn} {
 global nickflood nckflood
 if {[string first # $chan] != 0} {return 0}
 if {![all:checks:valid $nn $hand $chan] || [nafp:chan $chan $nickflood(chans)]} {return 0}
 if {![info exists nckflood([set nickchan [string tolower $uhost:$chan]])]} { set nckflood($nickchan) 0 }
 if {[follow $nickflood(secs) nckflood($nickchan)] >= $nickflood(lim)} {
  punish:method $nickflood(pmeth) $nn $uhost $chan $nickflood(kmsg) $nickflood(wmsg) $nickflood(btype) $nickflood(btime) $nickflood(klmsg) $nickflood(ktime) $nickflood(ktype) [string tolower $nick]:nickflood
 }
}

set ptextl(lim) [scan $ptextl(punish) %\[^:\]]
set ptextl(secs) [scan $ptextl(punish) %*\[^:\]:%s]
set ptextc(lim) [scan $ptextc(punish) %\[^:\]]
set ptextc(secs) [scan $ptextc(punish) %*\[^:\]:%s]

proc priv:texti {nick uhost hand arg} {
 global afpfp ptextl ptxtl ptextc ptxtc botnick bred
 if {[matchattr $hand f] || [matchattr $hand mo]} { return 0 }
 if {![info exists ptxtl]} { set ptxtl 0 }
 if {![info exists ptxtc]} { set ptxtc 0 }
 if {([follow $ptextl(secs) ptxtl] >= $ptextl(lim)) || ([follow $ptextc(secs) ptxtc [string length $arg]] >= $ptextc(lim))} {
  if {[string length $afpfp(rmode)]==1} {
   if {!$bred} {
    putquick "MODE $botnick +$afpfp(rmode)" -next
    if {$afpfp(rtime) > 0} {
     utimer $afpfp(rtime) {remr:bot}
    }
    set bred 1
    putlog "AFP: Set mode +$afpfp(rmode) on me. (MSG Flood on me!)"
   }
  }
  if {![isignore [set i *!*@[lindex [split $uhost @] 1]]]} {
   newignore $i AFP "MSG flooder" $afpfp(itime)
   putlog "AFP: Ignored $i (MSG flooder)"
  }
 }
}

proc priv:acti {nick uhost hand dest keyword arg} {
 if {[isbotnick [lindex [split $dest @] 0]]} {
  priv:texti $nick $uhost $hand $arg
 }
}

set pnotil(lim) [scan $pnotil(punish) %\[^:\]]
set pnotil(secs) [scan $pnotil(punish) %*\[^:\]:%s]
set pnotic(lim) [scan $pnotic(punish) %\[^:\]]
set pnotic(secs) [scan $pnotic(punish) %*\[^:\]:%s]

proc priv:notci {nick uhost hand arg dest} {
 global afpfp pnotil pnotl pnotic pnotc botnick bred
 if {[isbotnick [lindex [split $dest @] 0]]} {
  if {[matchattr $hand f] || [matchattr $hand mo]} { return 0 }
  if {![info exists pnotl]} { set pnotl 0 }
  if {![info exists pnotc]} { set pnotc 0 }
  if {([follow $pnotil(secs) pnotl] >= $pnotil(lim)) || ([follow $pnotic(secs) pnotc [string length $arg]] >= $pnotic(lim))} {
   if {[string length $afpfp(rmode)]==1} {
    if {!$bred} {
     putquick "MODE $botnick +$afpfp(rmode)" -next
     if {$afpfp(rtime) > 0} {
      utimer $afpfp(rtime) {remr:bot}
     }
     set bred 1
     putlog "AFP: Set mode +$afpfp(rmode) on me. (NOTICE Flood on me!)"
    }
   }
   if {![isignore [set i *!*@[lindex [split $uhost @] 1]]]} {
    newignore $i AFP "NOTICE flooder" $afpfp(itime)
    putlog "AFP: Ignored $i (NOTICE flooder)"
   }
  }
 }
}

set pctcpf(lim) [scan $pctcpf(punish) %\[^:\]]
set pctcpf(secs) [scan $pctcpf(punish) %*\[^:\]:%s]

proc priv:ctcpi {nick uhost hand dest kw arg} {
 global afpfp pctcpf pfctcp botnick bred
 if {![isbotnick [lindex [split $dest "@"] 0]] || [string equal -nocase "action" $kw] || [string equal -nocase "chat" $kw]} {return 0}
 if {[matchattr $hand f] || [matchattr $hand mo]} {return 0}
 if {![info exists pfctcp]} { set pfctcp 0 }
 if {[follow $pctcpf(secs) pfctcp] >= $pctcpf(lim)} {
  if {[string length $afpfp(rmode)]==1} {
   if {!$bred} {
    putquick "MODE $botnick +$afpfp(rmode)" -next
    if {$afpfp(rtime) > 0} {
     utimer $afpfp(rtime) {remr:bot}
    }
    set bred 1
    putlog "AFP: Set mode +$afpfp(rmode) on me. (CTCP Flood on me!)"
   }
  }
  if {![isignore [set i *!*@[lindex [split $uhost @] 1]]]} {
   newignore $i AFP "CTCP flooder" $afpfp(itime)
   putlog "AFP: Ignored $i (CTCP flooder)"
  }
 }
}
  
proc rem:btimer {nick uhost hand chan mc ban} {
 foreach t [timers] {
  if {[string equal -nocase "pushmode $chan -b $ban" [lindex $t 1]]} {
   killtimer [lindex $t 2]
   break
  }
 }
}

append ourlockmodes $btextl(lockmode)
append ourlockmodes $btextc(lockmode)
append ourlockmodes $bnotil(lockmode)
append ourlockmodes $bnotic(lockmode)
append ourlockmodes $joinflood(lockmode)
append ourlockmodes $bctcpf(lockmode)
append ourlockmodes $bjoinf(lockmode)
append ourlockmodes $brevdoor(lockmode)
append ourlockmodes $bpmsgf(lockmode)
append ourlockmodes $bnickf(lockmode)
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
  pushmode $chan -$mode
 }
}

proc follow {secs fvar {value 1}} {
 upvar $fvar follow
 incr follow $value
 utimer $secs [list unfollow $fvar $value]
 set follow
}

proc unfollow {fvar value} {
 global pwait
 upvar $fvar unfollow
 if {[info exists unfollow]} {
  if {$unfollow > 0} {
   incr unfollow -$value
  }
  if {[string match ptrig* $fvar]} {
   utimer [expr {$pwait +10}] [list followrem $fvar]
  } {
   utimer 75 [list followrem $fvar]
  }
 }
}

proc followrem fvar {
 upvar $fvar frem
 if {[info exists frem]} {
  unset frem
 }
}

proc remr:bot {} {
 global bred afpfp botnick
 puthelp "MODE $botnick -$afpfp(rmode)"
 putlog "AFP: Remove +$afpfp(rmode) from me."
 set bred 0
}

proc punish:method {method nick uhost chan kmsg wmsg btype btime klmsg ktime ktype fvar} {
 global pwait kline ptrig warnrelay
 if {$ktime < 0} { set ktime $kline(time) }
 switch -- $method {
  5 {
   putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
   if {!($btype < 0)} {
    putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $btype]]"
    if {!($btime <= 0)} {
     timer $btime [list pushmode $chan -b $bmask]
    }
   }
   return
  }
  4 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    follow $pwait ptrig($fvar)
   } {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    if {!($btype < 0)} {
     putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $btype]]"
     if {!($btime <= 0)} {
      timer $btime [list pushmode $chan -b $bmask]
     }
    }
   }
   return
  }
  3 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    puthelp "NOTICE $nick :$wmsg"
    putlog "Warned $nick :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned $nick :$wmsg"
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    if {!($btype < 0)} {
     putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $btype]]"
     if {!($btime <= 0)} {
      timer $btime [list pushmode $chan -b $bmask]
     }
    }
   }
   return
  }
  2 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    puthelp "NOTICE $nick :$wmsg"
    puthelp "Warned $nick :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned $nick :$wmsg"
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
   }
   return
  }
  1 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    puthelp "NOTICE $nick :$wmsg"
    putlog "Warned $nick :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned $nick :$wmsg"
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    if {!($btype < 0)} {
     putquick "MODE $chan +b [set bmask [masktype $nick!$uhost $btype]]"
     if {!($btime <= 0)} {
      timer $btime [list pushmode $chan -b $bmask]
     }
    }
   }
   return
  }
  6 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    puthelp "NOTICE $nick :$wmsg"
    putlog "Warned $nick :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned $nick :$wmsg"
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   }
   return
  }
  7 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    puthelp "NOTICE $nick :$wmsg"
    putlog "Warned $nick :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned $nick :$wmsg"
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   }
   return
  }
  8 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    putquick "KICK $chan $nick :[string map [list %kcount [getkcount]] $kmsg]"
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick "kill $nick $klmsg"
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   }
   return
  }
  9 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    putquick "kill $nick $klmsg"
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   }
   return
  }
  10 {
   putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   return
  }
  default {
   error "Invalid punishment method: $method - use a method from 1 to 10 only."
   return
  }
 }
}

proc punish:method2 {method nick uhost chan kmsg wmsg btype btime klmsg ktime ktype fvar} {
 global pwait kline ptrig eclones warnrelay
 if {$ktime < 0} { set ktime $kline(time) }
 switch -- $method {
  5 {
   foreach jnick [chanlist $chan] {
    if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
     putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     if {!($btype < 0)} {
      if {![info exists allreadybanned([set bmask [masktype $jnick![getchanhost $jnick $chan] $btype]])]} {
       pushmode $chan +b $bmask
       if {!($btime <= 0)} {
        timer $btime [list pushmode $chan -b $bmask]
       }
       set allreadybanned($bmask) 1
      }
     }
    }
   }
   flushmode $chan
   return
  }
  4 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     }
    }
    follow $pwait ptrig($fvar)
   } {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
      if {!($btype < 0)} {
       if {![info exists allreadybanned([set bmask [masktype $jnick![getchanhost $jnick $chan] $btype]])]} {
        pushmode $chan +b $bmask
        if {!($btime <= 0)} {
         timer $btime [list pushmode $chan -b $bmask]
        }
        set allreadybanned($bmask) 1
       }
      }
     }
    }
    flushmode $chan
   }
   return
  }
  3 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      puthelp "NOTICE $jnick :$wmsg"
      lappend offenders $jnick
     }
    }
    putlog "Warned [join $offenders \002,\002] :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned [join $offenders \002,\002] :$wmsg"
    }
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
      if {!($btype < 0)} {
       if {![info exists allreadybanned([set bmask [masktype $jnick![getchanhost $jnick $chan] $btype]])]} {
        pushmode $chan +b $bmask
        if {!($btime <= 0)} {
         timer $btime [list pushmode $chan -b $bmask]
        }
        set allreadybanned($bmask) 1
       }
      }
     }
    }
    flushmode $chan
   }
   return
  }
  2 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      puthelp "NOTICE $jnick :$wmsg"
      lappend offenders $jnick
     }
    }
    putlog "Warned [join $offenders \002,\002] :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned [join $offenders \002,\002] :$wmsg"
    }
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     }
    }
   }
   return
  }
  1 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      puthelp "NOTICE $jnick :$wmsg"
      lappend offenders $jnick
     }
    }
    putlog "Warned [join $offenders \002,\002] :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned [join $offenders \002,\002] :$wmsg"
    }
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     }
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
      if {!($btype < 0)} {
       if {![info exists allreadybanned([set bmask [masktype $jnick![getchanhost $jnick $chan] $btype]])]} {
        pushmode $chan +b $bmask
        if {!($btime <= 0)} {
         timer $btime [list pushmode $chan -b $bmask]
        }
        set allreadybanned($bmask) 1
       }
      }
     }
    }
    flushmode $chan
   }
   return
  }
  6 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      puthelp "NOTICE $jnick :$wmsg"
      lappend offenders $jnick
     }
    }
    putlog "Warned [join $offenders \002,\002] :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned [join $offenders \002,\002] :$wmsg"
    }
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     }
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    foreach jnick [chanlist $chan] {
     if {![info exists allreadyklined([set klmask [scan [masktype $jnick![getchanhost $jnick $chan] $ktype] %*\[^!\]!%s]])]} {
      putquick [string map [list %mask $klmask %time $ktime %reason $klmsg] $kline(cmd)]
      set allreadyklined($klmask) 1
     }
    }
   }
   return
  }
  7 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      puthelp "NOTICE $jnick :$wmsg"
      lappend offenders $jnick
     }
    }
    putlog "Warned [join $offenders \002,\002] :$wmsg"
    if {$warnrelay} {
     puthelp "PRIVMSG $chan :Warned [join $offenders \002,\002] :$wmsg"
    }
    if {[info exists eclones([string tolower $chan])]} {
     utimer $eclones(cagain) [list clones:kick $nick $uhost [nick2hand $nick $chan] $chan]
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    putquick [string map [list %mask [scan [masktype $nick!$uhost $ktype] %*\[^!\]!%s] %time $ktime %reason $klmsg] $kline(cmd)]
   }
   return
  }
  8 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "KICK $chan $jnick :[string map [list %kcount [getkcount]] $kmsg]"
     }
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "kill $jnick $klmsg"
     }
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 2} {
    foreach jnick [chanlist $chan] {
     if {![info exists allreadyklined([set klmask [scan [masktype $jnick![getchanhost $jnick $chan] $ktype] %*\[^!\]!%s]])]} {
      putquick [string map [list %mask $klmask %time $ktime %reason $klmsg] $kline(cmd)]
      set allreadyklined($klmask) 1
     }
    }
   }
   return
  }
  9 {
   if {![info exists ptrig($fvar)]} { set ptrig($fvar) 0 }
   if {!($ptrig($fvar))} {
    foreach jnick [chanlist $chan] {
     if {[string equal -nocase [scan [getchanhost $jnick $chan] %*\[^@\]@%s] [scan $uhost %*\[^@\]@%s]]} {
      putquick "kill $jnick $klmsg"
     }
    }
    follow $pwait ptrig($fvar)
   } elseif {$ptrig($fvar) == 1} {
    foreach jnick [chanlist $chan] {
     if {![info exists allreadyklined([set klmask [scan [masktype $jnick![getchanhost $jnick $chan] $ktype] %*\[^!\]!%s]])]} {
      putquick [string map [list %mask $klmask %time $ktime %reason $klmsg] $kline(cmd)]
      set allreadyklined($klmask) 1
     }
    }
   }
   return
  }
  10 {
   foreach jnick [chanlist $chan] {
     if {![info exists allreadyklined([set klmask [scan [masktype $jnick![getchanhost $jnick $chan] $ktype] %*\[^!\]!%s]])]} {
      putquick [string map [list %mask $klmask %time $ktime %reason $klmsg] $kline(cmd)]
      set allreadyklined($klmask) 1
     }
    }
   return
  }
  default {
   error "Invalid punishment method: $method - use a method from 1 to 10 only."
   return
  }
 }
}

proc checkbcd:join {} {
 global cbcd
 foreach chan [channels] {
  if {[lsearch -exact $cbcd(chans) [string tolower $chan]] == -1} {continue}
  foreach nick [chanlist $chan] {
   foreach sc $cbcd(procs) {
    $sc $nick [getchanhost $nick $chan] [nick2hand $nick $chan] $chan
   }
  }
 }
}

proc getkcount {} {
 global NumKicks
 incr NumKicks
}

proc store:kcount {args} {
 global NumKicks kckcount
 set kc [open $kckcount(file) w]
 puts $kc $NumKicks
 close $kc
}

proc all:checks:valid {nick hand chan} {
 global exmptype
 if {[isbotnick $nick] || ![botisop $chan] || [isop $nick $chan] || [matchattr $hand f|f $chan] || [matchattr $hand mo|mo $chan]} {return 0}
 switch -- $exmptype {
  3 {
   if {[isvoice $nick $chan] || [ishalfop $nick $chan]} { return 0 }
  }
  2 {
   if {[ishalfop $nick $chan]} { return 0 }
  }
  1 {
   if {[isvoice $nick $chan]} { return 0 }
  }
  0 {
   return 1
  }
  default {
   error "Invalid exempt type ($exmptype) must be an integer from 0 to 3"
  }
 }
 return 1
}

proc nafp:chan {chan chanlist} {
 if {($chanlist == "*") || ([lsearch -exact [split [string tolower $chanlist]] [string tolower $chan]] != -1)} {
  return 0
 }
 return 1
}
  
set masktypeDefaultType 3 

proc masktype [list name [list type $masktypeDefaultType]] { 
 if {[scan $name {%[^!]!%[^@]@%s} nick user host]!=3} { 
  error "Usage: masktype <nick!user@host> \[type\]" 
 } 
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

proc fzctrl:filter {str} {
 global eggver17
 if {$eggver17} {
  set str [stripcodes bcruag $str]
 } else {
  regsub -all -- {\003[0-9]{0,2}(,[0-9]{0,2})?} $str "" str
  set str [string map {"\017" "" "\037" "" "\002" "" "\026" "" "\006" "" "\007" ""} $str]
 }
}

putlog "\002A\002ll \002F\002lood \002P\002rotection v4.3 by Opposing Loaded..."