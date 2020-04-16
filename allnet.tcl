################################################################
# Auto identify nickserv TCL (designed for irc.allnetwork.org) #
# Author:                                                      #
#    Viper          <Meryn.Sanjaya@Gmail.Com>                  # 
#                                                              #
# Edited and add some enhancement by:                          #
#    Viper               (admin@viperedan.tk)                  #
#                                                              #
# I hate ripper, so please included the copyright stuff        #
# when you modified it. at least give credit to real author    #
#                                                              #
################################################################

##############################################################################
Agar bot dapat identify nick, tambahkan username NICKSERV melalui DCC CHAT bot
Caranya :
  .+user service nickserv!*@*
  .+host service *!*@services.us
  .chattr service +f
  .save
###############################################################################

# Set this to the password you're bot is to use to identify with. / Set password nick bot
set nickpass "botpasswordnick"

# Set the service client bots on the network here. / Set nama service server 
set nickserv "NickServ"
set chanserv "ChanServ"

# End of Configuration
# Do not modify below this line

# We may need to know when to identify again, so this takes care of that.
# Do not modify if you use allnetwork, otherwise change to you're suited network.
bind notc - "*type /msg NickServ*" ident_nickserv
bind notc - "*Password accepted - you are now recognized*" op_chanserv

proc ident_nickserv { nick uhost hand args } {
 global botnick nickpass nickserv
    putlog " Ada Notice Dari $nickserv"
    putserv "PRIVMSG $nickserv :identify $nickpass"
    putlog "Identify Ke $nickserv Dulu Neh"
  }

proc op_chanserv { nick uhost hand args } {
   global botnick chanserv
     putlog "Password Di Terima. Minta @ Ke $chanserv aah"
     putserv "PRIVMSG $chanserv :OP all"
     putlog "Mbah $chanserv @ Gue Dunk...:))"
}



#################################################
########### auto identify with nickserv ######### 
########### mode random timer           #########
#################################################
set time 30
set password "password"
if {![info exists {nickserv-loaded}]} {
global password time
set nickserv-loaded 1
timer ${time} Bigooo-proc}

proc Bigooo-proc {} {
global  password time
putserv "PRIVMSG nickserv :identify ${password}"
timer ${time} Bigooo-proc}



##############
# End of TCL #
##############

putlog "- Identify Lo@Ded ©-"