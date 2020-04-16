#################################################
##------------------------------------------- -##
##                                             ##
##         ***    *******  ***   *** ******    ##
##        *** *   ***   **  *** *** ***  ***   ##
##       ***   *  ***   **   *****  ***  ***   ##
##      ********* *******     ***   ***  ***   ##
##     ***        ***    **   ***   ***  ***   ##
##    ***         ***     **  ***   ***  ***   ##
##   ***          ***      ** ***    ******    ##
##---------------------------------------------##
#################################################
####################################
## AuToVeRsioN.TcL v1.0 By ARYO	  ##
## © juli 2010, edited by ARYO    ##
## #kaliurang@linkchat.org  	  ##
####################################
## Notes:
## + Memeriksa versi IRC Client dari user yang join ke channel dan menampilkannya ke channel tertentu

###################
##[ KONFIGURASI ]##
###################
set av_ownchan "#Makmur" ;#Channel untuk menampilkan hasil versi
set av_verchan { #Makmur } ;#Channel yang di versi, pisahkan dengan spasi

###############
##[ BINDING ]##
###############
bind pub n `autoversion list_av
bind pub n `+autoversion add_av
bind pub n `-autoversion del_av
bind join * * join_versi
bind ctcr * VERSION cek_kersi

################
##[ PROSEDUR ]##
################
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

####################################################################
putlog "0,12«0,1 ARYO.TcL v1.0 (By ARYO) 0,12» LoaDeD"
####################################################################
