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
set bnowner "abah" 

# Update
set bnupdate "09.08.2010"

# location
set bncountry "Indonesia"
set bnstate "Makassar"

# End configuration

#Note: jika kamu ingin menambahkan daftar badnick/ident, cukup dengan copy paste sebuah perintah dibawah ini, misalnya copy: bind join - "*fuck*" join_badnick, lalu edit "*fuck*" dengan "*penis*"

bind join - "*fuck*" join_badnick
bind join - "*asshole*" join_badnick
bind join - "*mani*" join_badnick
bind join - "*contol*" join_badnick
bind join - "*pepek*" join_badnick
bind join - "*kentot*" join_badnick
bind join - "*jembut*" join_badnick
bind join - "*zembut*" join_badnick
bind join - "*pantat*" join_badnick
bind join - "*suck*" join_badnick
bind join - "*tetek*" join_badnick
bind join - "*pukimak*" join_badnick
bind join - "*damn*" join_badnick
bind join - "*cibai*" join_badnick 
bind join - "*bitch*" join_badnick 
bind join - "*kimak*" join_badnick 
bind join - "*memek*" join_badnick 
bind join - "*kontol*" join_badnick 
bind join - "*kanjut*" join_badnick 
bind join - "*bangsat*" join_badnick 
bind join - "*ngentot*" join_badnick 
bind join - "*peler*" join_badnick 
bind join - "*lanciau*" join_badnick 
bind join - "*bajingan*" join_badnick 
bind join - "*vagina*" join_badnick 
bind join - "*ngewe*" join_badnick 
bind join - "*shit*" join_badnick 
bind join - "*anjing*" join_badnick
bind join - "*babi*" join_badnick
bind join - "*kampang*" join_badnick 
bind join - "*toket*" join_badnick 
bind join - "*stoket*" join_badnick 
bind join - "*homo*" join_badnick 
bind join - "*puting*" join_badnick 
bind join - "*penis*" join_badnick 
bind join - "*telaso*" join_badnick 
bind join - "*sundala*" join_badnick 
bind join - "*setang*" join_badnick 
bind join - "*horny*" join_badnick 
bind join - "*payudara*" join_badnick 
bind join - "*orgasme*" join_badnick 
bind join - "*titit*" join_badnick 
bind join - "*nenen*" join_badnick 
bind join - "*seks*" join_badnick 
bind join - "*sex*" join_badnick 
bind join - "*birahi*" join_badnick 
bind join - "*klitoris*" join_badnick 
bind join - "*klentit*" join_badnick 
bind join - "*onani*" join_badnick 
bind join - "*konak*" join_badnick 
bind join - "*mastrubasi*" join_badnick
bind join - "*masturbasi*" join_badnick
bind join - "*sperma*" join_badnick

proc join_badnick {nick host hand chan} {
putlog "$nick $hand $chan $host"
global join_badnick channel botnick Name 
if {$hand != ""} {
set host "*!*[string trimleft [maskhost [getchanhost $nick]] !*]"
set Reason "1RuLes: 4No Bad Nick join_badnick or Ident!! (detected on 4$nick (7$host)"
putserv "KICK $chan $nick :$Reason"
newchanban $chan $nick Banned $Reason 10
return 0
}}

putlog "TCL Name : TCL Badnick edited by $bnowner $bncountry $bnstate $bnupdate"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"