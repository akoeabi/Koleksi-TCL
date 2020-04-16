#################################################################################
# ��������: 
#	������ - wedding.tcl (����)
# �������:
# !����������� <���> - ������� ����������� ����"
# !������ <���> - ������ � �����"
# !����� - ���, ��� ��������� � ������"
# !�������_���� ��� - ��� ��� ��� ��� � �����
# !���� ��� - ������ ��� ����������� :)
#
# ���������:
# �� ���� fobos@sevcable.net
#
# �����:
#	GadenbIsh
#
#
#
# ������: 
#	1.4 
#################################################################################
# ������� ������:
#
# ������ 1.4
#	+������
#	+������� ������� ����
#	+������� ����
##################################################################################



######################################################
#binds
bind pub -|- !����������� zakci:perodlojenie
bind pubm - * zakci:svadba1
bind pubm - * zakci:svadba2
bind pub -|- !����� zakci:braku
bind pub -|- !������ zakci:razvod
bind pubm - * zakci:razvod2
bind pub -|- !���� zakci:help
bind pub -|- !�������_���� zakci:brn
bind pubm - * zakci:brn2
bind pubm - * zakci:brn3
bind pub -|- !���� zakci:sex
bind pubm - * zakci:sex2
bind pubm - * zakci:sex3

######################################################

###########
#���������#
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
#������ ����� ������ �� ������� ..#
###################################

proc zakci:help {nick uhost hand chan args} {
putserv "NOTICE $nick : !����� - ��� ��������� � ������"
putserv "NOTICE $nick : !����������� <���> - ����������� ����"
putserv "NOTICE $nick : !������ <���> - ������ � �����"
}



proc zakci:perodlojenie {nick unhost hand chan text} {

global zaks

set zaks(nick2) [lindex $text 0]
set zaks(nick1) $nick
set zaks(ip1) $unhost

putserv "PRIVMSG $chan :\00302$nick, ������ 1, ���� �� �������, ���� �� ������� �������� 2\003"
set zaks(started) 1
set zaks(nick1sex) 0
}



proc zakci:svadba1 {nick unhost hand chan text} {
global zaks

if {$nick == $zaks(nick1)} {} else {return}

if {$zaks(started) == 1} {} else {return}
if {$text == 1} {set zaks(nick1sex) 1}
if {$text == 2} {set zaks(nick1sex) 2}
if {$zaks(nick1sex) == 1} {set slovo "���"}
if {$zaks(nick1sex) == 2} {set slovo "����"}
if {$zaks(nick1sex) == 0} {return}

if {$nick == $zaks(nick2)} {putserv "PRIVMSG $chan :\00303����! �� ��� ������ ������� $slovo �� ���� ?"; putkick $chan $nick "���� ��� �� �����!\003"; set zaks(started) 0; return}

if {[onchan $zaks(nick2)]} {set ok 1} else {set ok 0}
if {$ok == 0} {putserv "PRIVMSG $chan :\00303������ ��������� ����� ��������������, ��� ��� ��� $zaks(nick2)"; set zaks(started) 0; return}

if {$zaks(nick1sex) == 1} {set slovo "������"}
if {$zaks(nick1sex) == 2} {set slovo "�������"}

putserv "PRIVMSG $chan :\00304\002$zaks(nick1) $slovo ����������� $zaks(nick2)"

putserv "PRIVMSG $chan :\00300\002����� ����� �������������� !"
if {$zaks(nick1sex) == 2} {set slovo "���"}
if {$zaks(nick1sex) == 1} {set slovo "�����"}
set zaks(started) 2
putserv "PRIVMSG $chan :\00311$zaks(nick2), �������� �� �� ����� � �������� $slovo $zaks(nick1) ? �������� �� �� � �������� ��� ? (�� - 1, ��� - 2)"
putserv "PRIVMSG $zaks(nick2) \00311$zaks(nick2), �������� �� �� ����� � �������� $slovo $zaks(nick1) ? �������� �� �� � �������� ��� ? (�� - 1, ��� - 2)"



}


proc zakci:svadba2 {nick unhost hand chan text} {
global zaks

set zaks(ip2) $unhost

if {$zaks(started) == 2} {} else {return}
if {$nick == $zaks(nick2)} {} else {return}

if {$zaks(nick1sex) == 1} {set slovo "�������"}
if {$zaks(nick1sex) == 2} {set slovo "������"}

if {$text == "2"} {putserv "PRIVMSG $chan :\00310\002�� $slovo ���� �����, ����� ����������"; set zaks(started) 0; return}
if {$text == "1"} {} else {return}

if {$zaks(nick1sex) == 1} {putserv "PRIVMSG $chan :\00308\002������ $zaks(nick1), ��������� $zaks(nick2) !"}
if {$zaks(nick1sex) == 2} {putserv "PRIVMSG $chan :\00308\002������ $zaks(nick2), ��������� $zaks(nick1) !"}

set i 0
set ok 0

set fp [open $zaks(ipk) r]
while {[gets $fp line]>=0} {
incr i
set str($i) $line
if {[string match -nocase *$zaks(ip1) $line]} {set ok 2}
if {[string match -nocase *$zaks(ip2) $line]} {set ok 3}

if {$ok == 2} {putserv "PRIVMSG $chan :\00302� ����� ������������, ��� $zaks(nick1) ��� ������� � ����� ! $zaks(nick1) ��� � ������� ������� �� ������� ���� !"; putkick $chan $zaks(nick1) "���� ��� �� �����!\003"; set zaks(started) 0; return}
if {$ok == 3} {putserv "PRIVMSG $chan :\00302� ����� ������������, ��� $zaks(nick2) ��� ������� � ����� ! $zaks(nick2) ��� � ������� ������� �� ������� ���� !"; putkick $chan $zaks(nick2) "���� ��� �� �����!\003"; set zaks(started) 0; return}

}
close $fp


putserv "PRIVMSG $chan :\00305\002$zaks(nick1)  $zaks(nick2), ������ �� ��� � ���� ! ����������� !"

set fp [open $zaks(ipk) a]
puts $fp $zaks(ip1)
puts $fp $zaks(ip2)

close $fp

set fp [open $zaks(braku) a]
puts $fp "$zaks(nick1) � $zaks(nick2)"
close $fp

set zaks(started) 0
}


proc zakci:braku {nick unhost hand chan text} {
global zaks 
putserv "PRIVMSG $chan :\00309�� ����������� ���� � ������ ���������: "
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

putserv "PRIVMSG $chan :\00302$nick, �� ������� ����������� $raz(nick2) ?\003 (������ �� - 1 ��� - 2)"
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

if {$raz(f) == 1} {set delstr "$raz(nick1) � $raz(nick2)"}
if {$raz(f) == 2} {set delstr "$raz(nick2) � $raz(nick1)"}



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


if {$ara == 1} {putserv "PRIVMSG $chan :\00303�� ���������"} else {putserv "PRIVMSG $chan :\00303�� ����� ������ �����"; set raz(started) 0 ; return}
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
if {$line == "$nick � $text"} {set ok 1}
}
close $fp

set fp [open $zaks(braku) r]

while {[gets $fp line]>=0} {
if {$line == "$text � $nick"} {set ok 1}
}

close $fp

if {$ok == 1} {} else {putserv "PRIVMSG $chan :\00302$nick �� �� �������� � ����� ..."; return}

if {[onchan $brn(nick2)]} {} else {putserv "PRIVMSG $chan :\00302$brn(nick2) ��� �� ������, $nick, ������� ������ ..."; return}

putserv "PRIVMSG $chan :\00302$nick �������� �������� � ������� $brn(nick2) .. $brn(nick2), ����������� �������� ?\003 (������ �� - 1 ��� - 2)"
set brn(started) 1
}

proc zakci:brn2 {nick unhost hand chan text} {
global brn
if {$brn(started) == 1} {} else {return}
if {$brn(nick2) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$nick ��������� ..."; set brn(started) 0; return}
if {$text == 1} {set brn(started) 2}
putserv "PRIVMSG $chan :\00302$brn(nick1) ... ��� .... ������ �������������� ?\003 (������ �� - 1 ��� - 2)"
}

proc zakci:brn3 {nick unhost hand chan text} {
global brn
set ci "1 2 3 4 5"
if {$brn(started) == 2} {} else {return}
if {$brn(nick1) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$nick � $brn(nick2) ������� �������� ���� �����, �� ���-��� �� ��� ����������� .."; set brn(started) 0}
if {$text == 1} {putserv "PRIVMSG $chan :\00302$nick � $brn(nick2) ������� �������� ���� �����, $brn(nick1) ������� [lindex $ci [rand [llength $ci]]] �������� �� ��� ����, � $brn(nick2) - [lindex $ci [rand [llength $ci]]]"; set brn(started) 1}
set brn(started) 0
}





proc zakci:sex {nick unhost hand chan text} {
global sex

set sex(nick2) [lindex $text 0]
set sex(nick1) $nick

if {[onchan $sex(nick2)]} {} else {putserv "PRIVMSG $chan :\00302$sex(nick2) ��� �� ������, $nick, ������� ������ ..."}

putserv "PRIVMSG $chan :\00302$nick �������� �������� � ������� $sex(nick2) .. $sex(nick2), ����������� �������� ?\003 (������ �� - 1 ��� - 2)"
set sex(started) 1
}

proc zakci:sex2 {nick unhost hand chan text} {
global sex
if {$sex(started) == 1} {} else {return}
if {$sex(nick2) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$sex(nick1) ��������� ..."; set sex(started) 0; return}
if {$text == 1} {set sex(started) 2}
putserv "PRIVMSG $chan :\00302$sex(nick1) ... ��� .... ������ �������������� ?\003 (������ �� - 1 ��� - 2)"
}

proc zakci:sex3 {nick unhost hand chan text} {
global sex
set ci "1 2 3 4 5"
if {$sex(started) == 2} {} else {return}
if {$sex(nick1) == $nick} {} else {return}
if {$text == 2} {putserv "PRIVMSG $chan :\00302$sex(nick1) � $sex(nick2) ������� �������� ���� �����, �� ���-��� �� ��� ����������� .."; set sex(started) 0}
if {$text == 1} {putserv "PRIVMSG $chan :\00302$sex(nick1) � $sex(nick2) ������� �������� ���� �����, $sex(nick1) ������� [lindex $ci [rand [llength $ci]]] ������� �� ��� ����, � $sex(nick2) - [lindex $ci [rand [llength $ci]]]"; set sex(started) 1}
set sex(started) 0
}

