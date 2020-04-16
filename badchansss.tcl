###### Settings ########
set ::badchan(char) "~"

###### Der ordner "badchan" muss existieren ######
###### Wenn du ihn nicht selbst hinzufügen kannst mach das "#" vor der nächsten zeile weg... rehashe den bot, und mach es danach wieder hin ... und rehashe ein weiteres mal ######
# exec mkdir badchan

###### Badchannel file
set ::badchan(dir) "badchan/badchan"

###### Kickmsg file
set ::badchan(msgdir) "badchan/kickmsg"

###### Wenn der user diese flags hat wird er ignoriert ######
set ::badchan(irgnore) "mno"

###### Zeit des bans, wenn nichts anderes vom user eingestellt wurde ######
set ::badchan(bantime) "30"

###### Badchan kick reason ######
set ::badchan(reason) "The channel %badchan is badchannel in this channel."


bind pub nm|nm $::badchan(char)bad pub:badchan
bind join - * join:badchan

proc pub:badchan {nick host hand chan arg} {
	set option [string tolower [lindex $arg 0]]
	set chan [string tolower $chan]
	set badchan [string tolower [lindex $arg 1]]
	set type [string tolower [lrange $arg 2 3]]
	switch -- $option {
		set {
			if {$badchan != ""} {
				if {![string match "#?*" $badchan]} {
					set badchan "#$badchan"
				}
				if {$type == ""} {
					set ok 1
				} elseif {$type == "kick"} {
					set ok 1
				} elseif {[lindex $type 0] == "ban" && [isnumber [lindex $type 1]]} {
					set ok 1
				} else {
					set ok 0
				}
				if {$ok == 1} {
					addbadchan $chan $badchan $type
					if {$type != ""} {
						putserv "NOTICE $nick :Ok, \002$badchan\002 was added to the badchans. Settings: $type"
					} else {
						putserv "NOTICE $nick :Ok, \002$badchan\002 was added to the badchans."
					}
				} else {
					putserv "NOTICE $nick :Invalid type."
					putserv "NOTICE $nick :Types: kick, ban <time> (ex. ban 5)."
				}
			} else {
				putserv "NOTICE $nick :Syntax: $::lastbind set \[#badchan\] \[type\]"
				putserv "NOTICE $nick :Types: kick, ban <time> (ex. ban 5)."
			}
		}
		del {
			if {$badchan != ""} {
				if {![string match "#?*" $badchan]} {
					set badchan "#$badchan"
				}
				if {[delbadchan $chan $badchan]} {
					putserv "NOTICE $nick :Done, its removed."
				} else {
					putserv "NOTICE $nick :Error, $badchan not in list"
				}
			} else {
				putserv "NOTICE $nick :Syntax: $::lastbind del \[#badchannel\]"
			}
		}
		list {
			set list [getbadchans $chan]
			if {$list != ""} {
				putserv "PRIVMSG $chan :• Badchan list for \002$chan\002 •"
				foreach {chan1 chan2 chan3 chan4} $list { 
					putserv "PRIVMSG $chan :• \037$chan1\037 \037$chan2\037 \037$chan3\037 \037$chan4\037 •" 
				}
				putserv "PRIVMSG $chan :• End of list •"
			} else {
				putserv "PRIVMSG $chan :• No badchans listed. •"
			}
		}
		kickmsg {
			set kickmsg [join [lrange $arg 1 end]]
			if {$kickmsg != ""} {
				addkickmsg $chan $kickmsg
				putserv "NOTICE $nick :Done, kickmsg was set to: $kickmsg"
			} else {
				putserv "NOTICE $nick :Syntax: $::lastbind kickmsg \[kickmsg\]"
			}
		}
		default {
			putserv "NOTICE $nick :Syntax: $::lastbind set/del/list/kickmsg"
		}
	} 
}

proc join:badchan {nick host hand chan} {
	if {$nick != $::botnick} {
		if {![matchattr $hand $::badchan(irgnore)|$::badchan(irgnore) $chan]} {
			set ::bad(nick) $nick
			set ::bad(host) $host
			set ::bad(chan) $chan
			bind319
			putquick "WHOIS $nick"
		}
	}
}

proc badchan {from kex text} {
	unbind319
	if {[info exists ::bad(nick)]} {
		regexp -all -nocase {^[^\s]+[\s]([^\s]+)[\s]:(.*)} $text temp nick data
		set newdata ""
		foreach c $data {
			if {[string match "+*" $c] || [string match "@*" $c]} {
				lappend newdata [join [string range $c 1 end]]
			}
		}
		set data $newdata
		set chan [string tolower $::bad(chan)]
		set user [string tolower $::bad(nick)]
		set host [string tolower $::bad(host)]
		set data [string tolower $data]
		if {[string tolower $nick] == $user} {
			unset ::bad(nick)
			unset ::bad(chan)
			unset ::bad(host)
			set badchans [string tolower [getbadchans $chan]]
			foreach badchan $badchans {
				if {[lsearch $data $badchan] >= 0} {
					set type [getbadchantype $chan $badchan]
					set reason [getkickmsg $chan]
					if {$reason == "" || $reason == 0} {
						set reason $::badchan(reason)
					}
					regsub -all {%nick} $reason $nick reason
					regsub -all {%host} $reason $host reason
					regsub -all {%badchan} $reason $badchan reason
					regsub -all {%chan} $reason $chan reason
					if {$type == ""} {
						regsub -all {%bantime} $reason $::badchan(bantime) reason
						newchanban $chan *!$host "badchan" $reason $::badchan(bantime) none
					} elseif {$type == "kick"} {
						regsub -all {%bantime} $reason "-" reason
						putquick "KICK $chan $nick :$reason"
					} elseif {[lindex $type 0] == "ban"} {
						set bantime [lindex $type 1]
						regsub -all {%bantime} $reason $bantime reason
						newchanban $chan *!$host "badchan" $reason $bantime none
					}
					return 0
				}
			}
		}
	}
}

proc bind319 {} {
	bind raw - 319 badchan
}


proc unbind319 {} {
	bind raw - 319 badchan
}

proc getbadchans {chan} {
	set chan [string tolower $chan]
	set chans ""
	if {[file exists $::badchan(dir)]} {
		set fr [open $::badchan(dir) r]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] == $chan} {
					lappend chans [decrypt split [lindex $line 1]]
				}
			}
		}
		close $fr
	}
	return [join $chans]
}

proc getbadchantype {chan badchan} {
	set type ""
	if {[file exists $::badchan(dir)]} {
		set fr [open $::badchan(dir) r]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] == $chan && [decrypt split [lindex $line 1]] == $badchan} {
					set type "[lrange $line 2 3]"
					close $fr
					return $type				
				}
			}
		}
		close $fr
		return $type
	}
}

proc addbadchan {chan badchan type} {
	set chan [string tolower $chan]
	set badchan [string tolower $badchan]
	set type [string tolower $type]
	set done 0
	if {[file exists $::badchan(dir)]} {
		set fr [open $::badchan(dir) r]
		set fw [open $::badchan(dir).save a]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] != $chan} {
					puts $fw $line
				} elseif {[decrypt split [lindex $line 1]] != $badchan} {
					puts $fw $line
				} elseif {[decrypt split [lindex $line 0]] == $chan && [decrypt split [lindex $line 1]] == $badchan} {
					puts $fw "[lindex $line 0] [lindex $line 1] $type"
					set done 1
				}
			}
		}
		if {$done == 0} {
			puts $fw "[encrypt split $chan] [encrypt split $badchan] $type"
			set done 1
		}
		close $fr
		close $fw
		file delete $::badchan(dir)
		file rename $::badchan(dir).save $::badchan(dir)
		exec chmod 777 $::badchan(dir)
		return 1
	} else {
		set fw [open $::badchan(dir) w]
		puts $fw "[encrypt split $chan] [encrypt split $badchan] $type"
		close $fw
		return 1
	}	
}

proc addkickmsg {chan kickmsg} {
	set chan [string tolower $chan]
	set done 0
	if {[file exists $::badchan(msgdir)]} {
		set fr [open $::badchan(msgdir) r]
		set fw [open $::badchan(msgdir).save a]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] != $chan} {
					puts $fw $line
				} else {
					puts $fw "[lindex $line 0] [encrypt split $kickmsg]"
					set done 1
				}
			}
		}
		if {$done == 0} {
			puts $fw "[encrypt split $chan] [encrypt split $kickmsg]"
			set done 1
		}
		close $fr
		close $fw
		file delete $::badchan(msgdir)
		file rename $::badchan(msgdir).save $::badchan(msgdir)
		exec chmod 777 $::badchan(msgdir)
		return 1
	} else {
		set fw [open $::badchan(msgdir) w]
		puts $fw "[encrypt split $chan] [encrypt split $kickmsg]"
		close $fw
		return 1
	}	
}


proc getkickmsg {chan} {
	set msg ""
	if {[file exists $::badchan(msgdir)]} {
		set fr [open $::badchan(msgdir) r]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] == $chan} {
					set msg [decrypt split [lrange $line 1 end]]
					close $fr
					return $msg				
				}
			}
		}
		close $fr
		return $msg
	}
}

proc delbadchan {chan badchan} {
	set chan [string tolower $chan]
	set badchan [string tolower $badchan]
	set done 0
	if {[file exists $::badchan(dir)]} {
		set fr [open $::badchan(dir) r]
		set fw [open $::badchan(dir).save a]
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				if {[decrypt split [lindex $line 0]] != $chan} {
					puts $fw $line
				} elseif {[decrypt split [lindex $line 1]] != $badchan} {
					puts $fw $line
				} elseif {[decrypt split [lindex $line 0]] == $chan && [decrypt split [lindex $line 1]] == $badchan} {
					set done 1
				}
			}
		}
		close $fr
		close $fw
		file delete $::badchan(dir)
		file rename $::badchan(dir).save $::badchan(dir)
		exec chmod 777 $::badchan(dir)
		return $done
	} else {
		return 0
	}
}
