########################################
############  Anti Proxy ###############
########################################
############  Descrition ###############
########################################
#Se tcl � pour fonction de kickban d'un salon ou il est pr�sent et surtout ou il est op�rateur
#Toute les extensions des users qui n'aurons pas une extension fran�aise ou espagnole.
#Biensur, il se peut que certaine connexion qui ne soit pas fran�aise ou espagnole puisse parvenir
#A joindre votre salon mais la chance que cela se produise est casi nulle. 
########################################
############  Condition ################
########################################
#Pour que le tcl fonctionne, il faut obligatoirement que le bot soit op sur 
#le ou les salons ou il sera pr�sent.
#J'ai cr�e se cl il y � un bout de temps dans mes d�but dans le language.
#Depuis, je ne l'ai plus utilis� mais je souhaite le faire parvenir aux autres.
#Tcl by �DaV34�
########################################
############  La Source  ###############
########################################

bind join - * proc:proxy1
proc proc:proxy1 { nick uhost hand chan } {
if [string match *.uk $host] {
putserv "mode $chan +b *!*@*.ad"
putkick $chan $nick "Extension Blacklist� : *!*@*.ad [Andorre]"
}
}

bind join - * proc:proxy2
proc proc:proxy2 { nick uhost hand chan } {
if [string match *.ae $host] {
putserv "mode $chan +b *!*@*.ae"
putkick $chan $nick "Extension Blacklist� : *!*@*.ae [Emirats Arabes Unis]"
}
}

bind join - * proc:proxy3
proc proc:proxy3 { nick uhost hand chan } {
if [string match *.af $host] {
putserv "mode $chan +b *!*@*.af"
putkick $chan $nick "Extension Blacklist� : *!*@*.af [Afghanistan]"
}
}

bind join - * proc:proxy4
proc proc:proxy4 { nick uhost hand chan } {
if [string match *.ag $host] {
putserv "mode $chan +b *!*@*.ag"
putkick $chan $nick "Extension Blacklist� : *!*@*.ag [Antigua et Barbuda]"
}
}

bind join - * proc:proxy5
proc proc:proxy5 { nick uhost hand chan } {
if [string match *.ai $host] {
putserv "mode $chan +b *!*@*.ai"
putkick $chan $nick "Extension Blacklist� : *!*@*.ai [Anguilla]"
}
}

bind join - * proc:proxy6
proc proc:proxy6 { nick uhost hand chan } {
if [string match *.al $host] {
putserv "mode $chan +b *!*@*.al"
putkick $chan $nick "Extension Blacklist� : *!*@*.al [Albanie]"
}
}

bind join - * proc:proxy7
proc proc:proxy7 { nick uhost hand chan } {
if [string match *.am $host] {
putserv "mode $chan +b *!*@*.am"
putkick $chan $nick "Extension Blacklist� : *!*@*.am [Arm�nie]"
}
}

bind join - * proc:proxy8
proc proc:proxy8 { nick uhost hand chan } {
if [string match *.an $host] {
putserv "mode $chan +b *!*@*.an"
putkick $chan $nick "Extension Blacklist� : *!*@*.an [Antilles N�erlandaises]"
}
}

bind join - * proc:proxy9
proc proc:proxy9 { nick uhost hand chan } {
if [string match *.ao $host] {
putserv "mode $chan +b *!*@*.ao"
putkick $chan $nick "Extension Blacklist� : *!*@*.ao [Angola]"
}
}

bind join - * proc:proxy10
proc proc:proxy10 { nick uhost hand chan } {
if [string match *.aq $host] {
putserv "mode $chan +b *!*@*.aq"
putkick $chan $nick "Extension Blacklist� : *!*@*.aq [Antarctique]"
}
}

bind join - * proc:proxy11
proc proc:proxy11 { nick uhost hand chan } {
if [string match *.ar $host] {
putserv "mode $chan +b *!*@*.ar"
putkick $chan $nick "Extension Blacklist� : *!*@*.ar [Argentine]"
}
}

bind join - * proc:proxy12
proc proc:proxy12 { nick uhost hand chan } {
if [string match *.as $host] {
putserv "mode $chan +b *!*@*.as"
putkick $chan $nick "Extension Blacklist� : *!*@*.as [Samoa Am�ricaine]"
}
}

bind join - * proc:proxy13
proc proc:proxy13 { nick uhost hand chan } {
if [string match *.at $host] {
putserv "mode $chan +b *!*@*.at"
putkick $chan $nick "Extension Blacklist� : *!*@*.at [Autriche]"
}
}

bind join - * proc:proxy14
proc proc:proxy14 { nick uhost hand chan } {
if [string match *.au $host] {
putserv "mode $chan +b *!*@*.au"
putkick $chan $nick "Extension Blacklist� : *!*@*.au [Australie]"
}
}

bind join - * proc:proxy15
proc proc:proxy15 { nick uhost hand chan } {
if [string match *.aw $host] {
putserv "mode $chan +b *!*@*.aw"
putkick $chan $nick "Extension Blacklist� : *!*@*.aw [Aruba]"
}
}

bind join - * proc:proxy16
proc proc:proxy16 { nick uhost hand chan } {
if [string match *.az $host] {
putserv "mode $chan +b *!*@*.az"
putkick $chan $nick "Extension Blacklist� : *!*@*.az [Azerbaijan]"
}
}

bind join - * proc:proxy17
proc proc:proxy17 { nick uhost hand chan } {
if [string match *.ba $host] {
putserv "mode $chan +b *!*@*.ba"
putkick $chan $nick "Extension Blacklist� : *!*@*.ba [Bosnie Herz�govine]"
}
}

bind join - * proc:proxy18
proc proc:proxy18 { nick uhost hand chan } {
if [string match *.bb $host] {
putserv "mode $chan +b *!*@*.bb"
putkick $chan $nick "Extension Blacklist� : *!*@*.bb [Barbades]"
}
}

bind join - * proc:proxy19
proc proc:proxy19 { nick uhost hand chan } {
if [string match *.bd $host] {
putserv "mode $chan +b *!*@*.bd"
putkick $chan $nick "Extension Blacklist� : *!*@*.bd [Bangladesh]"
}
}

bind join - * proc:proxy20
proc proc:proxy20 { nick uhost hand chan } {
if [string match *.be $host] {
putserv "mode $chan +b *!*@*.be"
putkick $chan $nick "Extension Blacklist� : *!*@*.be [Belgique]"
}
}

bind join - * proc:proxy21
proc proc:proxy21 { nick uhost hand chan } {
if [string match *.bf $host] {
putserv "mode $chan +b *!*@*.bf"
putkick $chan $nick "Extension Blacklist� : *!*@*.bf [Burkina Faso]"
}
}

bind join - * proc:proxy22
proc proc:proxy22 { nick uhost hand chan } {
if [string match *.bg $host] {
putserv "mode $chan +b *!*@*.bg"
putkick $chan $nick "Extension Blacklist� : *!*@*.bg [Bulgarie]"
}
}

bind join - * proc:proxy23
proc proc:proxy23 { nick uhost hand chan } {
if [string match *.bh $host] {
putserv "mode $chan +b *!*@*.bh"
putkick $chan $nick "Extension Blacklist� : *!*@*.bh [Bahrain]"
}
}

bind join - * proc:proxy24
proc proc:proxy24 { nick uhost hand chan } {
if [string match *.bi $host] {
putserv "mode $chan +b *!*@*.bi"
putkick $chan $nick "Extension Blacklist� : *!*@*.bi [Burundi]"
}
}

bind join - * proc:proxy25
proc proc:proxy25 { nick uhost hand chan } {
if [string match *.bj $host] {
putserv "mode $chan +b *!*@*.bj"
putkick $chan $nick "Extension Blacklist� : *!*@*.bj [B�nin]"
}
}

bind join - * proc:proxy26
proc proc:proxy26 { nick uhost hand chan } {
if [string match *.bm $host] {
putserv "mode $chan +b *!*@*.bm"
putkick $chan $nick "Extension Blacklist� : *!*@*.bm [Bermudes]"
}
}

bind join - * proc:proxy27
proc proc:proxy27 { nick uhost hand chan } {
if [string match *.bn $host] {
putserv "mode $chan +b *!*@*.bn"
putkick $chan $nick "Extension Blacklist� : *!*@*.bn [Brune� Darussalam]"
}
}

bind join - * proc:proxy28
proc proc:proxy28 { nick uhost hand chan } {
if [string match *.bo $host] {
putserv "mode $chan +b *!*@*.bo"
putkick $chan $nick "Extension Blacklist� : *!*@*.bo [Bolivie]"
}
}

bind join - * proc:proxy29
proc proc:proxy29 { nick uhost hand chan } {
if [string match *.br $host] {
putserv "mode $chan +b *!*@*.br"
putkick $chan $nick "Extension Blacklist� : *!*@*.br [Br�sil]"
}
}

bind join - * proc:proxy30
proc proc:proxy30 { nick uhost hand chan } {
if [string match *.bs $host] {
putserv "mode $chan +b *!*@*.bs"
putkick $chan $nick "Extension Blacklist� : *!*@*.bs [Bahamas]"
}
}

bind join - * proc:proxy31
proc proc:proxy31 { nick uhost hand chan } {
if [string match *.bt $host] {
putserv "mode $chan +b *!*@*.bt"
putkick $chan $nick "Extension Blacklist� : *!*@*.bt [Bhutan]"
}
}

bind join - * proc:proxy32
proc proc:proxy32 { nick uhost hand chan } {
if [string match *.bv $host] {
putserv "mode $chan +b *!*@*.bv"
putkick $chan $nick "Extension Blacklist� : *!*@*.bv [Iles Bouvet]"
}
}

bind join - * proc:proxy33
proc proc:proxy33 { nick uhost hand chan } {
if [string match *.bw $host] {
putserv "mode $chan +b *!*@*.bw"
putkick $chan $nick "Extension Blacklist� : *!*@*.bw [Botswana]"
}
}

bind join - * proc:proxy34
proc proc:proxy34 { nick uhost hand chan } {
if [string match *.by $host] {
putserv "mode $chan +b *!*@*.by"
putkick $chan $nick "Extension Blacklist� : *!*@*.by [Bi�larussie]"
}
}

bind join - * proc:proxy35
proc proc:proxy35 { nick uhost hand chan } {
if [string match *.bz $host] {
putserv "mode $chan +b *!*@*.bz"
putkick $chan $nick "Extension Blacklist� : *!*@*.bz [Belize]"
}
}

bind join - * proc:proxy36
proc proc:proxy36 { nick uhost hand chan } {
if [string match *.ca $host] {
putserv "mode $chan +b *!*@*.ca"
putkick $chan $nick "Extension Blacklist� : *!*@*.ca [Canada]"
}
}

bind join - * proc:proxy37
proc proc:proxy37 { nick uhost hand chan } {
if [string match *.cc $host] {
putserv "mode $chan +b *!*@*.cc"
putkick $chan $nick "Extension Blacklist� : *!*@*.cc [Iles Cocos]"
}
}

bind join - * proc:proxy38
proc proc:proxy38 { nick uhost hand chan } {
if [string match *.cf $host] {
putserv "mode $chan +b *!*@*.cf"
putkick $chan $nick "Extension Blacklist� : *!*@*.cf [R�publique Centrafricaine]"
}
}

bind join - * proc:proxy39
proc proc:proxy39 { nick uhost hand chan } {
if [string match *.cg $host] {
putserv "mode $chan +b *!*@*.cg"
putkick $chan $nick "Extension Blacklist� : *!*@*.cg [Congo]"
}
}

bind join - * proc:proxy40
proc proc:proxy40 { nick uhost hand chan } {
if [string match *.ch $host] {
putserv "mode $chan +b *!*@*.ch"
putkick $chan $nick "Extension Blacklist� : *!*@*.ch [Suisse]"
}
}

bind join - * proc:proxy41
proc proc:proxy41 { nick uhost hand chan } {
if [string match *.ci $host] {
putserv "mode $chan +b *!*@*.ci"
putkick $chan $nick "Extension Blacklist� : *!*@*.ci [Cote D'Ivoire]"
}
}

bind join - * proc:proxy42
proc proc:proxy42 { nick uhost hand chan } {
if [string match *.ck $host] {
putserv "mode $chan +b *!*@*.ck"
putkick $chan $nick "Extension Blacklist� : *!*@*.ck [Iles de Cook]"
}
}

bind join - * proc:proxy43
proc proc:proxy43 { nick uhost hand chan } {
if [string match *.cl $host] {
putserv "mode $chan +b *!*@*.cl"
putkick $chan $nick "Extension Blacklist� : *!*@*.cl [Chilie]"
}
}


bind join - * proc:proxy44
proc proc:proxy44 { nick uhost hand chan } {
if [string match *.cm $host] {
putserv "mode $chan +b *!*@*.cm"
putkick $chan $nick "Extension Blacklist� : *!*@*.cm [Cameroun]"
}
}

bind join - * proc:proxy45
proc proc:proxy45 { nick uhost hand chan } {
if [string match *.cn $host] {
putserv "mode $chan +b *!*@*.cn"
putkick $chan $nick "Extension Blacklist� : *!*@*.cn [Chine]"
}
}

bind join - * proc:proxy46
proc proc:proxy46 { nick uhost hand chan } {
if [string match *.co $host] {
putserv "mode $chan +b *!*@*.co"
putkick $chan $nick "Extension Blacklist� : *!*@*.co [Colombie]"
}
}

bind join - * proc:proxy47
proc proc:proxy47 { nick uhost hand chan } {
if [string match *.cr $host] {
putserv "mode $chan +b *!*@*.cr"
putkick $chan $nick "Extension Blacklist� : *!*@*.cr [Costa Rica]"
}
}

bind join - * proc:proxy48
proc proc:proxy48 { nick uhost hand chan } {
if [string match *.cs $host] {
putserv "mode $chan +b *!*@*.cs"
putkick $chan $nick "Extension Blacklist� : *!*@*.cs [Tch�coslovaquie]"
}
}

bind join - * proc:proxy49
proc proc:proxy49 { nick uhost hand chan } {
if [string match *.cu $host] {
putserv "mode $chan +b *!*@*.cu"
putkick $chan $nick "Extension Blacklist� : *!*@*.cu [Cuba]"
}
}

bind join - * proc:proxy50
proc proc:proxy50 { nick uhost hand chan } {
if [string match *.cv $host] {
putserv "mode $chan +b *!*@*.cv"
putkick $chan $nick "Extension Blacklist� : *!*@*.cv [Cap Vert]"
}
}

bind join - * proc:proxy51
proc proc:proxy51 { nick uhost hand chan } {
if [string match *.cx $host] {
putserv "mode $chan +b *!*@*.cx"
putkick $chan $nick "Extension Blacklist� : *!*@*.cx [Iles Christmas]"
}
}

bind join - * proc:proxy52
proc proc:proxy52 { nick uhost hand chan } {
if [string match *.cy $host] {
putserv "mode $chan +b *!*@*.cy"
putkick $chan $nick "Extension Blacklist� : *!*@*.cy [Chypre]"
}
}

bind join - * proc:proxy53
proc proc:proxy53 { nick uhost hand chan } {
if [string match *.cz $host] {
putserv "mode $chan +b *!*@*.cz"
putkick $chan $nick "Extension Blacklist� : *!*@*.cz [R�publique Tch�que]"
}
}

bind join - * proc:proxy54
proc proc:proxy54 { nick uhost hand chan } {
if [string match *.de $host] {
putserv "mode $chan +b *!*@*.de"
putkick $chan $nick "Extension Blacklist� : *!*@*.de [Allemagne]"
}
}

bind join - * proc:proxy55
proc proc:proxy55 { nick uhost hand chan } {
if [string match *.dj $host] {
putserv "mode $chan +b *!*@*.dj"
putkick $chan $nick "Extension Blacklist� : *!*@*.dj [Djibouti]"
}
}

bind join - * proc:proxy56
proc proc:proxy56 { nick uhost hand chan } {
if [string match *.dk $host] {
putserv "mode $chan +b *!*@*.dk"
putkick $chan $nick "Extension Blacklist� : *!*@*.dk [Danemark]"
}
}

bind join - * proc:proxy57
proc proc:proxy57 { nick uhost hand chan } {
if [string match *.dm $host] {
putserv "mode $chan +b *!*@*.dm"
putkick $chan $nick "Extension Blacklist� : *!*@*.dm [Dominique]"
}
}

bind join - * proc:proxy58
proc proc:proxy58 { nick uhost hand chan } {
if [string match *.do $host] {
putserv "mode $chan +b *!*@*.do"
putkick $chan $nick "Extension Blacklist� : *!*@*.do [R�publique Dominicaine]"
}
}

bind join - * proc:proxy59
proc proc:proxy59 { nick uhost hand chan } {
if [string match *.dz $host] {
putserv "mode $chan +b *!*@*.dz"
putkick $chan $nick "Extension Blacklist� : *!*@*.dz [Alg�rie]"
}
}

bind join - * proc:proxy60
proc proc:proxy60 { nick uhost hand chan } {
if [string match *.ec $host] {
putserv "mode $chan +b *!*@*.ec"
putkick $chan $nick "Extension Blacklist� : *!*@*.ec [Equateur]"
}
}

bind join - * proc:proxy61
proc proc:proxy61 { nick uhost hand chan } {
if [string match *.ee $host] {
putserv "mode $chan +b *!*@*.ee"
putkick $chan $nick "Extension Blacklist� : *!*@*.ee [Estonie]"
}
}

bind join - * proc:proxy62
proc proc:proxy62 { nick uhost hand chan } {
if [string match *.eg $host] {
putserv "mode $chan +b *!*@*.eg"
putkick $chan $nick "Extension Blacklist� : *!*@*.eg [Egypte]"
}
}

bind join - * proc:proxy63
proc proc:proxy63 { nick uhost hand chan } {
if [string match *.eh $host] {
putserv "mode $chan +b *!*@*.eh"
putkick $chan $nick "Extension Blacklist� : *!*@*.eh [Ouest Sahara]"
}
}

bind join - * proc:proxy64
proc proc:proxy64 { nick uhost hand chan } {
if [string match *.er $host] {
putserv "mode $chan +b *!*@*.er"
putkick $chan $nick "Extension Blacklist� : *!*@*.er [Erithr�e]"
}
}

bind join - * proc:proxy65
proc proc:proxy65 { nick uhost hand chan } {
if [string match *.et $host] {
putserv "mode $chan +b *!*@*.et"
putkick $chan $nick "Extension Blacklist� : *!*@*.et [Ethiopie]"
}
}

bind join - * proc:proxy66
proc proc:proxy66 { nick uhost hand chan } {
if [string match *.fi $host] {
putserv "mode $chan +b *!*@*.fi"
putkick $chan $nick "Extension Blacklist� : *!*@*.fi [Finlande]"
}
}

bind join - * proc:proxy67
proc proc:proxy67 { nick uhost hand chan } {
if [string match *.fj $host] {
putserv "mode $chan +b *!*@*.fj"
putkick $chan $nick "Extension Blacklist� : *!*@*.fj [Fidji]"
}
}

bind join - * proc:proxy68
proc proc:proxy68 { nick uhost hand chan } {
if [string match *.fk $host] {
putserv "mode $chan +b *!*@*.fk"
putkick $chan $nick "Extension Blacklist� : *!*@*.fk [Iles Falkland]"
}
}

bind join - * proc:proxy69
proc proc:proxy69 { nick uhost hand chan } {
if [string match *.fm $host] {
putserv "mode $chan +b *!*@*.fm"
putkick $chan $nick "Extension Blacklist� : *!*@*.fm [Micron�sie]"
}
}

bind join - * proc:proxy70
proc proc:proxy70 { nick uhost hand chan } {
if [string match *.fo $host] {
putserv "mode $chan +b *!*@*.fo"
putkick $chan $nick "Extension Blacklist� : *!*@*.fo [Iles Feroe]"
}
}

bind join - * proc:proxy71
proc proc:proxy71 { nick uhost hand chan } {
if [string match *.ge $host] {
putserv "mode $chan +b *!*@*.ge"
putkick $chan $nick "Extension Blacklist� : *!*@*.ge [G�orgie]"
}
}

bind join - * proc:proxy72
proc proc:proxy72 { nick uhost hand chan } {
if [string match *.gd $host] {
putserv "mode $chan +b *!*@*.gd"
putkick $chan $nick "Extension Blacklist� : *!*@*.gd [Grenade]"
}
}

bind join - * proc:proxy73
proc proc:proxy73 { nick uhost hand chan } {
if [string match *.gh $host] {
putserv "mode $chan +b *!*@*.gh"
putkick $chan $nick "Extension Blacklist� : *!*@*.gh [Ghana]"
}
}

bind join - * proc:proxy74
proc proc:proxy74 { nick uhost hand chan } {
if [string match *.gi $host] {
putserv "mode $chan +b *!*@*.gi"
putkick $chan $nick "Extension Blacklist� : *!*@*.gi [Gibraltar]"
}
}

bind join - * proc:proxy75
proc proc:proxy75 { nick uhost hand chan } {
if [string match *.gl $host] {
putserv "mode $chan +b *!*@*.gl"
putkick $chan $nick "Extension Blacklist� : *!*@*.gl [Gro�nland]"
}
}

bind join - * proc:proxy76
proc proc:proxy76 { nick uhost hand chan } {
if [string match *.gm $host] {
putserv "mode $chan +b *!*@*.gm"
putkick $chan $nick "Extension Blacklist� : *!*@*.gm [Gambie]"
}
}

bind join - * proc:proxy77
proc proc:proxy77 { nick uhost hand chan } {
if [string match *.gn $host] {
putserv "mode $chan +b *!*@*.gn"
putkick $chan $nick "Extension Blacklist� : *!*@*.gn [Guin�e]"
}
}

bind join - * proc:proxy78
proc proc:proxy78 { nick uhost hand chan } {
if [string match *.gp $host] {
putserv "mode $chan +b *!*@*.gp"
putkick $chan $nick "Extension Blacklist� : *!*@*.gp [Guadeloupe]"
}
}

bind join - * proc:proxy79
proc proc:proxy79 { nick uhost hand chan } {
if [string match *.gq $host] {
putserv "mode $chan +b *!*@*.gq"
putkick $chan $nick "Extension Blacklist� : *!*@*.gq [Guin�e Equatoriale]"
}
}

bind join - * proc:proxy80
proc proc:proxy80 { nick uhost hand chan } {
if [string match *.gr $host] {
putserv "mode $chan +b *!*@*.gr"
putkick $chan $nick "Extension Blacklist� : *!*@*.gr [Gr�ce]"
}
}

bind join - * proc:proxy81
proc proc:proxy81 { nick uhost hand chan } {
if [string match *.gr $host] {
putserv "mode $chan +b *!*@*.gr"
putkick $chan $nick "Extension Blacklist� : *!*@*.gr [Gr�ce]"
}
}

bind join - * proc:proxy82
proc proc:proxy82 { nick uhost hand chan } {
if [string match *.gs $host] {
putserv "mode $chan +b *!*@*.gs"
putkick $chan $nick "Extension Blacklist� : *!*@*.gs [Georgie du Sud/Iles Sandwich Sud]"
}
}

bind join - * proc:proxy83
proc proc:proxy83 { nick uhost hand chan } {
if [string match *.gt $host] {
putserv "mode $chan +b *!*@*.gt"
putkick $chan $nick "Extension Blacklist� : *!*@*.gt [Guatemala]"
}
}

bind join - * proc:proxy84
proc proc:proxy84 { nick uhost hand chan } {
if [string match *.gu $host] {
putserv "mode $chan +b *!*@*.gu"
putkick $chan $nick "Extension Blacklist� : *!*@*.gu [Guam]"
}
}

bind join - * proc:proxy85
proc proc:proxy85 { nick uhost hand chan } {
if [string match *.gw $host] {
putserv "mode $chan +b *!*@*.gw"
putkick $chan $nick "Extension Blacklist� : *!*@*.gw [Guin�e-Bissau]"
}
}

bind join - * proc:proxy86
proc proc:proxy86 { nick uhost hand chan } {
if [string match *.gy $host] {
putserv "mode $chan +b *!*@*.gy"
putkick $chan $nick "Extension Blacklist� : *!*@*.gy [Guyane]"
}
}

bind join - * proc:proxy87
proc proc:proxy87 { nick uhost hand chan } {
if [string match *.hk $host] {
putserv "mode $chan +b *!*@*.hk"
putkick $chan $nick "Extension Blacklist� : *!*@*.hk [Hong Kong]"
}
}

bind join - * proc:proxy88
proc proc:proxy88 { nick uhost hand chan } {
if [string match *.hm $host] {
putserv "mode $chan +b *!*@*.hm"
putkick $chan $nick "Extension Blacklist� : *!*@*.hm [Iles Heard et McDonald]"
}
}

bind join - * proc:proxy89
proc proc:proxy89 { nick uhost hand chan } {
if [string match *.hn $host] {
putserv "mode $chan +b *!*@*.hn"
putkick $chan $nick "Extension Blacklist� : *!*@*.hn [Honduras]"
}
}

bind join - * proc:proxy90
proc proc:proxy90 { nick uhost hand chan } {
if [string match *.hr $host] {
putserv "mode $chan +b *!*@*.hr"
putkick $chan $nick "Extension Blacklist� : *!*@*.hr [Croatie]"
}
}

bind join - * proc:proxy91
proc proc:proxy91 { nick uhost hand chan } {
if [string match *.ht $host] {
putserv "mode $chan +b *!*@*.ht"
putkick $chan $nick "Extension Blacklist� : *!*@*.ht [Ha�ti]"
}
}

bind join - * proc:proxy92
proc proc:proxy92 { nick uhost hand chan } {
if [string match *.hu $host] {
putserv "mode $chan +b *!*@*.hu"
putkick $chan $nick "Extension Blacklist� : *!*@*.hu [Hongrie]"
}
}

bind join - * proc:proxy93
proc proc:proxy93 { nick uhost hand chan } {
if [string match *.id $host] {
putserv "mode $chan +b *!*@*.id"
putkick $chan $nick "Extension Blacklist� : *!*@*.id [Indon�ie]"
}
}

bind join - * proc:proxy94
proc proc:proxy94 { nick uhost hand chan } {
if [string match *.ie $host] {
putserv "mode $chan +b *!*@*.ie"
putkick $chan $nick "Extension Blacklist� : *!*@*.ie [Irlande]"
}
}

bind join - * proc:proxy95
proc proc:proxy95 { nick uhost hand chan } {
if [string match *.il $host] {
putserv "mode $chan +b *!*@*.il"
putkick $chan $nick "Extension Blacklist� : *!*@*.il [Isra�l]"
}
}

bind join - * proc:proxy96
proc proc:proxy96 { nick uhost hand chan } {
if [string match *.in $host] {
putserv "mode $chan +b *!*@*.in"
putkick $chan $nick "Extension Blacklist� : *!*@*.in [Inde]"
}
}

bind join - * proc:proxy97
proc proc:proxy97 { nick uhost hand chan } {
if [string match *.io $host] {
putserv "mode $chan +b *!*@*.io"
putkick $chan $nick "Extension Blacklist� : *!*@*.io [Territoire Britannique de l'Oc�an Indien]"
}
}

bind join - * proc:proxy98
proc proc:proxy98 { nick uhost hand chan } {
if [string match *.iq $host] {
putserv "mode $chan +b *!*@*.iq"
putkick $chan $nick "Extension Blacklist� : *!*@*.iq [Iraq]"
}
}

bind join - * proc:proxy99
proc proc:proxy99 { nick uhost hand chan } {
if [string match *.ir $host] {
putserv "mode $chan +b *!*@*.ir"
putkick $chan $nick "Extension Blacklist� : *!*@*.ir [Iran]"
}
}

bind join - * proc:proxy100
proc proc:proxy100 { nick uhost hand chan } {
if [string match *.is $host] {
putserv "mode $chan +b *!*@*.is"
putkick $chan $nick "Extension Blacklist� : *!*@*.is [Islande]"
}
}

bind join - * proc:proxy101
proc proc:proxy101 { nick uhost hand chan } {
if [string match *.it $host] {
putserv "mode $chan +b *!*@*.it"
putkick $chan $nick "Extension Blacklist� : *!*@*.it [Italie]"
}
}

bind join - * proc:proxy102
proc proc:proxy102 { nick uhost hand chan } {
if [string match *.jm $host] {
putserv "mode $chan +b *!*@*.jm"
putkick $chan $nick "Extension Blacklist� : *!*@*.jm [Jama�que]"
}
}

bind join - * proc:proxy103
proc proc:proxy103 { nick uhost hand chan } {
if [string match *.jo $host] {
putserv "mode $chan +b *!*@*.jo"
putkick $chan $nick "Extension Blacklist� : *!*@*.jo [Jordanie]"
}
}

bind join - * proc:proxy104
proc proc:proxy104 { nick uhost hand chan } {
if [string match *.jp $host] {
putserv "mode $chan +b *!*@*.jp"
putkick $chan $nick "Extension Blacklist� : *!*@*.jp [Japon]"
}
}

bind join - * proc:proxy105
proc proc:proxy105 { nick uhost hand chan } {
if [string match *.ke $host] {
putserv "mode $chan +b *!*@*.ke"
putkick $chan $nick "Extension Blacklist� : *!*@*.ke [Kenya]"
}
}

bind join - * proc:proxy106
proc proc:proxy106 { nick uhost hand chan } {
if [string match *.kg $host] {
putserv "mode $chan +b *!*@*.kg"
putkick $chan $nick "Extension Blacklist� : *!*@*.kg [Kyrgyzstan]"
}
}

bind join - * proc:proxy107
proc proc:proxy107 { nick uhost hand chan } {
if [string match *.kh $host] {
putserv "mode $chan +b *!*@*.kh"
putkick $chan $nick "Extension Blacklist� : *!*@*.kh [Cambodge]"
}
}

bind join - * proc:proxy108
proc proc:proxy108 { nick uhost hand chan } {
if [string match *.ki $host] {
putserv "mode $chan +b *!*@*.ki"
putkick $chan $nick "Extension Blacklist� : *!*@*.ki [Kiribati]"
}
}

bind join - * proc:proxy109
proc proc:proxy109 { nick uhost hand chan } {
if [string match *.km $host] {
putserv "mode $chan +b *!*@*.km"
putkick $chan $nick "Extension Blacklist� : *!*@*.km [Comores]"
}
}

bind join - * proc:proxy110
proc proc:proxy110 { nick uhost hand chan } {
if [string match *.kn $host] {
putserv "mode $chan +b *!*@*.kn"
putkick $chan $nick "Extension Blacklist� : *!*@*.kn [Saint Kitts et Nevis]"
}
}

bind join - * proc:proxy111
proc proc:proxy111 { nick uhost hand chan } {
if [string match *.kp $host] {
putserv "mode $chan +b *!*@*.kp"
putkick $chan $nick "Extension Blacklist� : *!*@*.kp [Cor�e du Nord]"
}
}

bind join - * proc:proxy112
proc proc:proxy112 { nick uhost hand chan } {
if [string match *.kn $host] {
putserv "mode $chan +b *!*@*.kn"
putkick $chan $nick "Extension Blacklist� : *!*@*.kn [Cor�e du Sud]"
}
}

bind join - * proc:proxy113
proc proc:proxy113 { nick uhost hand chan } {
if [string match *.kw $host] {
putserv "mode $chan +b *!*@*.kw"
putkick $chan $nick "Extension Blacklist� : *!*@*.kw [Koweit]"
}
}

bind join - * proc:proxy114
proc proc:proxy114 { nick uhost hand chan } {
if [string match *.ky $host] {
putserv "mode $chan +b *!*@*.ky"
putkick $chan $nick "Extension Blacklist� : *!*@*.ky [Iles Ca�man]"
}
}

bind join - * proc:proxy115
proc proc:proxy115 { nick uhost hand chan } {
if [string match *.kz $host] {
putserv "mode $chan +b *!*@*.kz"
putkick $chan $nick "Extension Blacklist� : *!*@*.kz [Kazakhstan]"
}
}

bind join - * proc:proxy116
proc proc:proxy116 { nick uhost hand chan } {
if [string match *.la $host] {
putserv "mode $chan +b *!*@*.la"
putkick $chan $nick "Extension Blacklist� : *!*@*.la [Laos]"
}
}

bind join - * proc:proxy117
proc proc:proxy117 { nick uhost hand chan } {
if [string match *.lb $host] {
putserv "mode $chan +b *!*@*.lb"
putkick $chan $nick "Extension Blacklist� : *!*@*.lb [Liban]"
}
}

bind join - * proc:proxy118
proc proc:proxy118 { nick uhost hand chan } {
if [string match *.lc $host] {
putserv "mode $chan +b *!*@*.lc"
putkick $chan $nick "Extension Blacklist� : *!*@*.lc [Saint Lucia]"
}
}

bind join - * proc:proxy119
proc proc:proxy119 { nick uhost hand chan } {
if [string match *.li $host] {
putserv "mode $chan +b *!*@*.li"
putkick $chan $nick "Extension Blacklist� : *!*@*.li [Liechtenstein]"
}
}

bind join - * proc:proxy122
proc proc:proxy120 { nick uhost hand chan } {
if [string match *.lk $host] {
putserv "mode $chan +b *!*@*.lk"
putkick $chan $nick "Extension Blacklist� : *!*@*.lk [Sri Lanka]"
}
}

bind join - * proc:proxy121
proc proc:proxy121 { nick uhost hand chan } {
if [string match *.lr $host] {
putserv "mode $chan +b *!*@*.lr"
putkick $chan $nick "Extension Blacklist� : *!*@*.lr [Lib�ria]"
}
}

bind join - * proc:proxy122
proc proc:proxy122 { nick uhost hand chan } {
if [string match *.ls $host] {
putserv "mode $chan +b *!*@*.ls"
putkick $chan $nick "Extension Blacklist� : *!*@*.ls [Lesotho]"
}
}

bind join - * proc:proxy123
proc proc:proxy123 { nick uhost hand chan } {
if [string match *.lt $host] {
putserv "mode $chan +b *!*@*.lt"
putkick $chan $nick "Extension Blacklist� : *!*@*.lt [Lithuanie]"
}
}

bind join - * proc:proxy124
proc proc:proxy124 { nick uhost hand chan } {
if [string match *.lu $host] {
putserv "mode $chan +b *!*@*.lu"
putkick $chan $nick "Extension Blacklist� : *!*@*.lu [Luxembourg]"
}
}

bind join - * proc:proxy125
proc proc:proxy125 { nick uhost hand chan } {
if [string match *.lv $host] {
putserv "mode $chan +b *!*@*.lv"
putkick $chan $nick "Extension Blacklist� : *!*@*.lv [Latvia]"
}
}

bind join - * proc:proxy126
proc proc:proxy126 { nick uhost hand chan } {
if [string match *.ly $host] {
putserv "mode $chan +b *!*@*.ly"
putkick $chan $nick "Extension Blacklist� : *!*@*.ly [Libye]"
}
}

bind join - * proc:proxy127
proc proc:proxy127 { nick uhost hand chan } {
if [string match *.mc $host] {
putserv "mode $chan +b *!*@*.mc"
putkick $chan $nick "Extension Blacklist� : *!*@*.mc [Maroc]"
}
}

bind join - * proc:proxy128
proc proc:proxy128 { nick uhost hand chan } {
if [string match *.ma $host] {
putserv "mode $chan +b *!*@*.ma"
putkick $chan $nick "Extension Blacklist� : *!*@*.ma [Monaco]"
}
}

bind join - * proc:proxy129
proc proc:proxy129 { nick uhost hand chan } {
if [string match *.md $host] {
putserv "mode $chan +b *!*@*.md"
putkick $chan $nick "Extension Blacklist� : *!*@*.md [Moldavie]"
}
}

bind join - * proc:proxy130
proc proc:proxy130 { nick uhost hand chan } {
if [string match *.mg $host] {
putserv "mode $chan +b *!*@*.mg"
putkick $chan $nick "Extension Blacklist� : *!*@*.mg [Madagascar]"
}
}

bind join - * proc:proxy131
proc proc:proxy131 { nick uhost hand chan } {
if [string match *.mh $host] {
putserv "mode $chan +b *!*@*.mh"
putkick $chan $nick "Extension Blacklist� : *!*@*.mh [Iles Marshall]"
}
}

bind join - * proc:proxy132
proc proc:proxy132 { nick uhost hand chan } {
if [string match *.mk $host] {
putserv "mode $chan +b *!*@*.mk"
putkick $chan $nick "Extension Blacklist� : *!*@*.mk [Mac�donie]"
}
}

bind join - * proc:proxy133
proc proc:proxy133 { nick uhost hand chan } {
if [string match *.ml $host] {
putserv "mode $chan +b *!*@*.ml"
putkick $chan $nick "Extension Blacklist� : *!*@*.ml [Mali]"
}
}

bind join - * proc:proxy134
proc proc:proxy134 { nick uhost hand chan } {
if [string match *.mm $host] {
putserv "mode $chan +b *!*@*.mm"
putkick $chan $nick "Extension Blacklist� : *!*@*.mm [Myanmar]"
}
}

bind join - * proc:proxy135
proc proc:proxy135 { nick uhost hand chan } {
if [string match *.mn $host] {
putserv "mode $chan +b *!*@*.mn"
putkick $chan $nick "Extension Blacklist� : *!*@*.mn [Mongolie]"
}
}

bind join - * proc:proxy136
proc proc:proxy136 { nick uhost hand chan } {
if [string match *.mo $host] {
putserv "mode $chan +b *!*@*.mo"
putkick $chan $nick "Extension Blacklist� : *!*@*.mo [Macau]"
}
}

bind join - * proc:proxy137
proc proc:proxy137 { nick uhost hand chan } {
if [string match *.mp $host] {
putserv "mode $chan +b *!*@*.mp"
putkick $chan $nick "Extension Blacklist� : *!*@*.mp [Iles Mariana du Nord]"
}
}

bind join - * proc:proxy138
proc proc:proxy138 { nick uhost hand chan } {
if [string match *.mq $host] {
putserv "mode $chan +b *!*@*.mq"
putkick $chan $nick "Extension Blacklist� : *!*@*.mq [Martinique]"
}
}

bind join - * proc:proxy139
proc proc:proxy139 { nick uhost hand chan } {
if [string match *.mr $host] {
putserv "mode $chan +b *!*@*.mr"
putkick $chan $nick "Extension Blacklist� : *!*@*.mr [Mauritanie]"
}
}

bind join - * proc:proxy140
proc proc:proxy140 { nick uhost hand chan } {
if [string match *.ms $host] {
putserv "mode $chan +b *!*@*.ms"
putkick $chan $nick "Extension Blacklist� : *!*@*.ms [Montserrat]"
}
}

bind join - * proc:proxy141
proc proc:proxy141 { nick uhost hand chan } {
if [string match *.mt $host] {
putserv "mode $chan +b *!*@*.mt"
putkick $chan $nick "Extension Blacklist� : *!*@*.mt [Malte]"
}
}

bind join - * proc:proxy142
proc proc:proxy142 { nick uhost hand chan } {
if [string match *.mu $host] {
putserv "mode $chan +b *!*@*.mu"
putkick $chan $nick "Extension Blacklist� : *!*@*.mu [Mauritie]"
}
}

bind join - * proc:proxy143
proc proc:proxy143 { nick uhost hand chan } {
if [string match *.mv $host] {
putserv "mode $chan +b *!*@*.mv"
putkick $chan $nick "Extension Blacklist� : *!*@*.mv [Maldives]"
}
}

bind join - * proc:proxy144
proc proc:proxy144 { nick uhost hand chan } {
if [string match *.mw $host] {
putserv "mode $chan +b *!*@*.mw"
putkick $chan $nick "Extension Blacklist� : *!*@*.mw [Malawi]"
}
}

bind join - * proc:proxy145
proc proc:proxy145 { nick uhost hand chan } {
if [string match *.mx $host] {
putserv "mode $chan +b *!*@*.mx"
putkick $chan $nick "Extension Blacklist� : *!*@*.mx [Mexique]"
}
}

bind join - * proc:proxy146
proc proc:proxy146 { nick uhost hand chan } {
if [string match *.my $host] {
putserv "mode $chan +b *!*@*.my"
putkick $chan $nick "Extension Blacklist� : *!*@*.my [Malaysie]"
}
}

bind join - * proc:proxy147
proc proc:proxy147 { nick uhost hand chan } {
if [string match *.mz $host] {
putserv "mode $chan +b *!*@*.mz"
putkick $chan $nick "Extension Blacklist� : *!*@*.mz [Mozambique]"
}
}

bind join - * proc:proxy148
proc proc:proxy148 { nick uhost hand chan } {
if [string match *.na $host] {
putserv "mode $chan +b *!*@*.na"
putkick $chan $nick "Extension Blacklist� : *!*@*.na [Namibie]"
}
}

bind join - * proc:proxy149
proc proc:proxy149 { nick uhost hand chan } {
if [string match *.nc $host] {
putserv "mode $chan +b *!*@*.nc"
putkick $chan $nick "Extension Blacklist� : *!*@*.nc [Nouvelle Cal�donie]"
}
}

bind join - * proc:proxy150
proc proc:proxy150 { nick uhost hand chan } {
if [string match *.ne $host] {
putserv "mode $chan +b *!*@*.ne"
putkick $chan $nick "Extension Blacklist� : *!*@*.ne [Niger]"
}
}

bind join - * proc:proxy151
proc proc:proxy151 { nick uhost hand chan } {
if [string match *.nf $host] {
putserv "mode $chan +b *!*@*.nf"
putkick $chan $nick "Extension Blacklist� : *!*@*.nf [Iles de Norfolk]"
}
}

bind join - * proc:proxy152
proc proc:proxy152 { nick uhost hand chan } {
if [string match *.ng $host] {
putserv "mode $chan +b *!*@*.ng"
putkick $chan $nick "Extension Blacklist� : *!*@*.ng [Nig�ria]"
}
}

bind join - * proc:proxy153
proc proc:proxy153 { nick uhost hand chan } {
if [string match *.ni $host] {
putserv "mode $chan +b *!*@*.ni"
putkick $chan $nick "Extension Blacklist� : *!*@*.ni [Nicaragua]"
}
}

bind join - * proc:proxy154
proc proc:proxy154 { nick uhost hand chan } {
if [string match *.nl $host] {
putserv "mode $chan +b *!*@*.nl"
putkick $chan $nick "Extension Blacklist� : *!*@*.nl [Pays-Bas]"
}
}

bind join - * proc:proxy155
proc proc:proxy155 { nick uhost hand chan } {
if [string match *.no $host] {
putserv "mode $chan +b *!*@*.no"
putkick $chan $nick "Extension Blacklist� : *!*@*.no [Norv�ge]"
}
}

bind join - * proc:proxy156
proc proc:proxy156 { nick uhost hand chan } {
if [string match *.np $host] {
putserv "mode $chan +b *!*@*.np"
putkick $chan $nick "Extension Blacklist� : *!*@*.np [N�pal]"
}
}

bind join - * proc:proxy157
proc proc:proxy157 { nick uhost hand chan } {
if [string match *.nr $host] {
putserv "mode $chan +b *!*@*.nr"
putkick $chan $nick "Extension Blacklist� : *!*@*.nr [Nauru]"
}
}

bind join - * proc:proxy158
proc proc:proxy158 { nick uhost hand chan } {
if [string match *.nt $host] {
putserv "mode $chan +b *!*@*.nt"
putkick $chan $nick "Extension Blacklist� : *!*@*.nt [Zone Neutre]"
}
}

bind join - * proc:proxy159
proc proc:proxy159 { nick uhost hand chan } {
if [string match *.nu $host] {
putserv "mode $chan +b *!*@*.nu"
putkick $chan $nick "Extension Blacklist� : *!*@*.nu [Niue]"
}
}

bind join - * proc:proxy160
proc proc:proxy160 { nick uhost hand chan } {
if [string match *.nz $host] {
putserv "mode $chan +b *!*@*.nz"
putkick $chan $nick "Extension Blacklist� : *!*@*.nz [Nouvelle Zealand]"
}
}

bind join - * proc:proxy161
proc proc:proxy161 { nick uhost hand chan } {
if [string match *.om $host] {
putserv "mode $chan +b *!*@*.om"
putkick $chan $nick "Extension Blacklist� : *!*@*.om [Oman]"
}
}

bind join - * proc:proxy162
proc proc:proxy162 { nick uhost hand chan } {
if [string match *.op $host] {
putserv "mode $chan +b *!*@*.op"
putkick $chan $nick "Extension Blacklist� : *!*@*.op [Panama]"
}
}

bind join - * proc:proxy163
proc proc:proxy163 { nick uhost hand chan } {
if [string match *.pe $host] {
putserv "mode $chan +b *!*@*.pe"
putkick $chan $nick "Extension Blacklist� : *!*@*.pe [P�rou]"
}
}

bind join - * proc:proxy164
proc proc:proxy164 { nick uhost hand chan } {
if [string match *.pg $host] {
putserv "mode $chan +b *!*@*.pg"
putkick $chan $nick "Extension Blacklist� : *!*@*.pg [Papouasie Nouvelle Guin�e]"
}
}

bind join - * proc:proxy165
proc proc:proxy165 { nick uhost hand chan } {
if [string match *.ph $host] {
putserv "mode $chan +b *!*@*.ph"
putkick $chan $nick "Extension Blacklist� : *!*@*.ph [Philippines]"
}
}

bind join - * proc:proxy166
proc proc:proxy166 { nick uhost hand chan } {
if [string match *.pa $host] {
putserv "mode $chan +b *!*@*.pa"
putkick $chan $nick "Extension Blacklist� : *!*@*.pa [Pakistan]"
}
}

bind join - * proc:proxy167
proc proc:proxy167 { nick uhost hand chan } {
if [string match *.pl $host] {
putserv "mode $chan +b *!*@*.pl"
putkick $chan $nick "Extension Blacklist� : *!*@*.pl [Pologne]"
}
}

bind join - * proc:proxy168
proc proc:proxy168 { nick uhost hand chan } {
if [string match *.pm $host] {
putserv "mode $chan +b *!*@*.pm"
putkick $chan $nick "Extension Blacklist� : *!*@*.pm [St. Pierre et Miquelon]"
}
}

bind join - * proc:proxy169
proc proc:proxy169 { nick uhost hand chan } {
if [string match *.pn $host] {
putserv "mode $chan +b *!*@*.pn"
putkick $chan $nick "Extension Blacklist� : *!*@*.pn [Pitcairn]"
}
}

bind join - * proc:proxy170
proc proc:proxy170 { nick uhost hand chan } {
if [string match *.pr $host] {
putserv "mode $chan +b *!*@*.pr"
putkick $chan $nick "Extension Blacklist� : *!*@*.pr [Puerto Rico]"
}
}

bind join - * proc:proxy171
proc proc:proxy171 { nick uhost hand chan } {
if [string match *.pt $host] {
putserv "mode $chan +b *!*@*.pt"
putkick $chan $nick "Extension Blacklist� : *!*@*.pt [Portugal]"
}
}

bind join - * proc:proxy172
proc proc:proxy172 { nick uhost hand chan } {
if [string match *.pw $host] {
putserv "mode $chan +b *!*@*.pw"
putkick $chan $nick "Extension Blacklist� : *!*@*.pw [Palau]"
}
}

bind join - * proc:proxy173
proc proc:proxy173 { nick uhost hand chan } {
if [string match *.py $host] {
putserv "mode $chan +b *!*@*.py"
putkick $chan $nick "Extension Blacklist� : *!*@*.py [Paraguay]"
}
}

bind join - * proc:proxy174
proc proc:proxy174 { nick uhost hand chan } {
if [string match *.qa $host] {
putserv "mode $chan +b *!*@*.qa"
putkick $chan $nick "Extension Blacklist� : *!*@*.qa [Qatar]"
}
}

bind join - * proc:proxy175
proc proc:proxy175 { nick uhost hand chan } {
if [string match *.re $host] {
putserv "mode $chan +b *!*@*.re"
putkick $chan $nick "Extension Blacklist� : *!*@*.re [R�union]"
}
}

bind join - * proc:proxy176
proc proc:proxy176 { nick uhost hand chan } {
if [string match *.ro $host] {
putserv "mode $chan +b *!*@*.ro"
putkick $chan $nick "Extension Blacklist� : *!*@*.ro [Roumanie]"
}
}

bind join - * proc:proxy177
proc proc:proxy177 { nick uhost hand chan } {
if [string match *.ru $host] {
putserv "mode $chan +b *!*@*.ru"
putkick $chan $nick "Extension Blacklist� : *!*@*.ru [Russie]"
}
}

bind join - * proc:proxy178
proc proc:proxy178 { nick uhost hand chan } {
if [string match *.rw $host] {
putserv "mode $chan +b *!*@*.rw"
putkick $chan $nick "Extension Blacklist� : *!*@*.rw [Rwanda]"
}
}

bind join - * proc:proxy179
proc proc:proxy179 { nick uhost hand chan } {
if [string match *.sa $host] {
putserv "mode $chan +b *!*@*.sa"
putkick $chan $nick "Extension Blacklist� : *!*@*.sa [Arabie Saoudite]"
}
}

bind join - * proc:proxy180
proc proc:proxy180 { nick uhost hand chan } {
if [string match *.sb $host] {
putserv "mode $chan +b *!*@*.sb"
putkick $chan $nick "Extension Blacklist� : *!*@*.sb [Iles Salomon]"
}
}

bind join - * proc:proxy181
proc proc:proxy181 { nick uhost hand chan } {
if [string match *.sc $host] {
putserv "mode $chan +b *!*@*.sc"
putkick $chan $nick "Extension Blacklist� : *!*@*.sc [Seychelles]"
}
}

bind join - * proc:proxy182
proc proc:proxy182 { nick uhost hand chan } {
if [string match *.sd $host] {
putserv "mode $chan +b *!*@*.sd"
putkick $chan $nick "Extension Blacklist� : *!*@*.sd [Soudan]"
}
}

bind join - * proc:proxy183
proc proc:proxy183 { nick uhost hand chan } {
if [string match *.se $host] {
putserv "mode $chan +b *!*@*.se"
putkick $chan $nick "Extension Blacklist� : *!*@*.se [Su�de]"
}
}

bind join - * proc:proxy184
proc proc:proxy184 { nick uhost hand chan } {
if [string match *.sg $host] {
putserv "mode $chan +b *!*@*.sg"
putkick $chan $nick "Extension Blacklist� : *!*@*.sg [Singapoure]"
}
}

bind join - * proc:proxy185
proc proc:proxy185 { nick uhost hand chan } {
if [string match *.sh $host] {
putserv "mode $chan +b *!*@*.sh"
putkick $chan $nick "Extension Blacklist� : *!*@*.sh [St. H�l�ne]"
}
}

bind join - * proc:proxy186
proc proc:proxy186 { nick uhost hand chan } {
if [string match *.si $host] {
putserv "mode $chan +b *!*@*.si"
putkick $chan $nick "Extension Blacklist� : *!*@*.si [Slov�nie]"
}
}

bind join - * proc:proxy187
proc proc:proxy187 { nick uhost hand chan } {
if [string match *.sj $host] {
putserv "mode $chan +b *!*@*.sj"
putkick $chan $nick "Extension Blacklist� : *!*@*.sj [Iles Svalbard et Jan Mayen]"
}
}

bind join - * proc:proxy188
proc proc:proxy188 { nick uhost hand chan } {
if [string match *.sk $host] {
putserv "mode $chan +b *!*@*.sk"
putkick $chan $nick "Extension Blacklist� : *!*@*.sk [R�publique Slovaque]"
}
}

bind join - * proc:proxy189
proc proc:proxy189 { nick uhost hand chan } {
if [string match *.sl $host] {
putserv "mode $chan +b *!*@*.sl"
putkick $chan $nick "Extension Blacklist� : *!*@*.sl [Sierra L�one]"
}
}

bind join - * proc:proxy190
proc proc:proxy190 { nick uhost hand chan } {
if [string match *.sm $host] {
putserv "mode $chan +b *!*@*.sm"
putkick $chan $nick "Extension Blacklist� : *!*@*.sm [Saint Marin]"
}
}

bind join - * proc:proxy191
proc proc:proxy191 { nick uhost hand chan } {
if [string match *.sn $host] {
putserv "mode $chan +b *!*@*.sn"
putkick $chan $nick "Extension Blacklist� : *!*@*.sn [S�n�gal]"
}
}

bind join - * proc:proxy192
proc proc:proxy192 { nick uhost hand chan } {
if [string match *.so $host] {
putserv "mode $chan +b *!*@*.so"
putkick $chan $nick "Extension Blacklist� : *!*@*.so [Somalie]"
}
}

bind join - * proc:proxy193
proc proc:proxy193 { nick uhost hand chan } {
if [string match *.sr $host] {
putserv "mode $chan +b *!*@*.sr"
putkick $chan $nick "Extension Blacklist� : *!*@*.sr [Suriname]"
}
}

bind join - * proc:proxy194
proc proc:proxy194 { nick uhost hand chan } {
if [string match *.st $host] {
putserv "mode $chan +b *!*@*.st"
putkick $chan $nick "Extension Blacklist� : *!*@*.st [Sao Tome et Principe]"
}
}

bind join - * proc:proxy195
proc proc:proxy195 { nick uhost hand chan } {
if [string match *.su $host] {
putserv "mode $chan +b *!*@*.su"
putkick $chan $nick "Extension Blacklist� : *!*@*.su [URSS]"
}
}

bind join - * proc:proxy196
proc proc:proxy196 { nick uhost hand chan } {
if [string match *.sv $host] {
putserv "mode $chan +b *!*@*.sv"
putkick $chan $nick "Extension Blacklist� : *!*@*.sv [El Salvador]"
}
}

bind join - * proc:proxy197
proc proc:proxy197 { nick uhost hand chan } {
if [string match *.sy $host] {
putserv "mode $chan +b *!*@*.sy"
putkick $chan $nick "Extension Blacklist� : *!*@*.sy [Syrie]"
}
}

bind join - * proc:proxy198
proc proc:proxy198 { nick uhost hand chan } {
if [string match *.sz $host] {
putserv "mode $chan +b *!*@*.sz"
putkick $chan $nick "Extension Blacklist� : *!*@*.sz [Swaziland]"
}
}

bind join - * proc:proxy199
proc proc:proxy199 { nick uhost hand chan } {
if [string match *.tc $host] {
putserv "mode $chan +b *!*@*.tc"
putkick $chan $nick "Extension Blacklist� : *!*@*.tc [Iles Turks et Caicos]"
}
}

bind join - * proc:proxy200
proc proc:proxy200 { nick uhost hand chan } {
if [string match *.td $host] {
putserv "mode $chan +b *!*@*.td"
putkick $chan $nick "Extension Blacklist� : *!*@*.td [Tchad]"
}
}

bind join - * proc:proxy201
proc proc:proxy201 { nick uhost hand chan } {
if [string match *.tg $host] {
putserv "mode $chan +b *!*@*.tg"
putkick $chan $nick "Extension Blacklist� : *!*@*.tg [Togo]"
}
}

bind join - * proc:proxy202
proc proc:proxy202 { nick uhost hand chan } {
if [string match *.th $host] {
putserv "mode $chan +b *!*@*.th"
putkick $chan $nick "Extension Blacklist� : *!*@*.th [Tha�land]"
}
}

bind join - * proc:proxy203
proc proc:proxy { nick uhost hand chan } {
if [string match *.tj $host] {
putserv "mode $chan +b *!*@*.tj"
putkick $chan $nick "Extension Blacklist� : *!*@*.tj [Tajikistan]"
}
}

bind join - * proc:proxy203
proc proc:proxy203 { nick uhost hand chan } {
if [string match *.tk $host] {
putserv "mode $chan +b *!*@*.tk"
putkick $chan $nick "Extension Blacklist� : *!*@*.tk [Tokelau]"
}
}

bind join - * proc:proxy204
proc proc:proxy204 { nick uhost hand chan } {
if [string match *.tm $host] {
putserv "mode $chan +b *!*@*.tm"
putkick $chan $nick "Extension Blacklist� : *!*@*.tm [Turkmenistan]"
}
}

bind join - * proc:proxy205
proc proc:proxy205 { nick uhost hand chan } {
if [string match *.tn $host] {
putserv "mode $chan +b *!*@*.tn"
putkick $chan $nick "Extension Blacklist� : *!*@*.tn [Tunisie]"
}
}

bind join - * proc:proxy206
proc proc:proxy206 { nick uhost hand chan } {
if [string match *.to $host] {
putserv "mode $chan +b *!*@*.to"
putkick $chan $nick "Extension Blacklist� : *!*@*.to [Tonga]"
}
}

bind join - * proc:proxy207
proc proc:proxy207 { nick uhost hand chan } {
if [string match *.tp $host] {
putserv "mode $chan +b *!*@*.tp"
putkick $chan $nick "Extension Blacklist� : *!*@*.tp [Timor Est]"
}
}

bind join - * proc:proxy208
proc proc:proxy208 { nick uhost hand chan } {
if [string match *.tr $host] {
putserv "mode $chan +b *!*@*.tr"
putkick $chan $nick "Extension Blacklist� : *!*@*.tr [Turquie]"
}
}

bind join - * proc:proxy209
proc proc:proxy209 { nick uhost hand chan } {
if [string match *.tt $host] {
putserv "mode $chan +b *!*@*.tt"
putkick $chan $nick "Extension Blacklist� : *!*@*.tt [Trinidad et Tobago]"
}
}

bind join - * proc:proxy210
proc proc:proxy210 { nick uhost hand chan } {
if [string match *.tv $host] {
putserv "mode $chan +b *!*@*.tv"
putkick $chan $nick "Extension Blacklist� : *!*@*.tv [Tuvalu]"
}
}

bind join - * proc:proxy211
proc proc:proxy211 { nick uhost hand chan } {
if [string match *.tw $host] {
putserv "mode $chan +b *!*@*.tw"
putkick $chan $nick "Extension Blacklist� : *!*@*.tw [Ta�wan]"
}
}

bind join - * proc:proxy212
proc proc:proxy212 { nick uhost hand chan } {
if [string match *.tz $host] {
putserv "mode $chan +b *!*@*.tz"
putkick $chan $nick "Extension Blacklist� : *!*@*.tz [Tanzanie]"
}
}

bind join - * proc:proxy213
proc proc:proxy213 { nick uhost hand chan } {
if [string match *.ua $host] {
putserv "mode $chan +b *!*@*.ua"
putkick $chan $nick "Extension Blacklist� : *!*@*.ua [Ukraine]"
}
}

bind join - * proc:proxy214
proc proc:proxy214 { nick uhost hand chan } {
if [string match *.ug $host] {
putserv "mode $chan +b *!*@*.ug"
putkick $chan $nick "Extension Blacklist� : *!*@*.ug [Ouganda]"
}
}

bind join - * proc:proxy215
proc proc:proxy215 { nick uhost hand chan } {
if [string match *.uk $host] {
putserv "mode $chan +b *!*@*.uk"
putkick $chan $nick "Extension Blacklist� : *!*@*.uk [Grande Bretagne]"
}
}

bind join - * proc:proxy216
proc proc:proxy216 { nick uhost hand chan } {
if [string match *.um $host] {
putserv "mode $chan +b *!*@*.um"
putkick $chan $nick "Extension Blacklist� : *!*@*.um [Iles US Mineures]"
}
}

bind join - * proc:proxy217
proc proc:proxy217 { nick uhost hand chan } {
if [string match *.us $host] {
putserv "mode $chan +b *!*@*.us"
putkick $chan $nick "Extension Blacklist� : *!*@*.us [Etats Unis]"
}
}

bind join - * proc:proxy218
proc proc:proxy218 { nick uhost hand chan } {
if [string match *.uy $host] {
putserv "mode $chan +b *!*@*.uy"
putkick $chan $nick "Extension Blacklist� : *!*@*.uy [Uruguay]"
}
}

bind join - * proc:proxy219
proc proc:proxy219 { nick uhost hand chan } {
if [string match *.uz $host] {
putserv "mode $chan +b *!*@*.uz"
putkick $chan $nick "Extension Blacklist� : *!*@*.uz [Uzbekistan]"
}
}

bind join - * proc:proxy220
proc proc:proxy220 { nick uhost hand chan } {
if [string match *.va $host] {
putserv "mode $chan +b *!*@*.va"
putkick $chan $nick "Extension Blacklist� : *!*@*.va [Etat du Vatican]"
}
}

bind join - * proc:proxy221
proc proc:proxy221 { nick uhost hand chan } {
if [string match *.vc $host] {
putserv "mode $chan +b *!*@*.vc"
putkick $chan $nick "Extension Blacklist� : *!*@*.vc [Saint Vincent et les Grenadines]"
}
}

bind join - * proc:proxy222
proc proc:proxy222 { nick uhost hand chan } {
if [string match *.ve $host] {
putserv "mode $chan +b *!*@*.ve"
putkick $chan $nick "Extension Blacklist� : *!*@*.ve [V�n�zuela]"
}
}

bind join - * proc:proxy223
proc proc:proxy223 { nick uhost hand chan } {
if [string match *.vg $host] {
putserv "mode $chan +b *!*@*.vg"
putkick $chan $nick "Extension Blacklist� : *!*@*.vg [Iles Vierges (Anglaises)]"
}
}

bind join - * proc:proxy224
proc proc:proxy224 { nick uhost hand chan } {
if [string match *.vi $host] {
putserv "mode $chan +b *!*@*.vi"
putkick $chan $nick "Extension Blacklist� : *!*@*.vi [Iles Vierges (Am�ricaines)]"
}
}

bind join - * proc:proxy225
proc proc:proxy225 { nick uhost hand chan } {
if [string match *.vn $host] {
putserv "mode $chan +b *!*@*.vn"
putkick $chan $nick "Extension Blacklist� : *!*@*.vn [Vietnam]"
}
}

bind join - * proc:proxy226
proc proc:proxy226 { nick uhost hand chan } {
if [string match *.vu $host] {
putserv "mode $chan +b *!*@*.vu"
putkick $chan $nick "Extension Blacklist� : *!*@*.vu [Vanuatu]"
}
}

bind join - * proc:proxy227
proc proc:proxy227 { nick uhost hand chan } {
if [string match *.wf $host] {
putserv "mode $chan +b *!*@*.wf"
putkick $chan $nick "Extension Blacklist� : *!*@*.wf [Iles de Wallis et Futuna]"
}
}

bind join - * proc:proxy228
proc proc:proxy228 { nick uhost hand chan } {
if [string match *.ws $host] {
putserv "mode $chan +b *!*@*.ws"
putkick $chan $nick "Extension Blacklist� : *!*@*.ws [Samoa]"
}
}

bind join - * proc:proxy229
proc proc:proxy229 { nick uhost hand chan } {
if [string match *.ye $host] {
putserv "mode $chan +b *!*@*.ye"
putkick $chan $nick "Extension Blacklist� : *!*@*.ye [Yemen]"
}
}

bind join - * proc:proxy230
proc proc:proxy230 { nick uhost hand chan } {
if [string match *.yt $host] {
putserv "mode $chan +b *!*@*.yt"
putkick $chan $nick "Extension Blacklist� : *!*@*.yt [Mayotte]"
}
}

bind join - * proc:proxy231
proc proc:proxy231 { nick uhost hand chan } {
if [string match *.yu $host] {
putserv "mode $chan +b *!*@*.yu"
putkick $chan $nick "Extension Blacklist� : *!*@*.yu [Yougoslavie]"
}
}

bind join - * proc:proxy232
proc proc:proxy232 { nick uhost hand chan } {
if [string match *.za $host] {
putserv "mode $chan +b *!*@*.za"
putkick $chan $nick "Extension Blacklist� : *!*@*.za [Afrique du Sud]"
}
}

bind join - * proc:proxy233
proc proc:proxy233 { nick uhost hand chan } {
if [string match *.zm $host] {
putserv "mode $chan +b *!*@*.zm"
putkick $chan $nick "Extension Blacklist� : *!*@*.zm [Zambie]"
}
}

bind join - * proc:proxy234
proc proc:proxy234 { nick uhost hand chan } {
if [string match *.zr $host] {
putserv "mode $chan +b *!*@*.zr"
putkick $chan $nick "Extension Blacklist� : *!*@*.zr [Za�re]"
}
}

bind join - * proc:proxy235
proc proc:proxy235 { nick uhost hand chan } {
if [string match *.zw $host] {
putserv "mode $chan +b *!*@*.zw"
putkick $chan $nick "Extension Blacklist� : *!*@*.zw [Zimbabwe]"
}
}

bind join - * proc:proxy236
proc proc:proxy236 { nick uhost hand chan } {
if [string match *.edu $host] {
putserv "mode $chan +b *!*@*.edu"
putkick $chan $nick "Extension Blacklist� : *!*@*.edu [Education]"
}
}

bind join - * proc:proxy237
proc proc:proxy237 { nick uhost hand chan } {
if [string match *.gov $host] {
putserv "mode $chan +b *!*@*.gov"
putkick $chan $nick "Extension Blacklist� : *!*@*.gov [Gouvernement]"
}
}

bind join - * proc:proxy238
proc proc:proxy238 { nick uhost hand chan } {
if [string match *.rpa $host] {
putserv "mode $chan +b *!*@*.rpa"
putkick $chan $nick "Extension Blacklist� : *!*@*.rpa [Arpanet ancien style]"
}
}

bind join - * proc:proxy239
proc proc:proxy239 { nick uhost hand chan } {
if [string match *.ato $host] {
putserv "mode $chan +b *!*@*.ato"
putkick $chan $nick "Extension Blacklist� : *!*@*.ato [O.T.A.N]"
}
}

putlog "antiextension.tcl by DaV34"
