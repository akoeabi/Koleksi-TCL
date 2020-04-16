## Badnick par TeniX v1.0


#### Ajouter vos badnick CI-dessous.

### pour les pseudo qui entre sur le salon

bind join - "*fuck*" join_badnick
bind join - "*dick*" join_badnick
bind join - "*salope*" join_badnick

### pour les changement de pseudo

bind nick - *fuck* nick_bad_nick
bind join - *dick* join_badnick
bind join - "*salope*" join_badnick

############################################################

proc join_badnick {nick host hand chan} {
global botnick
newchanban $chan "$nick*!*@*" $botnick "Veuillez choisir un autre pseudo!"
return 0
}
	
proc nick_bad_nick {nick host hand chan newnick} {
global botnick
newchanban $chan "$newnick*!*@*" $botnick "Veuillez choisir un autre pseudo!"
return 0

}
