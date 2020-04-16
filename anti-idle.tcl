# anti-idle (10/09/2002)							#
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
# ANTI-IDLE est un programme très simple qui evite que le bot est un temps	#
# d'idle trop grand ! Parfois les users ayant un idle time trop gd sont killés	#
# des servers ou par d'autres bots.						#
# 										#
#################################################################################


##### CONFIGURATION (optionnelle) #####

### défini les messages anti-idle :-)

set anti_idle_msg {
 {
  ". (anti-idle :-)"
 }
 {
  ".. (anti-idle : ouais le truc pour faire croire ke je suis pas un bot ;-)"
 }
}

### message anti-idle répété tous les combiens (en minute !)
set anti_idle_time 3600




##### DEBUT DU PROGRAMME #####

if {![string match "*time_anti_idle*" [timers]]} {
 timer $anti_idle_time time_anti_idle
}

proc time_anti_idle {} {
	global anti_idle_msg anti_idle_time botnick
	set anti_idle_rmsg [lindex $anti_idle_msg [rand [llength $anti_idle_msg]]]
	foreach msgline $anti_idle_rmsg {
		puthelp "PRIVMSG $botnick :[subst $msgline]"
		putlog "#ANTI-IDLE# OK"
	}
	if {![string match "*time_anti_idle*" [timers]]} {
		timer $anti_idle_time time_anti_idle
 	}
}


putlog "\0032ANTI-IDLE.TCL\003 (\0031310/09/2002\003) par Jarod_"

