# $Id: splitdetect.tcl, v3.75.b eggdrop-1.6.18 2007/08/06 11:15:27 Exp $

# Begin - Netsplit Detector v3.75.b [splitdetect.tcl]
#       Build date: 17th July 2007
#       Copyright © 1998-2007 awyeah (awesomeawyeah@gmail.com)
#       This TCL script is designed to work with eggdrop v1.6.17 or higher

#########################################################################
#                       Netsplit Detector v3.75.b                       #
#                                                                       #
#                                                                       #
# Author: awyeah                                        6th August 2007 #
# Email: awesomeawyeah@gmail.com                   Build version 3.75.b #
#########################################################################
#                                                                       #
# #######                                                               #
# PURPOSE                                                               #
# #######                                                               #
#                                                                       #
# This script detects netsplits based on quit messages of users. If a   #
# netsplit is detected this script will make the bot send a notice to   #
# all channels it is on informing the channel with the servers split.   #
#                                                                       #
# NOTE: THIS SCRIPT IS ONLY INTENDED TO RUN ON THE DALNET IRC NETWORK.  #
#                                                                       #
#########################################################################
#                                                                       #
# ############                                                          #
# REQUIREMENTS                                                          #
# ############                                                          #
#                                                                       #
#  The following requirements must be taken into consideration before   #
#  utilizing this script further:                                       #
#                                                                       #
#   (Fields marked with a '*' are compulsory requirements)              #
#                                                                       #
# (*) (1) You must be running EGGDROP v1.6.17 or higher.                #
# (*) (2) You must have TCL v8.4 or higher installed on the system.     #
#                                                                       #
#   To FIND the TCL VERSION and PATCH LEVEL your shell is running:      #
#     (1) At your shell prompt type: tclsh                              #
#         (a) If you have several different versions of tcl installed   #
#             on the system, pick the latest version. E.g: tclsh8.3,    #
#             tclsh8.4 which is installed from the given list.          #
#             (i) At shell prompt type: tclsh8.4 (and go to step 2)     #
#         (b) If you have only one version, pick that one or continue   #
#             with 'tclsh' only if it doesn't say to use another name.  #
#     (2) To find your tcl version type: info tclversion                #
#     (3) To exit tclsh, type: exit                                     #
#                                                                       #
#########################################################################
#                                                                       #
# ############                                                          #
# INSTALLATION                                                          #
# ############                                                          #
#                                                                       #
#  This quick installation tutorial consists of 4 steps. Please follow  #
#  all steps correctly in order to setup your script.                   #
#                                                                       #
# (1) Upload the file splitdetect.tcl in your eggdrop '/scripts' folder #
#     along with your other TCL scripts.                                #
#                                                                       #
# (2) OPEN your eggdrops configuration (.conf) file and add a link at   #
#     the bottom of the configuration file to the path of drone nick    #
#     remover script, it would be:                                      #
#                                                                       #
#               source scripts/splitdetect.tcl                          #
#                                                                       #
#                                                                       #
# (3) SAVE your bots configuration file.                                #
#                                                                       #
# (4) REHASH and RESTART your bot.                                      #
#                                                                       #
#########################################################################
#                                                                       #
# ########                                                              #
# VERSIONS                                                              #
# ########                                                              #
#                                                                       #
#  v3.75.b  - Fixed a small bug in the string range expression for      #
# (06/08/07)  matching the network name in the quit message.            #
#           - Splitted the raw message arguments properly.              #
#                                                                       #
#  v1.82.b  - First public release.                                     #
# (17/07/07)                                                            #
#                                                                       #
#########################################################################
#                                                                       #
# ########                                                              #
# CONTACTS                                                              #
# ########                                                              #
#                                                                       #
#  (*) For any suggestions, comments, questions or bugs reports, feel   #
#      free to email me at:                                             #
#                                                                       #
#               awesomeawyeah@gmail.com                                 #
#                                                                       #
#                                                                       #
#  (*) You can also contact me on MSN Messenger - my messenger ID is:   #
#                                                                       #
#               awyeah@awyeah.org                                       #
#                                                                       #
#                                                                       #
#  (*) You can also catch me on The DALnet Network:                     #
#                                                                       #
#               /server irc.dal.net:6667, Nick: awyeah                  #
#                      Channels: #awyeah, #eggdrops                     #
#                                                                       #
#########################################################################
#                                                                       #
# #########                                                             #
# COPYRIGHT                                                             #
# #########                                                             #
#                                                                       #
# This program is a free software; you can distribute it under the      #
# terms of the GNU General Public License under Section 1 as published  #
# by the Free Software Foundation; either version 2 of the license, or  #
# (at your option) any later version.                                   #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          #
# GNU General Public License for more details.                          #
#                                                                       #
# WARNING:                                                              #
# This program is protected by copyright law and international          #
# treaties. Unauthorized reproduction of this program, or any portion   #
# of it, may result in severe civil penalties and will be prosecuted to #
# the maximum extent possible under the law.                            #
#                                                                       #
#########################################################################
#                                                                       #
# #########                                                             #
# DOWNLOADS                                                             #
# #########                                                             #
#                                                                       #
#  Latest versions of this script can be found on the TCL archives of   #
#  the following websites:                                              #
#                                                                       #
#   1) http://www.egghelp.org/                                          #
#   2) http://www.tclscript.com/                                        #
#   3) http://channels.dal.net/awyeah/scripts/                          #
#                                                                       #
#########################################################################
#                                                                       #
# #######                                                               #
# CREDITS                                                               #
# #######                                                               #
#                                                                       #
#  (*) I would like to thank 'nml375' for his help with the regexp      #
#      match statement.                                                 #
#                                                                       #
#  (*) Thanks to 'Sir_Fz' for helping me out with to find the correct   #
#      binding for detecting users splitting from the network.          #
#                                                                       #
#########################################################################

##################################################
### This script has no variables to configure! ###
##################################################
###########################################################################
### NOTE: THIS SCRIPT IS ONLY INTENDED TO RUN ON THE DALNET IRC NETWORK ###
###########################################################################


#########################################################################
### Please do not edit anything below this line even if you know tcl! ###
#########################################################################

set netsplit(auth) "\x61\x77\x79\x65\x61\x68"
set netsplit(ver) "v3.75.b"

bind raw - QUIT netsplit:detect

proc netsplit:detect {from key arg} {
 global netsplit
 if {[info exists netsplit(detected)]} { return 0 }
 set arg [string trimleft [stripcodes bcruag [split $arg]] :]
 if {[string equal "Quit:" [string range $arg 0 4]]} { return 0 }
 if {![regexp {^([[:alnum:][:punct:]]+)[[:space:]]([[:alnum:][:punct:]]+)$} $arg _arg server1 server2]} { return 0 }
 if {[string equal ".dal.net" [string range $server1 end-7 end]] && [string equal ".dal.net" [string range $server2 end-7 end]]} {
  foreach chan [channels] {
   putserv "NOTICE $chan :Netsplit detected: \002$server1\002 just split from \002$server2\002"
  }
  set netsplit(detected) 1
  utimer 25 [list netsplit:unlock]
 }
}

proc netsplit:unlock {} {
 global netsplit
 if {[info exists netsplit(detected)]} {
  unset netsplit(detected)
  }
}

if {![string equal "\x61\x77\x79\x65\x61\x68" $netsplit(auth)]} { set netsplit(auth) \x61\x77\x79\x65\x61\x68 }
putlog "Netsplit Detector $netsplit(ver) by $netsplit(auth) has been loaded successfully."


