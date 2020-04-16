# Channel to send anti-idle messages to
set ai_chan "#lampung"

# Maximum time interval between messages (in minutes)
set ai_time 8

# Messages to send
set ai_msgs {
  "12,1:: 8ADMIN 12:: 9,1[Bagi Anda Yang Ingin Promosi WARNET di sini silakan email ke : ruddin@brajamusti.com atau webmaster@petrozza.us] "
  "12,1:: 8Lampung 12:: 9,1[Selamat menunaikan Ibadah Puasa Semoga amal ibadahnya diterima Allah , Amin] "
  "12,1:: 8INFO 12:: 9,1[Iklan ke Reset, Jika Yang Ilang / Tidak di publiskan kirim memo / pv ke Ruddin atau R-o-n-n-y , Thx ] "
  "4,4| | 11,1[ ThunderNet ] Good Choice for Browsing, Surfing, Chatting, Cepat, Murah Lagi, Buka 24 jam. Mau bukti datang aja di [ Jln. Dr Sutomo No.14 Jogja ] Operatornya cakep cakep lhooo.. 4,4| | "
  "12,1:: 8Turbonet 12:: 9,1[Warnet & GameOnline  - JL.Overste Isdiman No.18 Purwokerto Tlp. (0281) 632686 ] "
    
}

# Don't edit anything below unless you know what you're doing

proc ai_start {} {
  global ai_time
  if {[string match *ai_sendmsg* [timers]]} {return 0}
  timer [expr [rand $ai_time] + 1] ai_sendmsg
}

proc ai_sendmsg {} {
  global botnick ai_chan ai_msgs ai_time
  if {[validchan $ai_chan] && [onchan $botnick $ai_chan]} {
    puthelp "PRIVMSG $ai_chan :[lindex $ai_msgs [rand [llength $ai_msgs]]]"
  }
  timer [expr [rand $ai_time] + 1] ai_sendmsg
}

set ai_chan [string tolower $ai_chan]

ai_start

putlog "aRc-ikLan Bot By: IdeaCR ... Loading !!"
