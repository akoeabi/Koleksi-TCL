bind pub - "!week" get_week


proc get_week {nick uhost handle chan text} {

        putserv "privmsg $chan :We're currently in week [clock format [clock scan now] -format %V]."


  } 