######################################################################
# Indonesian Auto update horoscope from http://astaga.com/astrologi/ #
# Base on incith horoscope.tcl 					         #
# Logs:										   #
# Ver 1.1 fixed the colour code error					   #
# Ver 1.0 1st released								   #
# di test pakai eggdrop v1.6.17					         #
#											   #
# jangan pakai eggdrop precompile, soalnya kita butuh http package   #
# Pengunaan:							               #
#   .chanset #channel +horoskop					         #
#   !horoskop <sign>						               #
#   !horoskop help								   #				
# Special Thank's									   #
#  1.all malangfree cRew    		                                 #
#  2.all my friends                                                  #
#  3.thanks for your help and support :D                             #
######################################################################

#Bismillah

package require http
setudef flag horoskop

namespace eval abdie {
  # command char, yang di pakai untuk public & private message binds
  set horoskop(command_char) "!"

  # binds yang anda mau , contoh ("satu dua empat")
  set horoskop(binds) "horoskop"

  # kalo kamu mau bind semua signs, contoh !virgo daripada !horoskop virgo dll, set ke 1
  set horoskop(bind_signs) 1

  # set di atas 0 , heading akan jadi bold 
  set horoskop(bold_headers) 1

  #ini cuma banner header keluar sebelum data horoskop. set ke "" untuk mendisable kan.
  set horoskop(header) ""


  # satu lagi banner footer
  set horoskop(footer) ""

  
  # nilai di atas 0 akan memperbolehkan user untuk dapat private-message dengan bot yang mana bot akan merespon user request
  set horoskop(private_messages) 1
  
  # setelah berapa lama untuk timeoutnya?
  set horoskop(timeout) 30

  # panjang baris yg harus di pisah, kalo tidak di pisa nanti terlalu panjang
  set horoskop(split_length) 435

  # seperator yg di perlukan untuk memisahkan antara header, set ke "\n" untuk memisahkan.  
  set horoskop(seperator) "\n"

  # flood protecksi - set 0 utk mengignore
  set horoskop(ignore) 1

  # berapa barus yg di butuh kan utk menditeksi kalo user ngeflood? 
  set horoskop(flood) 2:10
}

# script di mulai au au au 
namespace eval abdie {
  variable horoskop
  set horoskop(valid_symbols) "aquarius pisces aries taurus gemini cancer leo virgo libra scorpio sagitarius capricorn"
  set horoskop(version) "abdie:astaga horoskop-Ver 1.8"
}

# bind the binds
foreach bind [split ${abdie::horoskop(binds)} " "] { bind pub -|- "${abdie::horoskop(command_char)}$bind" abdie::horoskop:public }

# bind private messages if wanted
if {$abdie::horoskop(private_messages) > 0} {
  foreach bind [split ${abdie::horoskop(binds)} " "] { bind msg -|- "${abdie::horoskop(command_char)}$bind" abdie::horoskop:private }
}

# bind the signs if wanted
if {$abdie::horoskop(bind_signs) > 0} {
  foreach valid_symbol [split $abdie::horoskop(valid_symbols) " "] {
    bind pubm -|- "*${abdie::horoskop(command_char)}${valid_symbol}" abdie::horoskop:public
    if {$abdie::horoskop(private_messages) > 0} {
      bind msgm -|- "*${abdie::horoskop(command_char)}${valid_symbol}" abdie::horoskop:private
    }
  }
}

# toel toel astaga.com untuk data $input
namespace eval abdie {
  proc horoskop {input} {
    global tcl_platform
    set query "http://astaga.com/astrologi/index.php?cat="
    set input [string tolower $input]

    # see if it was a !sign bind
    if {[string match $abdie::horoskop(command_char)* $input] == 1} {
      regsub "^$abdie::horoskop(command_char)" $input "" input
    }

    # help me sayang, biar kita selamat .
    if {[string match help $input] == 1} {
      return "Commands: !leo !virgo !taurus !capricorn !aries !gemini !sagitarius !pisces dll."
    }

    # web-browser yang di pakai untuk konek
    #  coba pakai ini ahhhh "TCL/8.4 (Unix; Linux/2.6.11) http/2.4.5" di compie gue
    set ua "TCL/[info tclversion] ([string totitle $tcl_platform(platform)]; $tcl_platform(os)/$tcl_platform(osVersion)) http/[package provide http]"

    # ngecek permintaan user apa dia ngetik nya bener or gak
    foreach zodiac [split $abdie::horoskop(valid_symbols) " "] {
      if {[string match $input $zodiac] == 1} {
        set http [::http::config -useragent $ua]
        set http [::http::geturl "${query}${input}#as" -timeout [expr $abdie::horoskop(timeout) * 1000]]
      }
    }
    if {[info exists http] == 1} {
      set html [::http::data $http]
    } else {
      return "Oi, '$input' bukan kamu ketik wrong sign tuh. Ketik 'help' untuk informasi lebih lanjut."
    }

    if {[info exists html] == 0} {
      return "Sorry, kayak nya ada yg ngak bener dgn astaga.com, cobalah beberapa saat lagi."
    }

    # kali ini kita coba mempermudah menguraikan htlm nya
    regsub -all "\n" $html "" html
    regsub -all {(?:<b>|</b>)} $html "" html

    # penguraian html di mulai
    regexp -nocase {<div class=astrologi>(.+?)</div>} $html - sign
    regexp -nocase {<td id=ast><p>(.+?)</p>.*} $html - horoscope
    regexp -nocase {<p>Asmara\s*:\s*(.+?)</p>.*} $html - asmara
    regexp -nocase {<p>Keuangan\s*:\s*(.+?)</p>.*} $html - keuangan
    regexp -nocase {<p>Pekerjaan\s*:\s*(.+?)</p>.*} $html - pekerjaan

    # menampil data ke channel or private message tergantung setingan anda di atas
    set output "" ; set bold ""
    if {$abdie::horoskop(bold_headers) > 0} { set bold "\002" }

    if {[info exists sign] == 0} { set sign [string totitle $input] }
    if {[info exists horoscope] == 1} {
      append output "${bold}${sign}${bold} - ${horoscope}${abdie::horoskop(seperator)}"
    } else {
      append output "${bold}${sign}${bold} - horoscope lagi timed out cobalah beberapa saat lagi.${abdie::horoskop(seperator)}"
      return $output
    }
    if {[info exists asmara] == 1} {
      append output "${bold}$sign - Asmara:${bold} ${asmara}${abdie::horoskop(seperator)}"
    }
    if {[info exists keuangan] == 1} {
      append output "${bold}$sign - Keuangan:${bold} ${keuangan}${abdie::horoskop(seperator)}"
    }
    if {[info exists pekerjaan] == 1} {
      append output "${bold}$sign - Pekerjaan:${bold} ${pekerjaan}${abdie::horoskop(seperator)}"
    }
    regsub {(?:\s*|\n|$abdie::horoskop(seperator))$} $output {} output

    return $output
  }

  # menampilkan permintaan ke channel 
  proc horoskop:public {nick uhand handle chan input} {
    if {[lsearch -exact [channel info $chan] +horoskop] != -1} {
      if {[horoskop:flood $nick $uhand]} {
        return 0
      }
      if {$abdie::horoskop(header) != ""} {
        putserv "PRIVMSG $chan :$abdie::horoskop(header)"
      }
      foreach line [abdie::horoskop:split_output [abdie::horoskop $input]] {
        putserv "PRIVMSG $chan :$line"
      }
	if {$abdie::horoskop(footer) != ""} {
        putserv "PRIVMSG $chan :$abdie::horoskop(footer)"
      }
    }
  }

  # menampilkan permintaan ke private messages 
  proc horoskop:private {nick uhand handle input} {
    if {$abdie::horoskop(private_messages) > 0} {
      if {[horoskop:flood $nick $uhand]} {
        return -1
      }
      if {$abdie::horoskop(header) != ""} {
        putserv "PRIVMSG $nick :$abdie::horoskop(header)"
      }
      foreach line [abdie::horoskop:split_output [abdie::horoskop $input]] {
        putserv "PRIVMSG $nick :$line"
      }
    }
  }

  # memisahkan \n ke setiap barus untuk output nya.
  proc horoskop:split_output {input} {
    set parsed_output [set parsed_current {}]
    if {[string match "\n" $abdie::horoskop(seperator)] == 1} {
      regsub "\n\s*$" $input "" input
      foreach newline [split $input "\n"] {
        foreach line [abdie::horoskop:wordwrap $newline] {
          lappend parsed_output $line
        }
      }
    } else {
      regsub "$abdie::horoskop(seperator)\s*$" $input "" input
      foreach line [abdie::horoskop:wordwrap $input] {
        lappend parsed_output $line
      }
    }
    return $parsed_output
  }

  # dari http://forum.egghelp.org/viewtopic.php?t=6690
  # mengurangi baris yang panjang, dan menyingkat baris tsb sebelum baris menjadi panjang
  proc horoskop:wordwrap {str {splitChr { }}} {
    set out [set cur {}]
    set i 0
    set len $abdie::horoskop(split_length)
    regsub -all "\002" $str "<B>" str
    foreach word [split [set str][set str ""] $splitChr] {
      if {[incr i [string len $word]] > $len} {
        regsub -all "<B>" $cur "\002" cur
        lappend out [join $cur $splitChr]
        set cur [list $word]
        set i [string len $word]
      } else {
        lappend cur $word
      }
      incr i
    }
    regsub -all "<B>" $cur "\002" cur
    lappend out [join $cur $splitChr]
  }

  # flood protecksi di mulai 
  proc horoskop:flood_init {} {
    if {$abdie::horoskop(ignore) < 1} {
      return 0
    }
    global horoskop_flood horoskop_flood_array
    if {![string match *:* $abdie::horoskop(flood)]} {
      putlog "$abdie::horoskop(version): variable horoskop(flood) setingan anda salah coba di cek lagi."
      return 0
    }
    set horoskop_flood(flood_num) [lindex [split $abdie::horoskop(flood) :] 0]
    set horoskop_flood(flood_time) [lindex [split $abdie::horoskop(flood) :] 1]
    set i [expr ${horoskop_flood(flood_num)} - 1]
    while {$i >= 0} {
      set horoskop_flood_array($i) 0
      incr i -1
    }
  } ; horoskop:flood_init

  proc horoskop:flood {nick uhand} {
    if {$abdie::horoskop(ignore) < 1} {
      return 0
    }
    global horoskop_flood horoskop_flood_array
    if {${horoskop_flood(flood_num)} == 0} {
      return 0
    }
    set i [expr ${horoskop_flood(flood_num)} - 1]
    while {$i >= 1} {
      set horoskop_flood_array($i) $horoskop_flood_array([expr $i - 1])
      incr i -1
    }
    set horoskop_flood_array(0) [unixtime]
    if {[expr [unixtime] - $horoskop_flood_array([expr ${horoskop_flood(flood_num)} - 1])] <= ${horoskop_flood(flood_time)}} {
      putlog "$abdie::horoskop(version): flood detected from ${nick}."
      newignore [join [maskhost *!*[string trimleft $uhand ~]]] $abdie::horoskop(version) flood $abdie::horoskop(ignore)
      return 1
    } else {
      return 0
    }
  }
}

putlog " - $abdie::horoskop(version) loaded."

# EOF
