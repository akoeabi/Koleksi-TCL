# banchan (11/11/2003)								#
#################################################################################
#    ___          ___           ___           ___          _____    		#
#   /  /\        /  /\         /  /\         /  /\        /  /::\   		#
#  /  /:/       /  /::\       /  /::\       /  /::\      /  /:/\:\  		#
# /__/::\      /  /:/\:\     /  /:/\:\     /  /:/\:\    /  /:/  \:\ 		#
# \__\/\:\    /  /:/~/::\   /  /:/~/:/    /  /:/  \:\  /__/:/ \__\:|		#
#    \  \:\  /__/:/ /:/\:\ /__/:/ /:/___ /__/:/ \__\:\ \  \:\ /  /:/		#
#     \__\:\ \  \:\/:/__\/ \  \:\/:::::/ \  \:\ /  /:/  \  \:\  /:/ 		#
#     /  /:/  \  \::/       \  \::/~~~~   \  \:\  /:/    \  \:\/:/  		#
#    /__/:/    \  \:\        \  \:\        \  \:\/:/      \  \::/   		#
#    \__\/      \  \:\        \  \:\        \  \::/        \__\/    		#
#                \__\/         \__\/         \__\/                  		#
#										#
#										#
#					 ___					#
#  			     ___        /  /\                  			#
#  			    /  /\      /  /:/                  			#
#  			   /  /:/     /  /:/       ___     ___ 			#
#  			  /  /:/     /  /:/  ___  /__/\   /  /\			#
#  			 /  /::\    /__/:/  /  /\ \  \:\ /  /:/			#
# 			/__/:/\:\   \  \:\ /  /:/  \  \:\  /:/ 			#
# 			\__\/  \:\   \  \:\  /:/    \  \:\/:/  			#
# 			     \  \:\   \  \:\/:/      \  \::/   			#
# 			      \__\/    \  \::/        \__\/    			#
# 			                \__\/                  			#
#										#
#										#
#					web  : http://tcl.lagon-bleu.org	#
#					mail : jarod_angel@yahoo.fr		#
#					IRC  : Jarod_@IRCNet #buffy		#
#					       Asco@UNDERNet #tyranz		#
#										#
#################################################################################
#										#
# BANCHAN.tcl permet de kicker/bannir les personnes provenant d'un channel bien #
# précis.									#
# Le script vérifie on join et toutes les 5 mn si une personne est sur un chan	#
# interdit.									#
#										#
# Commandes :									#
# !addbanchan <#channel> : ajoute le #channel à la liste des BanChannels	#
# !delbanchan <#channel> : efface le #channel de la liste des BanChannels	#
# !banchan 		 : affiche la liste des BanChannels			#
#										#
#										#
#################################################################################


##### CONFIGURATION #####

### Le(s) channel(s) interdit(s) qui provoquerai(en)t une sanction
### (mettre des espaces entre les différents chans)
### cela sera ensuite géré dynamiquement par les commandes !addbanchan ou !delbanchan
### On peut ne rien mettre aussi au depart.
set chanban "#pasbeau #toto #truc"

### sur quel channel le script doit-il fonctionner (pour tous mettre "all")
### (mettre des espaces entre les différents chans) :
set channeldeban "all"

### Message du kick :
set kickm "Dehors !"

### ban de combien de temps (en minute) (si pas de ban mettre 0) :
set bantime "2"

### REMARQUE : après un .rehash ou un .restart, seule la liste marquée dans ce fichier
### restera, tous les autres channels ajoutés seront effacés !
### Cependant, si vous mettez la variable ci-dessous à 1, alors le bot ecrira la nouvelle
### liste directement dans ce fichier, donc pas d'effacement de BanChannel apres rehash !
set totomatike "1"

### indiquer le chemin et le nom du fichier tcl (par defaut : scripts/banchan.tcl) (que si totomatike à 1 !)
set pwdban "scripts/banchan.tcl"

##### FIN DE LA CONFIGURATION #####



##### DEBUT DU PROGRAMME #####

bind join - * join:bchan
bind pub o|o !banchan pub:banchan
bind pub o|o !addbanchan pub:addbanchan
bind pub o|o !delbanchan pub:delbanchan
bind time - "* * * * *" verif:banchan
bind raw - "319" raw:bwhois

proc pub:banchan {nick host hand chan arg} {
	global chanban channeldeban
	if { $channeldeban != "all" } {
		if {[lsearch -glob [string tolower $channeldeban] [string tolower $chan]] == -1 } {
			return 0
		}
	}
	set taille [llength $chanban]
	if {$taille == 0} {
		puthelp "notice $nick :Liste BanChannel Vide !"
		return 0
	}	
	puthelp "notice $nick :Les channels bannis sont : $chanban"
	return 0
}

proc pub:addbanchan {nick host hand chan arg} {
	global chanban channeldeban tablo var totomatike pwdban
	if { $channeldeban != "all" } {
		if {[lsearch -glob [string tolower $channeldeban] [string tolower $chan]] == -1 } {
			return 0
		}
	}
	if {[lsearch -exact $chanban [lindex $arg 0]] != -1} {
		puthelp "notice $nick :[lindex $arg 0] est deja defini comme un BanChannel !"
		return 0
	}
	if {$totomatike == 1} {
		set var 0
		set fd [open $pwdban r]
		while {[eof $fd] != 1} {
			set tablo($var) [gets $fd]
			if {[string range $tablo($var) 0 11] == "set chanban "} {
                                if {[lindex $tablo($var) 2] == " "} {
                                        set tablo($var) "set chanban \"$arg\""
                                } else {
                                        set tablo($var) [string trimright $tablo($var) \"]
                                        set tablo($var) "$tablo($var) [lindex $arg 0]\""
                                }
			}
			set var [expr $var + 1]
		}
		close $fd
		set fw [open $pwdban w+]
		set var [expr $var - 1]
		set i 0
		while {$i <= $var} {
			puts $fw $tablo($i)
			set i [expr $i + 1]
		}
		close $fw
	}
	set newbanchan [lindex $arg 0]
	lappend chanban $newbanchan
	puthelp "notice $nick :Ajout du BanChannel $newbanchan"
	putlog "#BANCHAN# Ajout du BanChannel $newbanchan"
	verif:banchan "00" "12" "02" "01" "02"
	return 0
}

proc pub:delbanchan {nick host hand chan arg} {
	global chanban channeldeban tablo var totomatike pwdban
	if { $channeldeban != "all" } {
		if {[lsearch -glob [string tolower $channeldeban] [string tolower $chan]] == -1 } {
			return 0
		}
	}
	set newchanban [lindex $arg 0]
	set ou [lsearch -exact $chanban $newchanban]
	if {$ou == -1} {
		puthelp "notice $nick :Aucun BanChannel de ce type !"
		return 0
	}
	set taille [llength $chanban]
	if {$taille == 0} {
		puthelp "notice $nick :Liste BanChannel Vide !"
		return 0
	}
	set chanban2 ""
	for { set i 0 } { $i < $taille } { incr i } {
		if {[lindex $chanban $i] != $newchanban} {
			lappend chanban2 [lindex $chanban $i]
		}
	}
	set chanselect ""
	if {$totomatike == 1} {
		set var 0
		set fd [open $pwdban r]
		while {[eof $fd] != 1} {
			set tablo($var) [gets $fd]
			if {[string range $tablo($var) 0 11] == "set chanban "} {
				set la [string trim [string range $tablo($var) 13 end] \"]
				for { set i 0 } { $i < [llength $la] } { incr i } {
					if {[lindex [split $la " "] $i] != $newchanban} {
						lappend chanselect [lindex [split $la " "] $i]
					}
				}
				regsub -all "\{" $chanselect "" chanselect
				regsub -all "\}" $chanselect "" chanselect
                                if {$chanselect == ""} {
                                        set tablo($var) "set chanban \" \""
                                } else {
                                        set tablo($var) "set chanban \"$chanselect\""
                                }

			}
			set var [expr $var + 1]
		}
		close $fd
		set fw [open $pwdban w+]
		set var [expr $var - 1]
		set i 0
		while {$i <= $var} {
			puts $fw $tablo($i)
			set i [expr $i + 1]
		}
		close $fw
	}
	set chanban $chanban2
	puthelp "notice $nick :Effacement du BanChannel $newchanban"
	putlog "#BANCHAN# Effacement du BanChannel $newchanban"
	return 0
}


proc join:bchan {nick host hand chan} {
	global channeldeban botnick
	if {(($channeldeban != "all") && ([lsearch -glob [string tolower $channeldeban] [string tolower $chan]] != -1)) || ($channeldeban == "all")} {
		if {$nick == $botnick} {
			return 0
		}
		if {![botisop $chan]} {
			return 0
		}
		if {($hand != "") && ($hand != "*")} {
			if {[validuser $hand]} {
				if {[matchattr $hand o|o $chan]} {
					return 0
				}
			}
		}
		putserv "WHOIS $nick"
	}
}

proc raw:bwhois {from key text} {
	global chanban kickm bantime channeldeban
	set nick [lindex $text 1]
	set host [getchanhost $nick]
	set chanban [string tolower $chanban]
	set onchans [string tolower [lindex [split $text :] 1]]
	foreach v $onchans {
		if {([string index $v 0] != "#") && ([string index $v 0] != "!") && ([string index $v 0] != "&")} {
			set v [string range $v 1 end]
		}
		if {[lsearch $chanban $v] != -1} {
			if {$channeldeban != "all"} {
				foreach ici $channeldeban {
					if {[onchan $nick $ici]} {
						putlog "#BANCHAN# BanChannel ($v) activé pour \002$nick ($host)\002 sur le channel \002$ici\002"
						set host [string trimleft $host ~]
						set chan $ici
						if { $bantime != "0" } {
							newchanban $chan [maskhost $nick!*$host] BanChan "BanChannel ($v) activé pour \002$nick ($host)\002 sur le channel \002$chan\002" $bantime
						}
						putserv "KICK $chan $nick :BanChannel ($v): $kickm"
					}
				}
				break
			} else {
				set host [string trimleft $host ~]
				foreach chan [channels] {
					if {[onchan $nick $chan]} {
						if { $bantime != "0" } {
							newchanban $chan [maskhost $nick!*$host] BanChan "BanChannel ($v) activé pour \002$nick ($host)\002 sur le channel \002$chan\002" $bantime
						}
						putserv "KICK $chan $nick :BanChannel ($v): $kickm"
						putlog "#BANCHAN# BanChannel ($v) activé pour \002$nick ($host)\002 sur le channel \002$chan\002"
					}
				}
				break
			}
		}
	}
	return 0
}

proc verif:banchan { min hour day month year } {
	global botnick channeldeban chanban
	set ok 1
	if {[lsearch "00 05 10 15 20 25 30 35 40 45 50 55" $min] != -1} {
		if {$channeldeban == "all"} {
			set sur [channels]
		} else {
			set sur $channeldeban
		}
		foreach channel $sur {
			if {[validchan $channel]} {
				if {[botisop $channel]} {
					foreach nick [chanlist $channel] {
						if {$nick != $botnick} {
							set hand [nick2hand $nick $channel]
							if {($hand != "") && ($hand != "*")} {
								if {[validuser $hand]} {
									if {[matchattr $hand o|o $channel]} {
										set ok 0
									}
								}
							}
							if {$ok == 1} {
								set host [getchanhost $nick $channel]
								putserv "WHOIS $nick"
							} else {
								set ok 1
							}
						}
					}
				}
			}
		}

	}
}

	
putlog "\0032BANCHAN.TCL\003 (\0031311/11/2003\003) par Jarod_"




