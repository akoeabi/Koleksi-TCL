##########################################################
# Script: X Login                 # You are free to edit #
# Version: 1.0.0                  # this script as much  #
# Author: Alien                   # as you want as long  #
# Email:  alien@irctools.org      # as you keep my name  #
# Web:    www.weaklink.ws/~alien/ # in credits.          #
##########################################################
# This simple script will login   # Feel free to email   #
# your bot automatically when it  # me with suggestions  #
# gets connected. Can be set to   # or bugs.             #
# set +x mode too.                #                      #
##########################################################

###
# Configuration
###

#
# Username to use when logging in to X

set xlogin_user "myuser"

#
# Password to use when logging in to X

set xlogin_pass "mypass"

#
# Autimatically set +x mode (0) = no (1) = yes

set xlogin_xmode "1"

#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#
#                      End of conf                      #
# You shouldn't edit anything below unless you know how.#
#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#

set init-server "xlogin_dologin"

proc xlogin_dologin {} {
global xlogin_user xlogin_pass xlogin_xmode botnick
   puthelp "PRIVMSG X@channels.undernet.org :login $xlogin_user $xlogin_pass"
   if {$xlogin_xmode == "1"} {
      puthelp "MODE $botnick +x"
   }
}

# Quite simple, isn't it

putlog "ALI: Loaded X Login TCL by Alien"