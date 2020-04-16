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
set warga(owner) "abah" 

# location
set warga(country) "Indonesia"
set warga(state) "Makassar"

# Update
set warga(update) "09.08.2010"

# Version
set warga(version) "20.10"

# End configuration

bind pub o|o `wargahelp wargahelp
bind pub o|o `wargastart wargastart
bind pub o|o `wargastop wargastop
bind pub o|o `wargachan wargachan
bind pub o|o `wargatimer wargatimer
#-----------------
bind pub o|o `listtimer xlisttimer
bind pub o|o `killtimer xkilltimer
bind pub o|o `procrun xprocrun

set warga_chans "*"
set warga_time 0
set isplaying 1

proc wargahelp {nick uhost hand chan text} {
  putserv "PRIVMSG $chan :`wargastart, `wargastop, `wargachan \"#channel1 #channel2\", `wargatimer <menit>"
}
proc wargastart {nick uhost hand chan text} {
  global isplaying warga_time
  if {$isplaying} {
    putserv "PRIVMSG $chan :already running"
  } else {
    set isplaying 1
    putserv "PRIVMSG $chan :is started"
  }
  if {$warga_time < 1} {set warga_time 5}
  timer $warga_time warga_speaks
}
proc wargastop {nick uhost hand chan text} {
  global isplaying
  if {$isplaying} {
    set isplaying 0
    putserv "PRIVMSG $chan :is stoped"
  } else {
    putserv "PRIVMSG $chan :already stoped"
  }
    foreach t [timers] {
       if [string match *warga_speaks* [lindex $t 1]] {
         killtimer [lindex $t end]
       }
    }    
}
proc wargachan {nick uhost hand chan text} {
  global warga_chans
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `wargachans \"#channel1 #channel2\" , current channel is $warga_chans"
  } else {
    set warga_chans $text
    putserv "PRIVMSG $chan :wargachan set to : $warga_chans"
  }
}
proc wargatimer {nick uhost hand chan text} {
  global warga_time
  if {$text == ""} {
    putserv "PRIVMSG $chan :usage : `wargatimer <menit> , current timer is $warga_time"
  } else {
    if {$text < 1} {set text 5}
    set warga_time $text
    putserv "PRIVMSG $chan :wargatimer set to : $warga_time"
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

set warga_msg {
{"00,03Ketentuan Channel $chan :01,15 Karena channel ini juga berfungsi untuk ukhuwah, maka para pengunjung dan para Operator dimohon tidak menonjolkan kelompoknya masing-masing, misal warga muhammadiyah dimohon jangan menonjolkan kemuhammadiyahannya, terus warga nu juga dimohon jangan menonjolkan ke nu annya, warga sufi juga dimohon jangan menonjolkan ke sufi annya. begitu juga dg warga yg lain. karena yg perlu kita tonjolkan bersama adalah islam dan bukan kelompok.\002"}
{"00,03Ketentuan Channel $chan :01,15 Demi menjalin ukhuwah dg sesama umat islam, maka tidak boleh ada yg memojokkan atau mencela salahsatu kelompok islam manapun, selama kelompok itu berpegang teguh pada Al-Quran dan Hadis.\002"}
{"00,03Ketentuan Channel $chan :01,15 Umat islam dari kelompok manapun diperkenankan bergabung dan berdiskusi serta memberikan dakwah selama kelompok itu tetap berpedoman pada AL-Quran dan Hadis.\002"}
{"00,03Ketentuan Channel $chan :01,15 Kemudian karena sulitnya mendefinisikan kelompok mana yg berpedoman pada quran dan hadis dan kelompok mana yg menyimpang. maka kami mendefinisikannya sebagai berikut: semua kelompok islam kami anggap berpedoman pada Al-Quran dan Hadis kecuali kelompok yg mengharamkan apa-apa yang dihalalkan islam, atau kelompok yangg menghalalkan apa-apa yang diharamkan islam, atau kelompok yang tidak mau menerima Al-Quran dan Hadis sepenuhnya (hanya menerima sebagian Al-Quran atau Hadis dan menolak sebagian yang lain).\002"}
{"00,03Ketentuan Channel $chan :01,15 Jadi kalau hanya berbeda masalah tahlilan, niat solat, tarawih, qunut, dll itu meskipun perlu didiskusikan bersama-sama antar kelompok utk mencari kebenarannya, tetapi itu hanya perbedaan kecil dan tidak perlu dibesar-besarkan. dan hal-hal seperti itu janganlah sampai melemahkan ukhuwah kita. tetapi memang perlu kita ingat, bahwa yg terbaik adalah seperti apa yang dicontohkan oleh Rasululloh SAW.\002"}
{"00,03Ketentuan Channel $chan :01,15 Apabila pengunjung mengucapkan salam dan kemudian tidak mendapat jawaban salam, maka mohon dimaafkan karena mungkin kami sedang sibuk atau lengah atau karena sebab lain dan sebagainya. kemudian apabila banyak yang menjawab salam di channel dan menyebabkan ribet, maka sebaiknya jawaban salam diberikan secara notice saja kepada orang yang mengucapkan salam.. Di imbau semua warga $chan menyampaikan salamnya dengan baik dan benar karena yang demikian tersebut lebih mulia disisi ALLAH.\002"}
{"00,03Ketentuan Channel $chan :01,15 Non muslim diperbolehkan join untuk mempelajari islam atau berdiskusi tentang islam tetapi asal tidak memiliki niat yg lain misalnya menyebarkan agama selain agama islam, atau mengolok-olok islam. Dan juga harus menggunakan nick yg baik dan tidak boleh menggunakan nick yang mengganggu perasaan umat islam lainnya seperti nick anti?tuhan, marxist, penyembah berhala, orang kafir dll. Tapi kalau nicknya itu seperti ini: orang kristen, agama_hindu, dll itu tidak apa-apa karena tidak bersifat offensive.\002"}
{"00,03Ketentuan Channel $chan :01,15 Dalam berpendapat boleh membela pendapatnya atau membandingkan dengan pendapat lain, tetapi tidak boleh menjelekkan / menghina / mengkafirkan pendapat yang lain selama pendapat itu tidak bertentangan dengan Al-Quran dan Hadis.\002"}
{"00,03Ketentuan Channel $chan :01,15 Apabila ingin mengemukakan pendapat, maka katakanlah yang halal itu halal, yang haram itu haram, dan yang meragukan itu katakan meragukan.\002"}
{"00,03Ketentuan Channel $chan :01,15 Pengunjung harus sopan berada dalam channel, tidak boleh melecehkan islam atau umat islam, membuat flood, mengatakan kalimat atau menggunakan nick / user id yang tidak semestinya (misal: nick yang berkesan negatif, berbau pornografi, nick yang kontra dg islam dll), mengkafirkan, menginvite, mencela / memojokkan salah satu kelompok islam, memprovokasi, repeat 5x berturut-turut, atau menyinggung sesama umat islam.\002"}
{"00,03Ketentuan Channel $chan :01,15 Pengunjung baik Operator maupun Warga harus mematikan sekrip auto reply / jawab di room karena banyak pengunjung yang online menggunakan koneksi GPRS via Handphone, bila belum paham dengan sekripnya cukup ketikan /remote off maka sekrip otomatis tidak berfungsi.\002"}
{"00,03Ketentuan Channel $chan :01,15 Bila pengunjung merasa terganggu dengan PV ( private ) yang mengarah ke intimidasi / pelecehan misal berbau pornografi atau doktrin – doktrin yang membingungkan, pengunjung diharapkan mengkonfirmasikan kepada operator di room #cafeislamhelp dengan meregister nickname terlebih dahulu untuk menghindari fitnah dan bukti yang dimaksud ( log PV-an ) lengkap dengan ip address nya.\002"}
{"00,03Ketentuan Channel $chan :01,15 Untuk menghindari fitnah, Nickname!Ident@IP.Address.user yang mengandung unsur pronografi / diskriminasi / terorisme akan langsung di kick dan banned.\002"}
{"00,03Ketentuan Channel $chan :01,15 Hasil musyawarah dengan Founder hari Sabtu pagi tanggal 13 Ramadhan 1429 Hijriah: Lama banned user sesuai dengan tingkat kesalahannya. Secara otomatis banned akan dilepas bot $chan 1 x 24 jam. User akan dimasukan akick list apabila user memang sudah tidak bisa dinasehati dan dianggap resedivis.\002"}
}

if {![string match "*warga_speaks*" [timers]]} {
 timer $warga_time warga_speaks
}
proc warga_speaks {} {
 global warga_msg warga_chans warga_time
 if {$warga_chans == "*"} {
  set warga_temp [channels]
 } else {
  set warga_temp $warga_chans
 }
 foreach chan $warga_temp {
  set warga_rmsg [lindex $warga_msg [rand [llength $warga_msg]]]
  foreach msgline $warga_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*warga_speaks*" [timers]]} {
  timer $warga_time warga_speaks
 }
}
putlog "-=-=   warga. warga.tcl   =-=-=-=-=-"
bind pub -|- `warga randwarga

proc randwarga {nick uhost hand chan text} {
 global warga_msg notc
  set warga_rmsg [lindex $warga_msg [rand [llength $warga_msg]]]
  foreach msgline $warga_rmsg {
   puthelp "PRIVMSG $chan :$notc $nick, 00,03[subst $msgline]"
  }
}

putlog "TCL Name : TCL Warga edited by $warga(owner) $warga(country) $warga(state) version $warga(version) update $warga(update)"
putlog "Running : Server $network"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"