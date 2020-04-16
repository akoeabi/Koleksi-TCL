####################
# Bad Word         #
####################
## 0 = kick 1= kickban ###
set badwordban 0
set badwords {
 "fuck"
 "fvck"
 "memek"
 "vagina"
 "asshole"
 "shit"
 "pussy"
 "suck"
 "konthol"
 "kontol"
 "contol"
 "pepek"
 "vevek"
 "bitch"
 "slut"
 "dick"
 "f.u.c.k"
 "f_u_c_k"
 "b-i-t-c-h"
 "b.i.t.c.h"
 "b_i_t_c_h"
 "a.s.s.h.o.l.e"
 "a_s_s_h_o_l_e"
 "d.i.c.k"
 "d_i_c_k"
 "kentot"
 "jembud"
 "jembut"
 "jembutz"
 "jembudz"
 "pantat"
 "totong"
 "tetek"
 "sepong"
 "tapiras"
 "puki"
 "bujanginam"
 "pepek"
 "vevek"
 "ngentot"
 "zembut"
 "totong"
 "puki"
 "cibai"
 "sodomi"
 "lanciau"
 "cipap"
 "dancok"
 "jancok"
 "dancox"
 "toket"
 "itil"
 "tempek"
 "dancik"
 "jancik"
 "ngewe"
 "heunceut"
 "(*)(*)"
 "(.)(.)"
 "homosex"
 "lesbian" 
 "payudara"
 "cibe"
 "turuk"
 "itil"
 "tempik"
 "kwontol"
 "entod"
 "entot"
 "ngentod"
 "taik"
 "brengsek"
 "coli"
 "penis"
 "masturb"
 "birahi"
 "pelacur"
}
set allprotect_chans "*"
set badwordmsg "4Badword Detected!!"

bind pubm - * pubm_badword
bind pub - * pubm_badword

bind ctcp - ACTION ctcp_badword 
proc pubm_badword {nick host hand chan arg} {
 global badwords badword_msg allprotect_chans botnick badwordmsg badwordban
 if {(([lsearch -exact [string tolower $allprotect_chans] [string tolower $chan]] != -1) || ($allprotect_chans == "*")) && (![matchattr $hand b]) && ($nick != $botnick)} {
  foreach badword [string tolower $badwords] {
   if [matchattr $hand f] {return 0}
   if {[string match *$badword* [string tolower $arg]]} {
    if {([isop $nick $chan] == 0)&&([isvoice $nick $chan] == 0)} {
	   if {$badwordban==1} {
         set banmask "*!*[string trimleft [maskhost [getchanhost $nick]] !*]"
	   putserv "MODE $chan +b $banmask"
	   }
	 putserv "KICK $chan $nick :$badwordmsg (*$badword*)"
	 return 0
    }
   }
  }
 }
}

proc ctcp_badword {nick host hand chan keyword arg} {
 pubm_badword $nick $host $hand $chan $arg
}

## [ Kicks and banned people who use bad nickname or identd ] ##
#****************************************************************************************************************************************************

#Note: jika kamu ingin menambahkan daftar badnick/ident, cukup dengan copy paste sebuah perintah dibawah ini, misalnya copy: bind join - "*fuck*" join_badnick, lalu edit "*fuck*" dengan "*penis*"

bind join - "*fuck*" join_badnick
bind join - "*bitch*" join_badnick
bind join - "*asshole*" join_badnick 
bind join - "*kontol*" join_badnick
bind join - "*contol*" join_badnick
bind join - "*pepek*" join_badnick
bind join - "*ngentot*" join_badnick
bind join - "*kentot*" join_badnick
bind join - "*jembut*" join_badnick
bind join - "*zembut*" join_badnick
bind join - "*pantat*" join_badnick
bind join - "*suck*" join_badnick
bind join - "*tetek*" join_badnick
bind join - "*vagina*" join_badnick
bind join - "*pukimak*" join_badnick
bind join - "*damn*" join_badnick
bind join - "*penis*" join_badnick
bind join - "*gigolo*" join_badnick
bind join - "*homo*" join_badnick
bind join - "*jembot*" join_badnick
bind join - "*peli*" join_badnick
bind join - "*sexy*" join_badnick
bind join - "*contil*" join_badnick
bind join - "*memek*" join_badnick
bind join - "*kunam*" join_badnick
bind join - "*manuk*" join_badnick
bind join - "*kenthu*" join_badnick
bind join - "*sex*" join_badnick
bind join - "*bispak*" join_badnick
bind join - "*oral*" join_badnick
bind join - "*bokong*" join_badnick
bind join - "*hack*" join_badnick
bind join - "*konthil*" join_badnick
bind join - "*kontil*" join_badnick
bind join - "*jancuk*" join_badnick
bind join - "*jancok*" join_badnick
bind join - "*jancux*" join_badnick
bind join - "*jancox*" join_badnick
bind join - "*babi*" join_badnick
bind join - "*lesbi*" join_badnick
bind join - "*gay*" join_badnick
bind join - "*horny*" join_badnick
bind join - "*ngaceng*" join_badnick
bind join - "*perex*" join_badnick
bind join - "*perek*" join_badnick
bind join - "*anjing*" join_badnick
bind join - "*lacur*" join_badnick
bind join - "*lonthe*" join_badnick
bind join - "*pelacur*" join_badnick
bind join - "*ondolan*" join_badnick
bind join - "*germo*" join_badnick
bind join - "*mucikari*" join_badnick
bind join - "*butt*" join_badnick
bind join - "*mau_ml*" join_badnick
bind join - "*png_ml*" join_badnick
bind join - "*peler*" join_badnick
bind join - "*bisex*" join_badnick
bind join - "*gatil*" join_badnick
bind join - "*makatuk*" join_badnick
bind join - "*tempik*" join_badnick
bind join - "*tempek*" join_badnick
bind join - "*turuk*" join_badnick
bind join - "*turux*" join_badnick
bind join - "*bawuk*" join_badnick
bind join - "*bawux*" join_badnick
bind join - "*seks*" join_badnick
bind join - "*ngewe*" join_badnick
bind join - "*henceut*" join_badnick
bind join - "*toked*" join_badnick
bind join - "*rempon*" join_badnick
bind join - "*petty*" join_badnick
bind join - "*pety*" join_badnick
bind join - "*petaw*" join_badnick
bind join - "*fuck*" join_badnick
bind join - "*bitch*" join_badnick
bind join - "*bayaran*" join_badnick
bind join - "*tante*" join_badnick

proc join_badnick {nick host hand chan} {
putlog "$nick $hand $chan $host"
global join_badnick channel botnick ZName 
if {$hand != ""} {
set host "*!*[string trimleft [maskhost [getchanhost $nick]] !*]"
set ZZ1Reason "2Peraturan: 4Bang Napi nick/ident kotor dilarang join channel ini!! (7terdetect pada 4$nick (7$host)"
putserv "KICK $chan $nick :$ZZ1Reason"
newchanban $chan $host Banned $ZZ1Reason 10
return 0
}}

#****************************************************************************************************************************************************
## [ End of proc ] ##
#****************************************************************************************************************************************************


putlog "dede tcl Badnick/ident masuk"
