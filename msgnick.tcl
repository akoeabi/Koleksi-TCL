# Hadace messaging (uzeno.tcl v.1.5 ENG 2005.nov.08) #mfc.cs @ quakenet
# my TCL scripts are avaiable here: 
# http://mazsola.linuxteam.hu/tcl/
bind pub v|o "!msg" mess_do
bind pub o|o "!messages" mess_lista
bind pubm - * mess_join
bind time - "20 * * * *" mess_sort
bind pub v|o "!messaging" mess_info
bind msg v|o "!msg" mess_do_inmsg

set message_db "data/h_message.dat"
set message_whodid ""

proc mess_info {nick host hand chan arg} {
	puthelp "PRIVMSG $chan :Hadace messaging (uzeno.tcl v.1.5 2005.dec.03)"
	puthelp "PRIVMSG $chan :Recepients list: !messages"
	puthelp "PRIVMSG $chan :Leaving message: !msg <nick> <message>"
	puthelp "PRIVMSG $chan :This info: !messaging"
}

proc mess_sort {a c d e f} {
	global message_db
	set t_count [clock clicks -milliseconds]
	set filemuvelet [open $message_db r]
	set osszesuzenet ""
	while {![eof $filemuvelet]} {
		set konkretuzenet [gets $filemuvelet]
		if {[info exists konkretuzenet]&&$konkretuzenet!=""} {
			lappend osszesuzenet [split $konkretuzenet " "]
		}
	}
	close $filemuvelet
	set osszesuzenet [lsort -index 1 $osszesuzenet]
	set filemuvelet [open $message_db w]
	foreach konkretuzenet $osszesuzenet {
		puts $filemuvelet [join $konkretuzenet " "]
	}
	close $filemuvelet
	putlog "!message Done with sorting of data on the database ($message_db)->[expr double([clock clicks -milliseconds]-$t_count)/1000]s"
}
proc mess_do_inmsg {nick uhost hand rest} {
global botnick
putlog "mess_do_inmsg: $rest"
	set rest [split $rest " "]
	set cimzett [lindex $rest 0]
	if {$cimzett == ""} {
		puthelp "NOTICE $nick :The right format: /msg $botnick !msg <nick> <message>"
	} else {
		mess_write $nick $cimzett [lrange $rest 1 end] "MSG"
		puthelp "NOTICE $nick :Message for $cimzett accepted"
	}
}
proc mess_do {nick host hand chan args} {
	set args [lindex $args 0]
	set args [split $args " "]
	set cimzett [lindex $args 0]
	if {$cimzett == ""} {
		puthelp "NOTICE $nick :The right format: !msg <nick> <message>"
	} else {
		if {[onchan $cimzett $chan]} {
			set mwhom $cimzett
			set mmoo [finduser "*![getchanhost $mwhom $chan]"]
			if {[validuser $mmoo]} {
				set cimzett $mmoo
				#putlog "uj uzenet $cimzett botuser szamara"
			} else {
				#putlog "uj uzenet $cimzett nick szamara"
			}
		}
		mess_write $nick $cimzett [lrange $args 1 end] $chan
		puthelp "NOTICE $nick :Message for $cimzett accepted"
	}
}

proc mess_write { nick cimzett uzenet csatorna } {
	global message_db
	set cimzett [string tolower $cimzett]
	if {![file exists $message_db]} {
		file mkdir [lindex [split $message_db /] 0]
		set filemuvelet [open $message_db w+]
		puts $filemuvelet "Hadace !messaging database file created"
	} else {
		set filemuvelet [open $message_db a]
	}
	set systemTime [clock seconds]
	set ido [clock format $systemTime -format {%d.%m.%Y. %H.%M:}]
	puts $filemuvelet "$nick $cimzett $csatorna $ido [join $uzenet] "
	close $filemuvelet
}

#####################
proc mess_join { nick uhost hand chan args } {
	#puthelp "NOTICE HeyBaby : $nick $uhost $hand $chan $args"
	if {$hand != "*"} {
		set explain [string tolower $hand]
	} else {
		set explain [string tolower $nick]
	}
	global message_db message_whodid
	if {![info exists message_whodid]} {
		set message_whodid ""
	}
	set nick [string tolower $nick]
	set filemuvelet [open $message_db r]
	set osszesuzenet ""
	while {![eof $filemuvelet]} {
		gets $filemuvelet konkretuzenet
		set konkretuzenet [split $konkretuzenet " "]
		if {[string equal -nocase [lindex $konkretuzenet 1] $explain]} {
			lappend osszesuzenet [join $konkretuzenet " "]
		}
	}
	close $filemuvelet
	set count 0
	if {[llength $osszesuzenet]==1} {
		set uzente [split [lindex $osszesuzenet 0] " "]
		puthelp "PRIVMSG $nick :[lindex $uzente 0] says at [join [lrange [split [lindex $osszesuzenet 0] " "] 2 end]]"
		incr count
	} else {
		foreach konkretuzenet $osszesuzenet {
			incr count
			puthelp "PRIVMSG $nick :[lindex $konkretuzenet 0]\[${count}] says at [join [lrange [split $konkretuzenet " "] 2 end]]"
		} 
	}
	if {$count == 0} { 
	} else {
		lappend message_whodid [list $explain [string tolower $chan]]
		set explain [message_filterstr $explain]	;# Don't allow code to be executed
		set chan [message_filterstr $chan]	;# ensure []s are properly handled...
		mess_delete $explain
	}
}
###############################################x
proc message_filterstr { data } {
	regsub -all -- \\\\ $data \\\\\\\\ data
	regsub -all -- \\\[ $data \\\\\[ data	
	regsub -all -- \\\] $data \\\\\] data
	regsub -all -- \\\} $data \\\\\} data
	regsub -all -- \\\{ $data \\\\\{ data
	regsub -all -- \\\" $data \\\\\" data
	return $data
}

proc mess_delete { cimzett {remnum "all"}} {
	global message_db
	set cimzett [string tolower $cimzett]
	set filemuvelet [open $message_db r]
	set osszesuzenet ""
	set count 1
	if {$remnum == "all"} {
		while {![eof $filemuvelet]} {
			gets $filemuvelet konkretuzenet
			if {![string equal -nocase [lindex [split $konkretuzenet] 1] $cimzett]} {
				lappend osszesuzenet $konkretuzenet
			}
		}
	} else {
		while {![eof $filemuvelet]} {
			gets $filemuvelet konkretuzenet
			if {![string equal -nocase [lindex [split $konkretuzenet] 1] $cimzett] || ($count != $remnum && $remnum != -2)} {
				if {[info exists konkretuzenet]&&$konkretuzenet!=""} {
					lappend osszesuzenet $konkretuzenet
				}
				if {[string equal -nocase [lindex [split $konkretuzenet] 1] $cimzett]} {
				incr count
				}
			} else {
				incr count
			}
		}
	}
	close $filemuvelet
	set filemuvelet [open $message_db w]
	foreach konkretuzenet $osszesuzenet {
		puts $filemuvelet $konkretuzenet
	}
	close $filemuvelet
}

proc mess_lista {nick host hand chan args} { 
	global message_db
	putserv "NOTICE $nick :\[ Recepients list \]"
	set lista ""
	set filemuvelet [open $message_db r]
	while {![eof $filemuvelet]} {
		lappend lista [lindex [split [gets $filemuvelet] " "] 1]
	}
	close $filemuvelet
	foreach {a b c d e f g} [lsort -unique $lista] {
		putserv "NOTICE $nick :Recepients: $a $b $c $d $e $f $g"
	}
	putserv "NOTICE $nick :\[ end of the list \]" 
}
putlog "Hadace messaging (uzeno.tcl v.1.5 ENG 2005.nov.08) #mfc.cs @ quakenet loaded"