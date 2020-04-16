########## Antiidle.tcl ######### 
set time-to-send 7
set uiversion "v1.0.0"
set anti-idle-msg "\[AntiIdle\]4Ard"

# How many min before each msg?
set idle-timer 10

# Idle msg?
set idle-msg "AntiKill By FroZeNiCK"

# END OF EDiT SECTION

set bowt-nick "$botnick"
set bowt-nick [string tolower ${nick}]
if {![info exists {antikill}]} {
 global bowt-nick idle-msg idle-timer
 set antikill 1
 timer ${idle-timer} antikill
}

proc antikill {} {
 global bowt-nick idle-msg idle-timer
 putserv "PRIVMSG ${bowt-nick} :${idle-msg}"
 timer ${idle-timer} antikill
}

# Channel to monitor
set channeldcc "*"
# Length of ban
set bantime 666

bind notc - "DCC Send*" archive_send

proc archive_send {nick uh hd text {dest ""}} {
        global channeldcc bmask botnick dcc_reason bantime
        putlog "$nick ($uh) Trying to send [lindex $text 2] Banned"
        set dcc_reason "$nick User Auto Sending [lindex $text 2]"
        newchanban $channeldcc [maskhost *$uh] $botnick $dcc_reason $bantime
        set dcc_reason "$nick User Auto Sending [lindex $text 2]"
        puthelp "notice $nick :Fuck Your Mother And Fuck Your Sister  Fuck And suck BOth Inf You Stolen My Bots."
        putserv "mode $channeldcc +b [maskhost *$uh] end]"
        putserv "KICK $channeldcc $nick :$dcc_reason"
        return 0
}

################## STARs AUTOUNNBAN #################
#setudef flag autounban
proc proc_unban_if_full {nick uhost hand chan type ban} {
        global botnick
        if {![isop $botnick $chan]} {return 1}
	if {([string match "* +autounban *" " [channel info $chan] "]) || ([llength [chanbans $chan]] >= 90)} {
	if {[llength [chanbans $chan]] >= 75} {
		putlog "6-=unban if full=- 7-=$chan=-"
		putserv "MODE $chan -k unban.if.ban.list.full"
		putserv "NOTICE $chan :autounban.if.ban.list.is.full.and.remove.ten.ban.list"
		set banup 0
		foreach bansHr [chanbans $chan] {
		 pushmode $chan -b [lindex $bansHr 0]
		 killchanban $chan [lindex $bansHr 0]
		 set banup [expr $banup + 1]
		 if {$banup >= 10} {return 0}
		}
	}
	}
}