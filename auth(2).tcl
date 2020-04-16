# auth (10/09/2002)								#
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
# AUTH.TCL permettant de s'identifier auprès du bot. Ce que j'utilise svt dans	#
# mes TCL. Il est donc indispensable pour certains TCL de mon site.		#
# Remarque : si vous utilisez plusieurs bots, vous pouvez prendre netcontrol.tcl#
# qui utilise une procédure identique mais qui permet de s'identifier auprès de #
# tous les bots d'un coup !							#
#										#
# Remarque : ce TCL a largement été inspiré par lol.tcl				#
#										#
#################################################################################




##### DEBUT DU PROGRAMME #####

bind nick - * chidentnick
bind sign - * deident
bind join - * joinident
bind kick - * kickident
bind rejn - * rejnident
bind msg -|- auth msg_auth


### /msg botnick auth <pass>

proc msg_auth {nick host hand arg} {
	set arg [charfilter $arg]
	global botnick
	if {[llength $arg] > 2} {return 0}
	set pass [lindex $arg 0]
	if {[passwdok $hand ""]} {
		puthelp "NOTICE $nick :Tu dois enregistrer un nouveau password: pass <your_Nouveau_password>"
		return 0
	}
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Usage:\002 auth <password>"
		return 0
	}
	if {[llength $arg] > 1} {
		if {[strlwr [lindex $arg 1]] != [strlwr $hand]} {
			return 0
		} {
			if {![passwdok $hand $pass]} {return 0}
		}
		puthelp "NOTICE $nick :Tu es deja reconnu par le bot :-)"
		return 0
	}
	if {![passwdok $hand $pass]} {
		puthelp "NOTICE $nick :Invalid password."
		puthelp "NOTICE $nick :\002Usage:\002 auth <password>"
		putlog "#AUTH# Mauvais password donné par $nick ( $hand )"
		return 0
	}
	if {[getuser $hand xtra auth] == "DEAD"} {
		puthelp "NOTICE $nick :Desole tu ne peux pas utiliser les commandes channel."
		return 0
	}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch]} {
			set find 1
			break
		}
	}
	if {!$find} {
		puthelp "NOTICE $nick :Tu dois être sur l'un de mes chans pour être identifie."
		return 0
	}
	setuser $hand xtra auth 1
	setuser $hand xtra authnick $nick
	set host [lindex [split $host "@"] 1]
	setuser $hand xtra authhost $host
	chattr $hand +3
	puthelp "NOTICE $nick : C'est bon je t'ai reconnu $nick ;-)"
	putlog "#AUTH# Authentification de $nick ( $hand ) OK"
	return 0
}

proc chidentnick {nick host hand chan Nouveaunick} {
	global botnick
	if {$hand == "*"} {return 0}
	if {[getuser $hand xtra auth] == 1} {
		if {[getuser $hand xtra authnick] == $nick} {
			setuser $hand xtra authnick $Nouveaunick
		}
	}
}

proc kickident {nick host hand chan kick arg} {
	global botnick
	if {$kick == $botnick} {
		foreach user [chanlist $chan] {
			set find 0
			foreach ch [channels] {
				if {[onchan $user $ch] && $ch != $chan} {
					incr find
				}
			}
			set userhand [nick2hand $user $chan]
			if {$userhand != "*"} {
				if {!$find} {
					if {[getuser $userhand xtra auth] != "DEAD"} {
						setuser $userhand xtra auth 0
					}
					chattr $userhand -3
				}
			}
		}
	}
	return 0
}

proc partident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {set find 1}
	}
	if {!$find} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc rejnident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {incr find}
	}
	if {!$find} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc joinident {nick host hand chan} {
	if {$hand == "*"} {return 0}
	set find 0
	foreach ch [channels] {
		if {[onchan $nick $ch] && $ch != $chan} {incr find}
	}
	if {!$find} {
		if {[getuser $hand xtra auth] != "DEAD"} {
			setuser $hand xtra auth 0
		}
		chattr $hand -3
	}
}

proc deident {nick host hand chan reason} {
	if {$hand == "*"} {return 0}
	if {[getuser $hand xtra auth] != "DEAD"} {
		setuser $hand xtra auth 0
	}
	chattr $hand -3
}

##### OUTILS


proc check {hand nick host} {
	if {[getuser $hand xtra auth] != "DEAD"} {
		set perm_host [getuser $hand xtra permident]
		if {[string match [strlwr $perm_host] [strlwr $nick!$host]]} {
			return 1
		}
	}
	set host [lindex [split $host "@"] 1]
	if {[getuser $hand xtra auth] == 1} {
		if {[getuser $hand xtra authnick] == $nick} {
			return 1
		}
	}
	return 0
}

proc charfilter {x {y ""} } {
	for {set i 0} {$i < [string length $x]} {incr i} {
		switch -- [string index $x $i] {
			"\"" {append y "\\\""}
			"\\" {append y "\\\\"}
			"\[" {append y "\\\["}
			"\]" {append y "\\\]"}
			"\} " {append y "\\\} "}
			"\{" {append y "\\\{"}
			default {append y [string index $x $i]}
		}
	}
	return $y
}

putlog "\0032AUTH.TCL\003 (\0031310/09/2002\003) par Jarod_"
