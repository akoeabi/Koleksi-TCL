bind pub - "!title" title:pub
bind pub - "!request" req:pub
bind pub - "!requestupdate" requpd:pub
bind pub - "!dl" yd:pub
bind pub - "!yd" yd:pub
bind pub - "!anak" anak:pub
bind pub - "!anakupdate" anakupd:pub
bind pub - "!nasional" nasional:pub
bind pub - "!nasionalupdate" nasionalupd:pub
bind pub - "!icema" icema:pub
bind pub - "!icemaupdate" icemaupd:pub
bind pub - "!tadarus" tadarus:pub
bind pub - "!tadarusupdate" tadarusupd:pub
bind pub - "!tilawahupdate" bljrtilupd:pub
bind pub - "!tilawah" bljrtil:pub
bind pub - "!murottalupdate" murupd:pub
bind pub - "!murottal" mur:pub
bind pub - "!nasyidupdate" nasyidupd:pub
bind pub - "!nasyid" nasyid:pub
bind pub - "!indiaupdate" indiaupd:pub
bind pub - "!india" india:pub
bind pub - "!dangdutupdate" dangdutupd:pub
bind pub - "!dangdut" dangdut:pub
bind pub - "!indoupdate" indoupd:pub
bind pub - "!indo" indo:pub
bind pub - "!rbtupdate" rbtupd:pub
bind pub - "!rbt" rbt:pub
bind pub - "!kbrupdate" kbrupd:pub
bind pub - "!keroncongupdate" keroncongupd:pub
bind pub - "!keroncong" keroncong:pub
bind pub - "!colianupdate" colianupd:pub
bind pub - "!colian" colian:pub
bind pub - "!test" test:pub
bind pub - "!on" on:pub
bind pub - "!off" off:pub
bind pub - "!next" next:pub
bind pub - "!autodjhelp" autodjhelp:pub
#bind pub - "!reload"  reload:pub

#title#
proc title:pub { mynick uhost hand chan text} {
global nick password
exec rm sc_trans.conf
exec cp temptrans.conf sc_trans.conf
exec echo StreamTitle=$text >> sc_trans.conf
puthelp "PRIVMSG #@radiobatu :AutoRJ Title Changed to: \002$text\002"
}

#youtube downloader#
proc yd:pub { mynick uhost hand chan text} {
global nick password
set ytlink [lindex $text 0 end]
set outputlink [lrange $text 1 end]
#exec youtube-dl --extract-audio --audio-format mp3 $ytlink --output /home/autodj/mp3/request/$outputlink.webm
exec youtube-dl --extract-audio --audio-format mp3 $ytlink --output /home/autodj/mp3/request/%(title)s.%(ext)s
#set outputlink %(title)s
putmsg $mynick "ketik !cari keyword file nya di room #@radiobatu yah"
}

#help#
proc autodjhelp:pub { mynick uhost hand chan text  } {
global nick password
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Autodj Command: !on !off !next !nasyid !keroncong !colian !rbt !indo !dangdut !india !title !murottal - tambahi update di blkg command klo habis update lagu, ex: !colianupdate"
}

#kbrupdate#
proc kbrupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/ -type f -name "*.mp3" > /home/autodj/kbr.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/kbr.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #kbr list!"
}
#rbt#
proc rbt:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux rbt.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #RBT (Radio Batu Top) Chart list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc rbtupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/RBT/ -type f -name "*.mp3" > /home/autodj/rbt.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/rbt.lst
#exec pkill sc_trans_linux
#exec /home/autodj/trans/sc_trans_linux keroncong.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #rbt list!"
}
#indo#
proc indo:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux indo.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #IndoMusic list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc indoupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/indo/ -type f -name "*.mp3" > /home/autodj/indo.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/indo.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #IndoMusic list!"
}

#colian#
proc colian:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux colian.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #colian list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc colianupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/cover/ -type f -name "*.mp3" > /home/autodj/colian.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/colian.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #colian list!"
}

#keroncong#
proc keroncong:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux keroncong.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #keroncong list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc keroncongupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/Keroncong/ -type f -name "*.mp3" > /home/autodj/keroncong.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/keroncong.lst
#exec pkill sc_trans_linux
#exec /home/autodj/trans/sc_trans_linux keroncong.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #keroncong list!"
}
#india#
proc india:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux india.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #india list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc indiaupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/India/ -type f -name "*.mp3" > /home/autodj/india.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/india.lst
#exec pkill sc_trans_linux
#exec /home/autodj/trans/sc_trans_linux keroncong.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #india list!"
}
#Dangdut#
proc dangdut:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux dangdut.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #Dangdut list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc dangdutupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/Dangdut/ -type f -name "*.mp3" > /home/autodj/dangdut.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/dangdut.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #dangdut list!"
}

#test#

proc test:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux test.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play test list!"
}

#nasyid#
proc nasyid:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux nasyid.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #nasyid list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc nasyidupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/nasyid/ -type f -name "*.mp3" > /home/autodj/nasyid.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/nasyid.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #nasyid list!"
}

proc reload:pub { mynick uhost hand chan text  } {
global nick password
exec pkill -USR1 sc_trans_linux
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Autodj Reload Last Playlist!"
}

proc on:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Autodj On Air Now!"
puthelp "PRIVMSG kbr :!bedj"
}

proc off:pub { mynick uhost hand chan text  } {
global nick password
exec pkill sc_trans_linux
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Autodj Off Air Now!"
}

proc next:pub { mynick uhost hand chan text  } {
global nick password
exec pkill -WINCH sc_trans_linux
puthelp "PRIVMSG #@radiobatu :Next Song Played"
}

#murottal#
proc mur:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux murottal.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #murottal list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc murupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/murottal/ -type f -name "*.mp3" > /home/autodj/murottal.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/murottal.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #murottal list!"
}

#belajar tilawah#
proc bljrtil:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux bljrtilawah.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #belajar tilawah list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc bljrtilupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/bljrtilawah/ -type f -name "*.mp3" > /home/autodj/bljrtilawah.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/bljrtilawah.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #belajar tilawah list!"
}

#tadarus#
proc tadarus:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux tadarus.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #tadarus list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc tadarusupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/tadarusan/ -type f -name "*.mp3" > /home/autodj/tadarus.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/tadarus.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #tadarus list!"
}

#icema#
proc icema:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux icema.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #icema list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc icemaupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/icema/ -type f -name "*.mp3" > /home/autodj/icema.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/icema.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #icema list!"
}

#nasional#
proc nasional:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux nasional.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #nasional list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc nasionalupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/nasional/ -type f -name "*.mp3" > /home/autodj/nasional.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/nasional.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #nasional list!"
}

#anak#
proc anak:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux anak.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #Lagu Anak list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc anakupd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/anak/ -type f -name "*.mp3" > /home/autodj/anak.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/anak.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #Lagu Anak list!"
}

#req#
proc req:pub { mynick uhost hand chan text  } {
global nick password
exec /home/autodj/trans/sc_trans_linux req.conf &
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Play #Requested list!"
puthelp "PRIVMSG kbr :!bedj"
}

proc requpd:pub { mynick uhost hand chan text  } {
global nick password
exec find /home/autodj/mp3/request/ -type f -name "*.mp3" > /home/autodj/req.lst
exec find /home/autodj/mp3/jingles\ n\ teaser/ -type f -name "*.mp3" >> /home/autodj/req.lst
puthelp "PRIVMSG #@radiobatu :Kota Batu Radio Update #Requested Songs list!"
}

