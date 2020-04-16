# XDCC Server for Eggdrops v1.0
# Code : RaPhiuS / PaRaSiTe
# email: henrraph@skynet.be

# NOTE : This script has been tested with eggdrops 1.6.8 & 1.6.10 and should normally work with 1.6.x series or higher
#        Please note that i am not a Tcl confirmed coder so please don't pay attention to the code ;)
#        !USE AT YOUR OWN RISKS!

# ------------------------------
# INSERT THE RIGHT SETTINGS HERE
# ------------------------------
#[Maximum of sends at once]
set maxdcc "2"
#[Maximum of queued packs]
set maxqueue "20000"
#[Maximum of queued file per user]
set maxuserqueue "10000"
#[Server logo]
set logo "-= jancrot =-"


# ------------------------------------------------------------------
# DO NOT EDIT BELOW THESE LINES UNTIL YOU KNOW WHAT YOU ARE DOING !!
# ------------------------------------------------------------------


# ----------------------------
# DO NOT CHANGE THESE SETTINGS
# ----------------------------
#[My infos! Hey dude, keep the credits where credits are due]
set author "RaPhiuS / PaRaSiTe (henrraph@skynet.be)"
#[Version Number]
set ver "1.0"
#[File which holds the channels where the XDCC server have to advertise]
set xchannelfile "./scripts/xdcc.chan"
#[File which holds the packages offered by the XDCC server]
set xpacketsfile "./scripts/xdcc.pack"
#[File which holds the total amount downloaded on the server]
set xcbytefile "./scripts/xdcc.cbyte"
#[File which holds the number of times a package have been downloaded]
set xcpackfile "./scripts/xdcc.cpack"
#[File which holds the queues]
set xqueuefile "./scripts/xdcc.queue"
#[Server open ? 0=open | 1=closed]
set iso 1
#[How many sends at the moment ?]
set xdccsend 0
#[How many queues at the moment ?]
set xqueues 0
#[Base timer min]
set xdcctime "7"

bind dcc m xhelp xhelp
bind dcc m xinfos xinfos
bind dcc m xlistpacks xlistpacks
bind dcc m xaddpack xaddpack
bind dcc m xdelpack xdelpack
bind dcc m xlistchans xlistchans
bind dcc m xaddchan xaddchan
bind dcc m xdelchan xdelchan
bind ctcp - xdcc xctcpevent
bind dcc m xstart xstart
bind dcc m xstop xstop
bind sent - * xupdate
bind lost - * xlosttransfer
bind tout - * xtimeout
bind pub -|- !list xlist
bind pub -|- !xdcc xlist
bind evnt - rehash xrehash
bind dcc m xstatus xstatus


# -------------------
# OTHER COMMANDS CODE
# -------------------


proc xhelp { handle idx text } {
 global ver author
 putidx $idx "XDCC Server for Eggdrops version $ver -HELP-"
 putidx $idx "--------------------------------------------"
 putidx $idx " "
 putidx $idx "Package commands :"
 putidx $idx "   .xlistpacks                    :  List the packages offered"
 putidx $idx "   .xaddpack <file> <description> :  Add a package | <file> need to be the full path"
 putidx $idx "   .xdelpack <packnumber>         :  Delete a package"
 putidx $idx "Channels commands :"
 putidx $idx "   .xlistchans                    :  List the channels"
 putidx $idx "   .xaddchan #<channel>           :  Add a channel | you have to specify the #"
 putidx $idx "   .xdelchan #<channel>           :  Delete a channel | you have to specify the #"
 putidx $idx "Server commands :"
 putidx $idx "   .xstart                        :  Start the server"
 putidx $idx "   .xstop                         :  Stop the server"
 putidx $idx "   .xstatus                       :  Server status"
 putidx $idx "Other commands :"
 putidx $idx "   .xhelp                         :  This help"
 putidx $idx "   .xinfos                        :  The infos"
 putidx $idx " "
 putidx $idx "XDCC Server by $author"
}

proc xinfos { handle idx text } {
 global ver author
 putidx $idx " XDCC Server v$ver by $author"
 putidx $idx " ---> Email : henrraph@skynet.be"
}

proc xlist { nick uhost handle channel arg} {
 global logo iso botnick
 if {$iso==0} {
  putserv "NOTICE $nick : $logo $nick there is a XDCC Server Active"
  putserv "NOTICE $nick : Type /ctcp $botnick XDCC help to get started !"
 }
}


# --------------------- 
# PACKAGE COMMANDS CODE
# ---------------------


proc xlistpacks { handle idx text } {
 global xpacketsfile xcpackfile
 set count 0
 if {[file exists $xpacketsfile]} {
  set xpkfile [open $xpacketsfile r]
  set xcpkfile [open $xcpackfile r]
  putidx $idx "|XDCC SERVER| I have the following package(s) to offer :"
  while {![eof $xpkfile]} {
   set temp [gets $xpkfile]
   set temp2 [gets $xcpkfile]
   if {[lindex $temp 0]!="" && [lindex $temp 1]!="" && [lindex $temp 2]!="" && [lindex $temp 3]!="" && [lindex $temp2 0]!=""} {
    incr count
    set size [xformatsize [lindex $temp 3]]
    putidx $idx "Pack #[lindex $temp 0] is file [lindex $temp 1] ($size) -[lindex $temp 2]- (Gets : [lindex $temp2 0] times)"
   }
  }
  putidx $idx "|XDCC SERVER| Serving $count package(s)"
  close $xpkfile
  close $xcpkfile
 } else { 
  putidx $idx "---------------------------------------------------"
  putidx $idx "XDCC SERVER ERROR : They are no packages offered !!"
  putidx $idx "---------------------------------------------------"
 }
}

proc xaddpack { handle idx text } {
 global xpacketsfile xcpackfile
 set pack "[lindex $text 0]"
 set desc "[lindex $text 1]"
 set packnum -1
 if {$pack=="" || $desc==""} {
  putidx $idx "------------------------------------------------"
  putidx $idx "XDCC SERVER ERROR :  Wrong use of a command !"
  putidx $idx ".xaddpack usage : .xaddpack <file> <description>"
  putidx $idx "example : .xaddpack /home/xxxxx/file1.zip File1"
  putidx $idx "------------------------------------------------"
 } else {
  if {![file exists $xpacketsfile]} {
   set xpkfile [open $xpacketsfile w]
   set xcpkfile [open $xcpackfile w]
   incr packnum
  } else {
   set xpkfile [open $xpacketsfile r+]
   set xcpkfile [open $xcpackfile r+]
   while {![eof $xpkfile]} {
    gets $xpkfile
    gets $xcpkfile
    incr packnum
   }
  }
  if {![file exists $pack]} {
   putidx $idx "-------------------------------------------------------------------"
   putidx $idx "XDCC SERVER ERROR : The file you are trying to add doesn't exist !!"
   putidx $idx "-------------------------------------------------------------------"
  } else {
   set size [xformatsize [file size $pack]]
   incr packnum
   puts $xpkfile "$packnum $pack $desc [file size $pack]"
   puts $xcpkfile "0"
   putidx $idx "|XDCC SERVER| Successfully added package $pack ($size) -$desc- at position $packnum" 
  }
  close $xpkfile
  close $xcpkfile
 }
}

proc xdelpack { handle idx text } {
 global xpacketsfile xcpackfile iso
 set xpktemp "./scripts/xpacket.t"
 set xcpktemp "./scripts/xcpk.t"
 set packnum [lindex $text 0]
 set number 1
 set count 0
 set num 0
 if {$packnum=="" } {
  putidx $idx "-----------------------------------------------"
  putidx $idx "XDCC SERVER ERROR : Wrong use of a command !"
  putidx $idx ".xdelpack usage : .xdelpack <packnumber>"
  putidx $idx "example : .xdelpack 1 (this will delete pack 1)"
  putidx $idx "-----------------------------------------------"
 } else {
  if {![file exists $xpacketsfile]} {
   putidx $idx "---------------------------------------------------"
   putidx $idx "XDCC SERVER ERROR : They are no packages offered !!"
   putidx $idx "---------------------------------------------------"
  } else {
   set xpkfile [open $xpacketsfile r]
   set xcpkfile [open $xcpackfile r]
   set xpacktemp [open $xpktemp w]
   set xcpacktemp [open $xcpktemp w]
   while {![eof $xpkfile]} {
    set temp [gets $xpkfile]
    set temp2 [gets $xcpkfile]
    incr count
    if {$count!=$packnum} {
     if {[lindex $temp 0]!="" && [lindex $temp 1]!="" && [lindex $temp 2] !="" && [lindex $temp 3]!=""} {
      puts $xpacktemp "$number [lindex $temp 1] [lindex $temp 2] [lindex $temp 3]"
      puts $xcpacktemp "[lindex $temp2 0]"
      incr number
      incr num
     }
    }
   }
   incr count -1
   if {$count<$packnum} {
    putidx $idx "-------------------------------------------------------------------"
    putidx $idx "XDCC SERVER ERROR : The package you want to delete doesn't exist !!"
    putidx $idx "-------------------------------------------------------------------"
   } else {
    putidx $idx "|XDCC SERVER| Successfully removed package $packnum"
   }   
   close $xpkfile
   close $xcpkfile
   close $xpacktemp
   close $xcpacktemp
   file delete $xpacketsfile
   file delete $xcpackfile
   file rename $xpktemp $xpacketsfile
   file rename $xcpktemp $xcpackfile
   file delete $xpktemp
   file delete $xcpktemp
   if {[file exists $xpacketsfile] && $num==0} {
    file delete $xpacketsfile
    file delete $xcpackfile
    set iso 1
   }
  } 
 }
}


# ----------------------
# CHANNELS COMMANDS CODE
# ----------------------


proc xlistchans { handle idx text } {
 global xchannelfile
 set count 0
 if {[file exists $xchannelfile]} {
  set xchfile [open $xchannelfile r]
  putidx $idx "|XDCC SERVER| actually runs in :"
  while {![eof $xchfile]} {
   set temp [gets $xchfile]
   if {[lindex $temp 0]!=""} {
    incr count
    putidx $idx "$count: [lindex $temp 0]"
   }
  }
  putidx $idx "|XDCC SERVER| End of channel(s) list"
  close $xchfile
 } else { 
  putidx $idx "--------------------------------------------"
  putidx $idx "XDCC SERVER ERROR : I have no channel(s) set"
  putidx $idx "--------------------------------------------"
 }
}

proc xaddchan { handle idx text } {
 global xchannelfile
 set chanadd [lindex $text 0]
 set channum -1
 set error 0
 if {$chanadd==""} {
  putidx $idx "-------------------------------------------------------------"
  putidx $idx "XDCC SERVER ERROR : Wrong use of a command !!"
  putidx $idx ".xaddchan usage : .xaddchan #<channel>"
  putidx $idx "example : .xaddchan #lamer (this will add the channel #lamer)"
  putidx $idx "-------------------------------------------------------------"
 } else {
  if {![file exists $xchannelfile]} {
   set xchfile [open $xchannelfile w]
   incr channum
  } else {
   set xchfile [open $xchannelfile r+]
   while {![eof $xchfile]} {
    set temp [gets $xchfile]
    if {$temp!=$chanadd} {
     incr channum
    } else {
     incr error
    }
   }
  }
  if {$error=="1"} {
   putidx $idx "-----------------------------------------------------------"
   putidx $idx "XDCC SERVER ERROR : I am already serving on that channel !!"
   putidx $idx "-----------------------------------------------------------"
  } else {
   incr channum
   puts $xchfile "$chanadd"
   putidx $idx "|XDCC SERVER| Successfully added channel $chanadd a position $channum"
  }
  close $xchfile
 }
}

proc xdelchan { handle idx text } {
 global xchannelfile iso
 set xchtemp "./scripts/xchan.t"
 set chanrem [lindex $text 0]
 set error 1
 set count 0
 if {$chanrem==""} {
  putidx $idx "----------------------------------------------------------------"
  putidx $idx "XDCC SERVER ERROR : Wrong use of a command !!"
  putidx $idx ".xdelchan usage : .xdelchan #<channel>"
  putidx $idx "example : .xdelchan #lamer (this will delete the channel #lamer)"
  putidx $idx "----------------------------------------------------------------"
 } else {
  if {![file exists $xchannelfile]} {
   putidx $idx "-----------------------------------------------------------------------"
   putidx $idx "XDCC SERVER ERROR : I can't delete a channel if i don't serve in any !!"
   putidx $idx "-----------------------------------------------------------------------"
  } else {
    set xchtempfile [open $xchtemp w]
    set xchfile [open $xchannelfile r]
    while {![eof $xchfile]} { 
     set temp [gets $xchfile]
     if {$temp==$chanrem} { 
      incr error -1
     } else {
      if {$temp!=""} {
       puts $xchtempfile "$temp"
       incr count
      }
     }
    }
    if {$error=="1"} {
     putidx $idx "----------------------------------------------------------------"
     putidx $idx "XDCC SERVER ERROR : I could not remove a non existing channel !!"
     putidx $idx "----------------------------------------------------------------"
    } else {
     putidx $idx "|XDCC SERVER| Successfully removed channel $chanrem"
    } 
    close $xchfile
    close $xchtempfile
    file delete $xchannelfile
    file rename $xchtemp $xchannelfile
    file delete $xchtemp
    if {[file exists $xchannelfile] && $count==0} {
     file delete $xchannelfile
     set iso 1
    }
  }
 }
}


# -----------------------
# XDCC CORE COMMANDS CODE
# -----------------------


proc xctcpevent { nick uhost handle dest keyword arg } {
 putlog "|XDCC SERVER| Received a CTCP $keyword $arg from $nick ($uhost)"
 xctcpmonitor $nick $arg
}

proc xctcpmonitor { nick command } {
 global botnick numversion logo iso author ver xpacketsfile xcpackfile xqueuefile xdccsend xqueues maxdcc maxqueue
 set cmd [string tolower $command]
 if {$iso!="1"} {
  if {$cmd=="list"} {
   putserv "PRIVMSG $nick : $logo package(s) list"
   set xpfile [open $xpacketsfile r]
   set xcpfile [open $xcpackfile r]
   set packnum 0
   while {![eof $xpfile]} {
    set temp1 [gets $xpfile]
    set temp2 [gets $xcpfile]
    if {$temp1!=""} {
     incr packnum
     set size [xformatsize [lindex $temp1 3]]
     putserv "PRIVMSG $nick : (Pack #$packnum) : [lindex $temp1 2] ($size) | Gets : ($temp2)X" 
    }
   }
   putserv "PRIVMSG $nick : $logo Serving $packnum package(s)"
   putserv "PRIVMSG $nick : |STATUS| Sends : ($xdccsend/$maxdcc) | Queues : ($xqueues/$maxqueue)"
   putserv "PRIVMSG $nick : To get a package just type : /ctcp $botnick XDCC send #<packnumber>"
   close $xpfile
   close $xcpfile
  }
  if {$cmd=="info"} {
   putserv "NOTICE $nick : Hi, i'm $botnick, an eggdrop bot v[string index $numversion 0].[string index $numversion 1][string index $numversion 2].[string index $numversion 3][string index $numversion 4]"
   putserv "NOTICE $nick : I am running XDCC Server version $ver by RaPhiuS / PaRaSiTe (henrraph@skynet.be)"   
  }
  if {$cmd=="" || $cmd=="help"} {
   putserv "NOTICE $nick : $logo HELP ON COMMANDS"
   putserv "NOTICE $nick : Commands are : help, list, info, send #<packnumber>"
  }
  if {[lindex $cmd 0]=="send"} {
   if {[lindex $cmd 1]==""} {
    putserv "NOTICE $nick : $logo Which package do you want ? Please tell me =)"
   } else {
    pushqueue $nick [string index [lindex $cmd 1] 1] 
   }
  }
 }
}

proc xformatsize { size } {
 set byte 0
 set kb 0
 set meg 0
 set gb 0
 set sizelenght [string length $size]
 if {$sizelenght<=3} {
  set byte "[string index $size 0][string index $size 1][string index $size 2] bytes"
  return "$byte"
 }
 if {$sizelenght==4} {
  set kb "[string index $size 0] kb's"
  return "$kb"
 } 
 if {$sizelenght==5} {
  set kb "[string index $size 0][string index $size 1] kb's"
  return "$kb"
 }
 if {$sizelenght==6} {
  set kb "[string index $size 0][string index $size 1][string index $size 2] kb's"
  return "$kb"
 }
 if {$sizelenght==7} {
  set meg "[string index $size 0] meg's"
  return "$meg"
 }
 if {$sizelenght==8} {
  set meg "[string index $size 0][string index $size 1] megs'"
  return "$meg"
 }
 if {$sizelenght==9} {
  set meg "[string index $size 0][string index $size 1][string index $size 2] meg's"
  return "$meg"
 }
 if {$sizelenght==10} {
  set gb "[string index $size 0].[string index $size 1][string index $size 2][string index $size 3] meg's"
  return "$gb"
 }
 if {$sizelenght==11} {
  set gb "[string index $size 0][string index $size 1].[string index $size 2][string index $size 3][string index $size 4] meg's"
  return "$gb"
 }
 if {$sizelenght==12} {
  set gb "[string index $size 0][string index $size 1][string index $size 2] gb's"
  return "$gb"
 }
 return "0"
}

proc pushqueue { nick packnumber } {
 global xqueuefile xqueues maxqueue logo xpacketsfile maxuserqueue
 set packindex 0
 set isonqueue 0
 if {$xqueues==$maxqueue} {
  putserv "NOTICE $nick : $logo Sorry maximum number of queues reached ! Retry when queue is not full thx =)"
 } else {
  if {![file exists $xqueuefile]} {
   set xqfile [open $xqueuefile w]
  } else {
   set xqfile [open $xqueuefile r+]
   while {![eof $xqfile]} {
    set alreadyonqueue [gets $xqfile]
    if {[lindex $alreadyonqueue 2]==$nick} {
     incr isonqueue
    }
   }
  }
  if {$isonqueue<$maxuserqueue} {
   set xpfile [open $xpacketsfile r]
   while {![eof $xpfile] && $packindex!=$packnumber} {
    set temp [gets $xpfile]
    if {$temp!=""} { 
     incr packindex
    }
   }
   close $xpfile
   if {$packindex!=$packnumber} {
    putserv "NOTICE $nick : $logo Sorry but the specified package doesn't exist ! Please retry with a valid package number"
   } else {
    set packfile [lindex $temp 1]
    set packsize [lindex $temp 3]
    puts $xqfile "$packfile $packsize $nick"
    incr xqueues
    putserv "NOTICE $nick : $logo Your demand has been placed on queue $xqueues/$maxqueue"
    putserv "NOTICE $nick : You'll receive your pack when a send is available. Stay in the channel or your queue will be removed !"
   }
  } else {
   putserv "NOTICE $nick : $logo Sorry but you can only get $maxuserqueue package(s) at a time !!"
  }
  close $xqfile
 } 
}

proc showxdcc { channel delay} {
 global logo maxqueue maxuserqueue maxdcc xqueues xdccsend xpacketsfile xcpackfile botnick xdcctime iso xcbytefile
 if {$iso==0} {
  putserv "PRIVMSG $channel : $logo XDCC Server brought to you by $channel"
  set xpfile [open $xpacketsfile r]
  set xcpfile [open $xcpackfile r]
  set count 0
  set totaltransfer 0
  if {[file exists $xcbytefile]} {
   set xcbfile [open $xcbytefile r]
   set totaltransfer [gets $xcbfile]
   close $xcbfile
  }
  while {![eof $xpfile]} {
   set p [gets $xpfile]
   set cp [gets $xcpfile]
   if {$p!=""} {
    incr count
    set size [xformatsize [lindex $p 3]]
    putserv "PRIVMSG $channel : (Pack #$count) : [lindex $p 2] | $size | Gets : ($cp)X"
   }
  }
  set sizetot [xformatsize $totaltransfer]
  putserv "PRIVMSG $channel : $logo Serving $count package(s) | Served : ($sizetot)"
  putserv "PRIVMSG $channel : |STATUS| Sends : ($xdccsend/$maxdcc) | Queues : ($xqueues/$maxqueue)"
  putserv "PRIVMSG $channel : To get a package just type : /ctcp $botnick XDCC send #<packnumber>"
  close $xpfile
  close $xcpfile
  timer [expr $xdcctime+$delay] [list showxdcc $channel $delay]
 }
}

proc xupdate { handle nick path } {
 global logo xdccsend xpacketsfile xcbytefile xcpackfile
 set temp 0
 set count 0
 set count2 0
 set xtemp "./scripts/xdcc.tcb"
 set xpfile [open $xpacketsfile r]
 while {![eof $xpfile] && [lindex $temp 1]!=$path} {
  set temp [gets $xpfile]
  if {$temp!=""} {
   incr count
  }
 }
 close $xpfile
 set xcpfile [open $xcpackfile r]
 set xttfile [open $xtemp w]
 while {![eof $xcpfile]} {
  set downpack [gets $xcpfile]
  if {$downpack!=""} {
   incr count2
   if {$count==$count2} {
    puts $xttfile "[expr $downpack + 1]"
   } else {
    puts $xttfile "$downpack"
   }
  }
 }
 close $xcpfile
 close $xttfile
 file delete $xcpackfile
 file rename $xtemp $xcpackfile
 file delete $xtemp  
 if {![file exists $xcbytefile]} {
  set xcbfile [open $xcbytefile w]
  puts $xcbfile "[lindex $temp 3]"
 } else {
  set xcbfile [open $xcbytefile r]
  set amount [gets $xcbfile]
  close $xcbfile
  incr amount [lindex $temp 3]
  set xcbfile [open $xcbytefile w]
  puts $xcbfile "$amount"
 }
 close $xcbfile
 incr xdccsend -1
 putlog "|XDCC SERVER| Successfully sent Pack #[lindex $temp 0] : [lindex $temp 2] to $nick"
 putserv "NOTICE $nick : $logo Successfully sent Pack #[lindex $temp 0] : [lindex $temp 2]"
}

proc xlosttransfer { handle nick path bytes lenght } {
 global logo xpacketsfile xdccsend
 set temp 0
 set xpfile [open $xpacketsfile r]
 while {![eof $xpfile] && [lindex $temp 1]!=$path} {
  set temp [gets $xpfile]
 }
 close $xpfile
 incr xdccsend -1
 putserv "NOTICE $nick : $logo An error occured when sending to you Pack #[lindex $temp 0] : [lindex $temp 2]"
 putserv "NOTICE $nick : For information the transfer was lost at position : $bytes of $lenght"
 putlog "|XDCC SERVER| |ERROR| An error occured when sending $nick Pack #[lindex $temp 0] : [lindex $temp 2] ($bytes/$lenght)"
}

proc xtimeout { handle nick path bytes lenght } {
 global logo xpacketsfile xdccsend
 set temp 0
 set xpfile [open $xpacketsfile r]
 while {![eof $xpfile] && [lindex $temp 1]!=$path} {
  set temp [gets $xpfile]
 }
 close $xpfile
 incr xdccsend -1
 putserv "NOTICE $nick : $logo Your request for Pack #[lindex $temp 0] : [lindex $temp 2] was timed out !!"
 putserv "NOTICE $nick : For information the transfer was timed out at position : $bytes of $lenght"
 putlog "|XDCC SERVER| |ERROR| Time out on send Pack #[lindex $temp 0] : [lindex $temp 2] to $nick ($bytes/$lenght)"
}

proc xdccsend { xfile nick } {
 global logo
 timer 1 processqueue
 set status [dccsend $xfile $nick]
 if {$status==2} {
  incr xdccsend -1 
  putserv "NOTICE $nick : $logo |ERROR| Unable to open a socket for the transfer"
  putlog "|XDCC SERVER| |ERROR| Unable to open a socket for the transfer to $nick"
 }
 if {$status==1} {
  incr xdccsend -1
  putserv "NOTICE $nick : $logo |ERROR| DCC Table Full (too many connections)"
  putlog "|XDCC SERVER| |ERROR| DCC Table full (too many connections) for $nick"
 }
 if {$status!=0} {
  incr xdccsend -1
  putserv "NOTICE $nick : $logo |ERROR| An error occured when trying to send you your requested package"
  putlog "|XDCC SERVER| |ERROR| An error occured when trying to send the requested package for $nick"
 }
}

proc processqueue {} {
 global xdccsend xqueues xqueuefile logo iso maxdcc processtime
 set xtemp "./scripts/xdcc.temp"
 if {$iso==0} {
  if {$xdccsend!=$maxdcc && $xqueues!=0} {
   set xqfile [open $xqueuefile r]
   set queueinfo [gets $xqfile]
   putserv "NOTICE [lindex $queueinfo 2] : $logo |[lindex $queueinfo 2]| Now sending you your requested package -|RESUME SUPPORTED|-"
   set size [xformatsize [lindex $queueinfo 1]]
   putlog "|XDCC SERVER| Now sending file [lindex $queueinfo 0] ($size) to [lindex $queueinfo 2]"
   incr xqueues -1
   incr xdccsend
   set xtfile [open $xtemp w]
   while {![eof $xqfile]} {
    set temp [gets $xqfile]
    if {$temp!=""} {
     puts $xtfile "$temp"
    }
   }
   close $xqfile
   close $xtfile
   file delete $xqueuefile
   file rename $xtemp $xqueuefile
   file delete $xtemp
   xdccsend [lindex $queueinfo 0] [lindex $queueinfo 2]
  } else {
   timer 1 processqueue
  }
 }
}

proc xrehash { rehash } {
 global iso xqueues xqueuefile maxqueue xchannelfile xdcctime xpacketsfile
 if {[file exists xqueuefile]} {
  set xqfile [open $xqueuefile r]
  while {![eof $xqfile]} {
   set temp [gets $xqfile]
   if {$temp!=""} {
    incr xqueues
   }
  }
  close $xqfile
  putlog "|XDCC SERVER| Restored queued files - Queue(s) : ($xqueues/$maxqueue)"
 } else {
  putlog "|XDCC SERVER| No queued files need to be restored"
 }
 if {[file exists $xchannelfile] && [file exists $xpacketsfile]} {
  set iso 0
  set dtime 0
  set xchfile [open $xchannelfile r]
  while {![eof $xchfile]} {
   set ch [gets $xchfile]
   if {$ch!=""} {
    timer $xdcctime+$dtime [list showxdcc $ch $dtime]
    incr dtime 3
   }
  }
  close $xchfile
  putlog "|XDCC SERVER| Restored timers on channel(s)..."
  processqueue
  putlog "|XDCC SERVER| Restarted queue processing..."
 } else {
  putlog "|XDCC SERVER| The server isn't running because no channel(s) is/are setup"
 }
}


# --------------------
# SERVER COMMANDS CODE
# --------------------


proc xstart { handle idx text } {
 global iso xqueuefile xqueues xdccsend xchannelfile xdcctime xpacketsfile
 set xqueues 0
 set xdccsend 0
 set dtime 0
 if {$iso==0} {
  putlog "|XDCC SERVER| The server is already started !"
 } else {
  if {[file exists $xchannelfile] && [file exists $xpacketsfile]} {
   incr iso -1
   if {[file exists $xqueuefile]} {
    file delete $xqueuefile
   }
   set xchfile [open $xchannelfile r]
   while {![eof $xchfile]} {
    set ch [gets $xchfile]
    if {$ch!=""} { 
     timer [expr $xdcctime+$dtime] [list showxdcc $ch $dtime] 
     incr dtime 3
    }
   }
   close $xchfile
   processqueue
   putlog "|XDCC SERVER| The server is now started !"
  } else {
   putlog "|XDCC SERVER| No channel setup and/or No packages offered !"
  }
 }
}

proc xstop { handle idx text } {
 global iso
 if {$iso!=0} {
  putlog "|XDCC SERVER| The server is already stopped !"
 } else {
  incr iso
  putlog "|XDCC SERVER| The server is now stopped !"
 }
}

proc xstatus { handle idx text} {
 global maxdcc maxqueue maxuserqueue logo ver author iso xqueues xdccsend xdcctime xpacketsfile xcbytefile xchannelfile
 set count 0
 set totcb 0
 putidx $idx "XDCC Server Status (to make changes on configuration edit xdcc.tcl)"
 putidx $idx "-------------------------------------------------------------------"
 putidx $idx " "
 if {$iso==0} {
  putidx $idx "The server is actually    : ON"
 } else {
  putidx $idx "The server is actually    : OFF"
 }
 putidx $idx "Server logo               : $logo"
 putidx $idx "Current queues            : $xqueues/$maxqueue"
 putidx $idx "Current sends             : $xdccsend/$maxdcc"
 if {[file exists $xpacketsfile]} {
  set xpfile [open $xpacketsfile r]
  while {![eof $xpfile]} {
   set temp [gets $xpfile]
   if {$temp!=""} {
    incr count
   }
  }
  close $xpfile
  putidx $idx "Offering                  : $count package(s)"
 } else {
  putidx $idx "Offering                  : No packages offered"
 }
 if {![file exists $xcbytefile]} {
  putidx $idx "Total transfered          : Nothing have been transfered yet"
 } else {
  set xcbfile [open $xcbytefile r]
  set totcb [gets $xcbfile]
  close $xcbfile
  set size [xformatsize $totcb]
  putidx $idx "Total transfered          : $size"
 }
 if {[file exists $xchannelfile]} {
  set xchfile [open $xchannelfile r]
  set ch [gets $xchfile]
  putidx $idx "Serving in                : $ch"
  while {![eof $xchfile]} {
   set ch [gets $xchfile]
   if {$ch!=""} {
    putidx $idx "                          : $ch"
   }
  }
  close $xchfile
 } else {
  putidx $idx "Serving in                : No channels have been setup"
 }
 putidx $idx " "
 putidx $idx "You are running XDCC Server version $ver by $author"
}

putlog "Loaded XDCC SERVER version $ver by $author"