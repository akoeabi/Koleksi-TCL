set cprev "!"
##################################################################################
# VER and CSINFO/NSINFO
##################################################################################
set fromchan "NONE"
set cctarget "NONE"
set fromchancs "NONE"
set cctargetcs "NONE"
set fromchanns "NONE"
set cctargetns "NONE"
##################################################################################

bind pub - "${cprev}version" proc:version
bind pub - "${cprev}csinfo" proc:csinfo
bind pub - "${cprev}nsinfo" proc:nsinfo
bind ctcr - VERSION ctcr:version
bind notc - * notc:version

proc proc:version {nick uhost hand chan text} {
    global botnick fromchan cctarget
    if {[string tolower $nick] != [string tolower $botnick]} {
        set fromchan $chan
        set cctarget [lindex $text 0]
        putquick "PRIVMSG $cctarget :\001VERSION\001"
        return 1
    }
}

proc proc:csinfo {nick uhost hand chan text} {
    global botnick fromchancs cctargetcs
    if {[string tolower $nick] != [string tolower $botnick]} {
        set fromchancs $chan
        set cctargetcs [lindex $text 0]
        putquick "cs info $cctargetcs"
        return 1
    }
}

proc proc:nsinfo {nick uhost hand chan text} {
    global botnick fromchanns cctargetns
    if {[string tolower $nick] != [string tolower $botnick]} {
        set fromchanns $chan
        set cctargetns [lindex $text 0]
        putquick "ns info $cctargetns"
        return 1
    }
}

proc ctcr:version {nick uhost hand dest key arg} {
    global botnick fromchan cctarget
    if {($fromchan == "NONE") || ($cctarget == "NONE")} {return 0}
    if {[string tolower $nick] != [string tolower $botnick]} {
        putquick "PRIVMSG $fromchan :14(1$nick 14VERSION 15reply4!14) 1: \00314$arg\003"
        set fromchan "NONE"
        set cctarget "NONE"
        return 1
    }
}

proc notc:version {nick uhost hand text {dest ""}} {
    global botnick fromchan cctarget fromchancs cctargetcs fromchanns cctargetns
    if {$dest == ""} { set dest $botnick }
    if {($fromchan != "NONE") && ($cctarget != "NONE")} {
        if {([string tolower $nick] == [string tolower $cctarget]) && ([string match "*version*" [lindex [string tolower $text] 0]])} {
            putquick "PRIVMSG $fromchan :14(1$nick 14VERSION 15reply4!14) 1: \00314$text\003"
            set fromchan "NONE"
            set cctarget "NONE"
            return 1
        }
    }   
    if {($fromchancs != "NONE") && ($cctargetcs != "NONE")} {
        if {[string tolower $nick] == "chanserv"} {
            putquick "PRIVMSG $fromchancs :\00314$text\003"
            if {[string match "*end of info*" [zzstripcodes [string tolower $text]]]} {
                set fromchancs "NONE"
                set cctargetcs "NONE"
                return 1
            }
        }
    }
    if {($fromchanns != "NONE") && ($cctargetns != "NONE")} {
        if {[string tolower $nick] == "nickserv"} {
            putquick "PRIVMSG $fromchanns :\00314$text\003"
            if {[string match "*end of info*" [zzstripcodes [string tolower $text]]]} {
                set fromchanns "NONE"
                set cctargetns "NONE"
                return 1
            }
        }
    }
}

putlog "+++ sh4fira info TCL Loaded"