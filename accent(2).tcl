# accent (18/07/2002)								#
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
# ACCENT.TCL est un script qui permet de corriger le bug des accents qu'on	#
# trouve trop souvent maintenant dans les eggdrops.				#
# Pour l'utiliser vous devez juste charger ce TCL.				#
# 										#
# Grand merci à Laetitia@IRCNet .. tu es le meilleur ;-)			#
# Merci aux soukiens ( #souk@IRCNet )						#
#										#
# Merci aux meilleurs scripts TCL (dans sa conception) : EGGNET			#
# ( http://eggnet.warpzone.org )						#
#										#
#################################################################################


##### DEBUT DU PROGRAMME #####


### puthelp

if {[info commands _puthelp] == ""} { 
	rename puthelp _puthelp
}

proc puthelp {arg} {
	catch { _puthelp [encoding convertfrom identity $arg] }
}



### putlog

if {[info commands _putlog] == ""} { 
	rename putlog _putlog
}


proc putlog {arg} {
	catch { _putlog [encoding convertfrom identity $arg] }
}



### putserv

if {[info commands _putserv] == ""} { 
	rename putserv _putserv
}

proc putserv {arg} {
	catch { _putserv [encoding convertfrom identity $arg] }
}



### putquick

if {[info commands _putquick] == ""} { 
	rename putquick  _putquick
}

proc putquick {arg} { 
	catch { _putquick [encoding convertfrom identity $arg] }
}



putlog "\0032ACCENT.TCL\003 (\0031318/07/2002\003) par Jarod_"