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
set bawelvoice(owner) "abah" 

# location
set bawelvoice(country) "Indonesia"
set bawelvoice(state) "Makassar"

# Update
set bawelvoice(update) "09.08.2010"

# Version
set bawelvoice(version) "20.10"

# End configuration

## ----------------------------------------------------------------
## Set global variables and specificic
## ----------------------------------------------------------------

## -=[ HELLO ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2 #channel3 #channel4"
set hello_chans "#chyndy #rakhel"

## HELLO ##
set hello "Hello Respon"

bind pub - hello hello_speak 
bind pub - alo hello_speak 
bind pub - aloo hello_speak 
bind pub - alooo hello_speak 
bind pub - hallo hello_speak 
bind pub - hai hello_speak 
bind pub - hi hello_speak 

set ranhello {
"hello there, nice to meet you"
"hello how are you ^_^"
"ramein channel donk saayyyy"
"halo halo bandung, wakil bos gua orang Makassar"
"Hi too, ohh ur so cutee xP~"
"halooooooooo"
"apaaaaaaa , suka yaaaaa ma Saya,hmm"
"chat in channel please"
"yes, Hello too, do I know ya ?"
"alo sayank"
"Hi there"
"hello, whats up"
"oi oi oi oi oi"  
"Halo juga nich, kamu sapa nich, kok sok kenal banget ma saya =P"
"hello how are you ^_^"
"Hai bro apa kabarmu, bagaimana dengan kabar keluargamu ?"
"hey whats up"
"yeah, yeah hi HI"
"hello, nice to see yea!"
"Hi i'm happy today!!"
"hai hai hai hai juga"
"apa khbar nich nama kamu siapa"
"halo juga perkenalkan nama ku Yazmien Octavia, kalau kamu siapa?"
"asl gua = 20 f Mksr, rumah gua di Ir.Juanda , tebak yg mana :P"
"hi ,  =)  , kenalan yukk"
"asl pls, I like to chat with you in channel"
"Hi juga, kamu makin kiyut aja dech, gemesssss"
"alo juga, siapa disitu ?"
",konnichiwa (halo dalam bahasa jepang)<== maklum baru belajar :P"
",how do you do? i'm happy to meet you"
",halo juga saya senang dapat berjumpa dengan anda lagi"
"it was nice meeting you"
"menyenakan dapat bertemu dengan anda lagi"
"how are you today ? are you okay ?"
}

proc hello_speak {nick uhost hand chan text} {
 global botnick hello_chans ranhello
if {(([lsearch -exact [string tolower $hello_chans] [string tolower $chan]] != -1) || 
($hello_chans == "*"))} {
set helos [lindex $ranhello [rand [llength $ranhello]]]
putserv "PRIVMSG $chan :$nick $helos"
  }
}

## -=[ BRB ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2 #channel3 #channel4"
set brb_chans "#chyndy #rakhel"

##  BRB  ##
set BRB "BRB Respon"

bind pub - brb brb_speak 
bind pub - gtg brb_speak 
bind pub - away brb_speak 

set ranbrb {
"ok"
"where you going?"
"me too, smoke time!"
"when you coming back. miss ya already! ;)"
"mo kemana nich, kok ga ngajak ngajak hehehe"
"jangan lama lama yah , aku masih kangen nich..."
"kalo mo ke WC aku ikut, kalo ke kamar juga hehehehhe"
"ok darling, but don't be so long ok pls, I need You honey"
",Alesan .. paling juga gebetan"
"5 menit aja hehehehehee"
"ikut donk..."
",ape ?? mo kmana lu jang ? TEGA LUH tinggalin gua sendiri ?? co macam apa pulak kau :("
"brb boleh tapi nicknamenya tetep disini kan ?"
"ok,  saya tunggu yah.. jangan lama2 kangen buanget  nich kekek.."
"brb mau kemana.. mau beli makanan yah.. ikut donk.."
"ye.. baru juga elo masuk udah brb payah.. loe..."
}

proc brb_speak {nick uhost hand chan text} {
 global botnick brb_chans ranbrb
if {(([lsearch -exact [string tolower $brb_chans] [string tolower $chan]] != -1) || 
($brb_chans == "*"))} {
set brbs [lindex $ranbrb [rand [llength $ranbrb]]]
putserv "PRIVMSG $chan :$nick $brbs"
  }
}

## -=[ BYE ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2 #channel3 #channel4"
set bye_chans "#chyndy #rakhel"

##  BYE  ##
set BYE "BYE Respon"

bind pub - bye bye_speak 
bind pub - dadah bye_speak

set ranbye {
"ati ati dijalan yahh, byeee, kalo jatoh, bangun sendiri yahhh"
"sampe jumpa besok di waktu dan jam yang sama hihihihi tha tha"
"ati ati Ntar ketabrak becak lagi"
"thathaaa"
"nice to meet you today, hope can see you agaiin tomorrow"
"ati-ati di jalan bro!!"
"ok see u later frend"
"kok buru-buru amat tadikan baru datang kok udah mau pergi.."
"ok deh.. bye.. juga"
"see u tommorow night"
"see u tonight"
"mata ashita (sampai jumpa besok)"
"sayoonara fren :)"
"sampai besok sobat"
"iyah..take care yaahh ^_^"
"take care fren, nice to meet u :)"
"good bye.. juga :)"
"nice to meet you today, hope can see you agaiin tomorrow"
"makacih ya udah join dan maen disini"
"Bye..!!"
"Bye JuGa"
"Bye Say"
"DadaH Cayang.."
"Kiss NyA MaNA...?!"
"Ati² di jLn yAH kLo jATuH BaNGUn sEnDIRi dEH"
"yAH MaU kEmaNA Lo"
}

proc bye_speak {nick uhost hand chan text} {
 global botnick bye_chans ranbye
if {(([lsearch -exact [string tolower $bye_chans] [string tolower $chan]] != -1) || 
($bye_chans == "*"))} {
set byes [lindex $ranbye [rand [llength $ranbye]]]
putserv "PRIVMSG $chan : $nick $byes"
  }
}

## -=[ PING PONG ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2 #channel3 #channel4"
set ping_chans "#chyndy #rakhel"

##  PING PONG ##
set ping "Ping Respon"

bind pub - !ping ping_speak 
bind pub - `ping ping_speak
bind pub - .ping ping_speak

set ranping {
"Ping itu Kerupuk Ya..? :P"
"PONG"
"PING apa PONG"
}

proc ping_speak {nick uhost hand chan text} {
 global botnick ping_chans ranping
if {(([lsearch -exact [string tolower $ping_chans] [string tolower $chan]] != -1) || 
($ping_chans == "*"))} {
set pings [lindex $ranping [rand [llength $ranping]]]
putserv "PRIVMSG $chan : $nick $pings"
  }
}

## -=[ SORE ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set sore_chans "#chyndy #rakhel"

## SORE ##
set sore "sore Respon"

bind pubm - "sore" sore_speak 

set ransore {
"Sore Juga"
"Pagi Kan"
"Tau.. Siapa yang Bilang Malem"
"MAsak sih Sore"
 }

proc sore_speak {nick uhost hand chan text} {
 global botnick sore_chans ransore
if {(([lsearch -exact [string tolower $sore_chans] [string tolower $chan]] != -1) || 
($sore_chans == "*"))} {
set sores [lindex $ransore [rand [llength $ransore]]]
putserv "PRIVMSG $chan : $nick $sores"
  }
}

## -=[ MALAM ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set malam_chans "#chyndy #rakhel"

## MALAM ##
set malam "Malam Respon"

bind pub - malem malam_speak 
bind pub - malam malam_speak 

set ranmalam {
"Malem"
"MasiH PaGi Kok.."
"God Night"
"MaLEm² GinI eNaKNyA nGapaiN yAH!!"
"MaLeM jUGa ML yUK"
 }

proc malam_speak {nick uhost hand chan text} {
 global botnick malam_chans ranmalam
if {(([lsearch -exact [string tolower $malam_chans] [string tolower $chan]] != -1) || 
($malam_chans == "*"))} {
set malams [lindex $ranmalam [rand [llength $ranmalam]]]
putserv "PRIVMSG $chan : $nick $malams"
  }
}

## -=[ PAGI ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set pagi_chans "#chyndy #rakhel"

##  pagi  ##
set pagi "Pagi Respon"

bind pub - pagi pagi_speak 
bind pub - morning pagi_speak 

set ranpagi {
"PaGi"
"Pagi Juga"
"MorNinG"
"aDA aPA"
 }

proc pagi_speak {nick uhost hand chan text} {
 global botnick pagi_chans ranpagi
if {(([lsearch -exact [string tolower $pagi_chans] [string tolower $chan]] != -1) || 
($pagi_chans == "*"))} {
set pagis [lindex $ranpagi [rand [llength $ranpagi]]]
putserv "PRIVMSG $chan : $nick $pagis"
  }
}

## -=[ JUNDI ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set jundi_chans "#chyndy #rakhel"

##  Jundi  ##
set jundi "Jundi Respon"

bind pub - jundi jundi_speak 
bind pub - abah abah_speak
bind pub - ummi ummi_speak
bind pub - abi abi_speak

set ranjundi {
"aDA aPA nYARiiN cO iya"
"BOSS LaGi MojoK mA iya GA biSa DigANggU"
"KaMU nYARiiN BoSS.. BenTaR yAH tAK PanggiLiN"
"KaYAknya BiGBoSS LaGi RapaT tUcH"
 }

proc jundi_speak {nick uhost hand chan text} {
 global botnick jundi_chans ranjundi
if {(([lsearch -exact [string tolower $jundi_chans] [string tolower $chan]] != -1) || 
($jundi_chans == "*"))} {
set jundis [lindex $ranjundi [rand [llength $ranjundi]]]
putserv "PRIVMSG $chan : $nick $jundis"
  }
}

## -=[ SALAM ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set salam_chans "#chyndy #rakhel"

##  salam ##
set salam "Salam Respon"

bind pub - assalamualaikum salam_speak 
bind pub - assalamu'alaikum salam_speak 
bind pub - assalamu`alaikum salam_speak 

set ransalam {
"12W10å'å£åïKümü§§å£ååm 12W10å®åhmåtü££ååhï 12W10åßå®åKååtüh apa kabar nih?"
 }

proc salam_speak {nick uhost hand chan text} {
 global botnick salam_chans ransalam
if {(([lsearch -exact [string tolower $salam_chans] [string tolower $chan]] != -1) || 
($salam_chans == "*"))} {
set salams [lindex $ransalam [rand [llength $ransalam]]]
putserv "PRIVMSG $chan : $nick $salams"
  }
}

## -=[ WASALAM ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set wsalam_chans "#chyndy #rakhel"

##  wasalam ##
set wasalam "Wasalam Respon"

bind pub - wassalamualaikum wasalam_speak 
bind pub - wassalamu'alaikum wasalam_speak 
bind pub - wassalamu`alaikum wasalam_speak 
bind pub - wassalam wasalam_speak 
bind pub - wasalam wasalam_speak 
bind pub - wassalam wasalam_speak

set ranwasalam {
"12W10å'å£åïKümü§§å£ååm 12W10å®åhmåtü££ååhï 12W10åßå®åKååtüh ati² di jalan yah.. kalo jatuh bangun sendiri ^_^"
 }

proc wasalam_speak {nick uhost hand chan text} {
 global botnick wasalam_chans ranwasalam
if {(([lsearch -exact [string tolower $wasalam_chans] [string tolower $chan]] != -1) || 
($wasalam_chans == "*"))} {
set wasalams [lindex $ranwasalam [rand [llength $ranwasalam]]]
putserv "PRIVMSG $chan : $nick $wasalams"
  }
}

## -=[ HEHE ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set hehe_chans "#chyndy #rakhel"

## hehe ##
set hehe "Hehe Respon"

bind pubm - "hehe" hehe_speak 
bind pubm - "haha" hehe_speak 
bind pubm - "hihi" hehe_speak 
bind pubm - "xixi" hehe_speak 
bind pubm - "keke" hehe_speak 
bind pubm - "heuh" hehe_speak 
bind pubm - "huhu" hehe_speak 
bind pubm - "hoho" hehe_speak 
bind pubm - "jeje" hehe_speak
bind pubm - "hoah" hehe_speak
bind pubm - "haoah" hehe_speak

set ranhehe {
"Huzz..!!!"
"Apanya YG Lucu"
"ixixixixix"
"ihh Lucu Deh"
"Jangan Keras² Bauuuu"
"he.. he.!!"
 }

proc hehe_speak {nick uhost hand chan text} {
 global botnick hehe_chans ranhehe
if {(([lsearch -exact [string tolower $hehe_chans] [string tolower $chan]] != -1) || 
($hehe_chans == "*"))} {
set hehes [lindex $ranhehe [rand [llength $ranhehe]]]
putserv "PRIVMSG $chan : $nick $hehes"
  }
}

## -=[ SENYUM ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set senyum_chans "#chyndy #rakhel"

## senyum ##
set senyum "Senyum Respon"

bind pub - :) senyum_speak 
bind pub - :D senyum_speak 
bind pub - :P senyum_speak 
bind pub - :)) senyum_speak 

set ransenyum {
":D"  
":))"
":P"
"=))"
":)"
";)"
":("
 }

proc senyum_speak {nick uhost hand chan text} {
 global botnick senyum_chans ransenyum
if {(([lsearch -exact [string tolower $senyum_chans] [string tolower $chan]] != -1) || 
($senyum_chans == "*"))} {
set senyums [lindex $ransenyum [rand [llength $ransenyum]]]
putserv "PRIVMSG $chan : $nick $senyums"
  }
}

## -=[ NGANTUK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set ngantuk_chans "#chyndy #rakhel"

## ngantuk ##
set ngantuk "Ngantuk Respon"

bind pubm - "huah" ngantuk_speak 
bind pubm - "ngantu" ngantuk_speak 
bind pubm - "nguantuk" ngantuk_speak
bind pubm - "hhhoooaaammmzzzzz" ngantuk_speak 
bind pubm - "hoammmzzz" ngantuk_speak  

set ranngantuk {
"Nguuantuk Yah Bobo Bareng Yuk"  
"Kalo Nguuantuk Tidur Sana"
"Sini Tak Ganjal Pake Linggis"
"Baru Jam Segini Udah Ngaantuk"
"DasaR MuKA BanTaL"
"HuH..!!"
 }
 
proc ngantuk_speak {nick uhost hand chan text} {
 global botnick ngantuk_chans ranngantuk
if {(([lsearch -exact [string tolower $ngantuk_chans] [string tolower $chan]] != -1) || 
($ngantuk_chans == "*"))} {
set ngantuks [lindex $ranngantuk [rand [llength $ranngantuk]]]
putserv "PRIVMSG $chan : $nick $ngantuks"
  }
}

## -=[ MUACH ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set muach_chans "#chyndy #rakhel"

## muach ##
set muach "Muach Respon"

bind pub - muac muach_speak 
bind pub - kiss muach_speak 

set ranmuach {
"Mmmmuuuaaaaccchhh!!!"  
"ihhh genit deh"
"Najis!!"
"basah deh"
"MunCraT tUCH"
"Hmmmm"
 }

proc muach_speak {nick uhost hand chan text} {
 global botnick muach_chans ranmuach
if {(([lsearch -exact [string tolower $muach_chans] [string tolower $chan]] != -1) || 
($muach_chans == "*"))} {
set muachs [lindex $ranmuach [rand [llength $ranmuach]]]
putserv "PRIVMSG $chan : $nick $muachs"
  }
}

## -=[ ASL ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set asl_chans "#chyndy #rakhel"

## ASL ##
set ASL "ASL Respon"

bind pubm - "asl" asl_speak 
bind pubm - "kenal" asl_speak 
bind pubm - "nama" asl_speak
bind pubm - "kenalan dongs" asl_speak

set ranasl {
"asl plz!"
"U1"
"Leh Aja"
"BoleH DonK"
"capa seh lo"
"NGGA..!!"
"maLes BGT dEH"
 }

proc asl_speak {nick uhost hand chan text} {
 global botnick asl_chans ranasl
if {(([lsearch -exact [string tolower $asl_chans] [string tolower $chan]] != -1) || 
($asl_chans == "*"))} {
set asls [lindex $ranasl [rand [llength $ranasl]]]
putserv "PRIVMSG $chan : $nick $asls"
  }
}

## -=[ TIDUR ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set tidur_chans "#chyndy #rakhel"

## TIDUR ##
set tidur "Tidur Respon"

bind pubm - "tidur" tidur_speak 
bind pubm - "bubuk" tidur_speak 
bind pubm - "turu " tidur_speak
bind pubm - "micek" tidur_speak

set rantidur {
"Perasaan Tidur Mulu"  
"Dasar Muka BantaL"
 }

proc tidur_speak {nick uhost hand chan text} {
 global botnick tidur_chans rantidur
if {(([lsearch -exact [string tolower $tidur_chans] [string tolower $chan]] != -1) || 
($tidur_chans == "*"))} {
set tidurs [lindex $rantidur [rand [llength $rantidur]]]
putserv "PRIVMSG $chan : $nick $tidurs"
  }
}

## -=[ WB ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set wb_chans "#chyndy #rakhel"

## WB ##
set WB "WB Respon"

bind pub - wb wb_speak 
bind pub - welcome wb_speak 
bind pub - webe wb_speak 

set ranwb {
"Wb"  
"WebeH"
"WeLLcOMe BaCk"
"TeKa ManiNG"
"WeW ADA"
"PakAbAR"
 }

proc wb_speak {nick uhost hand chan text} {
 global botnick wb_chans ranwb
if {(([lsearch -exact [string tolower $wb_chans] [string tolower $chan]] != -1) || 
($wb_chans == "*"))} {
set wbs [lindex $ranwb [rand [llength $ranwb]]]
putserv "PRIVMSG $chan : $nick $wbs"
  }
}

## -=[ WEK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set wek_chans "#chyndy #rakhel"

## WEK ##
set wek "Wek Respon"

bind pub - :P wek_speak 
bind pub - wek wek_speak 
bind pub - wew wek_speak 

set ranwek {
"WeQZ"  
"Wew"
":P"
"WEW jUGa dEH"
 }

proc wek_speak {nick uhost hand chan text} {
 global botnick wek_chans ranwek
if {(([lsearch -exact [string tolower $wek_chans] [string tolower $chan]] != -1) || 
($wek_chans == "*"))} {
set weks [lindex $ranwek [rand [llength $ranwek]]]
putserv "PRIVMSG $chan : $nick $weks"
  }
}

## -=[ JOROK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set jorok_chans "#chyndy #rakhel"

## JOROK ##
set jorok "Jorok Respon"

bind pubm - "tai " jorok_speak 
bind pubm - "jembut" jorok_speak 
bind pubm - "jwembut" jorok_speak 
bind pub - asu jorok_speak 
bind pubm - " asu " jorok_speak
bind pubm - "asuu" jorok_speak
bind pubm - "wasyu" jorok_speak 
bind pubm - "tempik" jorok_speak
bind pubm - "kontol" jorok_speak
bind pubm - "itil" jorok_speak
bind pubm - "celek" jorok_speak

set ranjorok {
"Cocote"  
"Sopan Su..!!!"
"LanYaP"
"CANGKEM MU LOH"
"!!TAMPONG SISAN COCOTE"
"NDASMU ATOS"
"TEK KETAR NANGIS"
 }

proc jorok_speak {nick uhost hand chan text} {
 global botnick jorok_chans ranjorok
if {(([lsearch -exact [string tolower $jorok_chans] [string tolower $chan]] != -1) || 
($jorok_chans == "*"))} {
set joroks [lindex $ranjorok [rand [llength $ranjorok]]]
putserv "PRIVMSG $chan : $nick $joroks"
  }
}

## -=[ QUIT ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set quit_chans "#chyndy #rakhel"

## QUIT ##
set quit "Quit Respon"

bind pubm - "quit" quit_speak 
bind pubm - "kuit" quit_speak 
bind pubm - " aku muleh " quit_speak 
bind pubm - " meh muleh " quit_speak 
bind pubm - "leren" quit_speak 
bind pubm - "muleh" quit_speak 
bind pubm - "balek" quit_speak
bind pubm - "pulang" quit_speak
bind pubm - "pamit" quit_speak

set ranquit {
"Bentar Lagi Donk"
"Dah..!!!"
"Hati-Hati YaH"
"TT DJ"
"ko ga pamit seh"
 }

proc quit_speak {nick uhost hand chan text} {
 global botnick quit_chans ranquit
if {(([lsearch -exact [string tolower $quit_chans] [string tolower $chan]] != -1) || 
($quit_chans == "*"))} {
set quits [lindex $ranquit [rand [llength $ranquit]]]
putserv "PRIVMSG $chan : $nick $quits"
  }
}

## -=[ OK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set ok_chans "#chyndy #rakhel"

## OK ##
set ok "OK Respon"

bind pub - okeh ok_speak 
bind pub - seep ok_speak 
bind pub - iya ok_speak 
bind pub - ok ok_speak 

set ranok {
"YupZ"  
"SumpeH Lo"
"Ok DeH"
"SeeP"
"Masa Seh"
"Beneran"
"JanJi.."
 }

proc ok_speak {nick uhost hand chan text} {
 global botnick ok_chans ranok
if {(([lsearch -exact [string tolower $ok_chans] [string tolower $chan]] != -1) || 
($ok_chans == "*"))} {
set oks [lindex $ranok [rand [llength $ranok]]]
putserv "PRIVMSG $chan : $nick $oks"
  }
}

## -=[ CRUT ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set crut_chans "#chyndy #rakhel"

## CRUT ##
set crut "Crut Respon"

bind pubm - "crot" crut_speak 
bind pubm - "cruot" crut_speak 
bind pubm - "cret" crut_speak 
bind pubm - "crut" crut_speak
bind pubm - "crit" crut_speak

set rancrut {
"CROOOTZZZ!!!"  
"CRUUTZZ!!!"
 }

proc crut_speak {nick uhost hand chan text} {
 global botnick crut_chans rancrut
if {(([lsearch -exact [string tolower $crut_chans] [string tolower $chan]] != -1) || 
($crut_chans == "*"))} {
set cruts [lindex $rancrut [rand [llength $rancrut]]]
putserv "PRIVMSG $chan : $nick $cruts"
  }
}

## -=[ LAG ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set lag_chans "#chyndy #rakhel"

## LAG ##
set lag "Lag Respon"

bind pubm - " lag " lag_speak 
bind pubm - "ngelag" lag_speak 
bind pubm - " laag" lag_speak 
bind pubm - "laag" lag_speak 
bind pubm - "nguelag" lag_speak
bind pubm - "lagg" lag_speak

set ranlag {
"Apaan sih itu lag apakah itu arti sebuah lagu HeHeHe"  
"Kacian DeH Lo"
"KaCiaN dEH LO"
"KaCiaN dEH LO"
"KaCiaN dEH LO"
"KaCiaN dEH LO"
"ADUH KaCiaN dEH LO"
 }

proc lag_speak {nick uhost hand chan text} {
 global botnick lag_chans ranlag
if {(([lsearch -exact [string tolower $lag_chans] [string tolower $chan]] != -1) || 
($lag_chans == "*"))} {
set lags [lindex $ranlag [rand [llength $ranlag]]]
putserv "PRIVMSG $chan : $nick $lags"
  }
}

## -=[ BAIK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set baik_chans "#chyndy #rakhel"

## BAIK ##
set baik "Baik Respon"

bind pub - baik baik_speak 
bind pub - apik baik_speak 
bind pub - apek baik_speak 
bind pub - fine baik_speak 

set ranbaik {
"Alhamdulillah"  
"I`m Fine To"
"I`m Fine To"
"I`m Fine To"
"Alhamdulillah"
"Alhamdulillah"
"Alhamdulillah"
 }

proc baik_speak {nick uhost hand chan text} {
 global botnick baik_chans ranbaik
if {(([lsearch -exact [string tolower $baik_chans] [string tolower $chan]] != -1) || 
($baik_chans == "*"))} {
set baiks [lindex $ranbaik [rand [llength $ranbaik]]]
putserv "PRIVMSG $chan : $nick $baiks"
  }
}

## -=[ TUNJUK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#channel1 #channel2"
set tunjuk_chans "#chyndy #rakhel"

## TUNJUK ##
set tunjuk "Tunjuk Respon"

bind pub - kamu tunjuk_speak 
bind pub - koe tunjuk_speak 

set rantunjuk {
"Aku.?!"  
"Aku.?!"
"Aku.?!"
"Aku.?!"
"Siapa,.. Aku.?!"
"Siapa,.. Aku.?!"
"Siapa,.. Aku.?!"
 }

proc tunjuk_speak {nick uhost hand chan text} {
 global botnick tunjuk_chans rantunjuk
if {(([lsearch -exact [string tolower $tunjuk_chans] [string tolower $chan]] != -1) || 
($tunjuk_chans == "*"))} {
set tunjuks [lindex $rantunjuk [rand [llength $rantunjuk]]]
putserv "PRIVMSG $chan : $nick $tunjuks"
  }
}

putlog "TCL Name : TCL Bawel edited by $bawelvoice(owner) $bawelvoice(country) $bawelvoice(state) version $bawelvoice(version) update $bawelvoice(update)"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"
putlog "Loaded Status : Success ...!!!"