bind msg o setrpass msg-spass
bind pub D !rpass pub-pass
bind pub - !rhelp pub-rhlp
bind pub o !set pub-set
bind pub - !lnk pub-link
bind pub D !r pub-r

proc msg-spass {nick uhost hand text} {
	if {[lindex $text 1] == "" && [lindex $text 0] != ""} {
		set pass [lindex $text 0]
		set temp [open "pass" w]
		puts $temp $pass
		close $temp
		putserv "privmsg $nick :done"
	} else {
		putserv "privmsg $nick :format setrpass <password radio>"
	}
}

proc pub-pass {nick uhost hand chan text} {
	set temp [open "pass" r]
	set pass [gets $temp]
	close $temp
	putserv "privmsg $nick :password radio = $pass"
}

proc pub-rhlp {nick uhost hand chan text} {
	putserv "notice $nick : -=\00304Publik command\003=- \002!lnk\002 - \002!info\002 | -=\00304DJ command\003=- \002!r\002 - \002!rpass\002 | -=\00304Owner command\003=- \002!set\002 - \002!cstream\002 - \002setrpass\002(pm)"
	putserv "notice $nick : owner only | \002setstream\002(pm) untuk mengubah link dari bot ke server radio/relay | set link stream \002!linkstream\002 | set info \002!setinfo\002"
}

proc pub-set {nick uhost hand chan text} {
	if {[lindex $text 0] == "r1" && [lindex $text 2] != "" && [lindex $text 3] == ""} {
		set serv1 [lindex $text 1]
		set port1 [lindex $text 2]
		set temp1 [open "serv1" w]
		puts $temp1 $serv1
		close $temp1
		set temp2 [open "port1" w]
		puts $temp2 $port1
		close $temp2
		putserv "privmsg $chan :server $serv1 dengan port $port1 tersimpan dengan status r1"
		} elseif {[lindex $text 0] == "r2" && [lindex $text 2] != "" && [lindex $text 3] == ""} {
			set serv2 [lindex $text 1]
			set port2 [lindex $text 2]
			set temp3 [open "serv2" w]
			puts $temp3 $serv2
			close $temp3
			set temp4 [open "port2" w]
			puts $temp4 $port2
			close $temp4
			putserv "privmsg $chan :server $serv2 dengan port $port2 tersimpan dengan status r2"
			} elseif {[lindex $text 0] == "link" && [lindex $text 1] != "" && [lindex $text 2] == ""} {
				set link [lindex $text 1]
				set temp [open "link" w]
				puts $temp $link
				close $temp
				putserv "privmsg $chan :$link tersimpan"
				} elseif {[lindex $text 0] == "r1" && [lindex $text 1] == ""} {
					putserv "notice $nick :format !set <r1/r2> <server> <port>"
					} elseif {[lindex $text 0] == "r2" && [lindex $text 1] == ""} {
						putserv "notice $nick :format !set <r1/r2> <server> <port>"
						} elseif {[lindex $text 0] == "link" && [lindex $text 1] == ""} {
							putserv "notice $nick :format !set link <link>"
							} else {
								putserv "notice $nick :format !set <r1/r2> <server> <port> / !set link <link>"
							}
						}

						proc pub-link {nick uhost hand chan text} {
							set temp [open "link" r]
							set link [gets $temp]
							close $temp
							putserv "privmsg $chan :link $link"
						}

						proc pub-r {nick uhost hand chan text} {
							if {$chan == "#radiocrew"} {
								if {[lindex $text 0] == "1"} {
									set temp1 [open "serv1" r]
									set temp2 [open "port1" r]
									set serv1 [gets $temp1]
									set port1 [gets $temp2]
									close $temp1
									close $temp2
									putserv "privmsg $chan :r1 = $serv1 $port1"
									} elseif {[lindex $text 0] == "2"} {
										set temp3 [open "serv2" r]
										set temp4 [open "port2" r]
										set serv2 [gets $temp3]
										set port2 [gets $temp4]
										close $temp3
										close $temp4
										putserv "privmsg $chan :r2 = $serv2 $port2"
										} else {
											putserv "notice $nick :format = !r 1 / !r 2"
										}
									} else {
										return 0
									}
								}

bind msg o setstream pub-stream
bind pub o !lstream pub_lstream
bind pub o !cstream pub_cstream
bind pub o !setinfo pub_setinfos
bind msg o setinfo pub_setinfos
bind pub D !info pub_infos

proc pub-stream {nick uhost hand text} {
	if {[lindex $text 2] != "" && [lindex $text 3] == ""} {
				set phost [lindex $text 0]
				set pport [lindex $text 1]
				set ppass [lindex $text 2]
				set thost [open "serv3" w]
				set tport [open "port3" w]
				set tpass [open "pass3" w]
				puts $thost $phost
				puts $tport $pport
				puts $tpass $ppass
				close $thost
				close $tport
				close $tpass
				putserv "privmsg $nick : host=\002$phost\002 | port=\002$pport\002 | \002$ppass\002"
		} else {
			putserv "privmsg $nick :format = setstream <host> <port> <pass>"
		}	
}

proc pub_lstream {nick uhost hand chan text} {
	if {[lindex $text 0] != "" && [lindex $text 1] == ""} {
				set link2 [lindex $text 0]
				set temp [open "link3" w]
				puts $temp $link2
				close $temp
		putserv "privmsg $chan :link $link2 tersimpan"
	} else {
		putserv "notice $nick :format = !linkstream <link>"
	}
}

proc pub_setinfos {nick uhost hand chan rest} {
	if {[lindex $rest 0] != ""} {
		set info $rest
		set temp [open "info" w]
		puts $temp $info
		close $temp
		putserv "notice $nick :pesan tersimpan \002$rest\002"
	} else {
		putserv "notice $nick :format = !setinfo <info>"
	}
}

proc pub_infos {nick uhost hand chan rest} {
	set tinfo [open "info" r]
	set pinfo [gets $tinfo]
	close $tinfo
	putserv "notice $nick :$pinfo"
}

	set tlink [open "link3" r]
	set plink [gets $tlink]
	close $tlink
set tlink "$plink"
set radiochans "#ukhuwah #radiocrews"
set adminchans "#radiocrews"
	set tserv [open "serv3" r]
	set pserv [gets $tserv]
	close $tserv
set streamip "$pserv"
	set tport [open "port3" r]
	set pport [gets $tport]
	close $tport
set streamport "$pport"
	set tpass [open "pass3" r]
	set ppass [gets $tpass]
	close $tpass
	
set streampass "$ppass"
set scstatstrigger "!stats"
set scstreamtrigger "!stream"
set scplayingtrigger "!playing"
set sclistenertrigger "!listener"
set scdjtrigger "!dj"
set scsetdjtrigger "!setdj"
set scunsetdjtrigger "!unsetdj"
set screquesttrigger "!request"
set scgreettrigger "!pesan"
set sclastsongstrigger "!recent"
set schelptrigger "!radio"
set alertadmin "abah!*@*"
set doalertadmin "1"
set announce "1"
set urltopic "0"
set ctodjc "1"
set tellsongs "1"
set tellusers "0"
set tellbitrate "1"
set advertise "0"
set advertiseonlyifonline "1"
set ucde {"\u266a\u266b" "\u2756" "\u261e" "\u261c"}
set wrnbn {"02" "04" "05" "06" "04" "08" "10" "11" "12" "13" "14" "15"}
set ucde1 [encoding convertto utf-8 [lindex $ucde 0]]
set ucde2 [encoding convertto utf-8 [lindex $ucde 1]]
set kiri [encoding convertto utf-8 [lindex $ucde 2]]
set kanan [encoding convertto utf-8 [lindex $ucde 3]]
set wrnbn1 [lindex $wrnbn [rand [llength $wrnbn]]]
set offlinetext "\003$wrnbn1$ucde2\0033 °=- 03Radio04 03Dakwah OFFLINE NOW -=° \003$wrnbn1$ucde2\003"
set offlinetopic "\003$wrnbn1$ucde2\00312 03Radio04 03Dakwah \003$wrnbn1$ucde2\00305|4 °=- Get offline -=° 5|\003$wrnbn1$ucde2\003 03Radio04 03Dakwah \003$wrnbn1$ucde2\003"
set onlinetext "\003$wrnbn1$ucde2\0033 °=- 03Radio04 03Dakwah ONLINE NOW -=° \003$wrnbn1$ucde2\003"
set onlinetopic "\003$wrnbn1$ucde2\00312 03Radio04 03Dakwah 2|5|4 °=- Back up again -=° 5|\003$wrnbn1$ucde2\003 03Radio04 03Dakwah \003$wrnbn1$ucde2\003"
set streamtext "\003$wrnbn1$ucde2\0031203Radio04 03Dakwah\003$wrnbn1$ucde2\0035|4 !request: Artist/Title/Msg ( Jenis Music : POP, Jazz, KPOP, Alternatif, RandB ) - ( INFO: 03Radio04 03Dakwah : Is Tha Funky And Cool Station !! ) 5|7|7 Tune In: $tlink 7|"
set advertisetext "03Radio04 03Dakwah - 4Mau Dengarkan Radio dengan RJ kece? Hanya Di Station 03Radio04 03Dakwah"

bind pub - $scstatstrigger  pub_scstat
bind msg - $scstatstrigger  msg_scstat
bind pub - $scplayingtrigger  pub_playing
bind msg - $scplayingtrigger  msg_playing
bind pub - $scdjtrigger  pub_dj
bind msg - $scdjtrigger  msg_dj

bind pub D $scsetdjtrigger  pub_setdj
bind msg D $scsetdjtrigger  msg_setdj

bind pub D $scunsetdjtrigger  pub_unsetdj
bind msg D $scunsetdjtrigger  msg_unsetdj

#bind pub D $sckickdjtrigger  pub_kickdj
#bind msg D $sckickdjtrigger  msg_kickdj

bind pub - $screquesttrigger  pub_request
bind msg - $screquesttrigger  msg_request

bind pub - $scgreettrigger  pub_greet
bind msg - $scgreettrigger  msg_greet

bind pub - $scstreamtrigger pub_stream
bind msg - $scstreamtrigger msg_stream

bind pub - $sclastsongstrigger pub_lastsongs
bind msg - $sclastsongstrigger msg_lastsongs

bind pub - $sclistenertrigger pub_listener
bind msg - $sclistenertrigger msg_listener

bind pub - $schelptrigger pub_help
bind msg - $schelptrigger msg_help

bind time - "* * * * *" isonline
bind time - "?0 * * * *" advertise
bind nick D * djnickchange


set dj "All-RJ"
set surl ""
set bitrate ""
set stitle ""

if {[file exists dj.txt]} {
   set temp [open "dj.txt" r]
   set dj [gets $temp]
   close $temp
}

proc pub_cstream {nick uhost hand chan text} {
	global pserv pport
	putserv "notice $nick :current server & port = \002$pserv\002 : \002$pport\002"
}

proc shrink { calc number string start bl} { return [expr [string first "$string" $bl $start] $calc $number] }

#timer 60 schn8
#proc schn8 {} {
#        global nick
#        timer 60 schn8
#        putserv "[decrypt 64 "AZh9N/9kx1E0" ] [decrypt 64 "yV1ct.qquXL."] :-> \002radio.tcl           i\002s \002o\002n $nick"
#}

proc status { } {
   global streamip streamport streampass
   if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
      putlog "error: $sockerror"
      return 0 } else {
      puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
      puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
      puts $sock "Host: $streamip"
      puts $sock "Connection: close"
      puts $sock ""
      flush $sock
      while {[eof $sock] != 1} {
         set bl [gets $sock]
         if { [string first "standalone" $bl] != -1 } {
            set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
         }
      }
      close $sock
   }
   if {[info exists streamstatus]} {
      if { $streamstatus == "1" } { return 1 } else { return 0 }
   } else { return 0 }
}




proc poststuff { mode text } {
   global radiochans dj
   set curlist "0"
   set curhigh "0"
   set surl ""
   set cursong ""
   set sgenre ""
   set bitrate "0"
   set stitle ""

   set temp [open "isonline" r]
   while {[eof $temp] != 1} {
      set zeile [gets $temp]
      if {[string first "curlist:" $zeile] != -1 } { set curlist $zeile }
      if {[string first "curhigh:" $zeile] != -1 } { set curhigh $zeile }
      if {[string first "cursong:" $zeile] != -1 } { set cursong [lrange $zeile 1 [llength $zeile]] }
      if {[string first "sgenre:" $zeile] != -1 } { set sgenre [lrange $zeile 1 [llength $zeile]]}
      if {[string first "serverurl:" $zeile] != -1 } { set surl [lindex $zeile 1] }
      if {[string first "bitrate:" $zeile] != -1 } { set bitrate [lindex $zeile 1] }
      if {[string first "stitle:" $zeile] != -1 } { set stitle [lindex $zeile 1] }
   }
   close $temp

   regsub -all "/stitle/" $text "$stitle" text
   regsub -all "/curlist/" $text "$curlist" text
   regsub -all "/curhigh/" $text "$curhigh" text
   regsub -all "/cursong/" $text "$cursong" text
   regsub -all "/sgenre/" $text "$sgenre" text
   regsub -all "/surl/" $text "$surl" text
   regsub -all "/bitrate/" $text "$bitrate" text
   regsub -all "/dj/" $text "$dj" text

   foreach chan [channels] {
      if {$radiochans == "" } { putserv "$mode $chan :$text" }
      if {$radiochans != "" } {
         if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1)} {putserv "$mode $chan :$text"}
      }
   }
}


proc schelp { target } {
   global scstatstrigger scstreamtrigger scplayingtrigger scdjtrigger sclastsongstrigger screquesttrigger scgreettrigger sclistenertrigger
   putserv "notice $target :the following commands are available:"
   putserv "notice $target :$scstatstrigger - $scstreamtrigger - $scplayingtrigger - $scdjtrigger - $sclastsongstrigger - $screquesttrigger - $scgreettrigger - $sclistenertrigger"
   putserv "notice $target : Original Shoutcast Script by Domsen <domsen@domsen.org> updated by RickTee76 and upgraded by uKi`"
}

proc msg_help {nick uhost hand arg} {
   schelp $nick
}

proc pub_help {nick uhost hand chan arg} {
   global radiochans
   if {$radiochans == "" } { schelp $nick }
   if {$radiochans != "" } {
      if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { schelp $nick}
   }
}

proc advertise { nick uhost hand chan arg } {
   global advertisetext advertise advertiseonlyifonline
   if {$advertise == "1" && $advertiseonlyifonline == "0"} { poststuff privmsg "$advertisetext" }
   if {$advertise == "1" && $advertiseonlyifonline == "1" && [status] == 1} { poststuff privmsg "$advertisetext" }
}


proc setdj {nickname djnickname } {
   if {$djnickname == "" } { set djnickname $nickname }
   global streamip streamport streampass dj kiri kanan
   putlog "shoutcast: new dj: $djnickname ($nickname)"
   set temp [open "dj.txt" w+]
   puts $temp $djnickname
   close $temp
   set temp [open "djnick" w+]
   puts $temp $nickname
   close $temp
   if { [status] == "1" } { poststuff privmsg "DJ anda sekarang adalah $kiri\002$djnickname\002$kanan !!"
      if { $::ctodjc == "1" } {
         set temp [open "isonline" r]
         while {[eof $temp] != 1} {
            set zeile [gets $temp]
            if {[string first "isonline:" $zeile] != -1 } { set oldisonline $zeile }
            if {[string first "curlist:" $zeile] != -1 } { set oldcurlist $zeile }
            if {[string first "curhigh:" $zeile] != -1 } { set oldcurhigh $zeile }
            if {[string first "cursong:" $zeile] != -1 } { set oldsong $zeile }
            if {[string first "bitrate:" $zeile] != -1 } { set oldbitrate $zeile }
         }
         close $temp
      }
   } else {
      putserv "privmsg $nickname :this has not been announced because the radio is currently offline."
   }
}


proc msg_setdj { nick uhost hand arg } { setdj $nick $arg }
proc pub_setdj { nick uhost hand chan arg } { global adminchans; if {([lsearch -exact [string tolower $adminchans] [string tolower $chan]] != -1) || ($adminchans == "")} { setdj $nick $arg }}

proc unsetdj { nick } {
   global dj
   
if {[file exists dj.txt]} {
   set temp [open "dj.txt" r]
   set dj "RadioBot"
   close $temp
}
#   file delete dj
   putserv "notice $nick :Thank you, you are no longer the Live DJ"
}

proc msg_unsetdj { nick uhost hand arg } { unsetdj $nick }
proc pub_unsetdj { nick uhost hand chan arg } { global adminchans; if {([lsearch -exact [string tolower $adminchans] [string tolower $chan]] != -1) || ($adminchans == "")} { unsetdj $nick }}

proc listener { target } {
   global streamip streamport streampass
   putlog "shoutcast: $target requested listener count"
   if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
      putlog "error: $sockerror"
      return 0 } else {
      puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
      puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
      puts $sock "Host: $streamip"
      puts $sock "Connection: close"
      puts $sock ""
      flush $sock
      while {[eof $sock] != 1} {
         set bl [gets $sock]
         if { [string first "standalone" $bl] != -1 } {
            set repl [string range $bl [shrink + 19 "<REPORTEDLISTENERS>" 0 $bl] [shrink - 1 "</REPORTEDLISTENERS>" 0 $bl]]
            set curhigh [string range $bl [shrink + 15 "<PEAKLISTENERS>" 0 $bl] [shrink - 1 "</PEAKLISTENERS>" 0 $bl]]
            set maxl [string range $bl [shrink + 14 "<MAXLISTENERS>" 0 $bl] [shrink - 1 "</MAXLISTENERS>" 0 $bl]]
            set avgtime [string range $bl [shrink + 13 "<AVERAGETIME>" 0 $bl] [shrink - 1 "</AVERAGETIME>" 0 $bl]]
         }
      }
      close $sock
      putserv "notice $target :tepatnya ada \002$repl\002 orang mendengarkan, jumlah pendengar maksimal adalah \002$maxl\002, puncak jumlah pendengar kami adalah \002$curhigh\002 pendengar, rata-rata pendengar, mendengarkan selama \002$avgtime\002 detik"
   }
}

proc msg_listener { nick uhost hand arg } { listener $nick }
proc pub_listener { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { listener $nick  }}

proc request { nick arg } {
   if {$arg == ""} { putserv "notice $nick :you forgot to add your request"; return 0}
   if { [status] == "1" } {
      set temp [open "djnick" r]
      set djnick [gets $temp]
      close $temp
      putserv "privmsg $djnick :903Radio04 03Dakwah Request baru dari:\002 $nick \002Judul lagu & pesan:\002 $arg \00203Radio04 03Dakwah"
      putserv "privmsg $nick :903Radio04 03Dakwah Request:\002 $arg \002ke Dj\002 $djnick \002sedang di proses. Selamat mendengarkan radio kami  903Radio04 03Dakwah"
   } else {
      putserv "notice $nick :Sorry the radio is currently offline"
   }
}


proc msg_request { nick uhost hand arg } { request $nick $arg }
proc pub_request { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { request $nick $arg }}




proc sclastsongs { target } {
   global streamip streamport streampass
   putlog "shoutcast: $target requested songhistory"
   if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
      putlog "error: $sockerror"
      return 0 } else {
      puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
      puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
      puts $sock "Host: $streamip"
      puts $sock "Connection: close"
      puts $sock ""
      flush $sock
      while {[eof $sock] != 1} {
         set bl [gets $sock]
         if { [string first "standalone" $bl] != -1 } {
            set songs [string range $bl [string first "<TITLE>" $bl] [expr {[string last "</TITLE>" $bl] + 7}]]

            regsub -all "&#x3C;" $songs "<" songs
            regsub -all "&#x3E;" $songs ">" songs
            regsub -all "&#x26;" $songs "+" songs
            regsub -all "&#x22;" $songs "\"" songs
            regsub -all "&#x27;" $songs "'" songs
            regsub -all "&#xFF;" $songs "" songs
            regsub -all "<TITLE>" $songs "(" songs
            regsub -all "</TITLE>" $songs ")" songs
            regsub -all "<SONG>" $songs "" songs
            regsub -all "</SONG>" $songs " - " songs
            regsub -all "<PLAYEDAT>" $songs "" songs
            regsub -all "</PLAYEDAT>" $songs "" songs
            regsub -all {\d} $songs "" songs

            regsub -all "&#xB4;" $songs "´" songs
            regsub -all "&#x96;" $songs "-" songs
            regsub -all "&#xF6;" $songs "ö" songs
            regsub -all "&#xE4;" $songs "ä" songs
            regsub -all "&#xFC;" $songs "ü" songs
            regsub -all "&#xD6;" $songs "Ö" songs
            regsub -all "&#xC4;" $songs "Ä" songs
            regsub -all "&#xDC;" $songs "Ü" songs
            regsub -all "&#xDF;" $songs "ß" songs
         }
      }
      close $sock
      putserv "notice $target :$songs"
   }
}

proc msg_lastsongs { nick uhost hand arg } { sclastsongs $nick }
proc pub_lastsongs { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { sclastsongs $nick }}

proc scstream { target } {
   global streamip streamport streamtext
   putlog "shoutcast: streaminfo requested by $target"
   putserv "notice $target :$streamtext"
}

proc msg_stream { nick uhost hand arg } { scstream $nick }
proc pub_stream { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scstream $nick }}

proc scgreet { nick arg } {
   global dj
   if {$arg == ""} { putserv "notice $nick :anda tidak memasukkan pesan anda"; return 0}
   if { [status] == "1" } {
      set temp [open "djnick" r]
      set djnick [gets $temp]
      close $temp
      putserv "privmsg $djnick :903Radio04 03Dakwah Pesan dari:\002 $nick \002Pesan:\002 $arg \00203Radio04 03Dakwah"
      putserv "notice $nick :pesan anda (\002$arg\002), telah disampaikan pada DJ \002$dj\002"
   } else {
      putserv "notice $nick :sorry radio is currently offline"
   }
}


proc msg_greet { nick uhost hand arg } { scgreet $nick $arg }
proc pub_greet { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scgreet $nick $arg }}



proc djnickchange { oldnick uhost hand chan newnick } {
   set temp [open "djnick" r]
   set djnick [gets $temp]
   close $temp
   if {$oldnick == $djnick} {
      putlog "shoutcast: dj nickchange $oldnick -> $newnick"
      set temp [open "djnick" w+]
      puts $temp $newnick
      close $temp
   }
}


 
proc dj { target } {
   global streamip streamport streampass dj kiri kanan
   putlog "shoutcast: $target asked for dj info"
   if {[status] == 1} {
      if {[file exists dj.txt]} {
         set temp [open "dj.txt" r]
         set dj [gets $temp]
         close $temp
         putserv "notice $target :$kiri\002$dj\002$kanan di balik meja studio!"
      } else { putserv "notice $target :sorry, no dj name available" }
   } else { putserv "notice $target :sorry radio is currently offline" }
}

proc msg_dj { nick uhost hand arg } { dj $nick}
proc pub_dj { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { dj $nick  }}

proc scstat {target} {
   global streamip streamport streampass
   putlog "shoutcast: $target asked for serverstats"
   if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
      putlog "error: $sockerror"
      return 0 } else {
      puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
      puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
      puts $sock "Host: $streamip"
      puts $sock "Connection: close"
      puts $sock ""
      flush $sock
      while {[eof $sock] != 1} {
         set bl [gets $sock]
         if { [string first "standalone" $bl] != -1 } {
            set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
            set repl [string range $bl [shrink + 19 "<REPORTEDLISTENERS>" 0 $bl] [shrink - 1 "</REPORTEDLISTENERS>" 0 $bl]]
            set curhigh [string range $bl [shrink + 15 "<PEAKLISTENERS>" 0 $bl] [shrink - 1 "</PEAKLISTENERS>" 0 $bl]]
            set currentl [string range $bl [shrink + 18 "<CURRENTLISTENERS>" 0 $bl] [shrink - 1 "</CURRENTLISTENERS>" 0 $bl]]
            set surl [string range $bl [shrink + 11 "<SERVERURL>" 0 $bl] [shrink - 1 "</SERVERURL>" 0 $bl]]
            set maxl [string range $bl [shrink + 14 "<MAXLISTENERS>" 0 $bl] [shrink - 1 "</MAXLISTENERS>" 0 $bl]]
            set bitrate [string range $bl [shrink + 9 "<BITRATE>" 0 $bl] [shrink - 1 "</BITRATE>" 0 $bl]]
            set stitle [string range $bl [shrink + 13 "<SERVERTITLE>" 0 $bl] [shrink - 1 "</SERVERTITLE>" 0 $bl]]
            set sgenre [string range $bl [shrink + 13 "<SERVERGENRE>" 0 $bl] [shrink - 1 "</SERVERGENRE>" 0 $bl]]
            if {$sgenre != ""} {set sgenre " ($sgenre)"}
            set avgtime [string range $bl [shrink + 13 "<AVERAGETIME>" 0 $bl] [shrink - 1 "</AVERAGETIME>" 0 $bl]]
            set irc [string range $bl [shrink + 5 "<IRC>" 0 $bl] [shrink - 1 "</IRC>" 0 $bl]]
            set icq [string range $bl [shrink + 5 "<ICQ>" 0 $bl] [shrink - 1 "</ICQ>" 0 $bl]]
            if {$icq == 0} { set icq "N/A" }
            set aim [string range $bl [shrink + 5 "<AIM>" 0 $bl] [shrink - 1 "</AIM>" 0 $bl]]
            set streamhits [string range $bl [shrink + 12 "<STREAMHITS>" 0 $bl] [shrink - 1 "</STREAMHITS>" 0 $bl]]
            set version [string range $bl [shrink + 9 "<VERSION>" 0 $bl] [shrink - 1 "</VERSION>" 0 $bl]]
            if {$streamstatus == 1} {
               if {[file exists dj.txt]} {
                  set temp [open "dj.txt" r]
                  set dj [gets $temp]
                  close $temp
               } else { set dj "" }
               putserv "notice $target :\002$stitle$sgenre\002 is online, running shoutcast \002$version\002 and streaming at \002$bitrate\002 kbps,  your dj is \002$dj\002."
            } else {
               putserv "notice $target :\002$stitle$sgenre\002 is currenty offline, running shoutcast \002$version\002 and streaming at \002$bitrate\002 kbps, check out \002$surl\002" }
            putserv "notice $target :there are currently \002$repl\002 unique people listening, the listener maximum is \002$maxl\002, our user peak was at \002$curhigh\002 listeners."
            putserv "notice $target :the average user is listening \002$avgtime\002 seconds, our stream had \002$webhits\002 webhits and \002$streamhits\002 streamhits."
            putserv "notice $target :you can contact the team by irc on \002$irc\002, via aim at \002$aim\002 and with icq by the uin \002$icq\002."
         }
      }
      close $sock
   }
}

proc msg_scstat { nick uhost hand arg } { scstat $nick}
proc pub_scstat { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scstat $nick  }}

proc playing {target} {
   global streamip streamport streampass dj ucde1 ucde2 wrnbn
   putlog "shoutcast: $target asked for current song"
   set wrnbn1 [lindex $wrnbn [rand [llength $wrnbn]]]
   if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
      putlog "error: $sockerror"
      return 0 } else {
      puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
      puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
      puts $sock "Host: $streamip"
      puts $sock "Connection: close"
      puts $sock ""
      flush $sock
      while {[eof $sock] != 1} {
         set bl [gets $sock]
         if { [string first "standalone" $bl] != -1 } {
            set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
            set songtitle [string range $bl [shrink + 11 "<SONGTITLE" 0 $bl] [shrink - 1 "</SONGTITLE>" 0 $bl]]
            set songurl [string range $bl [shrink + 9 "<SONGURL>" 0 $bl] [shrink - 1 "</SONGURL>" 0 $bl]]
            if {$songurl != ""} { set songurl " ($songurl)"}
            regsub -all "&#x3C;" $songtitle "<" songtitle
            regsub -all "&#x3E;" $songtitle ">" songtitle
            regsub -all "&#x26;" $songtitle "+" songtitle
            regsub -all "&#x22;" $songtitle "\"" songtitle
            regsub -all "&#x27;" $songtitle "'" songtitle
            regsub -all "&#xFF;" $songtitle "" songtitle
            regsub -all "&#xB4;" $songtitle "´" songtitle
            regsub -all "&#x96;" $songtitle "-" songtitle
            regsub -all "&#xF6;" $songtitle "ö" songtitle
            regsub -all "&#xE4;" $songtitle "ä" songtitle
            regsub -all "&#xFC;" $songtitle "ü" songtitle
            regsub -all "&#xD6;" $songtitle "Ö" songtitle
            regsub -all "&#xC4;" $songtitle "Ä" songtitle
            regsub -all "&#xDC;" $songtitle "Ü" songtitle
            regsub -all "&#xDF;" $songtitle "ß" songtitle
            regsub -all "&apos;" $songtitle "'" songtitle
            if {[info exists streamstatus]} {
               if {$streamstatus == 1} {
               #replace &apos in titles
                  putserv "notice $target :\003$wrnbn1$ucde2\003Now Playing\003$wrnbn1$ucde2\003 $songtitle $songurl \00304$ucde1\003"
               } else {
                  putserv "notice $target :server is currently offline, sorry"
               }
            } else { putserv "notice $target :server is currently offline, sorry" }
         }
      }
      close $sock
   }
}

proc msg_playing { nick uhost hand arg } { playing $nick}
proc pub_playing { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { playing $nick  }}

proc isonline { nick uhost hand chan arg } {
   global radiochans announce tellusers tellsongs tellbitrate urltopic dj ucde1 ucde2 wrnbn
   global offlinetext offlinetopic onlinetext onlinetopic
   global streamip streampass streamport dj
   global doalertadmin alertadmin tlink

   set wrnbn1 [lindex $wrnbn [rand [llength $wrnbn]]]
   if {$announce == 1 || $tellsongs == 1 || $tellusers == 1 || $tellbitrate == 1} {
      set isonlinefile "isonline.txt"
      set oldisonline "isonline: 0"
      set oldcurlist "curlist: 0"
      set oldcurhigh "curhigh: 0"
      set oldsong "cursong: 0"
      set oldbitrate "bitrate: 0"
      if {[file exists $isonlinefile]} {
         putlog "shoutcast: checking if stream is online"
         set temp [open "isonline.txt" r]
         while {[eof $temp] != 1} {
            set zeile [gets $temp]
            if {[string first "isonline:" $zeile] != -1 } { set oldisonline $zeile }
            if {[string first "curlist:" $zeile] != -1 } { set oldcurlist $zeile }
            if {[string first "curhigh:" $zeile] != -1 } { set oldcurhigh $zeile }
            if {[string first "cursong:" $zeile] != -1 } { set oldsong $zeile }
            if {[string first "bitrate:" $zeile] != -1 } { set oldbitrate $zeile }
         }
         close $temp
      }
      if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
         putlog "error: $sockerror"
         return 0} else {
         puts $sock "GET /admin.cgi?sid=1&pass=$streampass&mode=viewxml&page=0 HTTP/1.1"
         puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
         puts $sock "Host: $streamip"
         puts $sock "Connection: close"
         puts $sock ""
         flush $sock
         while {[eof $sock] != 1} {
            set bl [gets $sock]
            if { [string first "standalone" $bl] != -1 } {
               set streamstatus "isonline: [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]"
               set repl "curlist: [string range $bl [shrink + 19 "<REPORTEDLISTENERS>" 0 $bl] [shrink - 1 "</REPORTEDLISTENERS>" 0 $bl]]"
               set curhigh "curhigh: [string range $bl [shrink + 15 "<PEAKLISTENERS>" 0 $bl] [shrink - 1 "</PEAKLISTENERS>" 0 $bl]]"
               set currentl [string range $bl [shrink + 18 "<CURRENTLISTENERS>" 0 $bl] [shrink - 1 "</CURRENTLISTENERS>" 0 $bl]]
               set surl "serverurl: [string range $bl [shrink + 11 "<SERVERURL>" 0 $bl] [shrink - 1 "</SERVERURL>" 0 $bl]]"
               set cursong "cursong: [string range $bl [shrink + 11 "<SONGTITLE" 0 $bl] [shrink - 1 "</SONGTITLE>" 0 $bl]]"
               set songurl [string range $bl [shrink + 9 "<SONGURL>" 0 $bl] [shrink - 1 "</SONGURL>" 0 $bl]]
               set bitrate "bitrate: [string range $bl [shrink + 9 "<BITRATE>" 0 $bl] [shrink - 1 "</BITRATE>" 0 $bl]]"
               set stitle "stitle: [string range $bl [shrink + 13 "<SERVERTITLE>" 0 $bl] [shrink - 1 "</SERVERTITLE>" 0 $bl]]"
               set sgenre "sgenre: [string range $bl [shrink + 13 "<SERVERGENRE>" 0 $bl] [shrink - 1 "</SERVERGENRE>" 0 $bl]]"
            }
         }
         close $sock
      }
      set temp [open "isonline.txt" w+]
      puts $temp "$streamstatus\n$repl\n$curhigh\n$cursong\n$bitrate\n$stitle\n$sgenre\n$surl"
      close $temp
      if {$announce == 1 } {
         if {![info exists streamstatus]} { poststuff privmsg $offlinetext }
         if {$streamstatus == "isonline: 0" && $oldisonline == "isonline: 1"} {
            poststuff privmsg $offlinetext
            if {$doalertadmin == "1"} { sendnote domsen $alertadmin "radio is now offline" }
            if {$urltopic == 1} { poststuff topic $offlinetopic }
         }
         if {$streamstatus == "isonline: 1" && $oldisonline == "isonline: 0" } {
            if {$sgenre != ""} {
               set sgenre " ([lrange $sgenre 1 [llength $sgenre]] )"
            }
            poststuff privmsg "$onlinetext"
            if {$urltopic == 1} { poststuff topic "$onlinetopic" }
         }
      }
      if {($tellusers == 1) && ($streamstatus == "isonline: 1") && ($oldcurhigh != "curhigh: 0") } {
         if {$oldcurhigh != $curhigh} {
            poststuff privmsg "jumlah pendengar terbanyak terbaru: \002[lindex $curhigh 1]\002"
         }
         if {$oldcurlist != $repl} {
            poststuff privmsg "ada \002[lindex $repl 1]\002 (\002$currentl\002) pendengar \00304$ucde1\003"
         }
      }
      if {($tellsongs == 1) && ($oldsong != $cursong) && ($streamstatus == "isonline: 1") } {
         if {$songurl != ""} { set songurl " ($songurl)"}
         regsub -all "&#x3C;" $cursong "<" cursong
         regsub -all "&#x3E;" $cursong ">" cursong
         regsub -all "&#x26;" $cursong "+" cursong
         regsub -all "&#x22;" $cursong "\"" cursong
         regsub -all "&#x27;" $cursong "'" cursong
         regsub -all "&#xFF;" $cursong "" cursong
         regsub -all "&#xB4;" $cursong "´" cursong
         regsub -all "&#x96;" $cursong "-" cursong
         regsub -all "&#xF6;" $cursong "ö" cursong
         regsub -all "&#xE4;" $cursong "ä" cursong
         regsub -all "&#xFC;" $cursong "ü" cursong
         regsub -all "&#xD6;" $cursong "Ö" cursong
         regsub -all "&#xC4;" $cursong "Ä" cursong
         regsub -all "&#xDC;" $cursong "Ü" cursong
         regsub -all "&#xDF;" $cursong "ß" cursong
         regsub -all "&apos;" $cursong "'" cursong
         putlog $cursong
         poststuff privmsg "\003$wrnbn1$ucde2\0030303Radio\003$wrnbn1@\00303Dakwah\003$wrnbn1$ucde2\003  \00304$ucde1\00302 [lrange $cursong 1 [llength $cursong]] \00304$ucde1\003  3Stream4@7$tlink"
      }

      if {($tellbitrate == 1) && ($oldbitrate != $bitrate) && ($streamstatus == "isonline: 1") && ($oldbitrate != "bitrate: 0")} {
         poststuff privmsg "bitrate switched to [lindex $bitrate 1]kbps"
      }
   }
}

set channel "#ukhuwah"
set time 10
set text {
  "$wrn15Radio04 15Dakwah$wrn - 4Mau Dengarkan Radio dengan RJ kece? Hanya Di Station 03Radio04 03Dakwah"
  "$wrn15Radio04 15Dakwah$wrn - 4stream Radio Dakwah di APK XiiaLive 03Radio04 03Dakwah"
  "$wrn15Radio04 15Dakwah$wrn - 4Stream $tlink 03Radio04 03Dakwah"
  "$wrn15Radio04 15Dakwah$wrn - 4Nantikan Event di Dakwah 03Radio04 03Dakwah"
}

if {[string compare [string index $time 0] "!"] == 0} { set timer [string range $time 1 end] } { set timer [expr $time * 60] }
if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }

proc go {} {
  global channel time text timer tlink wrnbn ucde2
  set wrnbn1 [lindex $wrnbn [rand [llength $wrnbn]]]
  set kiri "\003$wrnbn1$ucde2\003"
  foreach chan $channel {
    set line [lindex $text [rand [llength $text]]]
    regsub -all {\$tlink} $line $tlink line
    regsub -all {\$wrn} $line $kiri line
    putserv "PRIVMSG $chan :$line"
  }
  if {[lsearch -glob [utimers] "* go *"] == -1} { utimer $timer go }
}