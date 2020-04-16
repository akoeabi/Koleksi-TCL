##########################################################################
#  Crée par NeO_DeStrucToR.  Copyright 2005 :: Tous droits résèrvés.     #
#                                                                        #
#               E-mail :  neo_destructor@ucool.org                       #
#                                                                        #
#      _   _   ____   ____   ____   _   _   ____   ____   _____          #
#     | | | | |  __| | __ | | __ | | | | | | __ | / ___| |__ __|         #
#     | | | | | |    ||  || ||  || | |_| | ||  || | \__    | |           #
#     | | | | | |    ||  || ||  || |  _  | ||  || \__  |   | |           #
#     | |_| | | |__  ||__|| ||__|| | | | | ||__||  __) |   | |           #
#     |_____| |____| |____| |____| |_| |_| |____| |____/   |_|           #
#                                                                        #
##########################################################################
                       ##########################
                       ##                      ##
                       ##      ASSIGN.TCL      ##
                       ##                      ##
                       ##########################

#############
# Les binds #
#############

bind msg - assign assign
bind msg - unassign unassign
bind pub - !help listemsg

#############
# Les procs #
#############

proc listemsg {nick host hand args} {
global botnick

putquick "NOTICE $nick :Voici la liste des commandes privées relatives à $botnick :"
putquick "NOTICE $nick :"
putquick "NOTICE $nick :ASSIGN -> Join $botnick à votre chan (Exemple : /msg $botnick ASSIGN #monsalon )"
putquick "NOTICE $nick :UNASSIGN -> Enlève $botnick de votre chan (Exemple : /msg $botnick UNASSIGN #monsalon )"
putquick "NOTICE $nick :"
}

#

proc assign {nick host hand text} {
set chan [join [lrange [split $text] 0 0]]
global botnick

channel add $chan
putquick "NOTICE $nick :$botnick a été atribué au salon 12$chan "
putquick "PRIVMSG $chan :ASSIGN by $nick"
putquick "PRIVMSG $chan :3Bonjour tout le monde !"

}

#

proc unassign {nick host hand text} {
set chan [join [lrange [split $text] 0 0]]
global botnick

if [isop $nick $chan] {
channel remove $chan
putquick "PRIVMSG $chan :UNASSIGN by $nick"
putquick "PRIVMSG $chan :3Tchao !"
putquick "NOTICE $nick :$botnick a été enlevé au salon 12$chan"
} else {
putquick "NOTICE $nick :Accès refusé. (Vous devez être au minimum OP sur 12$chan)"
}
}


                     ###########
                     ##       ##
                     ##  END  ##
                     ##       ##
                     ###########

putlog "assign.tcl créé par NeO_DeStrucToR - Irc.ucool.OrG"
