######################################################################
# Adzan By JoJo - #Botmaster Allnetwork
# hillzx@gmail.com
# Version 1.0
# 20 November 2009
######################################################################
bind pub - !adzan pub:adzan
bind pub o|m !adzanset pub:adzanset
bind RAW - 391 pub:waktureply

set waktusubuh "04:13:00"
set waktudzuhur "11:40:00"
set waktuashar "15:04:00"
set waktumaghrib "17:53:00"
set waktuisya "19:03:00"
set jam "00:00:xx"
set jamclean "00:00:00"
set waktu "xx xx xx"
set basechannel "#kafe"
set servtime "uii.id.allnetwork.org"
set parent ""
set jamcocok "00:00:00"
set cektiap 1
set sedangrunning "true"
set adzanrange "false"

proc konekserver {} {
global botnick servtime
putquick "TIME $servtime"
}

#set jam, jamclean, waktu
proc setwaktu { channel arguments } {
global botnick servtime waktu jam jamclean

 set day [lindex [split $arguments] 2]
 if {$day == ":Monday"} { set hari "Senin" }
 if {$day == ":Tuesday"} { set hari "Selasa" }
 if {$day == ":Wednesday"} { set hari "Rabu" }
 if {$day == ":Thursday"} { set hari "Kamis" }
 if {$day == ":Friday"} { set hari "Jum'at" }
 if {$day == ":Saturday"} { set hari "Sabtu" }
 if {$day == ":Sunday"} { set hari "Minggu" }
 set tanggal [lindex [split $arguments] 4]
 set month [lindex [split $arguments] 3]
 if {$month == "January"} { set bulan "Januari" }
 if {$month == "February"} { set bulan "Februari" }
 if {$month == "March"} { set bulan "Maret" }
 if {$month == "April"} { set bulan "April" }
 if {$month == "May"} { set bulan "Mei" }
 if {$month == "June"} { set bulan "Juni" }
 if {$month == "July"} { set bulan "Juli" }
 if {$month == "August"} { set bulan "Agustus" }
 if {$month == "September"} { set bulan "September" }
 if {$month == "October"} { set bulan "Oktober" }
 if {$month == "November"} { set bulan "November" }
 if {$month == "December"} { set bulan "Desember" }
 set tahun [lindex [split $arguments] 5]
 set jam [lindex [split $arguments] 7]
 set temp1 [lindex [split $jam :] 0]
 set temp2 [lindex [split $jam :] 1]
 set jamclean "$temp1:$temp2:00"
  
 set waktu "03$hari - 13$tanggal $bulan $tahun - 03$jam WIB"

}

proc iscocok { text } {
global jamclean

if { $jamclean == $text } {
return 1
} else {
return 0
}

}

proc pub:waktureply { from keyword arguments } {
global basechannel parent
setwaktu $basechannel $arguments

if { $parent == "showadzan" } {
	pub:adzanstatus
}

}

proc pub:pengecekan {} {
global sedangrunning cektiap waktusubuh waktudzuhur waktuashar waktumaghrib waktuisya
if { $sedangrunning == "true" } {
konekserver

if { [iscocok $waktusubuh] } {
	pub:showadzan "Subuh" $waktusubuh
	} 
	
if { [iscocok $waktudzuhur] } {
	pub:showadzan "Dzuhur" $waktudzuhur
	}

if { [iscocok $waktuashar] } {
	pub:showadzan "Ashar" $waktuashar
	}

if { [iscocok $waktumaghrib] } {
	pub:showadzan "Maghrib" $waktumaghrib
	}

if { [iscocok $waktuisya] } {
	pub:showadzan "Isya" $waktuisya
	}

timer [expr $cektiap] pub:pengecekan
		
}
}

proc pub:setkonekserver {} {
konekserver
}

proc pub:showadzan { text jamnya } {
global basechannel adzanrange

if { $adzanrange == "false" } {
puthelp "PRIVMSG $basechannel :9,1--(9æ3(8©3,1--(9æ3(8©1,9*** Allahu akbar.. Allahu akbar.. *** 8,1©3,1)--9æ3)8©)9æ3)3,1--"
puthelp "PRIVMSG $basechannel :9,1 *** Waktu tepat menunjukan pukul $jamnya WIB, waktunya utk melaksanakan ibadah solat $text ***"
puthelp "PRIVMSG $basechannel :9,1--(9æ3(8©3,1--(9æ3(8©1,9*** Allahu akbar.. Allahu akbar.. *** 8,1©)3,1--9æ3)8©)9æ3)3,1--"
set adzanrange "true"
timer 2 turnoff:adzanrange
return 0
}

}

proc turnoff:adzanrange {} {
global adzanrange
set adzanrange "false"
}


proc pub:adzan { nick uhost hand chan text } {
global parent sedangrunning
set parent "adzan"
set text [string tolower $text]

     if {[string match "#*" $text]} {
          puthelp "NOTICE $nick :Gunakan: !adzan start , atau !adzan stop"
          return 0
     } elseif {$text == "start" && [isop $nick $chan] } {
	      set sedangrunning "true"
		  pub:pengecekan
		  puthelp "NOTICE $nick :Adzan diaktifkan"
	 } elseif {$text == "stop" && [isop $nick $chan] } {
		  set sedangrunning "false"
		  puthelp "NOTICE $nick :Adzan berhenti"
	 } elseif {$text == ""} {
		  konekserver
		  set parent "showadzan"
     }

}

proc pub:adzanset { nick uhost hand chan text } {
global parent waktusubuh waktudzuhur waktuashar waktumaghrib waktuisya
set parent "adzanset"
set text [string tolower $text]
set tempopsi [lindex $text 0]
set tempjam [lindex $text 1]

     if {$text == "" || $tempopsi == "" || $tempjam == "" || [string match "#*" $text]} {
          puthelp "NOTICE $nick :Gunakan: !adzanset subuh|dzuhur|ashar|maghrib|isya <jam:menit> , misalnya !adzanset isya 12:33"
          return 0
	 }
	 
	 if { [expr [string length $tempjam] == 5 ] } {
	 
	 set tempjam "$tempjam:00"
	 
	 if {$tempopsi == "subuh"} {
	      set waktusubuh $tempjam
		  puthelp "NOTICE $nick :Setting berhasil diubah"
     } elseif {$tempopsi == "dzuhur"} {
	      set waktudzuhur $tempjam
		  puthelp "NOTICE $nick :Setting berhasil diubah"
     } elseif {$tempopsi == "ashar"} {
	      set waktuashar $tempjam
		  puthelp "NOTICE $nick :Setting berhasil diubah"
     } elseif {$tempopsi == "maghrib"} {
	      set waktumaghrib $tempjam
		  puthelp "NOTICE $nick :Setting berhasil diubah"
     } elseif {$tempopsi == "isya"} {
	      set waktuisya $tempjam
		  puthelp "NOTICE $nick :Setting berhasil diubah"
	 } else {
	 puthelp "NOTICE $nick :Format opsi salah, seharusnya subuh|dzuhur|ashar|maghrib|isya , misalnya !adzanset isya 12:33"
     }
	 
	 } else {
	 puthelp "NOTICE $nick :Format jam salah, seharusnya <jam:menit> , misalnya !adzanset isya 12:33"
	 }

}

proc pub:adzanstatus {} {
global basechannel waktusubuh waktudzuhur waktuashar waktumaghrib waktuisya waktu parent
set parent "adzanstatus"
puthelp "PRIVMSG $basechannel :-------Adzan Status-------"
puthelp "PRIVMSG $basechannel :$waktu"
puthelp "PRIVMSG $basechannel :--------------------------"
puthelp "PRIVMSG $basechannel :06Waktu subuh   : $waktusubuh"
puthelp "PRIVMSG $basechannel :06Waktu dzuhur  : $waktudzuhur"
puthelp "PRIVMSG $basechannel :06Waktu ashar   : $waktuashar"
puthelp "PRIVMSG $basechannel :06Waktu maghrib : $waktumaghrib"
puthelp "PRIVMSG $basechannel :06Waktu isya    : $waktuisya"
puthelp "PRIVMSG $basechannel :--------------------------"
puthelp "PRIVMSG $basechannel :Perintah !adzan start, !adzan stop, !adzan, !adzanset"
puthelp "PRIVMSG $basechannel :--------------------------"
}

set init-server {
pub:pengecekan
}

putlog "Adzan Time By JoJo"
