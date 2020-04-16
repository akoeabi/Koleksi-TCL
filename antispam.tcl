#############################################################
#                                                           #
#		http://www.centrosociale.net/               #
#                                                           #
#     Tcl scritta da masterix [team centrosociale.net]      #
#    Tcl bug fixati da d4ng3rus [team centrosociale.net]    #
#                                                           #
#                                                           #
#	         masterix@centrosociale.net                 #
#                                                           #
#   Ringraziamenti: d4ng3rus, A|ven, Voyager, Tr|b3, Pako   #
#                                                           #
#           Join: #Centrosociale    (IRCNet)                #
#                 #Giardini         (IRCNet)                #
#                                                           #
#              [TCL ITALIANA] - [ITALIAN TCL]               #
#                                                           #
#############################################################


# File in cui verranno salvate le impostazioni in caso di modifiche (relativo Anti-Spam Query)
set centrosociale(filesaveuno) "cs_spamsave1.conf"

# File in cui verranno salvate le impostazioni in caso di modifiche (relativo Anti-Spam con Send)
set centrosociale(filesavedue) "cs_spamsave2.conf"

# File in cui verranno salvate/lette le parole vietate (query spam)
set centrosociale(filenoword) "cs_spam_word.conf"

# File in cui verranno salvate/lette le estensioni o i files vietati (send spam)
set centrosociale(filenofile) "cs_spam_file.conf"

# File in cui verranno salvati/letti i canali in cui lo script deve funzionare
set centrosociale(filechanact) "cs_spam_chan.conf"

# Tempo previsto per l'aggiornamento dei file .conf (in secondi)
set centrosociale(aggiornamento) "1800"

# Tempo previsto per il cycle nei canali (in secondi)
set centrosociale(cycle) "1800"

if {![file exists "$centrosociale(filesaveuno)"]} {

# Anti-spam query status [0 = on] [1 = off]
set centrosociale(querystatus) 0

# Modo del ban [0 = globale] [1 = locale]
set centrosociale(queryban) 0

# Tipo di ban (Query):
#    1) *!*@host.dominio
#    2) *!ident@host.dominio
#    3) nick!*@host.dominio
#    4) nick!ident@host.dominio
#    5) *!?ident@*.host.dominio
set centrosociale(querytipoban) 1

# Durata del ban per spam in query (in minuti)
set centrosociale(querytempoban) "600"

} else {
	source $centrosociale(filesaveuno)
}

if {![file exists "$centrosociale(filesavedue)"]} {

# Anti-Spam con Send status [0 = on] [1 = off]
set centrosociale(sendstatus) 0

# Modo del ban [0 = globale] [1 = locale]
set centrosociale(sendban) 0

# Tipo di ban (Send):
#    1) *!*@host.dominio
#    2) *!ident@host.dominio
#    3) nick!*@host.dominio
#    4) nick!ident@host.dominio
#    5) *!?ident@*.host.dominio
set centrosociale(sendtipoban) 1

# Durata del ban per spam in query (in minuti)
set centrosociale(sendtempoban) "60"

} else {
	source $centrosociale(filesavedue)
}

bind dcc n|m spamsave cs:salvasetup:cmd
bind dcc n|m spamhelp cs:help
bind dcc n|m spaminfo cs:info
bind dcc n|m spamstato cs:stato
bind dcc n|m spammodban cs:modban
bind dcc n|m spamtipoban cs:tipoban
bind dcc n|m spamtempoban cs:tempoban
bind dcc n|m +spamquery cs:addspam:query
bind dcc n|m -spamquery cs:delspam:query
bind dcc n|m +spamsend cs:addspam:send
bind dcc n|m -spamsend cs:delspam:send
bind dcc n|m +nospam cs:addnospam
bind dcc n|m -nospam cs:delnospam
bind dcc n|m +spamchan cs:addspamchan
bind dcc n|m -spamchan cs:delspamchan
if {$centrosociale(querystatus) == 0} {
	bind msgm - * cs:spammer:check
	bind pubm - * cs:spammer:chan:check
}
if {$centrosociale(sendstatus) == 0} {
	bind ctcp - DCC cs:spammer:send:check
}


if {![info exists tempoon]} {
	set tempon 1
	utimer $centrosociale(aggiornamento) [split "cs:salvasetup $centrosociale(filesaveuno) $centrosociale(filesavedue)"]
}
if {![info exists cycletime]} {
	set cycletime 1
	utimer $centrosociale(cycle) [split "cs:effettua:ciclo"]
}

if {![file exists "$centrosociale(filenoword)"]} {
	set scrivi [open $centrosociale(filenoword) w]
	close $scrivi	
}

if {![file exists "centrosociale(filenofile)"]} {
	set scrivi [open $centrosociale(filenofile) w]
	close $scrivi	
}


if {![file exists "centrosociale(filechanact)"]} {
	set scrivi [open $centrosociale(filechanact) w]
	close $scrivi	
}

proc cs:effettua:ciclo {} {
	global centrosociale
	foreach canale [channels] {
		set puoipartare [cs:controlla:op $canale]
		if {$puoipartare != 1} {
			putserv "PART $canale :8,1 ***Ough...Yes..Ough..No!!** "
			putserv "JOIN $canale"
		} else {
			putlog "Centrosociale: Antispam: Impossibile fare il cycle su $canale. Sono l'unico @!!!"
		}
	}
	utimer $centrosociale(cycle) [split "cs:effettua:ciclo"]
}

proc cs:salvasetup:cmd {hand idx arg} {
	global centrosociale
	cs:salvasetup $centrosociale(filesaveuno) $centrosociale(filesavedue)
	putdcc $idx "Centrosociale: Antispam: Comando per il salvataggio inviato"
	return 0
}

proc cs:controlla:op {canale} {
	global botnick
	if {$canale == ""} {return 0}
	if {![onchan $botnick $canale]} {return 0}
	set totuser 0
	if {[isop $botnick $canale]} {set totuser 1}
	foreach nick [chanlist $canale] {
		if {[isop $nick $canale]} {
			if {$nick != $botnick} {incr totuser}
		}
	}
	if {$totuser == 1} {return 1} else {return $totuser}
}

proc cs:help {hand idx arg} {
	global centrosociale
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Sistema anti-spam by masterix "
		putdcc $idx " "
		putdcc $idx "   +- .spamhelp <comando>"
		putdcc $idx "   |- .spamsave"
		putdcc $idx "   |- .spaminfo <-query/-send>"
		putdcc $idx "   |- .spamstato <-query/-send> <on/off>"
		putdcc $idx "   |- .spammodban <-query/-send> <globale/locale>"
		putdcc $idx "   |- .spamtipoban <-query/-send> <1/2/3/4/5>"
		putdcc $idx "   +- .spamtempoban <-query/-send> <minuti>"
		putdcc $idx "   |- .+spamquery *parola*"
		putdcc $idx "   |- .-spamquery *parola*"
		putdcc $idx "   |- .+spamsend *file/est*"
		putdcc $idx "   +- .-spamsend *file/est*"
		putdcc $idx "   |- .+spamchan #canale"
		putdcc $idx "   +- .-spamchan #canale"
		putdcc $idx " "
		putlog "#$hand# Centrosociale: Antispam help"
		return 0
	} else {
		set tmparg [lindex [split $arg] 0]
		switch -exact $tmparg {
			"spamsave" {
				putdcc $idx " "
				putdcc $idx " Effettua un salvataggio forzato dei file contenenti i settaggi della tcl"
				putdcc $idx " I file in questione sono: "
				putdcc $idx "     - $centrosociale(filesaveuno)"
				putdcc $idx "     - $centrosociale(filesavedue)"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spamsave"
				return 0
			}
			"spaminfo" {
				putdcc $idx " "
				putdcc $idx "Comando che ci restituisce le informazioni relative al sistema scelto (ad esempio se ? on oppure off)."
				putdcc $idx "La sintassi ?:"
				putdcc $idx "  - .spaminfo -query (per le informazioni relative al sistema anti-spam in query)"
				putdcc $idx "  - .spaminfo -send (per le informazioni relative al sistema anti-spam sul send)"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spaminfo"
				return 0
			}
			"spamstato" {
				putdcc $idx " "
				putdcc $idx "Comando che ci consente di modificare lo stato del sistema."
				putdcc $idx "La sintassi ?:"
				putdcc $idx "  - .spamstato -query off (per disattivare protezione query)"
				putdcc $idx "  - .spamstato -query on (per attivare protezione query)"
				putdcc $idx "  - .spamstato -send off (per disattivare protezione send)"
				putdcc $idx "  - .spamstato -send on (per attivare protezione send)"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spamstato"
				return 0
			}
			"spammodban" {
				putdcc $idx " "
				putdcc $idx "Comando che ci consente di modificare il tipo del ban. Le scelte possibili sono: Globale e Locale."
				putdcc $idx "La sintassi ?:"
				putdcc $idx "  - .spammodban -query globale (per settare il tipo globale al query spam)"
				putdcc $idx "  - .spammodban -query locale (per settare il tipo locale al query spam)"
				putdcc $idx "  - .spammodban -send globale (per settare il modo globale al send spam)"
				putdcc $idx "  - .spammodban -send locale (per settare il modo locale al send spam)"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spammodban"
				return 0
			}
			"spamtipoban" {
				putdcc $idx " "
				putdcc $idx "Comando che ci consente di settare il modo del ban."
				putdcc $idx "Ban disponibili:"
				putdcc $idx "  1) *!*@host.dominio"
				putdcc $idx "  2) *!ident@host.dominio"
				putdcc $idx "  3) nick!*@host.dominio"
				putdcc $idx "  4) nick!ident@host.dominio"
				putdcc $idx "  5) *!?ident@*.host.dominio"
				putdcc $idx "La sintassi ?:"
				putdcc $idx "  - .spamtipoban -query <1/2/3/4/5>"
				putdcc $idx "  - .spamtipoban -send <1/2/3/4/5>"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spamtipoban"
				return 0
			}
			"spamtempoban" {
				putdcc $idx " "
				putdcc $idx "Comando che ci consente di settare la durata (in minuti) del ban."
				putdcc $idx "La sintassi ?:"
				putdcc $idx "  - .spamtempoban -query <minuti>"
				putdcc $idx "  - .spamtempoban -send <minuti>"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help spamtempoban"
				return 0
			}
			"+spamquery" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di aggiungere una parola/frase da bannare in query ed in chan"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .+spamquery *parola*"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help +spamquery"
				return 0
			}
			"-spamquery" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di eliminare una parola/frase da bannare in query ed in chan (dev'essere stata precedentemante aggiunga con il comando +spamquery)"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .-spamquery *parola*"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help -spamquery"
				return 0
			}
			"+spamsend" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di aggiungere un file/estensione da bannare in caso di dcc send"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .+spamsend *file/est*"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help +spamsend"
				return 0
			}
			"-spamsend" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di eliminare un file/estensione da bannare dcc send (dev'essere stata precedentemante aggiunga con il comando +spamsend)"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .-spamquery *file/est*"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help -spamsend"
				return 0
			}
			"+spamchan" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di aggiungere un canale nella lista dei canali in cui la tcl deve funzionare"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .+spamchan #canale"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help +spamchan"
				return 0
			}
			"-spamchan" {
				putdcc $idx " "
				putdcc $idx " Comando che ci consente di eliminare un canale nella lista dei canali in cui la tcl deve funzionare (deve essere un canale che in precedenza era stato aggiunto con +spamchan)"
				putdcc $idx " La sintassi ?:"
				putdcc $idx "   - .-spamchan #canale"
				putdcc $idx " "
				putlog "#$hand# Centrosociale: Antispam help -spamchan"
				return 0
			}
		}
		unset tmparg
		return 0
	}
	return 0
}

proc cs:info {hand idx arg} {
	global centrosociale
	set tipospam [lindex [split $arg] 0]
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spaminfo"
		putdcc $idx " "
		putlog "#$hand# Centrosociale: Antispam spaminfo \[errore\]"
	}
	if {$tipospam == "-query"} {
		putdcc $idx " "
		putdcc $idx " Sistema informativo dell'antispam per query"
		putdcc $idx " "
		if {$centrosociale(querystatus) == 0} {
			putdcc $idx "    +- Stato del sistema -> ON"
		} else {
			putdcc $idx "    +- Stato del sistema -> OFF"
		}
		putdcc $idx "    |- File di salvataggio -> $centrosociale(filesaveuno)"
		if {$centrosociale(queryban) == 0} {
			putdcc $idx "    |- Modo del ban -> Globale"
		} else {
			putdcc $idx "    |- Modo del ban -> Locale"
		}
		switch -exact $centrosociale(querytipoban) {
			"1" {
				putdcc $idx "    |- Tipo di ban -> *!*@host.dominio"
			}
			"2" {
				putdcc $idx "    |- Tipo di ban -> *!ident@host.dominio"
			}
			"3" {
				putdcc $idx "    |- Tipo di ban -> nick!*@host.dominio"
			}
			"4" {
				putdcc $idx "    |- Tipo di ban -> nick!ident@host.dominio"
			}
			"5" {
				putdcc $idx "    |- Tipo di ban -> *!?ident@*.host.dominio"
			}
		}
		putdcc $idx "    +- Durata del ban -> $centrosociale(querytempoban)"
		putdcc $idx " "
		putlog "#$hand# Centrosociale: Antispam spaminfo"
		return 0
	}
	if {$tipospam == "-send"} {
		putdcc $idx " "
		putdcc $idx " Sistema informativo dell'antispam per i send"
		putdcc $idx " "
		if {$centrosociale(sendstatus) == 0} {
			putdcc $idx "    +- Stato del sistema -> ON"
		} else {
			putdcc $idx "    +- Stato del sistema -> OFF"
		}
		putdcc $idx "    |- File di salvataggio -> $centrosociale(filesavedue)"
		if {$centrosociale(sendban) == 0} {
			putdcc $idx "    |- Modo del ban -> Globale"
		} else {
			putdcc $idx "    |- Modo del ban -> Locale"
		}
		switch -exact $centrosociale(sendtipoban) {
			"1" {
				putdcc $idx "    |- Tipo di ban -> *!*@host.dominio"
			}
			"2" {
				putdcc $idx "    |- Tipo di ban -> *!ident@host.dominio"
			}
			"3" {
				putdcc $idx "    |- Tipo di ban -> nick!*@host.dominio"
			}
			"4" {
				putdcc $idx "    |- Tipo di ban -> nick!ident@host.dominio"
			}
			"5" {
				putdcc $idx "    |- Tipo di ban -> *!?ident@*.host.dominio"
			}
		}
		putdcc $idx "    +- Durata del ban -> $centrosociale(sendtempoban)"
		putdcc $idx " "
		putlog "#$hand# Centrosociale: Antispam spaminfo"
		return 0
	}
	unset tipospam
	return 0
}

proc cs:stato {hand idx arg} {
	global centrosociale
	set tipospam [lindex [split $arg] 0]
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamstato"
		putdcc $idx " "
		return 1
	}
	if {$tipospam == "-query"} {
		set azione [lindex [split $arg] 1]
		if {$azione == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamstato"
			putdcc $idx " "
			putlog "#$hand# Centrosociale: Antispam spamstato \[errore\]"
			unset azione
			return 1
		} else {
			switch -exact $azione {
				"on" {
					if {$centrosociale(querystatus) == 1} {
						unset centrosociale(querystatus)
						set centrosociale(querystatus) 0
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query attivato"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam query attivato"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query gi? attivo"
						putdcc $idx " "
						return 1
					}
				}
				"off" {
					if {$centrosociale(querystatus) == 0} {
						unset centrosociale(querystatus)
						set centrosociale(querystatus) 1
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query disattivato"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam query disattivato"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query gi? inattivo"
						putdcc $idx " "
						return 1
					}
				}
			}
		}
		unset azione
		return 0
	}
	if {$tipospam == "-send"} {
		set azione [lindex [split $arg] 1]
		if {$azione == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamstato"
			putdcc $idx " "
			putlog "#$hand# Centrosociale: Antispam spamstato \[errore\]"
			unset azione
			return 1
		} else {
			switch -exact $azione {
				"on" {
					if {$centrosociale(sendstatus) == 1} {
						unset centrosociale(sendstatus)
						set centrosociale(sendstatus) 0
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send attivato"
						putdcc $idx " "
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send gi? attivo"
						putdcc $idx " "
						return 1
					}
				}
				"off" {
					if {$centrosociale(sendstatus) == 0} {
						unset centrosociale(sendstatus)
						set centrosociale(sendstatus) 1
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send disattivato"
						putdcc $idx " "
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send gi? inattivo"
						putdcc $idx " "
						return 1
					}
				}
			}
		}
		unset azione
		return 0
	}
	unset tipospam
	return 0
}

proc cs:modban {hand idx arg} {
	global centrosociale
	set tipospam [lindex [split $arg] 0]
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spammodban"
		putdcc $idx " "
		return 1
	}
	if {$tipospam == "-query"} {
		set azione [lindex [split $arg] 1]
		if {$azione == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spammodban"
			putdcc $idx " "
			unset azione
			return 1
		} else {
			switch -exact $azione {
				"globale" {
					if {$centrosociale(queryban) == 1} {
						unset centrosociale(queryban)
						set centrosociale(queryban) 0
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query ban globale"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam query ban globale"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query ban gi? globale"
						putdcc $idx " "
						return 1
					}
				}
				"locale" {
					if {$centrosociale(queryban) == 0} {
						unset centrosociale(queryban)
						set centrosociale(queryban) 1
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query ban locale"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam query ban locale"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam query ban gi? locale"
						putdcc $idx " "
						return 1
					}
				}
			}
		}
		unset azione
		return 0
	}
	if {$tipospam == "-send"} {
		set azione [lindex [split $arg] 1]
		if {$azione == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spammodban"
			putdcc $idx " "
			unset azione
			return 1
		} else {
			switch -exact $azione {
				"globale" {
					if {$centrosociale(sendban) == 1} {
						unset centrosociale(sendban)
						set centrosociale(sendban) 0
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send ban globale"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam send ban globale"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send ban gi? globale"
						putdcc $idx " "
						return 1
					}
				}
				"locale" {
					if {$centrosociale(sendban) == 0} {
						unset centrosociale(sendban)
						set centrosociale(sendban) 1
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send ban locale"
						putdcc $idx " "
						putlog "#$hand# Centrosociale: Antispam send ban locale"
						return 0
					} else {
						putdcc $idx " "
						putdcc $idx " Centrosociale: Antispam send ban gi? locale"
						putdcc $idx " "
						return 1
					}
				}
			}
		}
		unset azione
		return 0
	}
	unset tipospam
	return 0
}

proc cs:tipoban {hand idx arg} {
	global centrosociale
	set tipospam [lindex [split $arg] 0]
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamtipoban"
		putdcc $idx " "
		return 1
	}
	if {$tipospam == "-query"} {
		set tipoban [lindex [split $arg] 1]
		if {$tipoban == ""} {
			putdcc $idx " "
			putdcc $idx "Centrosociale: Antispam: Errore... scrivi .spamhelp spamtipoban"
			putdcc $idx " "
			return 1
		}
		switch -exact $tipoban {
			"1" {
				if {$centrosociale(querytipoban) != 1} {
					unset centrosociale(querytipoban)
					set centrosociale(querytipoban) 1
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query: *!*@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query gi? settato a: *!*@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"2" {
				if {$centrosociale(querytipoban) != 2} {
					unset centrosociale(querytipoban)
					set centrosociale(querytipoban) 2
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query: *!ident@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query gi? settato a: *!ident@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"3" {
				if {$centrosociale(querytipoban) != 3} {
					unset centrosociale(querytipoban)
					set centrosociale(querytipoban) 3
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query: nick!*@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query gi? settato a: nick!*@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"4" {
				if {$centrosociale(querytipoban) != 4} {
					unset centrosociale(querytipoban)
					set centrosociale(querytipoban) 4
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query: nick!ident@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query gi? settato a: nick!ident@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"5" {
				if {$centrosociale(querytipoban) != 5} {
					unset centrosociale(querytipoban)
					set centrosociale(querytipoban) 5
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query: *!?ident@*.host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban query gi? settato a: *!?ident@*.host.dominio"
					putdcc $idx " "
					return 0
				}
			}
		}
		unset tipoban
		return 0
	}
	if {$tipospam == "-send"} {
		set tipoban [lindex [split $arg] 1]
		if {$tipoban == ""} {
			putdcc $idx " "
			putdcc $idx "Centrosociale: Antispam: Errore... scrivi .spamhelp spamtipoban"
			putdcc $idx " "
			return 1
		}
		switch -exact $tipoban {
			"1" {
				if {$centrosociale(sendtipoban) != 1} {
					unset centrosociale(sendtipoban)
					set centrosociale(sendtipoban) 1
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send: *!*@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send gi? settato a: *!*@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"2" {
				if {$centrosociale(sendtipoban) != 2} {
					unset centrosociale(sendtipoban)
					set centrosociale(sendtipoban) 2
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send: *!ident@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send gi? settato a: *!ident@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"3" {
				if {$centrosociale(sendtipoban) != 3} {
					unset centrosociale(sendtipoban)
					set centrosociale(sendtipoban) 3
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send: nick!*@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send gi? settato a: nick!*@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"4" {
				if {$centrosociale(sendtipoban) != 4} {
					unset centrosociale(sendtipoban)
					set centrosociale(sendtipoban) 4
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send: nick!ident@host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send gi? settato a: nick!ident@host.dominio"
					putdcc $idx " "
					return 0
				}
			}
			"5" {
				if {$centrosociale(sendtipoban) != 5} {
					unset centrosociale(sendtipoban)
					set centrosociale(sendtipoban) 5
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send: *!?ident@*.host.dominio"
					putdcc $idx " "
					return 0
				} else {
					putdcc $idx " "
					putdcc $idx "Centrosociale: Antispam: Tipo di ban send gi? settato a: *!?ident@*.host.dominio"
					putdcc $idx " "
					return 0
				}
			}
		}
		unset tipoban
		return 0
	}
	unset tipospam
	return 0
}

proc cs:tempoban {hand idx arg} {
	global centrosociale
	set tipospam [lindex [split $arg] 0]
	if {$arg == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamtempoban"
		putdcc $idx " "
		return 1
	}
	if {$tipospam == ""} {
		putdcc $idx " "
		putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamtempoban"
		putdcc $idx " "
		return 1
	}
	if {$tipospam == "-query"} {
		set newtime [lindex [split 1 $arg] 1]
		if {$newtime == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamtempoban"
			putdcc $idx " "
			return 1
		} else {
			if {$centrosociale(querytempoban) == $newtime} {
				putdcc $idx " "
				putdcc $idx " Antispam: Il sistema prevede gi? un tempo di $centrosociale(querytempoban) minuti per lo spam in query"
				putdcc $idx " "
				return 1
			} else {
				unset centrosociale(querytempoban)
				set centrosociale(querytempoban) $newtime
				putdcc $idx " "
				putdcc $idx " Antispam: Il sistema ? stato settato per un ban di $centrosociale(querytempoban) minuti per lo spam in query"
				putdcc $idx " "
				return 1
			}
		}
		unset newtime
		return 0
	}
	if {$tipospam == "-send"} {
		set newtime [lindex [split 1 $arg] 1]
		if {$newtime == ""} {
			putdcc $idx " "
			putdcc $idx " Antispam: errore di sintassi... scrivi .spamhelp spamtempoban"
			putdcc $idx " "
			return 1
		} else {
			if {$centrosociale(sendtempoban) == $newtime} {
				putdcc $idx " "
				putdcc $idx " Antispam: Il sistema prevede gi? un tempo di $centrosociale(sendtempoban) minuti per lo spam in query"
				putdcc $idx " "
				return 1
			} else {
				unset centrosociale(sendtempoban)
				set centrosociale(sendtempoban) $newtime
				putdcc $idx " "
				putdcc $idx " Antispam: Il sistema ? stato settato per un ban di $centrosociale(sendtempoban) minuti per lo spam in query"
				putdcc $idx " "
				return 1
			}
		}
		unset newtime
		return 0
	}
	return 0
}

proc cs:salvasetup {query send} {
	global centrosociale
	set scrivi [open $query w]
		puts $scrivi "set centrosociale(querystatus) $centrosociale(querystatus)"
		puts $scrivi "set centrosociale(queryban) $centrosociale(queryban)"
		puts $scrivi "set centrosociale(querytipoban) $centrosociale(querytipoban)"
		puts $scrivi "set centrosociale(querytempoban) $centrosociale(querytempoban)"
	close $scrivi
	unset scrivi
	putlog "Centrosociale: Antispam: Aggiornamento file $query effettuato"
	set scrivi [open $send w]
		puts $scrivi "set centrosociale(sendstatus) $centrosociale(sendstatus)"
		puts $scrivi "set centrosociale(sendban) $centrosociale(sendban)"
		puts $scrivi "set centrosociale(sendtipoban) $centrosociale(sendtipoban)"
		puts $scrivi "set centrosociale(sendtempoban) $centrosociale(sendtempoban)"
	close $scrivi
	putlog "Centrosociale: Antispam: Aggiornamento file $send effettuato"
	utimer $centrosociale(aggiornamento) [split "cs:salvasetup $centrosociale(filesaveuno) $centrosociale(filesavedue)"]
	return 0
}

proc cs:addspam:query {hand idx arg} {
	global centrosociale
	set parola [lindex [split $arg] 0]
	if {$arg == "" || $parola == ""} {
		putdcc $idx "Centrosociale: Antispam: Errore di sintassi. .+spamquery *parola*"
		return 0
	} else {
		if {[strlen $arg] >= 3} {
			if {![file exists "$centrosociale(filenoword)"]} {
				set scrivi [open $centrosociale(filenoword) w]
					puts $scrivi "$parola"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunta parola ($parola) al sistema anti-spam in query"
			} else {
				set scrivi [open $centrosociale(filenoword) a]
					puts $scrivi "$parola"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunta parola ($parola) al sistema anti-spam in query"
			}
		} else {
			putdcc $idx "Centrosociale: Antispam: Errore il numero minimo di caratteri non e' stato raggiunto"
		}
	}
	return 0
}

proc cs:delspam:query {hand idx arg} {
	global centrosociale
	if {$arg == ""} {
		return 0
	}
	if {[file exists "$centrosociale(filenoword)"]} {
		set i 0
		set parole ""
		set leggi [open $centrosociale(filenoword) r]
			while {![eof $leggi]} {
				lappend parole [gets $leggi]
				incr i
			}
		close $leggi
		unset leggi
		set addparola [lindex [split $arg] 0]
		set scrivi [open $centrosociale(filenoword) w]
		foreach parola $parole {
			if {$parola != $addparola} {
				puts $scrivi "$parola"
			}
		}
		close $scrivi
		unset scrivi
		unset parola
		unset parole
		unset i
		putdcc $idx "Centosociale: Antispam: Eliminato $addparola dalla lista"
	} else {
		putdcc $idx "Centrosociale: Antispam: Errore... file: $centrosociale(filenoword) non trovato."
	}
	return 0
}

proc cs:addspam:send {hand idx arg} {
	global centrosociale
	set file [lindex [split $arg] 0]
	if {$arg == "" || $file == ""} {
		putdcc $idx "Centrosociale: Antispam: Errore di sintassi. .+spamsend *file/estensione*"
		return 0
	} else {
		if {[strlen $arg] >= 3} {
			if {![file exists "$centrosociale(filenofile)"]} {
				set scrivi [open $centrosociale(filenofile) w]
					puts $scrivi "$file"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunto $file al sistema anti-spam al send"
			} else {
				set scrivi [open $centrosociale(filenofile) a]
					puts $scrivi "$file"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunto $file al sistema anti-spam al send"
			}
		} else {
			putdcc $idx "Centrosociale: Antispam: Errore il numero minimo di caratteri non e' stato raggiunto"
		}
	}
	return 0
}

proc cs:delspam:send {hand idx arg} {
	global centrosociale
	if {$arg == ""} {
		return 0
	}
	if {[file exists "$centrosociale(filenofile)"]} {
		set i 0
		set files ""
		set leggi [open $centrosociale(filenofile) r]
			while {![eof $leggi]} {
				lappend files [gets $leggi]
				incr i
			}
		close $leggi
		unset leggi
		set addfile [lindex [split $arg] 0]
		set scrivi [open $centrosociale(filenofile) w]
		foreach filez $files {
			if {$filez != $addfile} {
				puts $scrivi "$filez"
			}
		}
		close $scrivi
		unset scrivi
		unset files
		unset filez
		unset i
		putdcc $idx "Centosociale: Antispam: Eliminato $addfile dalla lista"
	} else {
		putdcc $idx "Centrosociale: Antispam: Errore... file: $centrosociale(filenofile) non trovato."
	}
	return 0
}

proc cs:spammer:ban {uhost type} {
	global centrosociale
	switch $type {
		1 {set ban "*!*[string range $uhost [string first @ $uhost] e]"}
		2 {set ban "*[string range $uhost [string first ! $uhost] e]"}
		3 {
			set nick [string range $uhost 0 [expr [string first "!" $uhost]-1]]
			set ban "$nick!*[string range $uhost [string last "@" $uhost] e]"
		}
		4 {set ban $uhost}
		5 {set ban "*!?[string trimleft [string range $uhost [expr [string first ! $uhost]+1] e] "~"]"}
	}
	set cs(nick) [lindex [split $ban !] 0]
	set cs(ident) [string range $ban [expr [string first ! $ban]+1] [expr [string last @ $ban]-1]]
	set cs(host) [string range $ban [expr [string last @ $ban]+1] e]

	if {$cs(ident) != [set temp [string range $cs(ident) [expr [string length $cs(ident)]-9] e]]} {
		set cs(ident) *[string trimleft $temp *]
	}
	if {$cs(host) != [set temp [string range $cs(host) [expr [string length $cs(host)]-63] e]]} {
		set cs(host) *[string trimleft $temp *]
	}
	return $cs(nick)!$cs(ident)@$cs(host)
}

proc cs:aggiornalista:query {} {
	global centrosociale
	set i 0
	set parole ""
	set leggi [open $centrosociale(filenoword) r]
	while {![eof $leggi]} {
		lappend parole [gets $leggi]
		incr i
	}
	close $leggi
	unset leggi
	return $parole
}

proc cs:spammer:check {nick uhost hand args} {
	global centrosociale botnick
	if {[matchattr $hand nmf|mof] == 1} { return 0}
	foreach parola [cs:aggiornalista:query] {
		if {[string match $parola $args]} {
			newban [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(querytipoban)}] $botnick "Spammer"
		}
	}
	unset parola
	return 0
}

proc cs:spammer:chan:check {nick uhost hand chan args} {
	global centrosociale botnick
	set chanact [cs:listachan:attivi]
	if {[onchan $nick $chan] == 0} { return 0
	} elseif {[isop $nick $chan] != 0} { return 0
	} elseif {[isvoice $nick $chan] != 0} { return 0
	} elseif {[matchattr $hand nmf|nmof] == 1} { return 0
	} elseif {[lsearch -exact $chanact [string tolower $chan]] == "-1"} { return 0 }
	foreach parola [cs:aggiornalista:query] {
		if {[string match $parola $args]} {
			if {$centrosociale(queryban) == 0} {
				newban [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(querytipoban)}] $botnick "Spammer" $centrosociale(querytempoban)
				putlog "Centrosociale: Antispam: Bannato Spammer: $nick Spammava su: $chan"
			} else {
				if {($chanact == 0) || ([string match $chan $chanact])} {
					newchanban $chan [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(querytipoban)}] $botnick "Spammer" $centrosociale(querytempoban)
					if {![isop $botnick $chan]} {return 0}
					putserv "mode $chan -o+b $nick [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(querytipoban)}]"
					putserv "kick $chan $nick :Spammer"
					putlog "Centrosociale: Antispam: Bannato Spammer: $nick Spammava su: $chan"
				}
			}
		}
	}
	unset parola
	return 0
}

proc cs:aggiornalista:send {} {
	global centrosociale
	set i 0
	set files ""
	if {[file exists "$centrosociale(filenofile)"]} {
		set leggi [open $centrosociale(filenofile) r]
		while {![eof $leggi]} {
			lappend files [gets $leggi]
			incr i
		}
		close $leggi
		unset leggi
		return $files
	} else {return 0}
}

proc cs:listachan:attivi {} {
	global centrosociale
	set canali ""
	if {[file exists "$centrosociale(filechanact)"]} {
		set leggi [open $centrosociale(filechanact) r]
		while {![eof $leggi]} {
			lappend canali [gets $leggi]
		}
		close $leggi
		unset leggi
		if {$canali == ""} {return 0}
		return $canali
	} else {return 0}
}

proc cs:listachan:send {nick} {
	set canali ""
	foreach canale [channels] {if {[onchan $nick $canale]} {lappend canali $canale}}
	unset canale
	return $canali
}

proc cs:spammer:send:check {nick uhost hand dest key arg} {
	global centrosociale botnick
	set filesend [string tolower [lindex $arg 1]]
	set filesadd ""
	set chanact [cs:listachan:attivi]
	foreach filesadd [cs:aggiornalista:send] {
		if {[string match $filesadd $filesend]} {
			if {[matchattr $hand nmf|nmof] == 1} { return 0 }
			if {$centrosociale(sendban) == 0} {
				newban [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(sendtipoban)}] $botnick "Spammer" $centrosociale(sendtempoban)
				putlog "Centrosociale: Antispam: Bannato Spammer: $nick Inviava file: $filesend"
			} else {
				foreach canale [cs:listachan:send $nick] {
					if {($chanact == 0) || ([string match $canale $chanact])} {
						newchanban $canale [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(sendtipoban)}] $botnick "Spammer" $centrosociale(sendtempoban)
						if {![isop $botnick $canale]} {return 0}
						if {[isop $nick $canale] != 0} {return 0} elseif {[isvoice $nick $canale] != 0} {return 0}
						putserv "mode $canale -o+b $nick [cs:spammer:ban [join [split $nick!$uhost]] ${centrosociale(sendtipoban)}]"
						putserv "kick $canale $nick :Spammer"
						putlog "Centrosociale: Antispam: Bannato Spammer: $nick Inviava file: $filesend - Bannato da: $canale"
					}
				}
			}
		}
	}
	return 0
}

proc cs:addspamchan {hand idx arg} {
	global centrosociale
	set canale [lindex [split $arg] 0]
	if {$arg == "" || $canale == ""} {
		putdcc $idx "Centrosociale: Antispam: Errore di sintassi. .+spamchan #canale"
		return 0
	} else {
		if {[strlen $arg] >= 3} {
			if {![file exists "$centrosociale(filechanact)"]} {
				set scrivi [open $centrosociale(filechanact) w]
					puts $scrivi "$canale"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunto $canale ai canali attivi"
			} else {
				set scrivi [open $centrosociale(filechanact) a]
					puts $scrivi "$canale"
				close $scrivi
				unset scrivi
				putdcc $idx "Centrosociale: Antispam: Aggiunto $canale ai canali attivi"
			}
		} else {
			putdcc $idx "Centrosociale: Antispam: Errore il numero minimo di caratteri non e' stato raggiunto"
		}
	}
	return 0
}

proc cs:delspamchan {hand idx arg} {
	global centrosociale
	if {$arg == ""} {
		return 0
	}
	if {[file exists "$centrosociale(filechanact)"]} {
		set i 0
		set canali ""
		set leggi [open $centrosociale(filechanact) r]
			while {![eof $leggi]} {
				lappend canali [gets $leggi]
				incr i
			}
		close $leggi
		unset leggi
		set delchan [lindex [split $arg] 0]
		set scrivi [open $centrosociale(filechanact) w]
		foreach canale $canali {
			if {$delchan != $addchan} {
				puts $scrivi "$canale"
			}
		}
		close $scrivi
		unset scrivi
		unset canali
		unset canale
		putdcc $idx "Centosociale: Antispam: Eliminato $delchan dalla lista"
		unset delchan
	} else {
		putdcc $idx "Centrosociale: Antispam: Errore... file: $centrosociale(filechanact) non trovato."
	}
	return 0
}


putlog "Anti Spam"
putlog "antispam.tcl by masterix :> tcl caricata"

