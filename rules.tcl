###[INFO OWNER]###
set TCL "Bantuan" 
set owner "abah" 
set country "Indonesia"
set state "Makassar"
set versi "20.10"
set update "09.08.2010"
set mail "abah@ukhuwah.net"

###[SETUP]###
putlog "AssaLamu`aLaikum WarahmatuLLah Please wait... loading $TCL (C) 1978 by abah..."

bind pub - !rules pub:rules

set rules {
"Peraturan Room Medan (Anda sopan kami segan)"
"1. Hormatilah sesama user di room."
"2. Bersikap sopan dan santun dalam berkomunikasi."
"3. Tidak di 4BENAR kan untuk :"
"a. Berchat berisi hal bersifat menyinggunga user lain."
"b. Isi chat mesum, vulgar dan sebangsanya."
"c. Nyamar atau sok mau jadi artis."
"Jika ada yang melanggar kesepakatan ini maka operator akan mengambil tindakan yang dianggap pantas dan memang anda inginkan."
"Nickname, identd, dan hostname atau IP atau vhost yang masuk dalam daftar hitam tidak akan di lepaskan apapun alasannya walaupun itu atas rekomendasi operator lain."
"Best Regard"
"Management Medan Channel"
}

proc pub:rules {nick uhost hand chan text} {
global rules
foreach line $rules { puthelp "PRIVMSG $chan :$line" }
}

###[INFO TCL]###
putlog "TCL Name : $TCL" 
putlog "Oleh : $owner $country $state $versi $update"
putlog "Mailto : $mail"
putlog "Loaded Status : Success Alhamdulillah !!!"