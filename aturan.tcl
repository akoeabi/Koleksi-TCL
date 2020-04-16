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
set aturan(owner) "abah" 

# location
set aturan(country) "Indonesia"
set aturan(state) "Makassar"

# Update
set aturan(update) "09.08.2010"

# Version
set aturan(version) "20.10"

# End configuration

bind pub o|o `aturanhelp aturanhelp
bind pub o|o `aturanstart aturanstart
bind pub o|o `aturanstop aturanstop
bind pub o|o `aturanchan aturanchan
bind pub o|o `aturantimer aturantimer
#-----------------
bind pub o|o `listtimer xlisttimer
bind pub o|o `killtimer xkilltimer
bind pub o|o `procrun xprocrun

set aturan_chans "*"
set aturan_time 0
set isplaying 1

proc aturanhelp {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :`aturanstart, `aturanstop, `aturanchan \"#channel1 #channel2\", `aturantimer <menit>"
}
proc aturanstart {nick uhost hand chan text} {
  global isplaying aturan_time
  if {$isplaying} {
    putserv "PRIVMSG $chan :already running"
  } else {
    set isplaying 1
    putserv "PRIVMSG $chan :is started"
  }
  if {$aturan_time < 1} {set aturan_time 5}
  timer $aturan_time aturan_speaks
}
proc aturanstop {nick uhost hand chan text} {
  global isplaying
  if {$isplaying} {
    set isplaying 0
    putserv "PRIVMSG $chan :is stoped"
  } else {
    putserv "PRIVMSG $chan :already stoped"
  }
    foreach t [timers] {
       if [string match *aturan_speaks* [lindex $t 1]] {
         killtimer [lindex $t end]
       }
    }    
}
proc aturanchan {nick uhost hand chan text} {
  global aturan_chans
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `aturanchans \"#channel1 #channel2\" , current channel is $aturan_chans"
  } else {
    set aturan_chans $text
    putserv "PRIVMSG $chan :aturanchan set to : $aturan_chans"
  }
}
proc aturantimer {nick uhost hand chan text} {
  global aturan_time
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `aturantimer <menit> , current timer is $aturan_time"
  } else {
    if {$text < 1} {set text 5}
    set aturan_time $text
    putserv "PRIVMSG $chan :aturantimer set to : $aturan_time"
  }
}
proc xkilltimer {nick uhost hand chan text} {
  if { $text == "" } {
    putserv "PRIVMSG $chan :$nick, usage : `killtimer <timerid>"
  } else {
    killtimer $text
    putserv "PRIVMSG $chan :timer $text is killed."
  }
}
proc xlisttimer {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :[timers]"
}
proc xprocrun {nick uhost hand chan text} {
  [$text]
  putserv "[$text]"
}

set aturan_msg {
{"00,03Ketentuan Operator $chan :01,15 beragama islam dan berpedoman pada quran dan hadis serta menerima sepenuhnya alquran dan hadis. tidak mengemukakan pendapat yg membingungkan umat islam. beritikad baik dan mematuhi ketentuan yg berlaku. serta menjaga ukhuwah dg umat islam.\002"}
{"00,03Ketentuan Operator $chan :01,15 melayani para pengunjung dan Operator tidak harus jadi pengajar. krn di channel pengunjung dan Operator memiliki kesempatan yg sama utk belajar dan mengajar. Operator bertugas memberikan tausiyah minimal 1x seminggu. dg lama tausiyah maks 15 menit pertausiyah. dan diberikan ketika dlm channel tidak ada yg sedang tausiyah/diskusi.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator dilarang menginvite dalam bentuk apapun baik dari chan lain ke $chan maupun sebaliknya.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator tidak diperkenankan menggunakan script, kecuali bagi yg benar2 faham akan scriptnya supaya tidak salah kick. Operator tidak boleh bermain2 script. hindarilah memban atau kick kalau tidak benar2 perlu, supaya pengunjung merasa nyaman dalam berdiskusi dan tidak terancam kena kick/ban.\002"}
{"00,03Ketentuan Operator $chan :01,15 semua Operator harus sopan bila berada di dalam channel. dan bila terpaksa mengekick seseorang harus disertai dg alasan sebab kick tsb dan dg bahasa yg baik dan sopan. namun Operator tidak boleh melakukan kick hanya karena beda pendapat atau masalah pribadi. sop tidak boleh menambah/menghapus aop tanpa seizin founder.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator tidak boleh mengekick/ban seseorang dari channel. kecuali apabila: orang tsb melecehkan islam atau umat islam, membuat flood, mengatakan kalimat atau menggunakan nick/user id yg tidak semestinya (menjurus pd hal yg negatif), mengkafirkan, menginvite, mencela/memojokkan salah satu kelompok islam, memprovokasi, atau repeat 5x berturut2.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator tidak boleh menggunakan nick yg tidak semestinya, atau nick yg menimbulkan pro dan kontra, atau nick yg menimbulkan salah paham atau nick yg memihak kpd salah satu kelompok Islam atau kelompok politik, atau nick yg menimbulkan masalah/membingungkan. (gunakanlah nick yg baik dan dan tidak menimbulkan kesan negatif).\002"}
{"00,03Ketentuan Operator $chan :01,15 tidak diperkenankan ada bot di dalam channel kecuali bot yang diizinkan.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator tidak boleh melakukan kick terhadap seseorang yg di ban oleh Operator lain, karena itu menyebabkan Operator yg melakukan ban tidak dapat memberikan alasan kick sehingga orang yg dikick itu tidak mengetahui dimana kesalahannya.\002"}
{"00,03Ketentuan Operator $chan :01,15 yang dimaksud dg flood adl kesengajaan seseorang utk mengganggu channel dg text/kalimat. sedangkan orang yg diskusi atau tausiyah tidak boleh dikick meskipun menulis kalimat dlm jumlah yg banyak, atau menuliskan URL atau address website di channel (misalnya: http//www…. dst).\002"}
{"00,03Ketentuan Operator $chan :01,15 Diharap dengan hormat para operator tidak membawa – bawa organisasi atau politik atau kecenderungan pemikiran di dalam nick, karena organisasi atau pemikiran tersebut sudah punya wadah atau room sendiri – sendiri.\002"}
{"00,03Ketentuan Operator $chan :01,15 Ditegaskan sekali lagi “bahwa $chan adalah room umum bernafaskan islam” , bukan room golongan atau jamaah atau organisasi tertentu.\002"}
{"00,03Ketentuan Operator $chan :01,15 Bila operator melakukan banned kepada user karena kesalahan ringan sebaiknya hanya di banned nicknya saja. Bila user memang melakukan pelanggaran berat boleh di banned ip nya.\002"}
{"00,03Ketentuan Operator $chan :01,15 Bila operator sedang tidak sibuk dengan pekerjaan nya operator diharapkan mengirim tausiyah atau artikel yang bermanfaat seputar Islam yang tidak mengandung propaganda atau menonjolkan suatu golongan/partai/politik ke operator yang online untuk ditampilkan di room $chan ini. Atau artikel tersebut bisa di play di room dengan kecepatan yang wajar agar room terlihat hidup dan artikel terebut bisa terbaca pengunjung $chan.\002"}
{"00,03Ketentuan Operator $chan :01,15 Bila operator sedang sibuk dengan pekerjaan sebaiknya nicknya disetting away.\002"}
{"00,03Ketentuan Operator $chan :01,15 Dikarenakan Channel $chan tidak bisa disetting moderator dianjurkan kepada operator mensetting /ban *!*@* bila Channel $chan di flood dan operator harus mematikan script Auto Self Unban kemudian ip flooder di dibanned dan dikick keluar channel, kemudian ketik /cs unban #cafeislam *!*@*.\002"}
{"00,03Ketentuan Operator $chan :01,15 Setiap operator yang online dan tidak sedang sibuk, diharap masuk room #cafeislamhelp untuk membantu warga #cafeislam yang memberikan konfirmasi atas gangguan manusia-manusia yang kurang bertanggung jawab.\002"}
{"00,03Ketentuan Operator $chan :01,15 Operator tidak boleh melepas banned operator lain tanpa ada konfirmasi.\002"}
{"00,03Ketentuan Operator $chan :01,15 Secara otomatis banned akan dilepas bot $chan 1 x 24 jam. Aop bisa minta request akick kepada Sop, apabila user memang sudah tidak bisa dinasehati.\002"}
}

if {![string match "*aturan_speaks*" [timers]]} {
 timer $aturan_time aturan_speaks
}
proc aturan_speaks {} {
 global aturan_msg aturan_chans aturan_time
 if {$aturan_chans == "*"} {
  set aturan_temp [channels]
 } else {
  set aturan_temp $aturan_chans
 }
 foreach chan $aturan_temp {
  set aturan_rmsg [lindex $aturan_msg [rand [llength $aturan_msg]]]
  foreach msgline $aturan_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*aturan_speaks*" [timers]]} {
  timer $aturan_time aturan_speaks
 }
}
putlog "-=-=   aturan. aturan.tcl   =-=-=-=-=-"
bind pub -|- `aturan randaturan

proc randaturan {nick uhost hand chan text} {
 global aturan_msg notc
  set aturan_rmsg [lindex $aturan_msg [rand [llength $aturan_msg]]]
  foreach msgline $aturan_rmsg {
   puthelp "PRIVMSG $chan :$notc $nick, 00,03[subst $msgline]"
  }
}

putlog "TCL Name : TCL aturan edited by $aturan(owner) $aturan(country) $aturan(state) version $aturan(version) update $aturan(update)"
putlog "Running : Server $network"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"