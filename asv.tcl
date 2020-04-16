## ASV - Made in france
## Renvoie l'asv d'un utilisateur ... le vrai s'il a été configuré, sinon aléatoirement :)
## 
## © Mo-Ize@IRCNet, www.ircites.net
## E-mail: mo-ize@ircites.net
set asv_version "2.0"
set asv_date "09 octobre 2001"
## FAI analysés: 
## wanadoo.fr (Câble, ADSL, RTC)
## chello.fr (Limoges, Lyon)
## videotron.ca (Hull, Québec, Montréal, Chicoutimi)
## sympatico.ca (Québec)
## 9tel.net
##

## NB: je n'ai pas eu la possibilité de tester tous les FAI à fond, certaines procédures
## ne sont là que grâce à mes logs, en particulier les FAI canadiens ...
## désolé des inconvénients. Si vous pouvez compléter les villes pour chello ou wanadoo,
## faites le moi savoir . mo-ize@ircites.net

##############################
##############################
########  MANUEL  ############
##############################
##############################
#1) Users autorisés:
# tous les utilisateurs qui ont un enregistrement dans la userlist du bot
#
#2) Pour voir l'asv d'un user
# dès que le bot voit "asv" dans une ligne, il cherche un nick surla même ligne
# et s'il n'entrouve pas, il prend celui de l'émetteur de la commande.
#
#3) L'asv renvoyé
# Si l'user repéré par le bot s'est configuré un asv, alors le bot renvoit cet asv,
# sinon il renvoit un asv plus ou moins aléatoire.
#
#4) Configurer son asv
# /MSG <botnick> SETASV <age> <sexe> <ville>
# par ex: /msg PtitBot setasv 18 m Paris
#
#5) Effacer son asv
# /MSG <botnick> SETASV
# (sans rien derrière)
##############################
##############################
##############################
##############################

bind pubm -|- "*asv*" asv_global
bind msg -|- "setasv" asv_set

#
# Mise en place des villes pour le tirage au sort
#

set asv_villes(fr) "Paris Paris Paris Paris Paris Paris Paris Paris Paris Paris Lyon Lyon Lyon Lyon Marseille Marseille Marseille Marseille Bordeaux Bordeaux Bordeaux Toulouse Toulouse Toulouse Lille Lille Lille Perpignan Béziers Montpellier Nîmes Arles Avignon Toulon Nice Monaco Ajaccio Bastia Grenoble Annecy Genève Saint-Etienne Roanne Clermont-Ferrand Limoges Brive-la-Gaillarde Agen Pau Tarbes Bayonne Angoulême Périgueux Poitiers La-Rochelle Nantes Nantes Angers Tours Orléans Auxerre Chalon-sur-Saône Besançon Belfort Mulhouse Colmar Strasbourg Nancy Metz Reims Valenciennes Arras Dunkerque Rouen Caen Brest Quimper Rennes Laval Chartres Fort-de-France Pointe-à-Pitre Cayenne Papeete"
set asv_villes(qc) "Montréal Montréal Montréal Montréal Montréal Québec Québec Québec Trois-Rivières Trois-Rivières Hull Sherbrooke Jonquière Chicoutimi Laval Port-Nouveau-Québec Port-Cartier"
set asv_villes(ca) $asv_villes(qc)
set asv_villes(be) "Bruxelles Bruxelles Bruxelles Charleroi Bruges Anvers Gand Mouscron Namur Liège Mons"
set asv_villes(ch) "Zürich Zürich Berne Berne Lausanne Lausanne Genève Genève Sion Neuchâtel Bâle Bâle Saint-Gall Coire Lucerne Délémont Bienne Soleure Lugano"
set asv_villes(lu) "Luxembourg Luxembourg Luxembourg Esch-sur-Alzette Differdange Dudelange Diekirch Grevenmacher Mondorf-les-Bains Bous Pétange"
set asv_villes(ma) "Casablanca Casablanca Casablanca Casablanca Casablanca Rabat Rabat Rabat Rabat Agadir Agadir Marrakech Marrakech Marrakech Fès Fès Fès Meknès Meknès Meknès Oujda Oujda Oujda Safi Safi El-Jadida El-Jadida Settat Settat Khouribga Khouribga Tanger Tanger Tétouan Tétouan La'Youne Berkane Nador Sefrou Taza Oued-Zem Beni-Mellal Khenifra Salé Kenitra Larache Chechaouen Ouezzane Taroudant Ouarzazate"
set asv_villes(ci) "Abidjan Abidjan Abidjan Abidjan Abidjan Yamoussoukro Yamoussoukro Daloa Daloa Bouaké Bouaké Gagnoa Korhogo Divo Abengourou Agboville Grand-Bassam Divo Man"

set asv_paysdispo [array names asv_villes]

#
# Procédures pour l'aléatoire
#

proc asv_ville_wanadoo_fr {host pays} {

	set lieu [lindex $host 0]
	set lieu [split $lieu "-"]
	set type [lindex $lieu 0]
	
	if {$type == "Mix"} {
		set ville [lindex $lieu 1]
	} elseif {[lindex $type 0] == "ca"} {
		set ville [string toupper [lindex $lieu 2] 0 0]
	} elseif {[string range $type 0 0] == "A"} {
		set ville [string range $type 1 end]
	} else {
		set ville [lindex $lieu 0] 
	}
	
	set lieu0(Tuileries) "Paris"
	set lieu0(Pastourelles) "Paris"
	set lieu0(Montsouris) "Paris"
	set lieu0(Plessis) "Paris"
	set lieu0(Ph) "Paris"
	set lieu0(Poncelet) "Paris"
	set lieu0(Boulogne) "Boulogne-Billancourt"
	set lieu0(LeMans) "Le Mans"
	set lieu0(FontenayssB) "Fontenay sous Bois"
	set lieu0(Clermont) "Clermont-Ferrand"
	set lieu0(Neuilly) "Noisy Le Grand"
	set lieu0(Ste) "Ste Geneviève des Bois"
	set lieu0(Velizy) "Versailles"
	
	if {[lsearch -exact [array names lieu0] $ville] >= 0} {
		set ville $lieu0($ville)
	}
	
	return $ville
}

proc asv_ville_chello_fr {host pays} {
	set lieuabr [string range [lindex $host 0] 0 2]
	
	set lieu(lim) "Limoges"
	set lieu(lyo) "Lyon"
	set lieu(cha) "Champigny"
	
	if {[lsearch -exact [array names lieu] $lieuabr] == -1} {
		set ville [asv_villeaupif $pays]			
	} else {
		set ville $lieu($lieuabr)
	}
}

proc asv_ville_videotron_ca {host pays} {
	set lieuabr [lindex $host end-3]
	
	set lieu(hull) "Hull"
	set lieu(que) "Québec"
	set lieu(timi) "Chicoutimi"
	set lieu(mtl) "Montréal"
	
	if {[lsearch -exact [array names lieu] $lieuabr] == -1} {
		return [asv_villeaupif $pays]
	} else {
		set ville $lieu($lieuabr)
	}
}

proc asv_ville_sympatico_ca {host pays} {
	set ville [lindex [split [lindex $host 0] "-"] 1]
	
	set lieu(QuebecCity) "Québec"
	
	if {[lsearch -exact [array names lieu] $lieuabr] >= 0} {
		set ville $lieu($ville)
	}
}

proc asv_ville_9tel_net {host pays} {
	set ville [string toupper [lindex [split [lindex $host 0] "-"] 0] 0 0]
}

proc asv_villeaupif {pays} {
	global asv_paysdispo
	if {[lsearch -exact $asv_paysdispo [string tolower $pays]] >= 0} {
		set pays [string tolower $pays]
	} else {
		set pays "fr"
	}	
	global asv_villes
	set ville [lindex $asv_villes($pays) [rand [llength $asv_villes($pays)]]]
	return $ville
}

#
# Procédure pour la configuration de l'asv.
#

proc asv_set {nick mask hand args} {
	set args [lindex $args 0]
	if {$args == ""} {
		if {![validuser $hand]} {
			putserv "PRIVMSG $nick :Désolé, mais vous n'avez pas de compte sur ce bot."
			putserv "PRIVMSG $nick :Contactez l'admin du bot pour qu'il vous en crée un."
			return 0
		}
		# on remplit les champs A S V
		setuser $hand XTRA ASV_A ""
		setuser $hand XTRA ASV_S ""
		setuser $hand XTRA ASV_V ""
		
		# on renvoit la confirmation à l'utilisateur
		putserv "PRIVMSG $nick :Votre asv a bien été effacé. Il en sera désormais renvoyé un au pif."
		
		# on log la commande ...
		return 1
	}		
		

	# testons si le nick est dans le bot
	if {![validuser $hand]} {
		putserv "PRIVMSG $nick :Désolé, mais vous n'avez pas de compte sur ce bot."
		putserv "PRIVMSG $nick :Contactez l'admin du bot pour qu'il vous en crée un."
		return 0
	}
	
	# verifions qu'il nous envoit un A S V valable
	if {![regexp -nocase "^\[0-9\]\[0-9\] \[m,f\] \[^0-9\]+$" $args]} {
		global botnick
		putserv "PRIVMSG $nick :\002SYNTAXE\002: /msg $botnick setasv <age> <M ou F> <Ville>\n\002Exemple\002: /msg $botnick setasv 23 M Le Mans"
		return 0
	}
	
	# on remplit les champs A S V
	setuser $hand XTRA ASV_A [lindex $args 0]
	setuser $hand XTRA ASV_S [string toupper [lindex $args 1]]
	setuser $hand XTRA ASV_V [string toupper [lrange $args 2 end] 0 0]
	
	# on renvoit la confirmation à l'utilisateur
	putserv "PRIVMSG $nick :Votre asv est configuré pour $args."
	
	# on log la commande ...
	return 1
}

#
# Proc principale, appelée par le déclenchement du bind.
#

proc asv_global {nick mask hand chan args} {
	set args [lindex $args 0]
	set nbmots [llength $args]
	set asv_tmp 0
	set testnick "&"
	
	while {![onchan $testnick $chan] && $asv_tmp < $nbmots} {
		set testnick [string trim [lindex $args $asv_tmp] "!?,)(.;:&"]
		incr asv_tmp 1
	}

	if {![onchan $testnick $chan] && $asv_tmp == $nbmots} {
		set testnick $nick
	}
	
		##### Si l'asv a déjà été configuré.
	if {[validuser [nick2hand $testnick]] && [getuser [nick2hand $testnick] XTRA ASV_A] != ""} {
		set testhand [nick2hand $testnick]
		set age [getuser $testhand XTRA ASV_A]
		set sexe [getuser $testhand XTRA ASV_S]
		set ville [getuser $testhand XTRA ASV_V]
		putserv "PRIVMSG $chan :L'ASV de \002$testnick\002 est \002$age $sexe $ville\002"
		return 1
	}
	
	set mask [getchanhost $testnick $chan]
	set sexes "M F"
	set age [expr {[rand 30] + 11}]
	set sexe [lindex $sexes [rand 2]]

	set host [split $mask "@"]
	set host [split [lindex $host 1] "."]
	set fai [lindex $host end-1]
	set pays [lindex $host end]
	
	if {[lsearch -exact [info procs "asv_ville_*"] [join "asv_ville_$fai _ $pays" ""]] != -1} {
		set ville [eval [join "asv_ville_$fai _ $pays" ""] {$host} $pays]
	} else {
		set ville [asv_villeaupif $pays]
	}
	
	putserv "PRIVMSG $chan :L'ASV de \002$testnick\002 est \002$age $sexe $ville\002"
	return 1
}

putlog "RANDASV $asv_version CHARGÉ ! --- $asv_date ---"
