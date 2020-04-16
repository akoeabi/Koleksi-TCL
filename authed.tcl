namespace eval hiddenhost {

	namespace eval variable {
		variable account ""
		variable password ""
		variable usermodes "+ixr-ws"
		variable time 5
	}
	bind evnt - init-server [namespace current]::connect
	proc connect {type} {
		foreach channel [channels] {
			channel set $channel +inactive
		}
		[namespace current]::auth
		timer $::hiddenhost::variable::time [list [namespace current]::auth]
	}
	proc auth {} {
		putserv "AUTH $::hiddenhost::variable::account $::hiddenhost::variable::password"
		putserv "MODE $::botnick $::hiddenhost::variable::usermodes"
	}
	bind RAW - {396} [namespace current]::xhost
	proc xhost {f r a} {
		foreach c [channels] {
			channel set $c -inactive
		}
		foreach timer [timers] { 
			if {[string match -nocase "[lindex $timer 1]" "[namespace current]::auth"]} { 
				killtimer [lindex $timer 2]
			} 
		}
	}
}
putlog "\00304[string range [info script] 0 end]\00304 http://sp00fed.org \002loaded...\002"