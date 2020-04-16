##################### bello.tcl ###########################
##
## viel spaß damit
## bugs fehler etc. bitte mail an  tcl@Matfo.de
## ©2002 by Matfo 
##
## Neu: OP-Sensitive Befehle (siehe unten..), !toete *nick* und anderes
################### bello.tcl ##############################

################# Bello_nick #########################
set bello_nick "j0o`"

################# Bello_Version ######################
set belloversion "v3.2"

################# channel wo das script NICHT funktioniert
set no_bellos "#spe"

################# einsatz channel
set my_bello_chan "*"

######### !bello ###############
bind pub - !bello pub_bello_help
proc pub_bello_help {nick uhost hand chan arg} {
global no_bellos
global my_bello_chan
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
putlog "$nick used !bello..."
set bold "\002"
putnotc $nick "$bold bello.tcl $belloversion by Matfo (mailto:bello-tcl@matfo.de)"
putnotc $nick "$bold Ich bin der Hund des Channels $chan und $my_bello_chan und kenne folgende Befehle:"
putnotc $nick "$bold !gassi , !streicheln, !stoeckchen, !hallo *nick*, !klingel, !pfoetchen, !leckerli, !baden, !wanne, !kraul !schleck *nick*, !knuddel"
putnotc $nick "$bold !schmus , !knuff, !postbote, !anleinen *nick*, !woist *nick*, !braver, !schild *nick*"
putnotc $nick "$bold Auf diese Woerter zeige ich eine Reaktion (ohne !): muede, gähn, koeter, katze, pfeif (nur bei Herrchen), floh, hunger"
putnotc $nick "$bold Die folgenden Funktionen sind nur fuer meine Herrchen (OPs):"
putnotc $nick "$bold !zeitung, !sitz, !platz, !giblaut, !achtung, !aufpassen *nick*, !fass *nick*, !toete *nick"
putnotc $nick "$bold !herrchen *nick*, !nichtherrchen *nick*  !handy, !fernbedienung, !futter, !koerbchen"
putnotc $nick "$bold Die Gross- Kleinschreibung ist mir egal *g*"
}
######### !heise ###############
bind pub - !heise pub_heisecmds
proc pub_heisecmds {nick uhost hand chan arg} {
global no_bellos
global my_bello_chan
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
putlog "$nick used !help..."
set bold "\002"
putnotc $nick "$bold !heisenews gibt die letzten 10 Newslines aus."
putnotc $nick "$bold !heisenews all gibt alle news des tages wieder"
putnotc $nick "$bold !heiselink <x> msgt die url der newsline nummer x"
}
######################### Versteckte Funktionen #################################################
## Bello reagiert auf !Microsoft, !Microschrott, !Windows, !Windoof, !Windoze damit, dass er sich uebergibt *g*
## !deface [url], !scriptkiddie *nick*


##################################################################################################
##################### keine aenderungen unter dieser linie noetig ################################
##################################################################################################

########## ?bello ###################
bind pub - ?bello pub_bello
proc pub_bello {nick uhost hand chan arg} {
putlog "$nick used ?Bello..."
set bold "\002"
putchan $chan "$bold bello.tcl v3.1 by Matfo (bello-tcl@matfo.de) --> Befehle unter !Bello"
}
########## !postbote ###############
bind pub - !postbote pub_postbote
proc pub_postbote {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *postbote* woooooooo issa *auflauerlegundlausch* daaaaa issaaaaaaaa *nachpostbotefass*"
}
############# !kraul ###################
bind pub - !kraul pub_kraul
proc pub_kraul {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold  zu $nick rüüüberlauf und aufs kraulen wart :)"
}
######## !anleinen ###################
bind pub - !anleinen pub_anleinen
proc pub_anleinen {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Leine hol und $arg an die leine mach und los geh :)"
}
########## !gassi ##############
bind pub - !gassi pub_gassi
proc pub_gassi {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Ui, $nick will Gassi gehen *freu*!!!"
}
########### !streicheln ##############
bind pub - !streicheln pub_streicheln
proc pub_streicheln {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *AufdenRueckendrehundwarte*"
}
########## !stöckchen ##############
bind pub - !stöckchen pub_stoeckchen
bind pub - !stoeckchen pub_stoeckchen
proc pub_stoeckchen {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *wegwetzundwiederhol*"
}

######## !pfötchen ########
bind pub - !pfötchen pub_pfoetchen
bind pub - !pfoetchen pub_pfoetchen
proc pub_pfoetchen {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *$nick Pfötchengeb*"
}
######## !leckerli ########
bind pub - !leckerli pub_leckerli
proc pub_leckerli {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Leckerli? <--- *wegschnappschling*"
}
####### !baden ######
bind pub - !baden pub_baden
proc pub_baden {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Baden?...... WASSER?????? *schnellabhau*"
}
########## !wanne #############
bind pub - !wanne pub_wanne
proc pub_wanne {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Hey $nick, ich war erst letztes Jahr baden *abhau*"
}
######### !schmus ##############
bind pub - !schmus pub_schmus
proc pub_schmus {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Zu $nick Rüberlauf um zu Schmusen *SCHMUS*"
}
######### !knuddel ###########
bind pub - !knuddel pub_knuddel
proc pub_knuddel {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *KNUDDEL*??????? zu $nick rüberlauf und auch geknuddelt werden will *KNUDELL*"
}
######## !knuff ############
bind pub - !knuff pub_knuff
proc pub_knuff {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *KNUFF*????? $nick lieb anseh und auch geknuffel werden will *KNUFF* :)!!"
}
########### !schleck, !weck #################
bind pub - !schleck pub_schleck
bind pub - !weck pub_schleck
proc pub_schleck {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Zu $arg rüüüüüüüberlauf und abschleck *SCHLECK*"
}
########### !hallo #################
bind pub - !hallo pub_hallo
proc pub_hallo {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *Zu $arg rüüüüüüüberlauf, freudig schwanzwedelnd hochspring und $arg das Gesicht abschleck *SCHLECK*"
}
########### !tschuess #################
bind pub - !tschuess pub_tschuess
proc pub_tschuess {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *Zu $arg rüüüüüüüberlauf, freudig schwanzwedelnd hochspring und $arg das Gesicht abschleck *SCHLECK*"
}
########### !danke #################
bind pub - !danke pub_danke
proc pub_danke {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *wuff* gern geschehen *g*"
}
########### !woist #################
bind pub - !woist pub_woist
proc pub_woist {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold *schnupper*.. *such*.. Da ist $arg !!! Wuff Wuff"
}
###### !klingel #######
bind pub - !klingel pub_klingel
proc pub_klingel {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Es hat geklingelt! *tuereankläff*"
}
###### !braver #######
bind pub - !braver pub_braver
proc pub_braver {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold Hey $nick das ist mein Job! *g*"
}
###### !schild #######
bind pub - !schild pub_schild
proc pub_schild {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold $arg , Hier ist dein Schild! http://www.hieristdeinschild.de/"
}
###### !unix #######
bind pub - !unix pub_unix
proc pub_unix {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold UNIX? Das ist Balsam fuer meine Ohren.. $nick wenn du windows oder microsoft gesagt haettest.. *kotz*"
}
###### !linux #######
bind pub - !linux pub_linux
proc pub_linux {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
}
set bold "\002"
putchan $chan "$bold LINUX? Das ist Balsam fuer meine Ohren.. $nick wenn du windows oder microsoft gesagt haettest.. *kotz*"
}
########## !windows ##################
bind pub - !windows pub_windows
bind pub - !windoof pub_windows
bind pub - !windoze pub_windows
proc pub_windows {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold MS Windoof??? HILFE! *sich die letzte Futterportion (800g Rinds - Entrecote) durch den Kopf gehen lass* So das darf $nick wegputzen."
}
########## !microsoft ##################
bind pub - !microsoft pub_microsoft
bind pub - !microschrott pub_microsoft
bind pub - !ms pub_microsoft
proc pub_microsoft {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold Microschrott??? HILFE! *sich die letzte Futterportion (800g Rinds - Entrecote) durch den Kopf gehen lass* So das darf $nick wegputzen."
}

########## !geburtstag ##################
bind pub - !geburtstag pub_geburtstag
proc pub_geburtstag {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold Hey $arg alles gute zum Burzeltag *happy birthday jaul* *wouuuuuuu.. happy birthday* *g* *$arg abschleck"
}
########## !eunuch #############
bind pub - !eunuch pub_eunuch
proc pub_eunuch {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold * $arg die Eier abbeiss* mmh, proteine!"
}



############# hunger ########
bind pubm - *hunger* pub_hunger
proc pub_hunger {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold Hey, $nick - ich hab auch hunger!"
}
######### floh ##############
bind pubm - *floh* pub_floh
proc pub_floh {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold *floh* ????? aaaaaaaah *schrei* $nick mach sie weg, mach sie weg \0034*zutodekratz*"
}
############ köter #############
bind pubm - *köter* pub_koeter
bind pubm - *koeter* pub_koeter
proc pub_koeter {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold köter? *knurrr zaehnefletsch*"
}
########## katze ##################
bind pubm - *katze* pub_katze
proc pub_katze {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold Katze??? Wo?? *der Katze hinterher renn*"
}
######## Bello Gib Laut! ####################
bind pubm - "$bello_nick gib laut" pub_lautgeb
proc pub_lautgeb {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! 
*anknurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *Wuff Wuff*"
}
########## muede ##################
bind pubm - *muede* pub_muede
proc pub_muede {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold *gähn* *sich in den Hundekorb legt*"
}
########## gähn ##################
bind pubm - *gähn* pub_gaehn
proc pub_gaehn {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold *gaehn* *sich in den Hundekorb legt*"
}
########## stille ##################
bind pubm - *stille* pub_stille
proc pub_stille {nick uhost hand chan arg} {
set bold "\002"
putchan $chan "$bold Es ist so ruhig hier! *Klaeff Wuff Wuff*"
}











############################## nur fuer ops ######################################

####### !zeitung ####################
bind pub - !zeitung pub_zeitung
proc pub_zeitung {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *Mit der Zeitung im Maul zu $nick geh*"
}
######### !Sitz #######
bind pub - !Sitz pub_sitz
proc pub_sitz {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *bravhinsetz*"
}
######## !giblaut #############
bind pub - !giblaut pub_giblaut
proc pub_giblaut {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *schwanzwedelnd bellt* Wuff Wuff"
}
######## !fuss #############
bind pub - !fuss pub_fuss
proc pub_fuss {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *Schwanzwedelnd mit Hundeblick zu $nick geh* Hab doch nix getan!!"
}
######## !Platz #############
bind pub - !Platz pub_platz
proc pub_platz {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *widerspenstig ablieg und mit den augen nach $nick schiel*"
}
########## !achtung #############
bind pub - !achtung pub_achtung
proc pub_achtung {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *Ohrenspitz, Aufsteh, Umherkuck*"
}
########## !aufpassen #############
bind pub - !aufpassen pub_aufpassen
proc pub_aufpassen {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *Auf $arg aufpass* *Knurr* *Zaehnefletsch* WENNDUDICHBEWEGSTBISTDUTOT"
}
########### !fass ###############
bind pub - !fass pub_fass
proc pub_fass {nick uhost hand chan arg} {
global no_bellos

if {![isop $nick $chan]} {
putlog "$nick TRIED TO USE !fass $arg"
set bold "\002"
putchan $chan "$bold Schnappt sich das Hosenbein von $nick und schleppt ihn nach draussen. *auf_stefan_raabs_knopf_drueck* RAUS HIER ABER SCHNELL"
puthelp "KICK $chan $nick :Du bist keins von meinen Herrchen! *knurr* *wuff* http://www.raus.de"
puthelp "NOTICE $nick : *knurrr*"
return 0
}

if {[isop $arg $chan]} {
putlog "$nick TRIED TO USE !toete $arg"
set bold "\002"
putchan $chan "$bold Ich beisse meine Herrchen oder mich selbst nicht!"
puthelp "NOTICE $nick : *knurrr*"
return 0
}

putlog "$nick used !fass $arg"
set bold "\002"
putchan $chan "$bold Schnappt sich das hosenbein von $arg und schleppt ihn nach draussen. *auf_stefan_raabs_knopf_drueck* RAUS HIER ABER SCHNELL"
puthelp "KICK $chan $arg : *böseguck* nun bleibst du draussen *knurr* *bell*"
puthelp "NOTICE $arg : *knurrr*"
}
########### !toete ###############
bind pub - !toete pub_toete
proc pub_toete {nick uhost hand chan arg} {
global no_bellos
global botname
if {![isop $nick $chan]} {
putlog "$nick TRIED TO USE !toete $arg"
set bold "\002"
putchan $chan "$bold Schnappt sich das hosenbein von $nick und schleppt ihn nach draussen. *auf_stefan_raabs_knopf_drueck* RAUS HIER ABER SCHNELL"
puthelp "KICK $chan $nick :Du bist keins von meinen Herrchen! *knurr* *bell*"
puthelp "NOTICE $nick : *knurrr*"
return 0
}

if {[isop $arg $chan]} {
putlog "$nick TRIED TO USE !toete $arg"
set bold "\002"
putchan $chan "$bold Ich kille meine Herrchen oder mich selbst nicht!"
puthelp "NOTICE $nick : *knurrr*"
return 0
}

putlog "$nick used !toete $arg"
set bold "\002"
putchan $chan "$bold Springt $arg an die Gurgel und schleppt ihn nach draussen. *auf_stefan_raabs_knopf_drueck* RAUS HIER ABER SCHNELL"
putserv "MODE $chan +b $arg : Fahr zur Hoelle!"
puthelp "KICK $chan $arg : Und Bleib dort! *zaehnefletsch*"
puthelp "NOTICE $arg : *knurrr*"
}
########### !herrchen ###############
bind pub - !herrchen pub_herrchen
proc pub_herrchen {nick uhost hand chan arg} {
global no_bellos
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
putlog "$nick used !herrchen $arg"
set bold "\002"
putchan $chan "$bold Laeuft freudig zu $arg und macht ihn auf Befehl von $nick zu seinem Herrchen *anspring* *abschleck*"
putserv "MODE $chan +o $arg"
}
########### !nichtherrchen ###############
bind pub - !nichtherrchen pub_notherrchen
proc pub_notherrchen {nick uhost hand chan arg} {
global no_bellos
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
putlog "$nick used !nichtherrchen $arg"
set bold "\002"
putchan $chan "$bold Hey $arg , $nick will nicht mehr dass du mein Herrchen bist. *zaehnefletsch* *leinewegnehm* *vom-op-thron-zerr*"
putserv "MODE $chan -o $arg"
}
########## !fernbedienung ############
bind pub - !Fernbedienung pub_fernbedienung
proc pub_fernbedienung {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold Hier $nick die Fernbedienung, laeuft denn auch Lassy? *haechel*"
}
######### !handy ###########
bind pub - !Handy pub_handy
proc pub_handy {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *mit*handy*im*maul*angelaufenkomm*rufen*wir*denn*auch*meine*freundin*an*hechel*"
}
######## !futter ########
bind pub - !futter pub_futter
proc pub_futter {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr* Willst mich wohl vergiften!"
return 0}
}
set bold "\002"
putchan $chan "$bold Futter? *Zum Napf hetz und die dreimal - taegliche Futterportion (je 800g Rinds - Entrecote) innert 1/100sec runterschletz* War das alles???"
}
######## !koerbchen ########
bind pub - !koerbchen pub_koerbchen
proc pub_koerbchen {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
}
set bold "\002"
putchan $chan "$bold *in sein Hundebett lieg*"
}

######## !deface ########
bind pub - !deface pub_deface
proc pub_deface {nick uhost hand chan arg} {
global no_bellos
foreach ch $no_bellos {
if {[string tolower $chan] == $ch} {return 0}
if {![isop $nick $chan]} {
putchan $chan "$bold $nick weisst du ueberhaupt was n DoS ist?"
return 0}
}
set bold "\002"
putchan $chan "$bold OK $nick lets D3F4C3 $arg !"
}

########## !scriptkiddie ###############
bind pub - !scriptkiddie pub_scriptkiddie
proc pub_scriptkiddie {nick uhost hand chan arg} {
global no_bellos
global botname

if {[isop $arg $chan]} {
set bold "\002"
putchan $chan "$bold Hey $nick , $arg ist sicher kein scriptkiddie. Ich glaube eher, du bist eins! "
return 0
}

set bold "\002"
putchan $chan "$bold $arg ist n Scriptkiddie?? *auf_stefan_raabs_knopf_drueck* RAUS HIER ABER SCHNELL"
}

######## pfeif #########
bind pubm - *pfeif* pub_pfeif
proc pub_pfeif {nick uhost hand chan arg} {
if {![isop $nick $chan]} {
puthelp "NOTICE $nick : Du bist keins von meinen Herrchen $nick! *knurrrr*"
return 0}
set bold "\002"
putchan $chan "$bold *sofort zu Herrchen $nick rennt*"
}

######################################################################################
putlog "\002 \00311,1###bello.tcl : Version $belloversion by Matfo  bello-tcl@matfo.de is now loaded..."
putlog "\002 \00311,1###bello.tcl : Befehle unter !help oder !bello, Version unter ?bello"
putlog "\002 \00311,1###bello.tcl : version $belloversion by Matfo is now loaded..."

