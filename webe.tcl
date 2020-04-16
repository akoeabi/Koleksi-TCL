####################################
## WeLCoMe.TcL v1.0 By hadie 	  ##
## © Sep 2008, Riauhacker         ##
## #hadie@homemail.com  	  ##
####################################

###################
##[ KONFIGURASI ]##
###################
# 0 - di channel
# 1 - di PM
set mode_pesan 0

###################
##[ PESAN SALAM ]##
###################
# <nick> - Nick, <chan> - Channel
set pesan_salam {
"<nick>! met join ya :)"
"<nick> met gabung yach"
"<nick> webe"
"<nick> urang bungas datang hihihihi"
"<nick> urang gagah cungul huaAaaaa takut ^_^"
"wew <nick> dateng duduk yang manis yah jangan nakal yah heheheee"
"hy sang rupawan dan menawan yg mirip layang-layang ahhahahaaa met gabung yah"
"hi <nick> welcome"
"webee <nick> :D"
"Selamat Datang <nick> :)muaach-muach"
"<nick> <<=== ada ONYET lepas, minggir hihihihiiii"
"met datang Di <chan> <nick>"
"bubar,,ada orang ganteng datang hahahhaaaa"
"woy @P ,,cium tuh si <nick> orang wangi detect hihihiii"
"met datang <nick>,kalo mau minum ato snack bawa sendiri ajah yach"
"hy <nick>,baru bangun tidur yach"
"alo <nick>,udah makan blom,,pasti belon hihihiii ^,^"
"hallo <nick>,,ada yang bisa saya bantu"

}

###############
##[ BINDING ]##
###############
bind join * * salam_gabung

################
##[ PROSEDUR ]##
################
proc salam_gabung {nick uhost hand chan} {
  global botnick mode_pesan pesan_salam
  if {$nick != $botnick} {
    set salam [lindex $pesan_salam [rand [llength $pesan_salam]]]
    regsub -all "<nick>" $salam $nick salam
    regsub -all "<chan>" $salam $chan salam
    if { $mode_pesan == 0 } {
      putserv "PRIVMSG $chan :$salam"
    } else {
      putserv "PRIVMSG $nick :$salam"
    }
  } 
}

################################################################
putlog "0,12«0,1 WeLCoMe.TcL v1.0 (By hadie) 0,12» LoaDeD"
################################################################
