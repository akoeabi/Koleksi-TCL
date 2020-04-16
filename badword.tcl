################# START #################
## Setting untuk Kick atau Kickban jika ada yg mengucapkan badwords
## 0 = kick 1= kickban ###
set badwordban 1

# Kamu dapat menambahkan kata 'badwords' sendiri
# Contoh :
# set badwords {
#  "anoter badword"
# }
# look at the one I set below to get an idea :)
set badwords {
 "fuck"
 "memek"
 "vagina"
 "asshole"
 "shit"
 "pussy"
 "suck"
 "konthol"
 "kontol" 
 "babi"
 "fuck"
 "asshole"
 "bitch"
 "slut"
 "dick"
 "f.u.c.k"
 "suck"
 "f_u_c_k"
 "b-i-t-c-h"
 "b.i.t.c.h"
 "b_i_t_c_h"
 "a.s.s.h.o.l.e"
 "a_s_s_h_o_l_e"
 "d.i.c.k"
 "d_i_c_k"
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
 "tapiras"
 "puki"
 "bujanginam"
 "kontol"
 "contol"
 "pepek"
 "vevek"
 "ngentot"
 "kentot"
 "jembut"
 "zembut"
 "totong"
 "tetek"
 "vagina"
 "tapiras"
 "puki"
 "bujanginam"
 "cibai"
 "cibai"
 "lanciau"
 "lanciau"
 "c1b41"
 "cipap"
 "dancok"
 "jancok"
 "dancox"
 "toket"
 "itil"
 "tempek"
 "dancik"
 "jancik"
}

#Kamu dapat mengeset proteksi ini untuk semua channel atau 1 channel saja, contoh: set allprotect_chans "#arema" (hanya proteksi #arema saja), jika diisi "*" akan berlaku untuk semua channel.
set allprotect_chans "*"

#Set alasan kick-nya.
set badwordmsg "1RuLes: 4No Badword!!"

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
	 putserv "KICK $chan $nick :$badwordmsg"
	 return 0
    }
   }
  }
 }
}

proc ctcp_badword {nick host hand chan keyword arg} {
 pubm_badword $nick $host $hand $chan $arg
}

################## END ##################

putlog "Bad word detected PetroZZa@loaded."


