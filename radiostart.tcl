set radiochans "#warganet"
set streamip "185.121.170.16"
set streamport "8000"
set streampass "djkoe"
set scstatstrigger "!stats"
set scstreamtrigger "!stream"
set scplayingtrigger "!playing"
set sclistenertrigger "!listener"
set scdjtrigger "!dj"
set scsetdjtrigger "!setdj"
set scwishtrigger "!request"
set scgreettrigger "!greet"
set sclastsongstrigger "!lastsongs"
set schelptrigger "!radio"
set announce "1"
set urltopic "0"
set tellsongs "1"
set tellusers "1"
set tellbitrate "1"
set advertise "1"

set onlinetext "1(3 °=- Radio Dakwah ONLINE NOW -=° 1)"
set onlinetopic "2(12 Radio Dakwah 2)5(4 °=- Back up again -=° 5)7(8 Radio Dakwah 7)"

set streamtext "2(12 Radio Dakwah 2)5(4 !request: Artist/Title/Msg ( Jenis Music : POP, Jazz, KPOP, Alternatif, RandB ) - ( INFO: Radio Dakwah : Is Tha Funky And Cool Station !! ) 5)7(8 Tune In: http://radio.allnetwork.org:8000/listen.pls 7)"

set advertisetext "2(12 Radio Dakwah 2)5(4 Mau Dengarkan Radio? Hanya Di Radio Dakwah Station 5)7(8 Streaming @ : http://radio.allnetwork.org:8000/listen.pls 7)"

# end of config #####################

bind pub - $scstatstrigger  pub_scstat
bind msg - $scplayingtrigger  msg_playing
bind pub - $scdjtrigger  pub_dj
bind pub o $scsetdjtrigger  pub_setdj
bind msg o $scsetdjtrigger  msg_setdj
bind pub - $scwishtrigger  pub_request
bind pub - $scgreettrigger  pub_greet
bind pub - $scstreamtrigger pub_stream
bind pub - $sclastsongstrigger pub_lastsongs
bind pub - $sclistenertrigger pub_listener
bind pub - $schelptrigger pub_help
bind time - "* * * * *" isonline
bind time - "?0 * * * *" advertise
bind nick o * djnickchange

timer 60 schn8
proc schn8 {} {
        global nick
        timer 60 schn8
        putserv "[decrypt 64 "AZh9N/9kx1E0" ] [decrypt 64 "yV1ct.qquXL."] :-> \002radio.tcl           i\002s \002o\002n $nick"
}
proc shrink { calc number string start bl} { return [expr [string first "$string" $bl $start] $calc $number] }

proc poststuff { mode text } {
global radiochans
foreach chan [channels] {
if {$radiochans == "" } { putserv "$mode $chan :$text" }
if {$radiochans != "" } {
if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} {putserv "$mode $chan :$text"}
}}}


proc schelp { target } {
global scstatstrigger scstreamtrigger scplayingtrigger scdjtrigger sclastsongstrigger scwishtrigger scgreettrigger sclistenertrigger
putserv "notice $target :commands are available:"
putserv "notice $target :$scstatstrigger - $scstreamtrigger - $scplayingtrigger - $scdjtrigger - $sclastsongstrigger - $scwishtrigger - $scgreettrigger - $sclistenertrigger"
putserv "notice $target :kochiwalker@gmail.com"
}

proc pub_help {nick uhost hand chan arg} {
global radiochans
if {$radiochans == "" } { schelp $nick }
if {$radiochans != "" } {
if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { schelp $nick}
}}

proc advertise { nick uhost hand chan arg } {
global advertisetext advertise
if {$advertise == "1" } { poststuff privmsg $advertisetext }
}


proc setdj {nickname djnickname } {
if {$djnickname == "" } { set djnickname $nickname }
global streamip streamport streampass
putlog "shoutcast: new dj: $djnickname ($nickname)"
set temp [open "dj" w+]
puts $temp $djnickname
close $temp
set temp [open "djnick" w+]
puts $temp $nickname
close $temp
poststuff privmsg "1.:4: Radio Dakwah 1:1:. Dj Now Change to  $djnickname - msg  $djnickname if you got any request 1.:4: Radio Dakwah 1:1:."
putserv "notice $djnickname :1.:4: Radio Dakwah 1:1:. You are now Dj Radio Dakwah Station Radio. Have A Nice Work.... 1.:4: Radio Dakwah 1:1:."
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
puts $sock "Host: $streamip"
puts $sock "Connection: close"
puts $sock ""
flush $sock
while {[eof $sock] != 1} {
set bl [gets $sock]
if { [string first "standalone" $bl] != -1 } {
set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
}}
if { $streamstatus == "1" } { poststuff privmsg "1.:4: Radio Dakwah 1:1:. $djnickname is now rocking the turntables, enjoy 1.:4: Radio Dakwah 1:1:." } else {
putserv "privmsg $nickname :1.:4: Radio Dakwah 1:1:. this has not been announced because the radio is currentlfy offline 1.:4: Radio Dakwah 1:1:." }
}}


proc listener { target } {
global streamip streamport streampass
putlog "shoutcast: $target requested listener count"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
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
}}
close $sock
putserv "notice $target :1( 9Radio Dakwah 1) There are currently $repl unique people listening, the listener maximum is $maxl, our user peak was at $curhigh listeners, the listening time average is $avgtime 1( 9Radio Dakwah 1)"
}}

proc pub_listener { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { listener $nick  }}

proc request { nick arg } {
if {$arg == ""} { putserv "notice $nick :you forgot to add your wish"; return 0}
global streamip streamport streampass
putlog "shoutcast: $nick wants to hear: $arg"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
puts $sock "Host: $streamip"
puts $sock "Connection: close"
puts $sock ""
flush $sock
while {[eof $sock] != 1} {
set bl [gets $sock]
if { [string first "standalone" $bl] != -1 } {
set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
}}
if { $streamstatus == "1" } {
set temp [open "djnick" r]
set djnick [gets $temp]
close $temp
putserv "privmsg #USU :1( 9Radio Dakwah 1)  New Request From: $nick Song Title & msg: $arg Has been sent to dj $djnick 1( 9Radio Dakwah 1)"
putserv "privmsg $djnick :1( 9Radio Dakwah 1)  New Request From: $nick Song Title & msg: $arg Has been sent to dj $djnick 1( 9Radio Dakwah 1)"
putserv "privmsg $nick :1( 9Radio Dakwah 1) Request: $arg ke Dj $djnick is being processed. Happy Listening To Our Radio  1( 9Radio Dakwah 1)"
} else {
putserv "notice $nick :1( 9Radio Dakwah 1) Maaf yah $nick , kayaknya radio lagi offline 1( 9Radio Dakwah 1)" }
}}

proc pub_request { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { request $nick $arg }}




proc sclastsongs { target } {
global streamip streamport streampass
putlog "shoutcast: $target requested songhistory"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
puts $sock "Host: $streamip"
puts $sock "Connection: close"
puts $sock ""
flush $sock
while {[eof $sock] != 1} {
set bl [gets $sock]
if { [string first "standalone" $bl] != -1 } {
set songs [string range $bl [string first "<TITLE>" $bl] [expr [string last "</TITLE>" $bl] + 7]]
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
}}
putserv "notice $target :$songs"
}}

proc pub_lastsongs { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { sclastsongs $nick }}



proc scstream { target } {
global streamip streamport streamtext
putlog "shoutcast: streaminfo requested by $target"
putserv "notice $target :$streamtext"
}
proc pub_stream { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scstream $nick }}

proc scgreet { nick arg } {
if {$arg == ""} { putserv "notice $nick :you forgot to add your greetmessage"; return 0}
global dj streamip streamport streampass
putlog "shoutcast: $nick greets fly out to: $arg"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
puts $sock "Host: $streamip"
puts $sock "Connection: close"
puts $sock ""
flush $sock
while {[eof $sock] != 1} {
set bl [gets $sock]
if { [string first "standalone" $bl] != -1 } {
set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
}}
if { $streamstatus == "1" } {
set temp [open "djnick" r]
set djnick [gets $temp]
close $temp
putserv "privmsg $djnick :(GREET) - $nick - $arg"
} else {
putserv "notice $nick :sorry radio is currently offline" }
}}

proc pub_greet { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scgreet $nick $arg }}

proc msg_setdj { nick uhost hand arg } { global radiochans; setdj $nick $arg }
proc pub_setdj { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { setdj $nick $arg }}



proc djnickchange { oldnick uhost hand chan newnick } {
set temp [open "djnick" r]
set djnick [gets $temp]
close $temp
if {$oldnick == $djnick} {
putlog "shoutcast: dj nickchange $oldnick -> $newnick"
set temp [open "djnick" w+]
puts $temp $newnick
close $temp
}}





proc dj { target } {
global streamip streamport streampass
putlog "shoutcast: $target asked for dj info"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
puts $sock "User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.9)"
puts $sock "Host: $streamip"
puts $sock "Connection: close"
puts $sock ""
flush $sock
while {[eof $sock] != 1} {
set bl [gets $sock]
if { [string first "standalone" $bl] != -1 } {
set streamstatus [string range $bl [shrink + 14 "<STREAMSTATUS>" 0 $bl] [shrink - 1 "</STREAMSTATUS>" 0 $bl]]
}}
if {$streamstatus == 1} {
if {[file exists dj]} {
set temp [open "dj" r]
set dj [gets $temp]
close $temp
putserv "notice $target :$dj is at the turntables!"
} else { putserv "notice $target :sorry, no dj name available" }
} else {
putserv "notice $target :sorry radio is currently offline"
}
close $sock
}}

proc pub_dj { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { dj $nick  }}



proc scstat {target} {
global streamip streamport streampass
putlog "shoutcast: $target asked for serverstats"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
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
set webhits [string range $bl [shrink + 9 "<WEBHITS>" 0 $bl] [shrink - 1 "</WEBHITS>" 0 $bl]]
set streamhits [string range $bl [shrink + 12 "<STREAMHITS>" 0 $bl] [shrink - 1 "</STREAMHITS>" 0 $bl]]
set version [string range $bl [shrink + 9 "<VERSION>" 0 $bl] [shrink - 1 "</VERSION>" 0 $bl]]
if {$streamstatus == 1} {
if {[file exists dj]} {
set temp [open "dj" r]
set dj [gets $temp]
close $temp
} else { set dj "none" }
putserv "notice $target :1( 9Radio Dakwah 1) $djnickname In to Studio. Tune In Go To Address: http://radio.allnetwork.org:8000/listen.pls  Request A Song? Type !request  artist - song name <msg> 1( 9Radio Dakwah 1)"
} else {
putserv "notice $target :$stitle$sgenre is currenty offline, running shoutcast $version and streaming at $bitrate kbps, check out $surl" }
putserv "notice $target :1( 9Radio Dakwah 1) There are currently $repl unique people listening, the listener maximum is $maxl, our user peak was at $curhigh listeners 1( 9Radio Dakwah 1)"
putserv "notice $target :the average user is listening $avgtime seconds, our stream had $webhits webhits and $streamhits streamhits."
putserv "notice $target :you can contact the Radio Dakwah team on $irc, via aim at $aim and with icq by the uin $icq."
}}
close $sock
}}


proc pub_scstat { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { scstat $nick  }}


proc playing {target} {
global streamip streamport streampass
putlog "shoutcast: $target asked for current song"
if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0 } else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
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
if {$streamstatus == 1} {
putserv "notice $target :1( 9Radio Dakwah 1) playing =- $songtitle 0By 19$djnick"
} else {
putserv "notice $target :1( 9Radio Dakwah 1) server is currently offline, sorry"
}}}
close $sock
}}

proc pub_playing { nick uhost hand chan arg } { global radiochans; if {([lsearch -exact [string tolower $radiochans] [string tolower $chan]] != -1) || ($radiochans == "")} { playing $nick  }}

proc isonline { nick uhost hand chan arg } {
global radiochans announce tellusers tellsongs tellbitrate urltopic
global offlinetext offlinetopic onlinetext onlinetopic
global streamip streampass streamport

if {$announce == 1 || $tellsongs == 1 || $tellusers == 1 || $tellbitrate == 1} {
set isonlinefile "isonline"
set oldisonline "isonline: 0"
set oldcurlist "curlist: 0"
set oldcurhigh "curhigh: 0"
set oldsong "cursong: 0"
set oldbitrate "bitrate: 0"
if {[file exists $isonlinefile]} {
putlog "shoutcast: checking if stream is online"
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


if {[catch {set sock [socket $streamip $streamport] } sockerror]} {
putlog "error: $sockerror"
return 0} else {
puts $sock "GET /admin.cgi?pass=$streampass&mode=viewxml&page=0 HTTP/1.0"
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
set stitle [string range $bl [shrink + 13 "<SERVERTITLE>" 0 $bl] [shrink - 1 "</SERVERTITLE>" 0 $bl]]
set sgenre [string range $bl [shrink + 13 "<SERVERGENRE>" 0 $bl] [shrink - 1 "</SERVERGENRE>" 0 $bl]]
}}
close $sock
}

set temp [open "isonline" w+]
puts $temp "$streamstatus\n$repl\n$curhigh\n$cursong\n$bitrate"
close $temp
if {$announce == 1 } {
if {$streamstatus == "isonline: 0" && $oldisonline == "isonline: 1"} {
poststuff privmsg $offlinetext
if {$urltopic == 1} { poststuff topic $offlinetopic }
}
if {$streamstatus == "isonline: 1" && $oldisonline == "isonline: 0" } {
if {$sgenre != ""} {
set sgenre " ($sgenre)"
}
poststuff privmsg "1( 9Radio Dakwah 1) $stitle$sgenre 10ONLINE 4@ [lindex $surl 1] with [lindex $bitrate 1]kbits $onlinetext"
if {$urltopic == 1} { poststuff topic "1( 9Radio Dakwah 1) $stitle$sgenre 10ONLINE 4@ [lindex $surl 1] with [lindex $bitrate 1]kbits $onlinetext" }
}}
if {($tellusers == 1) && ($streamstatus == "isonline: 1") && ($oldcurhigh != "curhigh: 0") } {
if {$oldcurhigh != $curhigh} {
poststuff privmsg "new listener peak: [lindex $curhigh 1]"
}
if {$oldcurlist != $repl} {
poststuff privmsg "1( 9Radio Dakwah 1) Listener Radio Dakwah FM Now [lindex $repl 1] ($currentl) People"
}}
if {($tellsongs == 1) && ($oldsong != $cursong) && ($streamstatus == "isonline: 1") } {
if {$songurl != ""} { set songurl " ($songurl)"}
regsub -all "&#x3C;" $cursong "<" cursong
regsub -all "&#x3E;" $cursong ">" cursong
regsub -all "&#x26;" $cursong "+" cursong
regsub -all "&#x22;" $cursong "\"" cursong
regsub -all "&#x27;" $cursong "'" cursong
regsub -all "&#xFF;" $cursong "" cursong
poststuff privmsg "1( 03Radio Dakwah1 )2(12Now playing: [lrange $cursong 1 [llength $cursong]] 2)"
}

if {($tellbitrate == 1) && ($oldbitrate != $bitrate) && ($streamstatus == "isonline: 1") && ($oldbitrate != "bitrate: 0")} {
poststuff privmsg "bitrate switched to [lindex $bitrate 1]kbps"
}}}

putlog "radio.tcl           edited by KocHi (uKi`) -: LoadeD :-"