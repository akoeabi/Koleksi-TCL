#awaycheck.tcl version 1.2
#.Created by...................................................
#......;%%%;:....I%%:..........................................
#....%O$II?$$$..;$$$$1:........................................
#...CD.......%X....X$$;............!D!.........................
#...C$.......;$8:..:%$$%C;:.......$$$%$:.......................
#...:$$;.......D4...%4%$$$$C:.....%..;$$I;.....................
#.....;$%DDC:..:S..:$I::X%$$:.....:::::8$$X;...................
#..!D:...:;C%%=....=$I.....::............$$$%:...........:C?;:.
#..C$$=......:$%:..S$;....C$%$;.....:8$$%::C$$I8$%S.....;$$$$$O
#..-$$$O;......%:..O$-......:$%$I...S$DS4$8:.D$$O=$$$:..C$D:!$%
#...;O$$$!....I%:..X$D:.....!$$$$$$=1$%-.%$$C.:$$8:-$$;:X%$OD%=
#.....I$$D!:.;%4...:%$S:....1$$;!4D$:?$D!.;%$:: X%D-;$8.:S$%;..
#.....:C$$$$$$%:....!%$$4...?$$-..:..:=$$$$$$?:::D$$$%$;::%$$$!
#.......:;XXC1........:;....:C$%........:CD8=:.....!%$$;.:.;=$4
#..............................................................
#..............................................................
#brought to you by strobe, anarkhos@anarchism.org
#Keeps a record of away messages of all users in all channels the bot is currently on
#Will WHOIS a user to determine if they are registered as away on their IRC server
#checks an ACTION for "*away*", "*back*", or "*log*"
#Will add and remove users from list, but not channels. Therefore rehash if bot joins/parts a new channel
#1.0 first release
#1.1 second release, duh
#1.2 added kick, how did I miss that?
#possible bug: if you swamp the script with mass join/leave like in a large split it may get confused

bind raw - 301 check_away
bind raw - 311 remove_away
bind join - * add_awayuser
bind part - * remove_awayuser
bind kick - * remove_awayuser
bind sign - * remove_awayuser
bind nick - * change_awayuser
bind ctcp - ACTION action_away


#global variables
set awaycheck_channels ""
set away_timer 3
set timer_present 0

#set timer
timer away_timer check_all

#EFnet servers do not keep away information of users on other servers
proc awaycheck { nick } {
putserv "WHOIS $nick $nick"
}

#for example on how to use:

#foreach sleeper [return_away $channel] {
#	putserv "NOTICE $nick :[lindex $sleeper 0] is away: [lindex [lrange $sleeper 1 end] 0]"
#}

#awaycheck tracks everybody including bots, so you may want to add a line like [matchattr [nick2hand [lindex $sleeper 0] $channel] b]

#this is an except from the greeting script I use for my channels:

#	foreach sleeper [return_away $channel] {
#		if { [matchattr [nick2hand [lindex $sleeper 0] $channel] b] } {
#		} else {
#			putserv "NOTICE $nick :[lindex $sleeper 0] is away: [lindex [lrange $sleeper 1 end] 0]"
#		}
#	}

######DO NOT EDIT BEYOND THIS LINE OR FACE THE WRATH OF STROBE######
 
foreach chan [channels] {
	set people ""
	foreach person [chanlist $chan] {
		lappend people [list $person "" ]
	}
	lappend awaycheck_channels [list $chan $people ]
}

foreach awaychan [channels] {
	foreach awaynick [chanlist $awaychan] {
		if { ![matchattr [nick2hand $awaynick $awaychan] b]} {
			awaycheck $awaynick
		}
	}
}

proc check_all {} {
	foreach awaychan [channels] {
		foreach awaynick [chanlist $awaychan] {
			if { ![matchattr [nick2hand $awaynick $awaychan] b]} {
				awaycheck $awaynick
			}
		}
	}
#reset timer
set timer_present 0
	foreach t [timers] {
		if { [lindex $t 1] == "check_all" } {
			set timer_present 1
		}
	}
	if {!$timer_present} {
		timer away_timer check_all
	}
}

proc awaycheck { nick } {
putserv "WHOIS $nick $nick"
}

proc action_away { nick uhost handle dest keyword test } {
	if { [string match "*away*" [string tolower $test] ] || [string match "*back*" [string tolower $test] ] || [string match "*log*" [string tolower $test] ] } {
		awaycheck $nick
	}
}

proc return_away { channel } {
global awaycheck_channels
set awaylist ""
	foreach chan $awaycheck_channels {
		if { [lindex $chan 0] == $channel } {
			foreach person [lindex $chan 1] {
				if { [lindex $person 1] != "" } {
					lappend awaylist $person
				}
			}
		}
	}
return $awaylist
}

proc remove_away { from keyword arg } {
global awaycheck_channels
set nick [lindex $arg 1]
	foreach chan $awaycheck_channels {
		set people ""
		foreach person [lindex $chan 1] {
			if { [lindex $person 0] == $nick } {
				lappend people [list [lindex $person 0] ""]
			} else {
				lappend people $person
			}
		}
		lappend awaychans [list [lindex $chan 0] $people]
	}
	set awaycheck_channels $awaychans
}

proc check_away { from keyword arg } {
global awaycheck_channels
set awaytext [string range [lrange $arg 2 end] 1 end]
set nick [lindex $arg 1]
	if { $awaytext != "" } {
		foreach chan $awaycheck_channels {
			set people ""
			foreach person [lindex $chan 1] {
				if { [lindex $person 0] == $nick } {
					lappend people [list [lindex $person 0] $awaytext]
				} else {
					lappend people $person
				}
			}
			lappend awaychans [list [lindex $chan 0] $people]
		}
		set awaycheck_channels $awaychans
	}
}

proc add_awayuser { nick uhost handle channel } {
awaycheck $nick
global awaycheck_channels
	foreach chan $awaycheck_channels {
		set people ""
		foreach person [lindex $chan 1] {
			lappend people $person
		}
		if { [lindex $chan 0] == $channel } {
			lappend people [list $nick "" ]
		}
		lappend awaychans [list [lindex $chan 0] $people]
	}
	set awaycheck_channels $awaychans
}

proc remove_awayuser { nick uhost handle channel args } {
global awaycheck_channels
	foreach chan $awaycheck_channels {
		set people ""
		foreach person [lindex $chan 1] {
			if { ([lindex $person 0] == $nick) && ([lindex $chan 0] == $channel) } {
			} else {
				lappend people $person
			}
		}
		lappend awaychans [list [lindex $chan 0] $people]
	}
	set awaycheck_channels $awaychans
}

proc change_awayuser { nick uhost handle channel newnick} {
global awaycheck_channels
	foreach chan $awaycheck_channels {
		set people ""
		foreach person [lindex $chan 1] {
			if { ([lindex $person 0] == $nick) && ([lindex $chan 0] == $channel) } {
				lappend people [list $newnick ""]
			} else {
				lappend people $person
			}
		}
		lappend awaychans [list [lindex $chan 0] $people]
	}
	set awaycheck_channels $awaychans
}
