#################################################################################
# Описание: 
#	Скрипт - wedding.tcl (ЗАГС)
# Команды:
# !предложение <ник> - сделать предложение нику"
# !развод <ник> - развод с ником"
# !браки - все, кто находятся в браках"
# !брачная_ночь ник - это для тех кто в браке
# !секс ник - просто для развлечения :)
#
# Поддержка:
# Моё мыло fobos@sevcable.net
#
# Автор:
#	GadenbIsh
#
#
#
# Версия: 
#	1.4 
#################################################################################
# История версий:
#
# версия 1.4
#	+развод
#	+команда брачная ночь
#	+команда секс
##################################################################################



######################################################
#binds
bind pub -|- !предложение zakci:perodlojenie
bind pubm - * zakci:svadba1
bind pubm - * zakci:svadba2
bind pub -|- !браки zakci:braku
bind pub -|- !развод zakci:razvod
bind pubm - * zakci:razvod2
bind pub -|- !загс zakci:help
bind pub -|- !брачная_ночь zakci:brn
bind pubm - * zakci:brn2
bind pubm - * zakci:brn3
bind pub -|- !секс zakci:sex
bind pubm - * zakci:sex2
bind pubm - * zakci:sex3

######################################################

###########
#Настройки#
###########

set zaks(braku) "scripts/braku.dat"
set zaks(ipk) "scripts/ip.dat"
set zaks(braku2) "scripts/braku2.dat"
set zaks(ip2k) "scripts/ip2.dat"
set zaks(nick1) ""
set zaks(nick2) ""
set zaks(nick1sex) ""
set zaks(nick2sex) ""
set zaks(started) 0
set zaks(ip1) ""
set zaks(ip2) ""
set raz(started) 0
set raz(nick2) ""
set raz(nick1) ""
set raz(ip1) ""
set brn(nick1) ""
set brn(nick2) ""
set brn(started) 0
set sex(started) 0
set sex(nick1) ""
set sex(nick2) ""

###################################
#Дальше лучше ничего не трогать ..#
###################################

proc zakci:help {nick uhost hand chan args} {
putserv "NOTICE $nick : !браки - кто находятся в браках"
putserv "NOTICE $nick : !предложение <ник> - предложение нику"
putserv "NOTICE $nick : !развод <ник> - развод с ником"
}



proc zakci:perodlojenie {nick unhost hand chan text} {

global zaks

set zaks(nick2) [lindex $text 0]
set zaks(nick1) $nick
set zaks(ip1) $unhost

putserv "PRIVMSG $chan :\00302$nick, напиши 1, если вы мужчина, если вы женщина напишите 2\003"
set zaks(started) 1
set zaks(nick1sex) 0
}



proc zakci:svadba1 {nick unhost hand chan text} {
global zaks

if {$nick == $zaks(nick1)} {} else {return}

if {$zaks(started) == 1} {} else {return}
if {$text == 1} {set zaks(nick1sex) 1}
if {$text == 2} {set zaks(nick1sex) 2}
if {$zaks(nick1sex) == 1} {set slovo "сам"}
if {$zaks(nick1sex) == 2} {set slovo "сама"}
if {$zaks(nick1sex) == 0} {return}

if {$nick == $zaks(nick2)} {putserv "PRIVMSG $chan :\00303Стоп! Ты что хочешь женится $slovo на себе ?"; putkick $chan $nick "ТЕБЕ ТУТ НЕ МЕСТО!\003"; set zaks(started) 0; return}

if {[onchan $zaks(nick2)]} {set ok 1} else {set ok 0}
if {$ok == 0} {putserv "PRIVMSG $chan :\00303Нельзя совершить обряд бракосочетания, так как нет $zaks(nick2)"; set zaks(started) 0; return}

if {$zaks(nick1sex) == 1} {set slovo "сделал"}
if {$zaks(nick1sex) == 2} {set slovo "сделала"}

putserv "PRIVMSG $chan :\00304\002$zaks(nick1) $slovo предложение $zaks(nick2)"

putserv "PRIVMSG $chan :\00300\002Начнём обряд бракосочетания !"
if {$zaks(nick1sex) == 2} {set slovo "жёны"}
if {$zaks(nick1sex) == 1} {set slovo "мужья"}
set zaks(started) 2
putserv "PRIVMSG $chan :\00311$zaks(nick2), согласны ли вы взять в законные $slovo $zaks(nick1) ? Клянёшься ли ты в верности ему ? (да - 1, нет - 2)"
putserv "PRIVMSG $zaks(nick2) \00311$zaks(nick2), согласны ли вы взять в законные $slovo $zaks(nick1) ? Клянёшься ли ты в верности ему ? (да - 1, нет - 2)"



}


proc zakci:svadba2 {nick unhost hand chan text} {
global zaks

set zaks(ip2) $unhost

if {$zaks(started) == 2} {} else {return}
if {$nick == $zaks(nick2)} {} else {return}

if {$zaks(nick1sex) == 1} {set slovo "сделала"}
if {$zaks(nick1sex) == 2} {set slovo "сделал"}

if {$text == "2"} {putserv "PRIVMSG $chan :\00310\002Ты $slovo свой выбор, обряд отменяется"; set zaks(started) 0; return}
if {$text == "1"} {} else {return}

if {$zaks(nick1sex) == 1} {putserv "PRIVMSG $chan :\00308\002Теперь $zaks(nick1), поцелуйте $zaks(nick2) !"}
if {$zaks(nick1sex) == 2} {putserv "PRIVMSG $chan :\00308\002Теперь $zaks(nick2), поцелуйте $zaks(nick1) !"}

set i 0
set ok 0

set fp [open $zaks(ipk) r]
while {[gets $fp line]>=0} {
incr i
set str($i) $line
if {[string match -nocase *$zaks(ip1) $line]} {set ok 2}
if {[string match -nocase *$zaks(ip2) $line]} {set ok 3}

if {$ok == 2} {putserv "PRIVMSG $chan :\00302И вдруг обноружилось, что $zaks(nick1) уже состоит в браке ! $zaks(nick1) был в позором выкинут из команты чата !"; putkick $chan $zaks(nick1) "ТЕБЕ ТУТ НЕ МЕСТО!\003"; set zaks(started) 0; return}
if {$ok == 3} {putserv "PRIVMSG $chan :\00302И вдруг обноружилось, что $zaks(nick2) уже состоит в браке ! $zaks(nick2) был в позором выкинут из команты чата !"; putkick $chan $zaks(nick2) "ТЕБЕ ТУТ НЕ МЕСТО!\003"; set zaks(started) 0; return}

}
close $fp


putserv "PRIVMSG $chan :\00305\002$zaks(nick1)  $zaks(nick2), теперь вы муж и жена ! ПОЗДРАВЛЯЕМ !"

set fp [open $zaks(ipk) a]
puts $fp $zaks(ip1)
puts $fp $zaks(ip2)

close $fp

set fp [open $zaks(braku) a]
puts $fp "$zaks(nick1) и $zaks(nick2)"
close $fp

set zaks(started) 0
}


proc zakci:braku {nick unhost hand chan text} {
global zaks 
putserv "PRIVMSG $chan :\00309На сегодняшний день в браках находятся: "
set i 0
set fp [open $zaks(braku) r]
while {[gets $fp line]>=0} {
incr i
set str($i) $line
putserv "PRIVMSG $chan :\00312$line"
}
close $fp
}


proc zakci:razvod {nick unhost hand chan text} {
global zaks raz

set raz(nick2) [lindex $text 0]
set raz(nick1) $nick
set raz(ip1) $unhost

putserv "PRIVMSG $chan :\00302$nick, вы сделали предложение $raz(nick2) ?\003 (ответы да - 1 нет - 2)"
set raz(started) 1
set zaks(nick1sex) 0
}

proc zakci:razvod2 {nick unhost hand chan text} {
global zaks raz


set raz(f) 0
set i 0
if {$nick == $raz(nick1)} {} else {return}
if {$raz(started) == 1} {} else {return}
if {$text == 1} {set raz(f) 1}
if {$text == 2} {set raz(f) 2}
if {$raz(f) == 0} {return}

if {$raz(f) == 1} {set delstr "$raz(nick1) и $raz(nick2)"}
if {$raz(f) == 2} {set delstr "$raz(nick2) и $raz(nick1)"}



set gr [open $zaks(braku2) w]
flush $gr
close $gr


set fp [open $zaks(braku) r]
set gr [open $zaks(braku2) a]
while {[gets $fp line]>=0} {
puts $gr $line
}
close $gr
close $fp


set gr [open $zaks(braku) w]
flush $gr
close $gr


set fp [open $zaks(braku2) r]
set gr [open $zaks(braku) a]		
set ara 0
while {[gets $fp line]>=0} {
	if {$line == $delstr} {set ara 1} else {puts $gr $line}
}
close $fp
close $gr

 	set gr [open $zaks(braku2) a]		
	flush $gr
	close $gr


if {$ara == 1} {putserv "PRIVMSG $chan :\00303Вы разведены"} else {putserv "PRIVMSG $chan :\00303Не нашёл такого брака"; set raz(started) 0 ; return}
set one 0





set gr [open $zaks(ip2k) w]
flush $gr
close $gr

set fp [open $zaks(ipk) r]
set gr [open $zaks(ip2k) a]
while {[gets $fp line]>=0} {
puts $gr $line
}
close $gr
close $fp


set gr [open $zaks(ipk) w]
flush $gr
close $gr

		
if {$raz(f) == 1} {

set fp [open $zaks(ip2k) r]
set gr [open $zaks(ipk) a]

set i 1

while {[gets $fp line]>=0} {
	if {[string match -nocase *$unhost $line]} {set i 0} else {puts $gr $line}
	if {$i == 0} {gets $fp $line; set i 1}
}
close $gr
close $fp

} else {

set line2 ""
set nado ""

set fp [open $zaks(ip2k) r]
while {[gets $fp line]>=0} {
gets $fp line2

putserv "PRIVMSG $chan :$line - 1"
putserv "PRIVMSG $chan :$line2 - 2"
if {[string match -nocase *$unhost $line2]} {set nado $line}
putserv "PRIVMSG $chan :$nado"
}
close $fp


set fp [open $zaks(ip2k) r]
set gr [open $zaks(ipk) a]

set i 1

while {[gets $fp line]>=0} {
	if {$line == $nado} {set i 0} else {puts $gr $line}
	if {$i == 0} {gets $fp $line; set i 1}
}
close $gr
close $fp



}


set raz(started) 0

 	set gr [open $zaks(ip2k) a]		
	flush $gr
	close $gr

}

proc zakci:brn {nick unhost hand chan text} {
global brn zaks
set ok 0



set brn(nick2) $text
set brn(nick1) $nick

set fp [open $zaks(braku) r]
while {[gets $fp line]>=0} {
if {$line == "$nick и $text"} {set ok 1}
}
close $fp

set fp [open $zaks(braku) r]

while {[gets $fp line]>=0} {
if {$line == "$text и $nick"} {set ok 1}
}

close $fp

if {$ok == 1} {} else {putserv "PRIVMSG $chan :\00302$nick вы не состоите в браке ..."; return}

if {[onchan $brn(nick2)]} {} else {putserv "PRIVMSG $chan :\00302$brn(nick2) нет на канале, $nick, придётся одному ..."; return}

putserv "PRIVMSG $chan :\00302$nick пытается затащить в постель $brn(nick2) .. $brn(nick2), поддадитесь соблазну ?\003 (ответы да - 1 нет - 2)"
set brn(started) 1
}

proc zakci:brn2 {nick unhost hand chan text} {
global brn
if {$brn(started) == 1} {} else {return}
if {$brn(nick2) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$nick обломался ..."; set brn(started) 0; return}
if {$text == 1} {set brn(started) 2}
putserv "PRIVMSG $chan :\00302$brn(nick1) ... эээ .... хотите предохраниться ?\003 (ответы да - 1 нет - 2)"
}

proc zakci:brn3 {nick unhost hand chan text} {
global brn
set ci "1 2 3 4 5"
if {$brn(started) == 2} {} else {return}
if {$brn(nick1) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$nick и $brn(nick2) провели чудесную ночь вдвоём, но кое-кто из них забеременел .."; set brn(started) 0}
if {$text == 1} {putserv "PRIVMSG $chan :\00302$nick и $brn(nick2) провели чудесную ночь вдвоём, $brn(nick1) получил [lindex $ci [rand [llength $ci]]] оргазмов за эту ночь, а $brn(nick2) - [lindex $ci [rand [llength $ci]]]"; set brn(started) 1}
set brn(started) 0
}





proc zakci:sex {nick unhost hand chan text} {
global sex

set sex(nick2) [lindex $text 0]
set sex(nick1) $nick

if {[onchan $sex(nick2)]} {} else {putserv "PRIVMSG $chan :\00302$sex(nick2) нет на канале, $nick, придётся одному ..."}

putserv "PRIVMSG $chan :\00302$nick пытается затащить в постель $sex(nick2) .. $sex(nick2), поддадитесь соблазну ?\003 (ответы да - 1 нет - 2)"
set sex(started) 1
}

proc zakci:sex2 {nick unhost hand chan text} {
global sex
if {$sex(started) == 1} {} else {return}
if {$sex(nick2) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$sex(nick1) обломался ..."; set sex(started) 0; return}
if {$text == 1} {set sex(started) 2}
putserv "PRIVMSG $chan :\00302$sex(nick1) ... эээ .... хотите предохраниться ?\003 (ответы да - 1 нет - 2)"
}

proc zakci:sex3 {nick unhost hand chan text} {
global sex
set ci "1 2 3 4 5"
if {$sex(started) == 2} {} else {return}
if {$sex(nick1) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$sex(nick1) и $sex(nick2) провели чудесную ночь вдвоём, но кое-кто из них забеременел .."; set sex(started) 0}
if {$text == 1} {putserv "PRIVMSG $chan :\00302$sex(nick1) и $sex(nick2) провели чудесную ночь вдвоём, $sex(nick1) получил [lindex $ci [rand [llength $ci]]] оргазма за эту ночь, а $sex(nick2) - [lindex $ci [rand [llength $ci]]]"; set sex(started) 1}
set sex(started) 0
}

