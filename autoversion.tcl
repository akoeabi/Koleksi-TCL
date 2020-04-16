###[INFO OWNER]###
set TCL "Server Name" 
set owner "abah" 
set country "Indonesia"
set state "Makassar"
set versi "20.10"
set update "09.08.2010"
set mail "abah@ukhuwah.net"

###[SETUP]###
putlog "AssaLamu`aLaikum WarahmatuLLah Please wait... loading $TCL (C) 1978 by abah..."

set av_ownchan "#perisai" ;#Channel untuk menampilkan hasil versi
set av_verchan { #medan } ;#Channel yang di versi, pisahkan dengan spasi

bind pub n `autoversion list_av
bind pub n `+autoversion add_av
bind pub n `-autoversion del_av
bind join * * join_versi
bind ctcr * VERSION cek_kersi

proc join_versi {nick uhost hand chan} {
  global botnick av_verchan
  foreach x $av_verchan {
    set x [string toupper $x]
    set chan [string toupper $chan]
    if {[string match "$x" $chan]} {
      putlog "«Version» Nick: $nick Chan: $chan"
      putserv "PRIVMSG $nick :\001VERSION\001"
      return 0
    }
  }
}

proc cek_kersi {nick uhost hand dest key txt} {
  global av_ownchan
  putserv "PRIVMSG $av_ownchan :$nick menggunakan $txt"
}

proc add_bl {nick uhost hand chan arg} {
  global bl_ownchan av_verchan
  foreach x $av_verchan {
    if {[string toupper $x] == [string toupper $arg]} {
      putserv "NOTICE $nick :$arg sudah ada di AutoVersion"
      return 0
    }
  }
  append av_verchan [string tolower $arg]
  putserv "NOTICE $nick :$arg ditambahkan ke AutoVersion"
}

proc del_av {nick uhost hand chan arg} {
  global av_ownchan av_verchan
  set verchan ""
  foreach x $av_verchan {
    if {[string toupper $x] == [string toupper $arg]} {
      putserv "NOTICE $nick :$arg dihapus dari AutoVersion"
    } else {
      append verchan "[string tolower $x] "
    }
  }
  set av_verchan $verchan
}

proc list_av {nick uhost hand chan arg} {
  global av_ownchan av_verchan
  set verchan ""
  foreach x $av_verchan {
    append verchan "$x "
  }
  putserv "NOTICE $nick :\002YourChan:\002\ $av_ownchan \002VersionChan:\002 $verchan"
}

###[INFO TCL]###
putlog "TCL Name : $TCL" 
putlog "Oleh : $owner $country $state $versi $update"
putlog "Mailto : $mail"
putlog "Loaded Status : Success Alhamdulillah !!!"