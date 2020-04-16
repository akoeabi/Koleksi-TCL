######## Gestion d'aliases (c) Lucas <lucas@eggdrop-fr.org> ########
# Ce script est distribué selon la licence qui peut être trouvée sur
# http://www.eggdrop-fr.org/licence.html . Respectez-là !
#
# Modes (à ajouter avec .chattr):
# F : readonly : pas d'ajout / suppression
# G : read/write : ajout/suppresion
# H : admin : sauvegarde/rechargement/tri
# Il faut CUMULER les flags (admin : F+G+H !)
#
# Historique
# 09/02/2001 - v. 1.3 * Un tout petit bug de corrigé : un espace en trop.
# 31/01/2001 - v. 1.2 * On peut déclencher plusieurs aliases avec une seule
# 			ligne en les écrivant à la suite. Pareil pour les
# 			destinataires. (merci lara pour l'idée)
# 			ex : !egg !dcc Lucas EggFR
# 			enverra :
# 			<Bot> Lucas, EggFR: <message de l'alias egg>
# 			<Bot> Lucas, EggFR: <message de l'alias dcc>
#                     * On peut envoyer les réponses en query (PRIVMSG) en
#                       utilisant § à la place de ! (au dessus du ! sur le
#                       clavier français)
#
# avant : memory lacks /-:

# version (à ne pas changer sauf si vous voulez frimer ...:=)
set v "1.3"

# nombre d'alias par ligne pour !aliaslist et !aliasfind
set aliasesperline 5

# nom du fichier contenant les aliases (ne pas le modifier directement !)
set aliasesfile "aliases.db"

# Liste des channels sur lequel le script doit être actif
set aliaseschans { #aide #opers }

###########################################################################
#################################### SCRIPT ###############################
###########################################################################

######### Fonctions qui modifient la DB

# Charge la DB (écrase la db précédemment chargée !)
proc aliases_load { } {
global aliasesdb aliasesfile
putlog "Aliases : Chargement de la DB"
set fichier [open $aliasesfile r]
gets $fichier aliasesdb
close $fichier
}

# Sauvegarde la DB (écrase la db précédemment sauvegardée !)
proc aliases_save { } {
global aliasesdb aliasesfile
putlog "Aliases : Sauvegarde de la DB"
set fichier [open $aliasesfile w]
puts $fichier $aliasesdb
close $fichier
}

# Trie le contenu de la db, par nom
proc aliases_sort { } {
global aliasesdb
putlog "Aliases : Triage de la DB"
set aliasesdb [lsort -ascii -index 0 $aliasesdb]
}

# Ajoute une entrée à la DB
proc aliases_add { nom auteur texte } {
global aliasesdb
putlog "Aliases : Ajout de $nom par $auteur : $texte"
lappend aliasesdb [list $nom $auteur $texte]
}

# Supprime une entrée de la db
proc aliases_del { index } {
global aliasesdb
putlog "Aliases : suppression de l'entrée $index"
set aliasesdb [lreplace $aliasesdb $index $index]
}

############## Fonctions qui ne modifient pas la DB

# Affiche le contenu de la db (attention : peut flooder)
proc aliases_disp { } {
global aliasesdb
return $aliasesdb
}

# Recherche une entrée dans la DB, retourne -1 si inconnue
proc aliases_search { nom } {
global aliasesdb
for { set i 0 } { $i<[llength $aliasesdb] } { incr i } {
   if ![string compare [string tolower [lindex [lindex $aliasesdb $i] 0]] [string tolower $nom]] {
      return $i
   }
}
return -1
}

# Recherche des entrées dans la DB selon un masque
proc aliases_advsearch { masque } {
global aliasesdb
set result ""
for { set i 0 } { $i<[llength $aliasesdb] } { incr i } {
   if [string match [string tolower $masque] [string tolower [lindex $aliasesdb $i]]] {
      lappend result [lindex $aliasesdb $i]
   }
}
return $result
}

# Retourne une entrée de la DB (uniquement le 3ème champ)
proc aliases_get { index } {
global aliasesdb
return [lindex [lindex $aliasesdb $index] 2]
}

# Retoune une entrée de la DB (tous les champs)
proc aliases_info { index } {
global aliasesdb
return [lindex $aliasesdb $index]
}

###### Interface DCC
bind dcc G +alias dcc:addalias
proc dcc:addalias { handle idx arguments } {
set nom [lindex $arguments 0]
set auteur $handle
set arguments [lrange $arguments 1 end]
if ([aliases_search $nom]!=-1) {
   putdcc $idx "Un alias de ce nom existe déjà"
} else {
   aliases_add $nom $auteur $arguments
   aliases_sort
   aliases_save
}
return 1
}

bind dcc G -alias dcc:rmalias
proc dcc:rmalias { handle idx arguments } {
set index [aliases_search [lindex $arguments 0]]
if ($index==-1) {
   putdcc $idx "Cet alias n'existe pas !"
} else {
   aliases_del $index
   aliases_save
}
return 1
}

bind dcc G chalias dcc:chalias
proc dcc:chalias { handle idx arguments } {
set index [aliases_search [lindex $arguments 0]]
if ($index==-1) {
   putdcc $idx "Cet alias n'existe pas !"
} else {
   set auteur "[lindex [aliases_info $index] 1];$handle"
   set nom [lindex $arguments 0]
   set arguments [lrange $arguments 1 end]
   aliases_del $index
   aliases_add $nom $auteur $arguments
   aliases_sort
   aliases_save
}
return 1
}

bind dcc F alias dcc:alias
proc dcc:alias { handle idx arguments } {
set index [aliases_search [lindex $arguments 0]]
if ($index==-1) {
   putdcc $idx "Cet alias n'existe pas !"
} else {
   putdcc $idx "[aliases_get $index]"
}
return 1
}

bind dcc F aliasinfo dcc:aliasinfo
proc dcc:aliasinfo { handle idx arguments } {
set index [aliases_search [lindex $arguments 0]]
if ($index==-1) {
   putdcc $idx "Cet alias n'existe pas !"
} else {
   set alias [aliases_info $index]
   putdcc $idx "Nom : [lindex $alias 0]"
   putdcc $idx "Auteur : [lindex $alias 1]"
   putdcc $idx "Texte : [lindex $alias 2]"
}
return 1
}

bind dcc F aliaslist dcc:aliaslist
proc dcc:aliaslist { handle idx arguments } {
set liste [aliases_disp]
putdcc $idx "Nom / Auteur / texte"
foreach alias $liste {
   putdcc $idx "[lindex $alias 0] / [lindex $alias 1] / [lindex $alias 2]"
}
return 1
}

bind dcc F aliasfind dcc:aliasfind
proc dcc:aliasfind { handle idx arguments } {
set liste [aliases_advsearch $arguments]
putdcc $idx "Nom / Auteur / texte"
foreach alias $liste {
   putdcc $idx "[lindex $alias 0] / [lindex $alias 1] / [lindex $alias 2]"
}
return 1
}

bind dcc H aliassave dcc:aliassave
proc dcc:aliassave { handle idx arguments } {
aliases_save
return 1
}

bind dcc H aliasload dcc:aliasload
proc dcc:aliasload { handle idx arguments } {
aliases_load
return 1
}

bind dcc H aliassort dcc:aliassort
proc dcc:aliassort { handle idx arguments } {
aliases_sort
return 1
}

# Interface channel
foreach aliaseschan $aliaseschans {
	bind pubm - "$aliaseschan !*" pubm:alias
	bind pubm - "$aliaseschan §*" pubm:alias
}
proc pubm:alias { nick uhost handle channel texte } {
set texte [join [split $texte]]
set texte [string trim $texte]
foreach mot $texte {
   if [onchan $mot $channel] {
      lappend destnicks $mot
   }
}
if [info exists destnicks] {
   set destnicksformat "[join [lsort -dictionary $destnicks] ", "]:"
   set destnicksformat2 [join [lsort -dictionary $destnicks] ","]
} else {
   set destnicksformat ""
   set destnicksformat2 ""
}
foreach mot $texte {
   if !([string compare [string index $mot 0] "!"]&&[string compare [string index $mot 0] "§"]) {
      set index [aliases_search [string range $mot 1 end]]
      if ($index!=-1) {
	 if ![string compare [string index $mot 0] "!"] {
	    if [string length $destnicksformat] {
               putserv "PRIVMSG $channel :$destnicksformat [join [aliases_get $index]]"
	    } else {
	       putserv "PRIVMSG $channel :[join [aliases_get $index]]"
	    }
	 } else {
	    if [string length $destnicksformat2] {
	       putserv "PRIVMSG $destnicksformat2 :[join [aliases_get $index]]"
	    }
	 }
      }
   }
}
return 1
}

foreach aliaseschan $aliaseschans {
	bind pubm - "$aliaseschan !aliaslist*" pubm:aliaslist
}
proc pubm:aliaslist { nick uhost handle channel texte } {
pubm:listeralias $nick [aliases_disp]
return 1
}

foreach aliaseschan $aliaseschans {
	bind pubm - "$aliaseschan !aliasfind*" pubm:aliasfind
}
proc pubm:aliasfind { nick uhost handle channel texte } {
if [llength $texte]>1 {
   set result [aliases_advsearch [lindex $texte 1]]
   if [llength $result] {
      pubm:listeralias $nick $result
   } else {
      puthelp "NOTICE $nick :Aucun alias trouvé pour [lindex $texte 1]"
   }
} else {
   puthelp "NOTICE $nick :!aliasfind <masque>"
}
return 1
}

# Proc affichant les alias sur une ligne, en notice
proc pubm:listeralias { nick liste } {
global aliasesperline
set longueur_liste [llength $liste]
for {
   set i 0
   set sortie ""
   set nbaliasline 0
} { $i<$longueur_liste } {
   incr i
   incr nbaliasline
} {
   if $nbaliasline==$aliasesperline {
      putserv "NOTICE $nick :$sortie"
      set nbaliasline 0
      set sortie ""
   }
   lappend sortie [lindex [lindex $liste $i] 0]
}  
if [llength $sortie] {
   putserv "NOTICE $nick :$sortie"
}
}

###########################################################################
################################ INITIALISATION ###########################
###########################################################################

# si le fichier n'existe pas, le créer
if ![file exists $aliasesfile] {
   set fichier [open $aliasesfile w]
   close $fichier
}

if ![info exists antirehashreloadaliasesdb] {
aliases_load
set antirehashreloadaliasesdb 1
}

putlog "Aliases v.$v par Lucas <lucas@eggdrop-fr.org> loaded"
