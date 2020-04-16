##################################
# ce programme permet d'interdir certains mots sur un chan sinon la personne riske le kick
# puis le ban au bout de 3 kicks !
# Attention cepdt ce TCL crée parfois des pb chez les bots (surtt sous windows !)
##################################


############################################################################
# File Name   : badwords.tcl
# Author      : SOLaL <alain@antinea.org>
############################################################################

set bwLog "badwords.tcl"
set bwVersion "1.0b"
set bwCopyright "(c) 1999-2000 SOLaL <alain@antinea.org>"
set bwChan "#buffy"

# YOU SHOULDN'T MODIFY ANTYTHING BELOW THIS LINE
set bwRun 1
set bwArray() ""
set bwNumber 0
set bwFilename "badwordsfile.txt"

############################################################################
# MAIN proc
############################################################################
if { ![info exists bwLoaded] } {
	putlog "$bwLog (c) 2000 SOLaL <alain@antinea.org>"
	set bwLoaded 1
} else {
	putlog "$bwLog : Already loaded..."
}
# Load the badwords file into memory
if { [file exists $bwFilename] } {
	set fd [open $bwFilename r]
	while { ![eof $fd] } {
		set bwArray($bwNumber) [gets $fd]
		incr bwNumber
	}
	close $fd
}

############################################################################
# CONTROL proc
############################################################################
bind pub o|o !control bwControl
proc bwControl {nick uhost hand channel args} {
	global bwChan bwLog bwVersion bwCopyright bwRun
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	putserv "PRIVMSG $bwChan :$bwLog ($bwVersion) - $bwCopyright"
	return 0
}

############################################################################
# VER proc
############################################################################
bind pub o|o !ver bwVersion
proc bwVersion {nick uhost hand channel args} {
	global bwChan bwLog bwVersion bwCopyright bwRun
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	putserv "PRIVMSG $bwChan :$bwLog ($bwVersion) - $bwCopyright"
	return 0
}

############################################################################
# SURVEYpub proc
############################################################################
bind pubm - * bwSurveypub
proc bwSurveypub {nick uhost hand channel args} {
	global bwLog bwChan bwArray bwNumber bwRun
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	if { ([isop $nick $bwChan])||([matchattr $nick o|o $bwChan])||([isvoice $nick $bwChan]) } {
		return 0
	}
	
	set args [join $args]
	set args [string tolower $args]

	for {set i 0} {$i < $bwNumber} {incr i} {
		if { $bwArray($i) != "" } {
			set badw [join $bwArray($i)]
			set dummy ""
			if { [regsub -all "$badw" $args "" dummy] } {
				putlog "$bwLog KICK $nick because saying '$badw'"
				putserv "KICK $bwChan $nick :Mot interdit ($badw) !"
			}
		}
	}
	return 0
}

############################################################################
# SURVEYact proc
############################################################################
bind ctcp - ACTION bwSurveyact
proc bwSurveyact {nick uhost hand channel keyword args} {
	bwSurveypub $nick $uhost $hand $channel $args
	return 0
}

############################################################################
# LIST proc
############################################################################
bind pub o|o !lst bwList
proc bwList {nick uhost hand channel args} {
	global bwLog bwChan bwArray bwNumber bwRun
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	putlog "$bwLog $nick ($uhost) uses !lst"
	set txForbidden ""
	set nWords 0
	for {set i 0} {$i < $bwNumber} {incr i} {
		if { $bwArray($i) != "" } {
			set txForbidden "$txForbidden $bwArray($i)"
			incr nWords
		}
	}
	if { $nWords == 0 } {
		putserv "PRIVMSG $bwChan :Mots interdits : <liste vide>"
	} else {
		putserv "PRIVMSG $bwChan :Mots interdits :$txForbidden"
	}
	return 0
}

############################################################################
# ADD proc
############################################################################
bind pub o|o !add bwAdd
proc bwAdd {nick uhost hand channel args} {
	global bwLog bwChan bwArray bwNumber bwFilename bwRun
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	if { ![isop $nick $bwChan] } {
		return 0
	}
	if { $args == [list {}] } {
		putserv "PRIVMSG $bwChan :Mots interdits : usage is !add words"
		return 0
	}

	set args [string tolower $args]

	putlog "$bwLog $nick ($uhost) uses !add (word is : '$args')"
	for {set i 0} {$i < $bwNumber} {incr i} {
		if { $args == $bwArray($i) } {
			putserv "PRIVMSG $bwChan :Mots interdits : '$args' existe déjà"
			return 0
		}
	}
	set bwArray($bwNumber) "$args"
	incr bwNumber
	putserv "PRIVMSG $bwChan :Mots interdits : ajout de '$args'"
	bwWritefile
}

############################################################################
# DEL proc
############################################################################
bind pub o|o !del bwDel
proc bwDel {nick uhost hand channel args} {
	global bwLog bwChan bwArray bwNumber bwFilename
	set channel [string tolower $channel]
	if { $bwChan != $channel } {
		return 0
	}
	if { ![isop $nick $bwChan] } {
		return 0
	}
	if { $args == [list {}] } {
		putserv "PRIVMSG $bwChan :Mots interdits : usage is !del words"
		return 0
	}

	set args [string tolower $args]

	putlog "$bwLog $nick ($uhost) uses !del (word is : '$args')"
	for {set i 0} {$i < $bwNumber} {incr i} {
		if { $args == $bwArray($i) } {
			set bwArray($i) ""
		}
	}
	putserv "PRIVMSG $bwChan :Mots interdits : suppression de '$args'"
	bwWritefile
	return 0
}

############################################################################
# WRITEFILE proc
############################################################################
proc bwWritefile {} {
	global bwArray bwNumber bwFilename
	set fd [open $bwFilename w]
	for {set i 0} {$i < $bwNumber} {incr i} {
		if { $bwArray($i) != "" } {
			puts $fd "$bwArray($i)"
		}
	}
	close $fd
	return 0
}

