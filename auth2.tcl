
bind msg - auth auth:msg
proc auth:msg {nick host hand arg} {
global botnick auth deauth

####                           ####
# Set des infos envoyé en PRIVMSG #
####                           ####

set auth(salon) [lindex $arg 0]
set auth(nick) [lindex $arg 1]
set auth(pass) [lrange $arg 2 end]

####                           ####
# Si une info manque dans les Set #
####                           ####

if {$auth(salon)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick auth #salon <pseudo> <mot de passe>"
return 0
}

if {$auth(nick)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick auth #salon <pseudo> <mot de passe>"
return 0
}

if {$auth(pass)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick auth #salon <pseudo> <mot de passe>"
return 0
}

####                                  ####
# Si une info dans le Set est incorrecte #
####                                  ####

if {![validuser $auth(nick)]} {
putserv "NOTICE $nick :\002Erreur!\002 Nickname non enregistré!"
return 0
}

if {![passwdok $auth(nick) $auth(pass)]} {
putserv "NOTICE $nick :\002Mot de passe Incorrect!\002"
return 0
}

if {![validchan $auth(salon)]} {
putserv "NOTICE $nick :\002Erreur!\002 Se salon n'es pas dans ma liste!"
return 0
}

if {![matchattr $auth(nick) +ov $auth(salon)]} {
putserv "NOTICE $nick :\002Erreur!\002 Vous n'avez pas accès à ce salon!"
return 0
}

####                      ####
# Une fois le contrat rempli #
####                      ####

set auth($nick) 1
putserv "NOTICE $nick :\002Authentification réussie pour $auth(salon).\002"
setuser $auth(nick) hosts "$auth(nick)!*"
return 0

}

bind msg - deauth deauth:msg
proc deauth:msg {nick host hand arg} {
global botnick deauth auth

####                           ####
# Set des infos envoyé en PRIVMSG #
####                           ####

set deauth(salon) [lindex $arg 0]
set deauth(nick) [lindex $arg 1]
set deauth(pass) [lindex $arg 2]

####                           ####
# Si une info manque dans les Set #
####                           ####

if {$deauth(salon)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick deauth #salon <pseudo> <mot de passe>"
return 0
}

if {$deauth(nick)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick deauth #salon <pseudo> <mot de passe>"
return 1
}

if {$deauth(pass)==""} {
putserv "NOTICE $nick :\002Erreur!\002"
putserv "NOTICE $nick :\002Syntaxe:\002 /msg $botnick deauth #salon <pseudo> <mot de passe>"
return 3
}

####                          ####
# Si le user n'est pas déja auth #
####                          ####

if {$auth($nick)=="0"} {
putserv "NOTICE $nick :\002Erreur!\002 Vous n'êtes pas identifié!"
return 4
}

####                    ####
# Si le user est déja auth #
####                    ####

if {$auth($nick)=="1"} {

if {![passwdok $deauth(nick) $deauth(pass)]} {
putserv "NOTICE $nick :\002Mot de passe Incorrect!\002"
return 5
}

if {![validchan $auth(salon)]} {
putserv "NOTICE $nick :\002Erreur!\002 Se salon n'es pas dans ma liste!"
return 0
}

if {![matchattr $auth(nick) +ov $auth(salon)]} {
putserv "NOTICE $nick :\002Erreur!\002 Vous n'avez pas accès à ce salon!"
return 0
}

####                     ####
# Un fois le contrat rempli #
####                     ####

set auth($nick) 0
putserv "NOTICE $nick :\002DéAuthentification réussie pour $deauth(salon).\002"
return 6

}

}

