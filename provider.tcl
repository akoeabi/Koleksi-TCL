##########################################################
##########################################################
##   Info : This tcl is made for shell provider         ##
##   You can Add Staff, Del Staff, View Staff,          ##
##   View URL and View Uptime.                          ##
##                                                      ##
##   Programmer : AcADIeN on Efnet (#hands)             ##
##   Email : admin@tohands.org                          ##
##   Website : http://www.tohands.org                   ##
##########################################################
#Bugs from older version:                               ##
#   Uptime reply didn't do the right job                ##
##########################################################

# channel where it's working
set chan "#hands"

# backupfile is the place where the data will be save

set backupfile "/home/bubhold/eggdrop/provider.txt"

# URL

set urlstring "http://www.tohands.org"

set welcome "Yeah welcome to the world of yakuja (the hell is yakuja)"

# FLAG
# who can do the addcommand (give me a flag)

set adminflag "n"

# this is the command
# if you set the msg in dcc... the command will have a "." in front
# if you set it in PRIVATE MSG or CHANNEL... the command will have a "!" in front
# Like add if you set the addmsg in DCC... you have to use ".add" but if you set
# in PRIVATE or CHANNEL... you have to use "!add"
#
# understand?? if not well use another script

set addcommand "add"
set delcommand "del"
set uptimecommand "uptimebox"
set staffcommand "staff"
set urlcommand "url"

# addmsg,delmsg,uptimemsg,staffmsg and urlmsg is where the addcommand will work

# 0 = in DCC
# 1 = in PRIVATE MSG
# 2 = in CHANNEL

set addmsg "1"
set delmsg "1"
set uptimemsg "2"
set staffmsg "2"        
set urlmsg "2"      

# uptimereply,staffreply and urlreply is where the uptimecommand will reply
# Public option will do the same thing as PRIVATEMSG if the msg command (below) 
# is set to PRIVATE MSG
# 0 = in PRIVATE MSG
# 1 = in PRIVATE NOTICE
# 2 = Public 

set uptimereply "1"
set staffreply "1" 
set urlreply "1"
set joinreply "1"



################################################
#### DO NOT CHANGE ANYTHING AFTER THIS LINE ####
################################################
if {$addmsg == 0} {
  set addbind dcc
  set addcmd "$addcommand"
} elseif {$addmsg == 1} {
  set addbind msg
  set addcmd "!$addcommand"
} else {            
  set addbind pub
  set addcmd "!$addcommand"
}                       
bind $addbind $adminflag $addcmd add$addbind

if {$delmsg == 0} {
  set delbind dcc
  set delcmd "$delcommand"
} elseif {$delmsg == 1} {
  set delbind msg
  set delcmd "!$delcommand"
} else {            
  set delbind pub
  set delcmd "!$delcommand"
}                       
bind $delbind $adminflag $delcmd del$delbind

if {$uptimemsg == 0} {
  set uptimebind dcc
  set uptimecmd "$uptimecommand"
} elseif {$uptimemsg == 1} {
  set uptimebind msg
  set uptimecmd "!$uptimecommand"
} else {            
  set uptimebind pub
  set uptimecmd "!$uptimecommand"
}
bind $uptimebind - $uptimecmd uptime$uptimebind

if {$staffmsg == 0} {
  set staffbind dcc
  set staffcmd "$staffcommand"
} elseif {$staffmsg == 1} {
  set staffbind msg
  set staffcmd "!$staffcommand"
} else {            
  set staffbind pub
  set staffcmd "!$staffcommand"
}                       
bind $staffbind - $staffcmd staff$staffbind

if {$urlmsg == 0} {
  set urlbind dcc
} elseif {$urlmsg == 1} {
  set urlbind msg
  set urlcmd "!$urlcommand"
} else {            
  set urlbind pub
  set urlcmd "!$urlcommand"
}                       
bind $urlbind - $urlcmd url$urlbind

bind join - *!*@* joinmsg

proc adddcc {hand idx arg} {
  global backupfile addcmd
  if {$arg != ""} {
    set fsw [open $backupfile a+]
    puts $fsw "$arg"
    close $fsw
    putlog "$arg as been added"
  } else {
    putlog "You have to put something after $addcmd"
  }
  return 0
} 

proc addmsg {nick uhost hand arg} {         
  global backupfile addcmd
  if {$arg != ""} {
    set fsw [open $backupfile a+]
    puts $fsw "$arg"
    close $fsw
    putserv "PRIVMSG $nick :$arg as been added"
  } else {
    putserv "PRIVMSG $nick :You have to put something after $addcmd"
  }
  return 0
}

proc addpub {nick uhost handle channel arg} {
  global backupfile addcmd chan
  if {$chan == $channel} {
    if {$arg != ""} {
      set fsw [open $backupfile a+]
      puts $fsw "$arg"
      close $fsw
      putserv "PRIVMSG $channel :$arg as been added"
    } else {
      putserv "PRIVMSG $channel :You have to put something after $addcmd"
    }
  }
  return 0
}

proc rtnUptime { } {
  if {[catch {exec uptime} uptime]} { set uptime "Uptime is unavailable." }
  if {[catch {exec uname -sr} operating]} { set operating [unames] }
  if {[catch {exec hostname} host]} { set host [info hostname] }
  return "$host ($operating): $uptime"
}

proc uptimedcc {hand idx arg} {      
  putlog "Uptime for [rtnUptime]"
  return 0
}

proc uptimemsg {nick uhost hand arg} {
  global uptimereply
  if {$uptimereply == 0 || $uptimereply == 2} {
    putserv "PRIVMSG $nick :Uptime for [rtnUptime]"
  } else {
    putserv "NOTICE $nick :Uptime for [rtnUptime]"
  }
  return 0
}

proc uptimepub {nick uhost handle channel arg} {
  global uptimereply chan
  if {$chan == $channel} {
    if {$uptimereply == 0} {
      putserv "PRIVMSG $nick :Uptime for [rtnUptime]"
    } elseif {$uptimereply == 1} {
      putserv "NOTICE $nick :Uptime for [rtnUptime]"
    } else {
      putserv "PRIVMSG $channel :Uptime for [rtnUptime]"
    }
  }
  return 0
}

proc staffdcc {hand idx arg} {
  global backupfile
  set fs [open $backupfile r]
  putlog "Staff is :"
  while {![eof $fs]} {
    gets $fs line
    putlog "$line"
  }
  close $fs
  return 0
}
                                      
proc staffmsg {nick uhost hand arg} {
  global backupfile staffreply
  set fs [open $backupfile r]
  if {$staffreply == 0 || $staffreply == 2} {
    putserv "PRIVMSG $nick :Staff is :"
  } else {
    putserv "NOTICE $nick :Staff is:"
  }
  while {![eof $fs]} {
    gets $fs line
    if {$staffreply == 0 || $staffreply == 2} {
      putserv "PRIVMSG $nick :$line"
    } else {
      putserv "NOTICE $nick :$line"
    }
  }
  close $fs
  return 0
}

proc staffpub {nick uhost handle channel arg} {
  global backupfile staffreply chan
  if {$chan == $channel} {
    set fs [open $backupfile r]
    if {$staffreply == 0} {
      putserv "PRIVMSG $nick :Staff is :"
    } elseif {$staffreply == 1} {
      putserv "NOTICE $nick :Staff is:"
    } else {
      putserv "PRIVMSG $channel :Staff is:"
    }
    while {![eof $fs]} {
      gets $fs line
      if {$staffreply == 0} {
        putserv "PRIVMSG $nick :$line"
      } elseif {$staffreply == 1} {
        putserv "NOTICE $nick :$line"
      } else {
        putserv "PRIVMSG $channel :$line"
      }
    }
    close $fs
  }
  return 0
}

proc deldcc {hands idx arg} {
  global backupfile delcmd
  if {$arg != ""} {
    set infile [open $backupfile r]
    set outfile [open $backupfile.tmp w]
    set find 0 
    while {![eof $infile]} {
      gets $infile line
      if {![string match [string tolower $arg]* [string tolower $line]]} {
        puts $outfile $line      
      } else {
        set find 1 
      }
    }
    close $infile
    close $outfile   
    if {$find == 1} {            
      file rename -force $backupfile.tmp $backupfile
      putlog "$arg is deleted"
    } else {               
      putlog "$arg not found"               
    }
  } else {
    putlog "You have to put something after $delcmd"
  }
  return 0
}

proc delmsg {nick uhost hand arg} {
  global backupfile delcmd
  if {$arg != ""} {
    set infile [open $backupfile r]
    set outfile [open $backupfile.tmp w]
    set find 0 
    while {![eof $infile]} {
      gets $infile line
      if {![string match [string tolower $arg]* [string tolower $line]]} {
      puts $outfile $line      
      } else {
      set find 1 
      }
    }
    close $infile
    close $outfile   
    if {$find == 1} {            
      file rename -force $backupfile.tmp $backupfile
      putserv "PRIVMSG $nick :$arg is deleted"
    } else {               
      putserv "PRIVMSG $nick :$arg not found"               
    }
  } else {
    putserv "PRIVMSG $nick :You have to put something after $delcmd"
  }
  return 0
}

proc delpub {nick uhost handle channel arg} {
  global backupfile delcmd chan
  if {$chan == $channel} {
    if {$arg != ""} {
      set infile [open $backupfile r]
      set outfile [open $backupfile.tmp w]
      set find 0 
      while {![eof $infile]} {
        gets $infile line
        if {![string match [string tolower $arg]* [string tolower $line]]} {
          puts $outfile $line      
        } else {
          set find 1 
        }
      }
      close $infile
      close $outfile   
      if {$find == 1} {            
        file rename -force $backupfile.tmp $backupfile
        putserv "PRIVMSG $channel :$arg is deleted"
      } else {               
        putserv "PRIVMSG $channel :$arg not found"               
      }
    } else {
      putserv "PRIVMSG $channel :You have to put something after $delcmd"
    }
  }
  return 0
}
 
proc urldcc {hand idx arg} {           
  global urlstring
  putlog "The website is $urlstring"
  return 0
}

proc urlmsg {nick uhost hand arg} {
  global urlstring urlreply
  if {$urlreply == 0 || $urlreply == 2} {
    putserv "PRIVMSG $nick :The website is $urlstring"
  } else {
    putserv "NOTICE $nick :The website is $urlstring"
  }
  return 0
}

proc urlpub {nick uhost handle channel arg} {
  global urlstring urlreply chan
  if {$chan == $channel} {
    if {$urlreply == 0} {
      putserv "PRIVMSG $nick :The website is $urlstring"
    } elseif {$urlreply == 1} {
      putserv "NOTICE $nick :The website is $urlstring"
    } else {
      putserv "PRIVMSG $channel :The website is $urlstring"
    }
  }
  return 0
}

proc joinmsg {nick uhost hand channel} {
  global botnick joinreply welcome chan
  if {$chan == $channel} {
    if {$botnick != $nick} {
      if {$joinreply == 0} {
        putserv "PRIVMSG $nick :$welcome"
      } elseif {$joinreply == 1} {
        putserv "NOTICE $nick :$welcome"
      } else {
        putserv "PRIVMSG $channel :$welcome"
      }
    }
  }
}

putlog "provider.tcl v0.7.1 by AcADIeN (http://www.tohands.org)"
