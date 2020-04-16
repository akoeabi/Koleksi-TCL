#################################
#[ astro.tcl versi 1.0         ]#
#[ by Rudi Budianto            ]#
#[ http://www.rudibudianto.com ]#
#[ a.k.a diKi a.k.a ayam_jago  ]#
#################################
#+ Required Package
package require http
#+ Public Command
bind pub * !astro astrology
#+ Processing Data
proc astrology {nick uhost hand chan text} {
set valid [llength $text]
if { $valid > 0} {
set bintang [lindex $text 0]
}
if { $bintang == "aquarius"} {
set nomor "10"
} elseif { $bintang == "capricorn"} {
set nomor "21"
} elseif { $bintang == "sagitarius"} {
set nomor "20"
} elseif { $bintang == "scorpio"} {
set nomor "19"
} elseif { $bintang == "libra"} {
set nomor "18"
} elseif { $bintang == "virgo"} {
set nomor "17"
} elseif { $bintang == "leo"} {
set nomor "16"
} elseif { $bintang == "cancer"} {
set nomor "15"
} elseif { $bintang == "gemini"} {
set nomor "14"
} elseif { $bintang == "taurus"} {
set nomor "13"
} elseif { $bintang == "aries"} {
set nomor "12"
} elseif { $bintang == "pisces"} {
set nomor "11"
} else {
puthelp "PRIVMSG $chan :08,01Astrology anda tidak terdaftar!"
puthelp "PRIVMSG $chan :00,01List Astrology:"
puthelp "PRIVMSG $chan :09,01aquarius - capricorn - sagitarius - scorpio - libra - virgo"
puthelp "PRIVMSG $chan :09,01leo - cancer - gemini - taurus - aries - pisces"
}
::http::config -useragent "Mozilla/5.0"
set astro_req [::http::geturl "http://www.anekayess-online.com/kata_zodiak/article.php?article_id=$nomor" -timeout 4000]
set astro_dat [::http::data $astro_req]
if {[::http::status $astro_req] != "ok"} {
puthelp "PRIVMSG $chan :08,01Ntar bos! Tak intipin dulu..."
}
::http::cleanup $astro_req
if {[regexp {<STRONG>Kesehatan</STRONG>:([^<]+)<BR>} $astro_dat x kesehatan]} {
puthelp "PRIVMSG $chan :00,01KESEHATAN:07 $kesehatan"
}
if {[regexp {<STRONG>Keuangan</STRONG>: ([^<]+)<BR>} $astro_dat x keuangan]} {
puthelp "PRIVMSG $chan :00,01KEUANGAN:08 $keuangan"
}
if {[regexp {<STRONG>Asmara</STRONG>: ([^<]+)<BR>} $astro_dat x asmara]} {
puthelp "PRIVMSG $chan :00,01ASMARA:09 $asmara"
}
if {[regexp {<STRONG>Kepribadian</STRONG>: ([^<]+)</FONT>} $astro_dat x kepribadian]} {
puthelp "PRIVMSG $chan :00,01KEPRIBADIAN:11 $kepribadian"
}
}