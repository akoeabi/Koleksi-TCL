####################################################
#       aVote 1.1 by arcane (arc-76024@web.de)
#              (#k13, #Prophecy @euIRC)	
#
# Umfrageskript mit beliebigen Antwortm�glichkeiten
#
# Falls ihr mein Skript einsetzt, w�rde ich mich �ber
# eine kurze Nachricht freuen. :)
#
# F�r Hilfe:
#   /msg <botnick> vhelp
#
#   Der Syntax ist: "!vote <Zeit>|<Thema>|<Antworten>" (mit "|" dazwischen).
#     Die einzelnen Antwortm�glichkeiten werden dabei durch ":" getrennt.
#     z.B. "!vote 10m|Was ist eure Lieblingsfarbe? Oder habt ihr gar keine?|habe keine:gr�n:rot:gelb:blau"
#
#   Die Zeit wird in der folgenden Form angegeben:
#     xxm: xx Minuten; xxh: xx Stunden. Mischangaben mit m und h sind nicht m�glich.
#     z.B. "12m" f�r 12 Minuten, "24h" f�r 24 Stunden. "24h 30m" ist nicht erlaubt.
#   
#   Weitere Befehle:
#     "!vote" (ohne Argumente): Zeigt Informationen �ber die aktuelle / letzte Umfrage
#     Abgestimmt wird mit "/msg <botnick> vote <Antwort>"
#     Der Umfragestarter kann die Umfrage mit "!endvote" vorzeitig beenden.
#
#
# Features:
#
# - beliebige dynamische Antwortm�glichkeiten
# - Nachricht an alle, die noch nicht gew�hlt haben, beim Betreten des Channels
# - Hostmasken f�r W�hler (keine Mehrfach-Wahl)
# - keine Wahl �ber Bots
# - Abbruch der Umfrage durch den Starter
#
# ToDo:
#
# - mehrere Umfragen gleichzeitig
# - Erinnerung derjenigen, die noch nicht gew�hlt haben und away sind
# - Beschr�nkung auf bestimmte Gruppen (Ops, Voice...)
# - Kommentare zu den Umfragen?
# - frei definierbare Antworten (Umfragen ohne vorgegebene Antwortm�glichkeiten)
#
# Historie:
#
# - Version 1.0:  (10.02.2003)
#   - nur auf forum.egghelp.org ver�ffentlicht
#   - Erste Version
# - Version 1.1:  (19.02.2003)
#   - Dank stdragon ein paar Kleinigkeiten und einen m�glichen Fehler ausgebessert
#   - Anzeige des aktuellen Standes bei "!vote" und beim Joinen
#   - Syntax ge�ndert auf "!vote <Zeit>|<Thema>|<Antworten>"
#   - noch ein paar kosmetische �nderungen
#
#
# Dank an:
#
# - Loki` f�r sein Channel Voter Script 1.15
# - ppslim @forum.egghelp.org f�r seine unerm�dliche Hilfe
# - stdragon @forum.egghelp.org dass er das Skript nochmal durchgesehen hat  
####################################################

##################### Params #######################
set aversion "aVote 1.1b"
set vvotes "0"

##################### Bindings #####################
bind pub - ?vote avote_anyvote
bind msg - vhelp avote_help
bind msg - vote avote_vote
bind pub - ?endvote avote_end
bind join - * avote_reminder

##################### Remove old timers ############
if {![info exists vtopic]} {
	catch {
		killutimer $vtimer
	}
}

##################### AnyVote ######################
proc avote_anyvote {nick mask hand chan arg} {
global botnick vchan vnick vpeople vvotes vtopic vanswers vcount vtime aversion vtimestart vtimer vhand
	
	if {$arg == ""} {
		if {$vvotes == "0"} {
			puthelp "NOTICE $nick :Zur Zeit l�uft keine Umfrage."
			if {[info exists vtopic]} {
				puthelp "NOTICE $nick :Letzte Umfrage von $vnick:"
				puthelp "NOTICE $nick :\"$vtopic\""
				puthelp "NOTICE $nick :Endergebnis:"
				for {set number 0} {$number < [llength $vanswers]} {incr number} {
					puthelp "NOTICE $nick :\"[lindex $vanswers $number]\": [lindex $vcount $number]"
				}
			} else {
				puthelp "NOTICE $nick :Noch keine Umfragen gestartet."
			}
			return 0
		} else {
			puthelp "NOTICE $nick :Aktuelle Umfrage von $vnick:"
			puthelp "NOTICE $nick :\"$vtopic\""
			puthelp "NOTICE $nick :Aktueller Stand:"
			for {set number 0} {$number < [llength $vanswers]} {incr number} {
				puthelp "NOTICE $nick :\"[lindex $vanswers $number]\": [lindex $vcount $number]"
			}
			puthelp "NOTICE $nick :Verbleibende Zeit: [duration [expr (([unixtime] - $vtimestart) - $vtime) * -1]]"
			puthelp "NOTICE $nick :Abstimmen mit \"/msg $botnick vote <Antwort>\""
			return 0
		}
	} else { 
		if {$vvotes != 0} {	
			puthelp "NOTICE $nick :Es l�uft bereits eine Umfrage."
			return 0
		}

		set parts [split $arg "|"] 
		set time [lindex $parts 0] 
		set topic [lindex $parts 1] 
		set answers [split [lindex $parts 2] :]
		
		if {$time == "" || $topic == "" || [lindex $answers 0] == ""} {
			puthelp "NOTICE $nick :Der Syntax ist \"!vote <Zeit>|<Thema>|<Antworten>\" (mit \"|\" dazwischen)."
			puthelp "NOTICE $nick :Die einzelnen Antwortm�glichkeiten werden dabei durch \":\" getrennt."
			return 0
		}
		if {[lindex $answers 1] == ""} {
			puthelp "NOTICE $nick :Es m�ssen mindestens zwei Antwortm�glichkeiten gegeben werden."
			return 0
		}

		set vtimeleft $time
		if [string match "*m" [string tolower $vtimeleft]] {
			set vtime [expr [string trimright $vtimeleft m] * 60]
			set vtimestart [unixtime]
		} elseif [string match "*h" [string tolower $vtimeleft]] {
			set vtime [expr [string trimright $vtimeleft h] * 3600]
			set vtimestart [unixtime]
		} else {
			puthelp "NOTICE $nick :$time: Dies ist keine g�ltige Zeit (m: Minuten, h: Stunden)."
			return 0
		}

		set vchan $chan
		set vtopic $topic
		set vanswers $answers
		set vvotes "1"
		set vnick $nick
		set vhand $hand

		set vcount [list] 
		foreach answer $vanswers { 
			lappend vcount 0 
		}

		puthelp "PRIVMSG $vchan :\002Umfrage von $nick:"
		puthelp "PRIVMSG $vchan :\"$vtopic\""
		puthelp "PRIVMSG $vchan :M�gliche Antworten: [join $vanswers " : "]"
		puthelp "PRIVMSG $vchan :Dauer: $time"
		puthelp "PRIVMSG $vchan :Abstimmen mit \"/msg $botnick vote <Antwort>\""

		if {[info exists vpeople]} { unset vpeople }

		set vtimer [utimer $vtime "avote_end \"end of time\" 2 3 4 5"]
	}
}

##################### Vote #########################
proc avote_vote {nick mask hand arg} {
global botnick vchan vpeople vvotes vanswers vcount

	if {$vvotes == 0} {
		puthelp "NOTICE $nick :Es l�uft keine Umfrage."
		return 0
	}

	set mask [maskhost $mask]
	if {[matchattr $hand b]} {
		puthelp "NOTICE $nick :Keine Bots."
		puthelp "PRIVMSG $vchan :Jemand versucht �ber $nick abzustimmen!"
		return 0
	} elseif {[info exists vpeople($mask)]} {
		puthelp "NOTICE $nick :Du hast bereits abgestimmt."
		return 0
	} else {
		for {set number 0} {$number < [llength $vanswers]} {incr number} {
			if {[string tolower $arg] == [string tolower [lindex $vanswers $number]]} {
				puthelp "NOTICE $nick :Deine Stimme wurde gez�hlt ([string tolower $arg])."

				set vtemp [lindex $vcount $number]
				incr vtemp
				set vcount [lreplace $vcount $number $number $vtemp]
				
				set vpeople($mask) 1
				return 0
			}
		}
		puthelp "NOTICE $nick :$arg: keine g�ltige Antwort."
		puthelp "NOTICE $nick :M�gliche Antwort sind: [join $vanswers " : "]"
	}
}

##################### Help #########################
proc avote_help {nick mask hand arg} {
global botnick aversion

	puthelp "NOTICE $nick :$aversion by arcane - Hilfe"
	puthelp "NOTICE $nick :Der Syntax ist \"!vote <Zeit>|<Thema>|<Antworten>\" (mit \"|\" dazwischen)."
	puthelp "NOTICE $nick :Die einzelnen Antwortm�glichkeiten werden dabei durch \":\" getrennt."
	puthelp "NOTICE $nick :Die Zeit wird in der folgenden Form angegeben:"
	puthelp "NOTICE $nick :xxm: xx Minuten; xxh: xx Stunden. Mischangaben mit m und h sind nicht m�glich."
	puthelp "NOTICE $nick :Weitere Befehle:"
	puthelp "NOTICE $nick :/msg $botnick vhelp: Zeigt diese Hilfe"
	puthelp "NOTICE $nick :!vote (ohne Argumente): Zeigt Informationen �ber die aktuelle / letzte Umfrage"
	puthelp "NOTICE $nick :Abgestimmt wird mit /msg $botnick vote <Antwort>"	
	puthelp "NOTICE $nick :Der Umfragestarter kann die Umfrage mit !endvote vorzeitig beenden."
}

##################### Endvote ######################
proc avote_end {nick mask hand chan arg} {
global botnick vchan vnick vpeople vvotes vtopic vanswers vcount vtime vtimer vhand vtimestart
	
	if {$vvotes == 0} {
		puthelp "NOTICE $nick :Es l�uft keine Umfrage."
		return 0
	}	

	if {$chan == $vchan || $nick == "end of time"} {
		if {$hand != $vhand && $nick != "end of time"} {
			puthelp "NOTICE $nick :Nur der Umfragestarter kann die Umfrage vorzeitig beenden."
			return 0
		}
	
		if {$nick == "end of time"} {
			puthelp "PRIVMSG $vchan :Umfrage von $vnick zum Thema $vtopic beendet (Zeit abgelaufen)."
		} else {
			puthelp "PRIVMSG $vchan :Umfrage von $vnick zum Thema $vtopic beendet von $nick."
		}
		puthelp "PRIVMSG $vchan :Ergebnis:"
		for {set number 0} {$number < [llength $vanswers]} {incr number} {
			puthelp "PRIVMSG $vchan :\"[lindex $vanswers $number]\": [lindex $vcount $number]"
		}

		set vvotes "0"
		
		catch {
			killutimer $vtimer
		}
		if {[info exists vpeople]} { unset vpeople }
	}
}

##################### OnJoin Reminder ##############
proc avote_reminder {nick mask hand chan} {
global botnick vchan vnick vpeople vvotes vtopic vanswers vcount vtime vtimestart

	if {![info exists vchan]} {
		return 0
	}

	set mask [maskhost $mask]
	if {$chan == $vchan && [info exists vpeople($mask)] == 0 && $vvotes != 0} {
		puthelp "NOTICE $nick :Es l�uft eine Umfrage von $vnick"
		puthelp "NOTICE $nick :\"$vtopic\""
		puthelp "NOTICE $nick :Aktueller Stand:"
		for {set number 0} {$number < [llength $vanswers]} {incr number} {
			puthelp "NOTICE $nick :\"[lindex $vanswers $number]\": [lindex $vcount $number]"
		}
		puthelp "NOTICE $nick :Verbleibende Zeit: [duration [expr (([unixtime] - $vtimestart) - $vtime) * -1]]"
		puthelp "NOTICE $nick :Abstimmen mit \"/msg $botnick vote <Antwort>\""
	}
}

##################### Log Message ##################
putlog "\0033$aversion loaded"