##################### Advance Channel Greet v1.0 ######################
#
#
# Author : MeS - MeS@Hells.Ca - http://www.Hells.Ca
# Source DownLoad : http://www.mesloopy.net/ACG.zip
#
# Support Channels :  #EdenTech @Undernet.Org
#                     #Hells    @Hells.Ca
#                   
#                     
#
# *Description : Ce script permet de sender une notice informative et
# une notice de bienvenue. Au personnes qui joignent votre channel.
# Il recevrons une notice leur donnant l'url du channel et une autre 
# leur souhaitant la bienvenue.
# Ce script envoi aussi un query priver piocher au hazard dans une list
# lorsque une personne quit le channel.
# Il permet aussi d'utiliser la commande !Info pour avoir des
# informations compl�tent sur le channel.
#
# *Ce Script Est valabre pour 1 channel.
#
#
#######################################################################
#               La Configuration du script commence ici               #
#######################################################################

# Channel 1 ou le script doit agirs.
set channel "#kotagaul"

# Adresse web de votre channel.
set url "http://www.kotagaul.web.id"


# Formule de bienvenu au channel
set info {
    "Komunitas Chatter anak Gaul Indonesia"
}

# Le query que recoivent les gens en quittant.
set partmsg {
"mau kemana?... join lagi di #kotagaul yach "
"dah mau pergi yach?... byeeeee... jangan lupa join lagi di #kotagaul"
}

# Les informations qui suivent seront transmis par la commande !info.

# Seter ici une description de votre channel.
set description "Description du chan"

# Seter ici Le nick/nom du propri�taire du channel.
set owner "Propri�taire du channel"

# Seter ici le propri�taire de l'eggdrop en question.
set owner2 "Propri�taire du bot"

# Seter ici la notice on join que recevrons les users pour les 
# prevenirs que la commande !info Existe et leurs est disponible. Si 
# vous ne souhaiter pas qu'une notice soit communiquer laisser vide.

set infonotice "Votre-Notice"

#######################################################################
# NE TOUCHEZ PAS LES LIGNES QUI SUIVENT OU CELA POURAIT ENDOMAGER LE  #                        
# SCRIPT                                                              #
#######################################################################

set ACG(ver) "v1.0"

set siteinfo "0"
bind join - "$channel %" msg_jmsg
bind part - "$channel %" msg_pmsg

proc msg_pmsg {nick uhost hand channel args} {
    global partmsg siteinfo url
      if {$siteinfo == "0"} {
       putserv "PRIVMSG $nick :[do_part $args]"
    return 0
 }
      if {$siteinfo == "1"} {
       putserv "PRIVMSG $nick :Kunjungi : $url" 
       putserv "PRIVMSG $nick :[do_part $args]"
    return 0
 }
}

proc do_part {nick} {
   global partmsg
   set partoutput [lindex $partmsg [rand [llength $partmsg]]]
   return "$partoutput" 

}

proc msg_jmsg {nick uhost hand channel args} {
    global url 
       putserv "NOTICE $nick :Notre Siteweb: $url" 
       putserv "NOTICE $nick :[do_random $args]" 
    return 0
}

proc do_random {nick} {
   global info
   set output [lindex $info [rand [llength $info]]]
   return "$output" 

}

bind pub - !info pub_info

bind join - * join_tous
proc join_tous {nick host hand chan} {
global channel infonotice
if {$chan == "$channel"} {
puthelp "NOTICE $nick :$infonotice"
  }
}

proc pub_info {nick host hand chan args} {
global channel description url owner owner2
if {$chan == "$channel"} {
puthelp "NOTICE $nick :Description: $description"
puthelp "NOTICE $nick :URL du chan: $url"
puthelp "NOTICE $nick :Owner du Chan: $owner"
puthelp "NOTICE $nick :Owner de l'egg: $owner2"
  }
}

############### CopyRight 2003 : Hells.ca ###############

putlog "Advance Channel Greet. TCL by MeS - http://www.Hells.Ca loaded!"
