##########################################################################
#  Crée par NeO_DeStrucToR.  Copyright 2005 :: Tous droits résèrvés.     #
#                                                                        #
#               E-mail :  neo_destructor@ucool.org                       #
#                                                                        #
#    _   _   ____   ____   ____   _     _   _   ____   ____   _____      #
#   | | | | |  __| | __ | | __ | | |   | | | | | __ | / ___| |__ __|     #
#   | | | | | |    ||  || ||  || | |   | |_| | ||  || | \__    | |       #
#   | | | | | |    ||  || ||  || | |   |  _  | ||  || \__  |   | |       #
#   | |_| | | |__  ||__|| ||__|| | |_  | | | | ||__||  __) |   | |       #
#   |_____| |____| |____| |____| |___| |_| |_| |____| |____/   |_|       #
#                                                                        #
##########################################################################
                       ##########################                        
                       ##                      ##                        
                       ##     ANIM-1.2.TCL     ##                        
                       ##                      ##                      
                       ##########################                      

#########
## LINK ##
##########

set anim(link) "Anim.domaine.tld"
set anim(info) "Anim Service"
set anim(host) "Anim.domaine.tld"
set anim(ip) "XXX.XXX.XXX.XXX"
set anim(port) "port-du-link"
set anim(pass) "pass-du-link"
set anim(pseudo) "Anim"
set anim(real) "Anim Services"
set anim(ident) "Anim"
set anim(salon) "#Anim"
set anim(modesalon) "+nt"
set anim(mode) "+oOSqswB"

proc connexion {} {
global botnick anim
if {![catch "connect $anim(ip) $anim(port)" anim(idx)]} {
putdcc $anim(idx) "PASS $anim(pass)"
putdcc $anim(idx) "SERVER $anim(link) 24 :$anim(info)"
putdcc $anim(idx) ":$anim(link) NICK $anim(pseudo) 24 [unixtime] $anim(ident) $anim(host) $anim(link) :$anim(real)"
putdcc $anim(idx) ":$anim(pseudo) MODE $anim(pseudo) $anim(mode)"
putdcc $anim(idx) ":$anim(pseudo) MODE $anim(pseudo) +q"
putdcc $anim(idx) ":$anim(pseudo) JOIN $anim(salon)"
putdcc $anim(idx) ":$anim(pseudo) MODE $anim(salon) +oa $anim(pseudo) $anim(pseudo)"
putdcc $anim(idx) ":$anim(pseudo) MODE $anim(salon) $anim(modesalon)"
                catch {open salon.db r} autojoin
                while {![eof $autojoin]} {
                        gets $autojoin salon
                        if {$salon!=""} {
                                putdcc $anim(idx) ":$anim(pseudo) JOIN $salon"
                                putdcc $anim(idx) ":$anim(pseudo) MODE $salon +oa $anim(pseudo) $anim(pseudo)"
                                
                        }
                }
                catch {close $autojoin}

control $anim(idx) event; utimer 30 verification
}
}

if {![info exists anim(idx)]} { connexion }

proc verification {} {
global botnick anim
if {[valididx $anim(idx)]} { utimer 30 verification } else {
connexion }
}

##############
# Anim  Ctcp #
##############

set anim(reply) {
":VERSION"
":SCRIPT"
":CLIENTINFO"
":USERINFO"
":ECHO"
":PAGE"
":SOUND"
":TIME"
":FINGER"
":HELP"
}


set anim(version) "1.0"
set anim(ctcp) "Anim Service $anim(version) by NeO_DeStrucToR©"



proc event {idx arg} {
global botnick anim
set chan [join [lrange [split $arg] 0 0]]
  set arg [split $arg]
  set arg2 [lindex $arg 1]
  set arg3 [lindex $arg 2]
  set arg4 [lindex $arg 3]
  set arg5 [lindex $arg 4]
  set arg6 [lindex $arg 5]
  set arg7 [lindex $arg 6]
      if {[lindex $arg 0]=="PING"} { putdcc $anim(idx) "PONG [lindex $arg 1]"; set anim(counter) "0" }
             switch -exact [lindex $arg 1] {
                 "PRIVMSG" {
                                                 set user [string trim [lindex $arg 0] :]
                                                 set vuser [string tolower $user]
                                                 set robot [string tolower [lindex $arg 2]]
                                                 set commande [string trim [lindex $arg 3] :]
                                                 set commande2 [lindex $arg 4 ]
                                                 set text [lrange [split $arg] 5 end]
                                                 set commande3 [lindex $arg 5 ]
                                                 if { $commande == "assign" } { anim:join $commande2 $user}
                                                 if { $commande == "unassign" } { anim:part $commande2 $user}
                                                 if { $commande == "say" } { say $commande2 $text }
                                                 if { $commande == "act" } { act $commande2 $text }
                                                 if { $commande == "!coca" } { coca $arg3 $user $commande2 }
                                                 if { $commande == "!bonjour" } { bonjour $arg3 $user $commande2 }
                                                 if { $commande == "!com" } { listechan $user }
                                                 if { $commande == "!aurevoir" } { aurevoir $arg3 $user $commande2 }
                                                 if { $commande == "!dodo" } { dodo $arg3 $user $commande2 }
                                                 if { $commande == "!fille" } { fille $arg3 $user $commande2 }
                                                 if { $commande == "!mec" } { mec $arg3 $user $commande2 }
                                                 if { $commande == "!cava" } { cava $arg3 $user $commande2 }
                                                 if { $commande == "!boulet" } { boulet $arg3 $user $commande2 }
                                                 if { $commande == "!merci" } { merci $arg3 $user $commande2 }
                                                 if { $commande == "!kiff" } { kiff $arg3 $user $commande2 }
                                                 if { $commande == "!bise" } { bise $arg3 $user $commande2 }
                                                 if { $commande == "!bisoute" } { bisoute $arg3 $user $commande2 }
                                                 if { $commande == "!guilis" } { guilis $arg3 $user $commande2 }
                                                 if { $commande == "!pv" } { pv:chan $arg3 $user $commande2 }
                                                 if { $commande == "!aide" } { aide $arg3 $user $commande2 }
                                                 if { $commande == "!help" } { aide $arg3 $user $commande2 }
                                                 if { $commande == "!pub" } { pub $arg3 $user $commande2 }
                                                 if { $commande == "!chieuse" } { chieuse $arg3 $user $commande2 }
                                                 if { $commande == "!osf" } { osf $arg3 $user $commande2 }
                                                 if { $commande == "!massage" } { massage $arg3 $user $commande2 }
                                                 if { $commande == "!caresse" } { caresse $arg3 $user $commande2 }
                                                 if { $commande == "!biere" } { biere $arg3 $user $commande2 }
                                                 if { $commande == "!seduction" } { seduction $arg3 $user $commande2 }
                                                 if { $commande == "!cafe" } { cafe $arg3 $user $commande2 }
                                                 if { $commande == "!frigide" } { frigide $arg3 $user $commande2 }
                                                 if { $commande == "!clope" } { clope $arg3 $user $commande2 }
                                                 if { $commande == "!fume" } { fume $arg3 $user $commande2 }
                                                 if { $commande == "!jaime" } { jaime $arg3 $user $commande2 }
                                                 if { $commande == "!ducon" } { ducon $arg3 $user $commande2 }
                                                 if { $commande == "!hummm" } { hummm $arg3 $user $commande2 }
                                                 if { $commande == "!sexe" } { sexe $arg3 $user $commande2 }
                                                 if { $commande == "!plotte" } { plotte $arg3 $user $commande2 }
                                                 if { $commande == "!desire" } { desire $arg3 $user $commande2 }
                                                 if { $commande == "!lol" } { lol $arg3 $user $commande2 }
                                                 if { $commande == "!comment" } { comment $arg3 $user $commande2 }
                                                 if { $commande == "!gwine" } { gwine $arg3 $user $commande2 }
                                                 if { $commande == "!bazouka" } { bazouka $arg3 $user $commande2 }
                                                 if { $commande == "!sexe2" } { sexe2 $arg3 $user $commande2 }
                                                 if { $commande == "!ortho" } { ortho $arg3 $user $commande2 }
                                                 if { $commande == "!choco" } { choco $arg3 $user $commande2 }
                                                 if { $commande == "!anges" } { anges $arg3 $user $commande2 }
                                                 if { $commande == "!bn" } { bn $arg3 $user $commande2 }
                                                 if { $commande == "!flingue" } { flingue $arg3 $user $commande2 }
                                                 if { $commande == "!grenade" } { grenade $arg3 $user $commande2 }
                                                 if { $commande == "!pisse" } { pisse $arg3 $user $commande2 }
                                                 if { $commande == "!palot" } { palot $arg3 $user $commande2 }
                                                 if { $commande == "!tapote" } { tapote $arg3 $user $commande2 }
                                                 if { $commande == "!balancepc" } { balancepc $arg3 $user $commande2 }
                                                 if { $commande == "!comic" } { comic $arg3 $user $commande2 }
                                                 if { $commande == "!champagne" } { champagne $arg3 $user $commande2 }
                                                 if { $commande == "!nopv" } { nopv $arg3 $user $commande2 }
                                                 if { $commande == "!pute" } { putes $arg3 $user $commande2 }
                                                 if { $commande == "!mord" } { mord $arg3 $user $commande2 }
                                                 if { $commande == "!69" } { 69 $arg3 $user $commande2 }
                                                 if { $commande == "!cuni" } { cuni $arg3 $user $commande2 }
                                                 if { $commande == "!partouze" } { partouze $arg3 $user $commande2 }
                                                 if { $commande == "!torture" } { torture $arg3 $user $commande2 }
                                                 if { $commande == "!billes" } { billes $arg3 $user $commande2 }
                                                 if { $commande == "!turlute" } { turlute $arg3 $user $commande2 }
                                                 if { $commande == "!drague" } { drague $arg3 $user $commande2 }
                                                 if { $commande == "!gore" } { gore $arg3 $user $commande2 }
                                                 if { $commande == "!mytho" } { mytho $arg3 $user $commande2 }
                                                 if { $commande == "!grui" } { grui $arg3 $user $commande2 }
                                                 if { $commande == "!funk" } { funk $arg3 $user $commande2 }
                                                 if { $commande == "!sodomie" } { sodomie $arg3 $user $commande2 }
                                                 if { $commande == "!pastis" } { pastis $arg3 $user $commande2 }
                                                 if { $commande == "!vodka" } { vodka $arg3 $user $commande2 }
                                                 if { $commande == "!pizza" } { pizza $arg3 $user $commande2 }
                                                 if { $commande == "!rose" } { rose $arg3 $user $commande2 }
                                                 if { $commande == "!cacao" } { cacao $arg3 $user $commande2 }
                                                 if { $commande == "!lechouille" } { lechouille $arg3 $user $commande2 }
                                                 if { $commande == "!reve" } { reve $arg3 $user $commande2 }
                                                 if { $commande == "!appetit" } { appetit $arg3 $user $commande2 }
                                                 if { $commande == "!torgniole" } { torgniole $arg3 $user $commande2 }
                                                 if { $commande == "!retourne" } { retourne $arg3 $user $commande2 }
                                                 if { $commande == "!fouette" } { fouette $arg3 $user $commande2 }
                                                 if { $commande == "!pelle" } { pelle $arg3 $user $commande2 }
                                                 if { $commande == "!whisky" } { whisky $arg3 $user $commande2 }
                                                 if { $commande == "!tequila" } { tequila $arg3 $user $commande2 }
                                                 if { $commande == "!chouchen" } { chouchen $arg3 $user $commande2 }
                                                 if { $commande == "!martini" } { martini $arg3 $user $commande2 } 
                                                 if { $commande == "!chatouille" } { chatouille $arg3 $user $commande2 }
                                                 if { $commande == "!moto" } { moto $arg3 $user $commande2 }
                                                 if { $commande == "!travail" } { travail $arg3 $user $commande2 }
                                                 if { $commande == "!pipe" } { pipe $arg3 $user $commande2 }
                                                 if { $commande == "!cirque" } { cirque $arg3 $user $commande2 }
                                                 if { $commande == "!bouffon" } { bouffon $arg3 $user $commande2 }
                                                 if { $commande == "!avis" } { avis $arg3 $user $commande2 }
                                                 if { $commande == "!perf" } { perf $arg3 $user $commande2 }
                                                 if { $commande == "!salop" } { salop $arg3 $user $commande2 }
                                                 if { $commande == "!salope" } { salope $arg3 $user $commande2 }
                                                 if { $commande == "!choune" } { choune $arg3 $user $commande2 }
                                                 if { $commande == "!becot" } { becot $arg3 $user $commande2 }
                                                 if { $commande == "!moncul" } { moncul $arg3 $user $commande2 }
                                                 if { $commande == "!baffe" } { baffe $arg3 $user $commande2 }

                                                 }
             }
}


#######################################################################
                                                                        
proc act {chan pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION $pseudo \001"
}

#######################################################################

proc say {nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $nick $pseudo"
}

#######################################################################


###########
## PROCS ##
###########

proc anim:join {chan user} {
global anim
       set arg [split $chan]
       set vuser [string tolower [lindex $arg 0]]
       set vchan [string tolower $chan]
        set stop "0"
        if {[string index $chan 0]!="#"} { putdcc $anim(idx) ":$anim(pseudo) NOTICE $user :\002Commande Join :\002 /msg $anim(pseudo) join #salon"; return 0 }
       catch {open "salon.db" r} liste
       while {![eof $liste]} { gets $liste verif; if {$verif==$vchan} { putdcc $anim(idx) ":$anim(pseudo) NOTICE $user :$anim(pseudo) est déjà sur $chan."; set stop "1"; break } }
       catch {close $liste}; if {$stop==1} { return 0 }
       set join [open "salon.db" a]; puts $join "$vchan"; close $join; putdcc $anim(idx) ":$anim(pseudo) NOTICE $user :Je rejoin $chan"; putdcc $anim(idx) ":$anim(pseudo) JOIN $chan"
       putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan Bonjour Tous le monde ! Pour ma liste de commande taper !com"
       putdcc $anim(idx) ":$anim(pseudo) MODE $chan +oa $anim(pseudo) $anim(pseudo)"

}
proc anim:part {chan user} {
global anim
       set arg [split $chan]
       set vuser [string tolower [lindex $arg 0]]
       set vchan [string tolower $chan]
        set stop "0"
        if {[string index $chan 0]!="#"} { putdcc $anim(idx) ":$anim(pseudo) NOTICE $user :\002Commande Part :\002 /msg $anim(pseudo) part #salon"; return 0 }
        catch {open "salon.db" r} liste
        while {![eof $liste]} { gets $liste verif; if {$verif==$vchan} { set stop 1 }; if {$verif!=$vchan && $verif!=""} { lappend salle "$verif" } }
        catch {close $liste}
        if {$stop==0} {
                putdcc $anim(idx) ":$anim(pseudo) NOTICE $user :$anim(pseudo) n'est pas sur $chan."; return 0
        } else {
                if {[info exists salle]} {
                        set del [open "salon.db" w+]; foreach delchan $salle { puts $del "$delchan" }; close $del
                } else {
                        set del [open "salon.db" w+]; close $del
                }
                putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $vchan UNASIGN BY $user"
                putdcc $anim(idx) ":$anim(pseudo) PART $vchan"
                } 
}



proc listechan {nick} {
global anim botnick

putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :\002Voici la liste des commandes publiques relatives à $anim(pseudo) :"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :\002Slaps"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!bonjour 4!aurevoir 12!coca 4!baffe 12!pute 4!rose 12!bouffon"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!dodo 4!fille 12!mec 4!cava 12!mord 4!lechouille 12!avis"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!boulet 4!merci 12!kiff 4!bise 12!69 4!cacao 12!salope"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!bisoute 4!guilis 12!pv 4!chieuse 12!cuni 4!reve 12!salop"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!osf 4!massage 12!caresse 4!partouze 12!torture 4!appetit 12!moncul"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!biere 4!seduction 12!cafe 4!billes 12!turlute 4!torgniole 12!becot"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!frigide 4!clope 12!fume 4!jaime 12!drague 4!retourne 12!perf"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!plotte 4!desire 12!lol 4!comment 12!gore 4!fouette 12!choune"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!gwine 4!bazouka 12!sexe2 4!ortho 12!mytho 4!pelle 12!travail"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!choco 4!anges 12!bn 4!flingue 12!vodka 4tequila 12!chatouille"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!grenade 4!pisse 12!palot 4!tapote 12!pizza 4!chouchen 12!pipe"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!balancepc 4!comic 12!champagne 4!nopv 12!whisky 4!martini 12!cirque"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!ducon 4!hummm 12!sexe 4!pastis 12!funk 4!sodomie 12!moto"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :\002Autres"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12!aide 4!pub 12!forums 4!site 12!hosting"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12act 10/msg $anim(pseudo) ACT 4<14#chan4> <14ton-texte4>"
putdcc $anim(idx) ":$anim(pseudo) NOTICE $nick :12say 10/msg $anim(pseudo) SAY 4<14#chan4> <14ton-texte4>"
}

#######################################################################


proc coca {chan nick pseudo} {
global anim botnick

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12offre une canette de coca bien fraiche à 4$pseudo 12!"

}

#######################################################################

proc bonjour {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12dit un grand bonjour à 4$nick 12!"
} elseif {$pseudo == $anim(pseudo)} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick > 12Bonjour à toi !  Belle journée n' est-ce pas ?"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit un grand bonjour à 4$pseudo 12!"
}

}

#######################################################################

proc aurevoir {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12dit aurevoir et bonne journée 4$nick 12!!"
} elseif {$pseudo == $anim(pseudo)} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick > 12Je ne part pas lol.. :p"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit aurevoir et bonne journée à 4$pseudo 12!"

}

}

#######################################################################

proc baffe {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12donne une GROSSE BAFFE de la mort à 4$nick 12!!!!"
} elseif {$pseudo == $anim(pseudo)} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > Nan mais !  Aller, je suis pas rencuignié... tappe ça, tu aura une surpise : !suicide"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12donne une GROSSE BAFFE de la mort à 4$pseudo 12!!!!"

}

}

#######################################################################

proc dodo {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12demande un peut de silence dans la salle car 4$nick ! 12dort profondement ! Dodoo, l'enfant do.... Zzzz"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > Mr $botnick ! 24h sur 24 ; 7jours sur 7 !  Je ne dort jamais !"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12demande à 4$pseudo 12si il dort ou quoi ?!"
}

}

#######################################################################

proc fille {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12cherche une FILLE !  Est-ce-qu'il y a des FILLES dans la salle pour 4$nick 12?!"

}

#######################################################################

proc mec {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12cherche un MEC !  Est-ce-qu'il y a des mecs dans la salle pour 4$nick 12?!"

}

#######################################################################

proc cava {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12demande à 4$nick 12si ça va bien ?!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > ça va très bien et toi ?"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12demande à 4$pseudo 12si ça va bien ?!"
}

}

#######################################################################

proc boulet {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12décèrne le BOULET D'OR à 4$nick 12!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > Je ne vois pas de quelle commande tu veux parler :p ?!"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12décèrne le BOULET D'OR à 4$pseudo 12!"
}

}

#######################################################################

proc merci {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12dit un GRAND merci à 4$nick ! 10(12Je sais pas pourquoi... :p10)"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > de rien ;)"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit un GRAND merci à 4$pseudo 12!"
}

}

#######################################################################

proc kiff {chan nick pseudo} {
global botnick anim 

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12KIFF à mort 4$nick 12!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > oui, moi aussi, j' te KIFF à mort ! :p"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12KIFF à mort 4$pseudo 12!"
}

}

#######################################################################

proc bise {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12fait une GROSSE BISE à 4$nick 12!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > on se fait la bise ?!"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait une GROSSE BISE à 4$pseudo 12!"
}

}

#######################################################################

proc bisoute {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12fait pleins de 13XxX 12bisous 13XxX 12partout à 4$nick 12!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > moi aussi je t' aime :p"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait pleins de 13XxX 12bisous 13XxX 12partout à 4$pseudo 12!"
}

}

#######################################################################

proc guilis {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :\001ACTION  12fait pleins de guilis à 4$nick 12!!!"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > lool ça chatouilleeeee !!!"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait pleins de guilis à 4$pseudo 12!!!"
}

}

#######################################################################

proc pv:chan {chan nick pseudo} {
global botnick anim

if {$pseudo == ""} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 veux se faire une 10PV 12 à lui même ! :s"
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 > Hummmm... NAN. (Et si c' est pour me draguer, j' ai déjà une robotesse dans ma vie ! =) )"
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12demande une 10PV 12à 4$pseudo 12!!!"
}

}

#######################################################################

proc aide {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) Notice $nick :AIDE -> 10 1) 12La liste de mes commandes4 PUBLIQUES12 , tappez sur le salon : 1!com10   2) 12La liste de mes commandes privées tape sur le salon : 1!com12" 
putdcc $anim(idx) ":$anim(pseudo) Notice $nick :"
putdcc $anim(idx) ":$anim(pseudo) Notice $nick :12Je rappel que pour toutes questions sur le réseau , tous problèmes etc, n' ésitez pas à aller sur le salon d' aide officiel du réseau : 4#!aide!"
putdcc $anim(idx) ":$anim(pseudo) Notice $nick :"
putdcc $anim(idx) ":$anim(pseudo) Notice $nick :JOIN -> 12Join 4$anim(pseudo) à votre chan (Exemple : 10/msg 4$anim(pseudo) 1JOIN 10#monsalon )"
putdcc $anim(idx) ":$anim(pseudo) Notice $nick :PART -> 12Enlève 4$anim(pseudo) de votre chan (Exemple : 10/msg 4$anim(pseudo) 1PART 10#monsalon )"

}

#######################################################################

proc pub {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit qu'il à decouvert un reseau super cool ! Viens vite nous rejoindres 1/server -m irc.ucool.org 12!!!!"

}

#######################################################################

proc chieuse {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12informe la salle que 4$pseudo 12est vraiment une chieuse de 4PREMIERE 12!!!"

}

#######################################################################

proc biere {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12offre une 8MOUSSE 12à 4$pseudo 12est vraiment une chieuse de 4PREMIERE 12!!!"

}

#######################################################################

proc osf {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12s'en fou de ce que tu raconte 4$pseudo 12!!!"

}

#######################################################################

proc massage {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait un long massage à 4$pseudo 12et elle ne s'en plein pas :pPp"

}

#######################################################################

proc caresse {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12caresse doucement 4$pseudo . 12Tu aime ?"

}

#######################################################################

proc bierre {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12offre une bonne bière bien fraiche à 4$pseudo 12:o)"

}

#######################################################################

proc seduction {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12s'est fait beau ce soir pour séduire 4$pseudo 12!!!"

}

#######################################################################

proc cafe {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12offre un cafe bien chaud à 4$pseudo 12:o)"

}

#######################################################################

proc frigide {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12HuM !!! tu ma completement refroidie 4$pseudo 12:'("

}

#######################################################################

proc clope {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12offre une 7()¯¯¯¯)¯¯¯¯¯¯¯¯¯¯¯)14 ~~ 4$pseudo 12:'))"

}

#######################################################################

proc fume {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12est parti se grillé une p'tite 7()¯¯¯¯)¯¯¯¯¯¯¯¯¯¯¯)14 ~~ 12:o)"

}

#######################################################################

proc jaime {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12tiens a declaré devant tout le monde sa flemme pour 4$pseudo 12:')"

}

#######################################################################

proc ducon {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12Tu sais que tu est con toi 4$pseudo 12:/"

}

#######################################################################

proc sexe {chan nick pseudo} {
global botnick anim

set text [join [lrange [split $pseudo] 0 end]]

if {$pseudo == ""} {
} elseif {$pseudo == $botnick} {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12> Oh, he ben toi mon cochon !!!" 
} else {
putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12demande à 4$pseudo 12juste un tit peut de sexe ce soir stp !!!"
}

}

#######################################################################

proc sexe2 {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13S12e glisse entre les jambes de4 $pseudo 12frotte son sexe contre le sien et la pénetre lentement 14humm"

}

########################################################################

proc plotte {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13A6ttrape4 $pseudo 6est lui plottes c'est Deux gros 5(13o5 ) ( 13o5)"

}

#########################################################################

proc desire {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13M12eurs de désire de pouvoir caressé du bout des doigts les douce cuisses de4 $pseudo 12en lui faisant des bisoux dans le cou 14SlurpZ"

} 

#########################################################################

proc lol {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :13L12o13L1!! 13L12o13L1!! 13L12o13L1!! 13L12o13L1!! 4$pseudo"

} 

#########################################################################

proc comment {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :CoMmEnT 4$pseudo 1?2?3?4?5?6?7?8?9?10?11?12?13?14?15?"

} 

#########################################################################

proc gwine {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4N12on non4 $pseudo 12n'est pas une espéce en voie de disparition c'est juste une Gwine 12!"

} 

#########################################################################

proc bazouka {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 va chercher un bazooka, s'éloigne de 4$pseudo lui vide la tête, lock, puis......15PIIIIII8UUUUUUUUU 4BRRRRRRRR"

} 

#########################################################################

proc ortho {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit à 4$pseudo 7,1Utilise 3Prof de 12Français ScRiPt 7,1 pour mirc sans fautes (avec ceux scripte tu fera plu auqune fauteux d'ortaugraffe!!)"

} 

#########################################################################

proc choco {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13O12ffre du chocolat a4 $pseudo 12ah pardon... tas pas de bras bha pas de bras pas de chocolat désolé 14:o)"

} 

#########################################################################

proc anges {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13t'envoie de petits anges gardiens pour te surveiller 4 text 2~Å~ 4~Å~ 2~Å~ 12~Å~ 3~Å~ 4 $pseudo 10~Å~ 13~Å~ 4 $pseudo 11~Å~ 6~Å~ 14~Å~ 4 $pseudo 4~Å~ 13~Å~ 15~Å~"

} 

#########################################################################

proc bn {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12dit 6ø¤°`°¤ø,¸¸,ø¤ 12Bonne Nuit6 $pseudo 12xox 6¸,ø¤°`°¤ø,¸¸,ø¤"

} 

#########################################################################

proc flingue {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13P12ointe le flingue entre les deux yeux de4 $pseudo 12et appui sur la détente... la cervelle de4 $pseudo 12s'envole partout 4MDR14 look in your face"

} 

#########################################################################

proc grenade {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13S12ors les grenades de sa poche et regarde $pseudo 12dans les yeux.. ta 3minute pour te cassé 4!"

} 

#########################################################################

proc pisse {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick ouvre sa braguette 8 et il pisse sur la tronche de   $pseudo  ... 7 alors $pseudo , ca te plaît d'être douché pour une fois ?!..Grenade: 4$nick 3 balance une grenade sur 4 $pseudo  .. et B2OOOOOO3OOO7M3 dans la tronche de 4 $pseudo  !! yeaaaaaaaaaaaaah"

} 

#########################################################################

proc palot {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13D12épose ses main sur les épaules à4 $pseudo 12et lui roule une grosse pelle bien degoulinante 4Slurp"

} 

#########################################################################

proc tapote {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 13M12et une claque dans le dos de $pseudo 12bien ma viou ? 14:o)"

} 

#########################################################################

proc balancepc {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick lance un 4gros Pc 6sur la tete de4 $pseudo 6pour lui ecrasé la tete contre le mur de brique juste derriere 4SpalsHShSHHShsH"

} 

#########################################################################

proc comic {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :13,1ptin t'as du faire l'ecole du rire pour etre aussi drole 4$pseudo"

} 

#########################################################################

proc champagne {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait péter le bouchon et couvre 4$pseudo 12de ChamPagneEeEeEeeeEEEeeEeE !!!"

} 

#########################################################################

proc nopv {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12ne souhaite pas avoir de privé avec toi 4$pseudo 12merci !!!"

} 

#########################################################################

proc hummm {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12tiens a faire savoire à4 $pseudo 12qu'il as pris un pied d'enferrrrr 14humm"

}

#########################################################################

proc assign {nick host hand text} {
global botnick anim
channel add $chan
    putquick "NOTICE $nick :$botnick a été atribué au salon 12$chan"
}


#########################################################################

proc unassign {nick host hand text} {

global botnick anim

if [isop $nick $chan] {
channel remove $chan

    putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :UNASSIGN by $nick"
    putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :3Tchao !"
    putquick "NOTICE $nick :$botnick a été enlevé au salon 12$chan"
} else {
    putquick "NOTICE $nick :Accès refusé. (Vous devez être au minimum OP sur 12$chan)"
}
}

##########################################################################

proc rejoin {nick uhost handl chan} {
global botnick anim
if {$nick == $botnick} {
    putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :3Bonjour tout le monde !"
    putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12Pour obtnir mes commandes tappé !com :o)"
} else { putquick "NOTICE $nick :12Bienvenue sur le salon 4$chan12 ! Pour obtenir la liste de mes commande, tappez sur le salon : 1!com" }

}

##########################################################################

proc grui {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :Hey 3$pseudo! 4G4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4g4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4r4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4u4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i4i !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

}

##########################################################################

proc putes {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12paye une pute a 4$pseudo. 12C'est le seul moyen pour toi de faire du saiks mon povre"

}

##########################################################################

proc mord {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12choppe 4$pseudo12 et lui mort le coin de l oeil puis l oreille façon Tyson.. On fait moins le malin la hein ?"

}

##########################################################################

proc lechouille {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12choppe 4$pseudo12 et lui leche langoureusement le corp SlurRrRrRp :pPp"

}

##########################################################################

proc 69 {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 veut tenter une experience avec 4$pseudo. 12Operation nettoyage des outils (69 rulez)"

}

##########################################################################

proc cuni {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12aime se muscler la langue et fait un gros cuni bien humide a4 $pseudo 12jusqu'a epuisemant lingual :). T'aimes ca hein ?"

}

##########################################################################

proc partouze {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$chan12 vire carrement aux ebats sexuels en public, 4$nick 12et 4$pseudo 12sont a poil !!!!!! vous avez pas honte ??? y a des ames sensibles ici!!"

}

##########################################################################

proc torture {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12menotte4 $pseudo12 a une chaise puis braque un halogene vers son visage ! Avoues maintenannt, je veux connaitre tes plus vils secrets !"

}

##########################################################################

proc billes {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12arretes de faire chier 4$pseudo 12et vas jouer aux billes plutot c de ton age :)"

}

##########################################################################

proc turlute {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 suce amoureusement par 4$pseudo ...... 12elle a la bouche pleine ..hummm comme c'est bon, divin ...... UNE FEMME KI ARRETE UN PEU DE PARLER, UNE FEMME COMME JE LES AIME !!!"

}

##########################################################################

proc drague {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 s'approche lentement de 4$pseudo 12et lui murmure à l'oreille: Tu sais que tu as de tres jolis yeux ? Tu fais quoi les 30 prochaines annees ?!!"

}

##########################################################################

proc gore {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12se demande comment 4$pseudo12 a pu s'echapper du zoo. Avec la tronche qu'il a, a se demander si goregallery.com va pas fermer quand il ouvrira sa homepage :)"

}

##########################################################################

proc mytho {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 a tous ses détecteurs de mythomanes qui s'affolent en voyant et en entendant 4$pseudo. 12Tous les cadrans sont dans le rouge, je crois que nous tenons un sacré spécimen..."

}

##########################################################################

proc pizza {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12Et une pizza, une pour4 $pseudo 12de la part de 4$nick 12!"

}

##########################################################################

proc funk {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$pseudo 12> t'es trop cool !"

}

##########################################################################

proc sodomie {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12demande a 4$pseudo12 de lui montrer ses tites fesses (_|_) et de se laisser faire, je te laisse encore le choix entre le lubrifiant et la vaseline a moins que tu sois maso (hum pas mauvais le gravier $pseudo)."

}

##########################################################################

proc pastis {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre un ricard a 4$pseudo12 :-) D'autres amateurs ?"

}

##########################################################################

proc whisky {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12offre un bon Whisky a 4$pseudo12 :-) D'autres amateurs ?"

}

##########################################################################

proc vodka {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre une vodka a 4$pseudo12 :-) D'autres amateurs ?"

}

##########################################################################

proc rose {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre cette merveilleuse rose \0034@\003\0033\} >-`--,--`---\003 a 4$pseudo :-) (une declaration d'amour??)"

}

##########################################################################

proc cacao {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre un cacao 4(12un veritable Banania!4)12 a 4$pseudo 12:-)"

}

##########################################################################

proc appetit {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 te souhaite une bonne bouffe4 $pseudo,12 reviens moi vite :-)"

}

##########################################################################

proc torgniole {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 prend4 $pseudo,12 le retourne et lui fout une torgniole dans la goule !!!!"

}

##########################################################################

proc retourne {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 retourne 4$pseudo,12 le(la) colle sur la table a repasser (un peu etroite) et le(la) viole 3 heures durant (c'est tout ?) !!!!"

}

##########################################################################

proc reve {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12Fait de beaux reves 4$pseudo 12:-) et penses a nous :))))) Bonne nuit petit ange !"

}

##########################################################################

proc fouette {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fouette 4$pseudo 12! ($pseudo doit surement aimer ca pour en redemander, sado maso?? :PPP)"

}

##########################################################################

proc pelle {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12CHoPPe4 $pseudo12 eT Lui RouLe uNe GRoSSe PeLLe...SLUUUUUUUUUUURP ! :o)"

}

##########################################################################

proc tequila {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre une tequila frappee a4 $pseudo 12:-) D'autres amateurs ?"

}

##########################################################################

proc chouchen {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre un bon verre de chouchen a4 $pseudo12 !! Yermat !!!!! 'tention bois le po cul sec malheureux ! ca se savoure! ;o)))"

}

##########################################################################

proc martini {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 offre un martini a 4$pseudo 12:-) D'autres amateurs ?"

}

##########################################################################

proc moto {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12se la pete sur sa moto, cheveux au vent, pied a fond sur l'accelerateur vroummmmmmmmmmmmm"

}

##########################################################################

proc chatouille {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick 12fait des giligili a4 $pseudo12 qui explose de rire :-)"

}

##########################################################################

proc travail {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 dit qu'il est temp pour 4$pseudo12 d'allé un peu taffé :pPp"

}

##########################################################################

proc pipe {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 demande à 4$pseudo12 de se mettre a quatre pattes et d'ouvrir la bouche  :pPp"

}

##########################################################################

proc cirque {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12 HuM HuM 4$pseudo12 du as du faire l'ecole du cirque toi pas possible :'("

}

##########################################################################

proc bouffon {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$pseudo12 est le ROI des bouffon :p^^"

}

##########################################################################

proc avis {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$pseudo12 A quelque chose de tres important as nous dire 1CHUTTTTTTTTT BORDEL !!!"

}

##########################################################################

proc perf {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4$nick12 Tiens a faire savoir au jeune damoiselles qu'il est tres performant au lit :pPp"

}

##########################################################################

proc salop {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :4Hannnn 1$pseudo 4espece de salop 1!!!"

}

##########################################################################

proc salope {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :1$pseudo est une 1S2a3l4o5o6p7P8e9E10e11E12e13e14E15e  1!2!3!4!"

}

##########################################################################

proc choune {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :Hey ! Regardez13 $pseudo 12se fait balancer les foufounes 13(_/_) (_|_) (_\_) (_|_) (_/_)12 4WOW !!!"

}

##########################################################################

proc becot {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :12$nick 4donne à12 $pseudo 4un bec tres juteux et savoureux!! 12 =8Þ~~"

}

##########################################################################

proc moncul {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :14(12__14|12__14) 4<=== OUAIS C EST CA 12$pseudo ...4 Et MoN CuL C eSt Du PoUlEt ! ! !"

}

##########################################################################

proc forums {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :FORUMS ---> 12http://forums.ucoolhost.com"

}

##########################################################################

proc site {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :SITE ---> 12http://tchat.ucoolhost.com"

}

##########################################################################

proc hosting {chan nick pseudo} {
global botnick anim

putdcc $anim(idx) ":$anim(pseudo) PRIVMSG $chan :HOSTING ---> 12http://www.ucoolhost.com"

}

###############
## COPYRIGHT ##
###############

putlog "anim-1.2.tcl créé par NeO_DeStrucToR - Irc.ucool.OrG"
