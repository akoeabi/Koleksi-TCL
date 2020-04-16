# Anti Spam away et Realname
##
#
# /!\ Ce script n' a pas de protection un mass join et le bot part en excess flood/!\
# Soit vous faites une protect
# soit votre bot est ircop ;)soit

# Definir les SaLons ou l' antispam away et realname est actif
# Séparez par des espaces
# Pour Activer sur tous les salons du bot laissez ""
set chanz ""

# La raison du kickban (ou gline)
set rez "Spam Realname ou away!"

# Definir les mots clefs suceptibles d' etre du spam
set motz {
"*sexy*"
"*hotmail*"
"*h*t*t*p"
"*http://*"
"*www.*"
"*.com*"
"*.fr*"
"*.org*"
"*.info*"
"*.net*"
"*.br*"
"*.tk*"
"*.euro*"
"*.st*"
}

#################################

# On bind les joins
if {( $chanz != "" )} {
 foreach chanz $chanz {
bind join - "$chanz *" check:join
  }
} else {
bind join - * check:join
}

# Le bind raw realname
bind raw - 311 check:real

# le bind raw away
bind raw - 301 check:aw

proc check:join { nick uhost hand chan } {

   # La seule Protection est le choix du puthelp
   # un putquick serait beaucoup plus efficace pour un bot ircop
    variable whonick $nick
    set host [lindex [split $uhost "@"] 1]
    variable whohost "*!*@$host"
    variable whochan $chan
    puthelp "WHOIS $nick"
    return 0
}

proc check:real {from key txt} {
  global motz whohost whochan whonick rez
  set rn [string range [join [lrange [split $txt] 5 end]] 1 end]
  regsub -all -- "\003(\[0-9\]\[0-9\]?(,\[0-9\]\[0-9\]?)?)?|\002|\017|\026|\037" $rn "" rn

  foreach sp $motz {
    if {[string match -nocase $sp $rn]} {
        # ici ça put un ban et un kick
       # ça pourrait etre un newchanban ou un gline/kline pour un bot ircop
      putquick "MODE $whochan +b $whohost"
      putquick "KICK $whochan $whonick :$rez"
    return 0
    }
}
return 0
}


# on fait pareiL pour le raw away

proc check:aw {from key txt} {
global motz whohost whochan whonick rez
 set aw [string range [join [lrange [split $txt] 2 end]] 1 end]
 regsub -all -- "\003(\[0-9\]\[0-9\]?(,\[0-9\]\[0-9\]?)?)?|\002|\017|\026|\037" $aw "" aw
foreach sp $motz {
    if {[string match -nocase $sp $aw]} {
      putquick "MODE $whochan +b $whohost"
      putquick "KICK $whochan $whonick :$rez"
    return 0
    }
}
return 0
}

putlog "\00314 AntiSpam RealName et Away ¤ \0035 by Che ;)"
