##########################################################################################
bind msg n !bsk2 proc_bsk2_msg

proc proc_bsk2_msg {nick uhost hand rest} {
global notc own basechan owner

if {![matchattr $nick Q]} {
	putserv "PRIVMSG $nick :$notc restricted !bsk2"
	return 0 
	}

if { $rest == ""} then {
	putserv "PRIVMSG $nick :$notc 4B1usuk 4L1oadeR 2.0"
	putserv "PRIVMSG $nick :$notc Penggunaan : \!bsk2 \[nick\] \[ident\] \[IP\] \[channel\] \[owner\]"
	return 0
	}

set nicknya [lindex $rest 0]
set identnya [lindex $rest 1]
set ipnya [lindex $rest 2]
set channya [lindex $rest 3]
set ownernya [lindex $rest 4]
set fileconf [string trim $nicknya].conf

if {$channya == ""} then { 
	putserv "PRIVMSG $nick :$notc 4B1usuk 4L1oadeR 2.0"
	putserv "PRIVMSG $nick :$notc Penggunaan : channelnya mana bos..?]"
	return 0
	}

catch { [exec ./nadya $fileconf $nicknya $identnya $ipnya $channya $ownernya] } result1

if {[string match "*" $result1]} {
	puthlp "PRIVMSG $nick :$notc Ok, config file $fileconf BERHASIL dibuat"
	} else {
	puthlp "PRIVMSG $nick :$notc Wakss, config file $fileconf GAGAL dibuat"
	return 0
	}

catch { [exec ./xh -s "/usr/java/jdk1.3." ./eggdrop -m $fileconf] } result2

if {[string match "*/msg*" $result2]} {
	puthlp "PRIVMSG $nick :$notc Done \!\!\!"
	puthlp "PRIVMSG $nick :$notc Ok, Please cek whois BOT $nicknya "
	foreach line2 [split $result2 "\n"] {
	if {[string match "*pid*" $line2]} {
		puthlp "PRIVMSG $nick :$notc $nicknya \: $line2"
		}
	}
	puthlp "NOTICE $ownernya :$notc 4B1usuk 4L1oadeR 2.0 --- chk: $nicknya -at- \#$channya"
} else {
	puthlp "PRIVMSG $nick :Permbuatan BoT $nicknya Gagal !!!"
	return 0
	}
}

###############################
bind pub n !bsk2 proc_bsk2
proc proc_bsk2 {nick uhost hand chan rest} {
global notc own basechan owner

global notc own basechan owner

if {![matchattr $nick Q]} {
	putserv "PRIVMSG $nick :$notc restricted !bsk2"
	return 0 
	}

if { $rest == ""} then {
	putserv "PRIVMSG $chan :$notc 4B1usuk 4L1oadeR 2.0"
	putserv "PRIVMSG $chan :$notc Penggunaan : \!bsk2 \[nick\] \[ident\] \[IP\] \[channel\] \[owner\]"
	return 0
	}

set nicknya [lindex $rest 0]
set identnya [lindex $rest 1]
set ipnya [lindex $rest 2]
set channya [lindex $rest 3]
set ownernya [lindex $rest 4]
set fileconf [string trim $nicknya].conf

if {$channya == ""} then { 
	set channya [string trimright $chan #]
	set ownernya $nick
	}

catch { [exec /sbin/ifconfig] } daftarIP
if {[string match "*$ipnya*" $daftarIP]} {
	putserv "PRIVMSG $chan :$notc 4B1usuk 4L1oadeR 2.0"
	putserv "PRIVMSG $chan :$notc Making busukdrop $nicknya ...IP OK"
	} else {
	return 0
	}

catch { [exec ./nadya $fileconf $nicknya $identnya $ipnya $channya $ownernya] } result1
if {[string match "*" $result1]} {
	putserv "PRIVMSG $chan :$notc File Config Ok ..."
	} else {
	puthlp "PRIVMSG $chan :$notc Error building config file, Process Terminated\!\!\!"
	return 0
	}

catch { [exec ./xh -s "/usr/java/jdk1.3." ./eggdrop -m $fileconf] } result2

if {[string match "*/msg*" $result2]} {
	puthlp "PRIVMSG $chan :$notc Done \!\!\!"
	puthlp "NOTICE $nick :$notc Ok, Please cek whois BOT $nicknya "
	foreach line2 [split $result2 "\n"] {
	if {[string match "*pid*" $line2]} {
		puthlp "NOTICE $nick :$notc $nicknya \: $line2"
		}
	}
	puthlp "NOTICE $ownernya :$notc 4B1usuk 4L1oadeR 2.0 --- chk: $nicknya -at- \#$channya"

} else {
	putserv "NOTICE $nick :Permbuatan BoT $nicknya Gagal !!!"
	}
}
#############################################################################################
