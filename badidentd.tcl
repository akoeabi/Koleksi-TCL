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
set badidentowner "abah" 

# Update
set badidentupdate "09.08.2010"

# location
set badidentcountry "Indonesia"
set badidentstate "Makassar"

# End configuration

# jika kamu ingin menambahkan daftar badident, cukup dengan copy paste sebuah perintah dibawah ini, misalnya copy: bind join - "*fuck*" badident, lalu edit "*fuck*" dengan "*penis*"

bind join - "*fuck*" badident
bind join - "*asshole*" badident
bind join - "*mani*" badident
bind join - "*contol*" badident
bind join - "*pepek*" badident
bind join - "*kentot*" badident
bind join - "*jembut*" badident
bind join - "*zembut*" badident
bind join - "*pantat*" badident
bind join - "*suck*" badident
bind join - "*tetek*" badident
bind join - "*pukimak*" badident
bind join - "*damn*" badident
bind join - "*cibai*" badident 
bind join - "*bitch*" badident 
bind join - "*kimak*" badident 
bind join - "*memek*" badident 
bind join - "*kontol*" badident 
bind join - "*kanjut*" badident 
bind join - "*bangsat*" badident 
bind join - "*ngentot*" badident 
bind join - "*peler*" badident 
bind join - "*lanciau*" badident 
bind join - "*bajingan*" badident 
bind join - "*vagina*" badident 
bind join - "*ngewe*" badident 
bind join - "*shit*" badident 
bind join - "*anjing*" badident
bind join - "*babi*" badident
bind join - "*kampang*" badident 
bind join - "*toket*" badident 
bind join - "*stoket*" badident 
bind join - "*homo*" badident 
bind join - "*puting*" badident 
bind join - "*penis*" badident 
bind join - "*telaso*" badident 
bind join - "*sundala*" badident 
bind join - "*setang*" badident 
bind join - "*horny*" badident 
bind join - "*payudara*" badident 
bind join - "*orgasme*" badident 
bind join - "*titit*" badident 
bind join - "*nenen*" badident 
bind join - "*seks*" badident 
bind join - "*sex*" badident 
bind join - "*birahi*" badident 
bind join - "*klitoris*" badident 
bind join - "*klentit*" badident 
bind join - "*onani*" badident 
bind join - "*konak*" badident 
bind join - "*mastrubasi*" badident
bind join - "*masturbasi*" badident
bind join - "*sperma*" badident

proc badident {nick host hand chan} {
putlog "$nick $hand $chan $host"
global badident channel botnick Name 
if {$hand != ""} {
set badidentban1 "*!*$badident*@*"
set host "*!*[string trimleft [maskhost [getchanhost $nick]] !*]"
set Reason "1RuLes: 4No Ident!! (detected on 4$nick (7$host)"
putserv "KICK $chan $badidentban1 :$Reason"
newchanban $chan $nick Banned $Reason 10
return 0
}
}

putlog "TCL Name : TCL Badident edited by $badidentowner $badidentcountry $badidentstate $badidentupdate"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"