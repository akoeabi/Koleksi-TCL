######################################################################
# Indonesian Auto update horoscope from http://astaga.com/astrologi/ #
# Base on incith horoscope.tcl 					     #
# Logs:								     #
# Ver 1.0 1st released						     #
# di test pakai eggdrop v1.6.17					     #
#                                                                    #
######################################################################
#								     #
# jangan pakai eggdrop precompile, soalnya kita butuh http package   #
# Pengunaan:							     #
#   `chanset #channel +horoskop					     #
#   !horoskop <sign>						     #
#   !horoskop help						     #				
######################################################################

#semprol

package require http
setudef flag horoskop

namespace eval teduh {
  # command char, yang di pakai untuk public & private message binds
  set horoskop(command_char) "!"

  # binds yang anda mau , contoh ("satu dua empat")
  set horoskop(binds) "horoskop"

  # kalo kamu mau bind semua signs, contoh !virgo daripada !horoskop virgo dll, set ke 1
  set horoskop(bind_signs) 1

  # set di atas 0 , heading akan jadi bold 
  set horoskop(bold_headers) 1

  #ini cuma banner header keluar sebelum data horoskop. set ke "" untuk mendisable kan.
  set horoskop(header) " 12-0=9| 11Horoskop Curcaci9|0=12-"


  # satu lagi banner footer
  set horoskop(footer) "\00313Dipersembahkan kembali oleh\003  12-0=9| 11Curcaci9|0=12-"

  
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
namespace eval teduh {
  variable horoskop
  set horoskop(valid_symbols) "aquarius pisces aries taurus gemini cancer leo virgo libra scorpio sagitarius capricorn"
  set horoskop(version) "12-0=9| 11Curcaci Horoskop9|0=12-: astaga horoskop-Ver 1.0"
}

# bind the binds
foreach bind [split ${teduh::horoskop(binds)} " "] { bind pub -|- "${teduh::horoskop(command_char)}$bind" teduh::horoskop:public }

# bind private messages if wanted
if {$teduh::horoskop(private_messages) > 0} {
  foreach bind [split ${teduh::horoskop(binds)} " "] { bind msg -|- "${teduh::horoskop(command_char)}$bind" teduh::horoskop:private }
}

# bind the signs if wanted
if {$teduh::horoskop(bind_signs) > 0} {
  foreach valid_symbol [split $teduh::horoskop(valid_symbols) " "] {
    bind pubm -|- "*${teduh::horoskop(command_char)}${valid_symbol}" teduh::horoskop:public
    if {$teduh::horoskop(private_messages) > 0} {
      bind msgm -|- "*${teduh::horoskop(command_char)}${valid_symbol}" teduh::horoskop:private
    }
  }
}

# toel toel astaga.com untuk data $input
namespace eval teduh {
  proc horoskop {input} {
    global tcl_platform
    set query "http://astaga.com/astrologi/index.php?cat="
    set input [string tolower $input]

    # see if it was a !sign bind
    if {[string match $teduh::horoskop(command_char)* $input] == 1} {
      regsub "^$teduh::horoskop(command_char)" $input "" input
    }

    # help me sayang, biar kita selamat .
    if {[string match help $input] == 1} {
      return "Commands: !leo !virgo !taurus !capricorn !aries !gemini !sagitarius !pisces dll."
    }

    # web-browser yang di pakai untuk konek
    #  coba pakai ini ahhhh "TCL/8.4 (Unix; Linux/2.6.11) http/2.4.5" di compie gue
    set ua "TCL/[info tclversion] ([string totitle $tcl_platform(platform)]; $tcl_platform(os)/$tcl_platform(osVersion)) http/[package provide http]"

    # ngecek permintaan user apa dia ngetik nya bener or gak
    foreach zodiac [split $teduh::horoskop(valid_symbols) " "] {
      if {[string match $input $zodiac] == 1} {
        set http [::http::config -useragent $ua]
        set http [::http::geturl "${query}${input}#as" -timeout [expr $teduh::horoskop(timeout) * 1000]]
      }
    }
    if {[info exists http] == 1} {
      set html [::http::data $http]
    } else {
      return "Oi, '$input' Woooooo salah tanda tuh, gemana sech. Ketik 'help' untuk informasi lebih lanjut."
    }

    if {[info exists html] == 0} {
      return "Sorry, kayak nya ada yang error dgn astaga.com, coba aja beberapa saat lagi ya."
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
    regexp -nocase {Kiss-o-rama\s*:\s*(.+?)</td>.*} $html - kissorama

    # menampil data ke channel or private message tergantung setingan anda di atas
    set output "" ; set bold ""
    if {$teduh::horoskop(bold_headers) > 0} { set bold "\002" }

    if {[info exists sign] == 0} { set sign [string totitle $input] }
    if {[info exists horoscope] == 1} {
      append output "${bold}${sign}${bold} - ${horoscope}${teduh::horoskop(seperator)}"
    } else {
      append output "${bold}${sign}${bold} - horoscope lagi timed out cobalah beberapa saat lagi.${teduh::horoskop(seperator)}"
      return $output
    }
    if {[info exists asmara] == 1} {
      append output "${bold}$sign - Asmara:${bold} ${asmara}${teduh::horoskop(seperator)}"
    }
    if {[info exists keuangan] == 1} {
      append output "${bold}$sign - Keuangan:${bold} ${keuangan}${teduh::horoskop(seperator)}"
    }
    if {[info exists pekerjaan] == 1} {
      append output "${bold}$sign - Pekerjaan:${bold} ${pekerjaan}${teduh::horoskop(seperator)}"
    }
    if {[info exists kissorama] == 1} {
      append output "${bold}$sign - Kiss-o-Rama:${bold} ${kissorama}${teduh::horoskop(seperator)}"
    }
    regsub {(?:\s*|\n|$teduh::horoskop(seperator))$} $output {} output

    return $output
  }

  # menampilkan permintaan ke channel 
  proc horoskop:public {nick uhand handle chan input} {
    if {[lsearch -exact [channel info $chan] +horoskop] != -1} {
      if {[horoskop:flood $nick $uhand]} {
        return 0
      }
      if {$teduh::horoskop(header) != ""} {
        putserv "PRIVMSG $chan :$teduh::horoskop(header)"
      }
      foreach line [teduh::horoskop:split_output [teduh::horoskop $input]] {
        putserv "PRIVMSG $chan :$line"
      }
	if {$teduh::horoskop(footer) != ""} {
        putserv "PRIVMSG $chan :$teduh::horoskop(footer)"
      }
    }
  }

  # menampilkan permintaan ke private messages 
  proc horoskop:private {nick uhand handle input} {
    if {$teduh::horoskop(private_messages) > 0} {
      if {[horoskop:flood $nick $uhand]} {
        return -1
      }
      if {$teduh::horoskop(header) != ""} {
        putserv "PRIVMSG $nick :$teduh::horoskop(header)"
      }
      foreach line [teduh::horoskop:split_output [teduh::horoskop $input]] {
        putserv "PRIVMSG $nick :$line"
      }
    }
  }

  # memisahkan \n ke setiap barus untuk output nya.
  proc horoskop:split_output {input} {
    set parsed_output [set parsed_current {}]
    if {[string match "\n" $teduh::horoskop(seperator)] == 1} {
      regsub "\n\s*$" $input "" input
      foreach newline [split $input "\n"] {
        foreach line [teduh::horoskop:wordwrap $newline] {
          lappend parsed_output $line
        }
      }
    } else {
      regsub "$teduh::horoskop(seperator)\s*$" $input "" input
      foreach line [teduh::horoskop:wordwrap $input] {
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
    set len $teduh::horoskop(split_length)
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
    if {$teduh::horoskop(ignore) < 1} {
      return 0
    }
    global horoskop_flood horoskop_flood_array
    if {![string match *:* $teduh::horoskop(flood)]} {
      putlog "$teduh::horoskop(version): variable horoskop(flood) setingan anda salah coba di cek lagi."
      return 0
    }
    set horoskop_flood(flood_num) [lindex [split $teduh::horoskop(flood) :] 0]
    set horoskop_flood(flood_time) [lindex [split $teduh::horoskop(flood) :] 1]
    set i [expr ${horoskop_flood(flood_num)} - 1]
    while {$i >= 0} {
      set horoskop_flood_array($i) 0
      incr i -1
    }
  } ; horoskop:flood_init

  proc horoskop:flood {nick uhand} {
    if {$teduh::horoskop(ignore) < 1} {
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
      putlog "$teduh::horoskop(version): flood detected from ${nick}."
      newignore [join [maskhost *!*[string trimleft $uhand ~]]] $teduh::horoskop(version) flood $teduh::horoskop(ignore)
      return 1
    } else {
      return 0
    }
  }
}

putlog " - $teduh::horoskop(version) loaded."

# EOF
