#########################################
# 			    						#
# ReLease Date   : 30 Januari 2010  	#                 
# 							   			#
# DediCateD      : Ukhuwahnet@DALnet	#
#                                   	#  
#########################################

##############################################
### Start configuring variables from here! ###
##############################################

# Configuration settings:

# Owner
set antideop(owner) "abah" 

# location
set antideop(country) "Indonesia"
set antideop(state) "Makassar"

# Update
set antideop(update) "09.08.2010"

# End configuration

############################################
## AntiDeOp.TcL v1.0 Edited By wonk_santai##
## © Sep 2008, Bombat Community		  ##
## #Bombat@allnetwork.org 		  ##
############################################                                                                                                                        
                                                                                                                          
###################
##[ KONFIGURASI ]##
###################

#######################
# SETTING NICKSERVICE #
#######################
#untuk UNDERNET gunakan   : X
#untuk DALNET gunakan     : chanserv@services.dal.net
#untuk QUAKENET gunakan   : Q atau L 
#untuk Allnetwork gunakan : CHANSERV

set servicenick "chanserv@services.dal.net"

###################
# SETTING HUKUMAN #
###################

#ada 3 pilihan hukuman bagi siapapun yg men-DeOp-kan Bot kamu:
#Setting '0' bot tidak melakukan apa2 If you dont want bot to take any action against the user which deoped your bot
#Setting '1' bot akan meng-kick siapa siapapun yg men-DeOp-kan Bot kamu
#Setting '2' bot akan meng-KickBan siapapun yg men-DeOp-kan Bot kamu
#Setting '3' bot akan men-deopkan siapapun yg men-DeOp-kan Bot kamu

set punish "3"

############################
# SETTING ALASAN MENG-KICK #
############################

#Catatan hanya bekerja jika setting hukuman di setting 1 atau 2

set deopkickreason "|.:Proteksi Anti Deop:.|"

#########################
##[ AKHIR-KONFIGURASI ]##
#########################

bind mode - "*-*o*" antideop:autoreop
proc antideop:autoreop {nick uhost hand chan mode target} {
global botnick servicenick punish deopkickreason
if {($target == $botnick) && ($nick != $botnick)} {
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putlog "\002BOT DEOPED ON $chan by $nick"
putlog "\002REOPING BOT ON $chan"
putserv "PRIVMSG $servicenick :op $chan $botnick"
putlog "\002REOP SUCCESSFULL"
utimer 2 [list antideop:punish $nick $uhost $chan] 
 }
}
proc antideop:punish {nick uhost chan} {
global punish deopkickreason
if {($punish == 0)} { return 0 }
if {($punish == 1)} { 
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putquick "KICK $chan $nick :$deopkickreason"
putlog "\002$nick Kicked from $chan for Deoping me on $chan "
 }
if {($punish == 2)} { 
if {($nick == "X") || ($nick == "Q") || ($nick == "L") || ($nick == "chanserv")} { return 0 }
putquick "MODE $chan +b *!*@[lindex [split $uhost @] 1]"
putquick "KICK $chan $nick :$deopkickreason"
putlog "\002 $nick BAN N KICKED FROM $chan FOR DEOPING ME ON $chan"
}
if {($punish == 3)} { 
putquick "MODE $chan -o $nick"
putlog "\002$nick DEOPED FOR DEOPING ME ON $chan"
 }
} 

putlog "TCL Name : TCL AntideOp edited by $antideop(owner) $antideop(country) $antideop(state) $antideop(update)"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"