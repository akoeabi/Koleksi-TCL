## ----------------------------------------------------------------
## Set global variables and specificic - www.sandykrezz.multiply.com
## ----------------------------------------------------------------

## -=[ SPEAK ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "*"

set speaks_chans "*"
# Set you want in XXX minute you bot always talk on minute 
set speaks_time 15


## -=[ Hello ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#lemper #lemper"
set hello_chans "*"

## -=[ BRB ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#lemper #lemper"
set brb_chans "*"

## -=[ BYE ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#lemper #lemper"
set bye_chans "*"

## -=[ PING ]=-  Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#lemper #lemper"
set ping_chans "*"

## -=[ CHANGE NICK ]=- Set the next line as the channels you want to run in
## for all channel just type "*" if only for 1 channel or 2 chnnel just
## type "#lemper #lemper"
set chgnick_chans "*"

## ----------------------------------------------------------------
## --- Don't change anything below here if you don't know how ! ---
## ----------------------------------------------------------------

######################################################################
##--------------------------------------------------------------------
##--- F O R     ---   E N T E R T A I N M E N T  ---    CHANNEL   ----
##--------------------------------------------------------------------
######################################################################         
### SPEAK ###
set spoken.v "Auto talk"
# Set the next lines as the random speaks msgs you want to say
set speaks_msg {
{"bang.. SMS siapa itu bang.. =p"}
{"ada yang tau gak gimana caranya bikin bot?"}
{"sya..la..la..lalala..she"}
{"brb all. mau boker dulu.."}
{"waw nih warnet kenceng banget!..."}
{"ML itu apa cih? makan lemper ya? *_*"}
{"apakabar semuanya.. bahagia hari ini...?"}
{"identify jelek lo whaaaaaaaaa salah ketik *hiks*"}
{"yang cakep pv dong =p"}
{"dor! dor!"}
{"aa sandy ganteng banget loch! =p"}
{"ada yang mau ngajak aku jalan jalan enggak ?"}
{"hehehehe"}
{"whaaaaaaaaa siapa yang kentut! hayyo ngaku!"}
{"nang ning ning nang ning nung"}
{"oh syelaaaaaaaaaaaamat malam... duhai kekasih..kuuuuu.."}
{"*me* slaps semuanya yang ada di channel hi.hi.hi.."}
{"satu..satu...aku...sayang....threenet.."}
{"wew.. aku lagi di PV cowok gantengs neh *_^"}
{"yang ngerasa hacker ngaceeeng, ups salah ngacung heheheh!"}
}

if {![string match "*time_speaks*" [timers]]} {
 timer $speaks_time time_speaks
}

proc time_speaks {} {
 global speaks_msg speaks_chans speaks_time
 if {$speaks_chans == "*"} {
  set speaks_temp [channels]
 } else {
  set speaks_temp $speaks_chans
 }
 foreach chan $speaks_temp {
  set speaks_rmsg [lindex $speaks_msg [rand [llength $speaks_msg]]]
  foreach msgline $speaks_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*time_speaks*" [timers]]} {
  timer $speaks_time time_speaks
 }
}



##  PING PONG ##
set Reponden2.v "Ping Respon"
bind pub - !ping ping_speak 
bind pub - `ping ping_speak
bind pub - .ping ping_speak
  
set ranping {
  "kamu LAG yah? langganan internetnya belum bayar kali hehehehehe"
}

proc ping_speak {nick uhost hand chan text} {
 global botnick ping_chans ranping
if {(([lsearch -exact [string tolower $ping_chans] [string tolower $chan]] != -1) || ($ping_chans == "*"))} {
set pings [lindex $ranping [rand [llength $ranping]]]
putserv "PRIVMSG $chan :$nick $pings"
  }
} 

##  hello ##
set Reponden3.v "hello Respon"
bind pub - hello hello_speak 
bind pub - alo hello_speak 
bind pub - hallo hello_speak 
bind pub - hai hello_speak 
bind pub - hi hello_speak 

set ranhello {
  "hello juga disana.. apa kabarnya nih! kemarin kok gak jadi jalan jalan sama aku :)"
}

proc hello_speak {nick uhost hand chan text} {
 global botnick hello_chans ranhello
if {(([lsearch -exact [string tolower $hello_chans] [string tolower $chan]] != -1) || ($hello_chans == "*"))} {
set helos [lindex $ranhello [rand [llength $ranhello]]]
putserv "PRIVMSG $chan :$nick $helos"
  }
} 

##  Brb  ##
set Reponden4.v "Brb Respon"
bind pub - brb brb_speak 
set ranbrb {
  "Alesan.. paling juga ML tuh"
  "alah, boker aje pake bilang Brb"
}

proc brb_speak {nick uhost hand chan text} {
 global botnick brb_chans ranbrb
if {(([lsearch -exact [string tolower $brb_chans] [string tolower $chan]] != -1) || ($brb_chans == "*"))} {
set brbs [lindex $ranbrb [rand [llength $ranbrb]]]
putserv "PRIVMSG $chan :$nick $brbs"
  }
} 

##  Bye  ##
set Reponden5.v "Bye respon"
bind pub - bye bye_speak 
set ranbye {
  "ati ati dijalan yahh.. byeee.. kalo jatoh, bangun sendiri loh =p atau sms aa sandy yang ganteng ajah ok =p"
}

proc bye_speak {nick uhost hand chan text} {
 global botnick bye_chans ranbye
if {(([lsearch -exact [string tolower $bye_chans] [string tolower $chan]] != -1) || ($bye_chans == "*"))} {
set byes [lindex $ranbye [rand [llength $ranbye]]]
putserv "PRIVMSG $chan : $nick $byes"
  }
} 

##  Nick  ##
set Reponden6.v "Change nick respon"
bind nick - * rand_nick 
set rannicks {
  "ganti nick niye.. hehehe pasti lagi di cari-cari orang yee aw aw =p"
}

proc rand_nick {nick uhost hand chan newnick} {
global botnick chgnick_chans rannicks
if {(([lsearch -exact [string tolower $chgnick_chans] [string tolower $chan]] != -1) || ($chgnick_chans == "*"))} {
set chgnick [lindex $rannicks [rand [llength $rannicks]]]
putserv "PRIVMSG $chan : $newnick, $chgnick"
 }
} 

###############################################################################
##### GENERAL SETTINGS ####
# on the old scripts, it's on particular channel. but now, i made it for all channels.
set channel "*"

# Edit the time cycle which is in minutes format depending on the time intervals you want the bot to flow out the advertisment
set time 20

# EDIT the text or REMOVE or ADD lines including inverted commas at the starting and ending at each line 
set text {
  "0,2 15[0JASA15] 0Webhosting & Domain Registration. 11Kepingin Punya Web Sendiri? 0- Hosting, domain dan web desain. Mulai dari 185rb per tahun! 8klik www.dirmanto.com 0atau www.dirmanto.web.id"
  "0,2 15[0INFORMASI15] 0Cari atau Baca Artikel 11download, tutorial, lowongan kerja DLL 8klik www.sandykrezz.multiply.com 0jangan lupa isi komentarnya yah :)"
  "0,9<3>9,3<1>9,1<11,1 psyBNC, Eggdrop, Shell dan bantuan dasar IRC cari aja di http://dirmanto.web.id/ 9>1,3<9>3,9<0>"
  "0,13<6>13,6<1>6,1<15,1 Kamu² kepingin punya blog pribadi dengan alamat nama-kamu.com ?8 klik http://www.sandykrezz.multiply.com.id 6,1>1,6<13>6,13<0>"
}

##### DO NOT EDIT ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING #####

if {[string compare [string index $time 0] "!"] == 0} { set timer [string range $time 1 end] } { set timer [expr $time * 60] }
if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }

proc go {} {
  global channel time text timer
  foreach chan $channel {
    set line [lindex $text [rand [llength $text]]]
    putserv "PRIVMSG $chan :$line"
  }
  if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }
}

putlog "\00315(\003dcL\00304\002!\002\00315)\003 versi 1.0 dijalankan..."

## -----------------------------------------------------------------------
putlog "-=-=   ENTERTAINMENT  PROSES   =-=-=-=-=-"
putlog "Entertainment Channel (auto/respon) Ver 1.0:"
putlog "1.${spoken.v},2.${Reponden2.v},3.${Reponden3.v}"
putlog "4.${Reponden4.v},5.${Reponden5.v},6. ${Reponden6.v}"
putlog "loaded Successfuly..."
##------------------------------------------------------------------------
##                      ***    E N D   OF  ENT1.1.TCL ***
## -----------------------------------------------------------------------