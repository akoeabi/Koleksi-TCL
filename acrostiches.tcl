######## Acrostiches (c) Lucas <lucas@eggdrop-fr.org> ########
# Ce script est distribue selon la licence qui peut etre trouvee sur
# http://www.eggdrop-fr.org/licence.html . Respectez-l� !
#
# Historique
# 21/02/2001 - v. 1.4 * tout petit bug corrig�
# 15/02/2001 - v. 1.3 * Ajout de mots par nori (that's +18 stuff)
# 09/02/2001 - v. 1.2 * Correction de la liste de mots (Laurent, Lucas)
#                     * correction d'un bug (Lucas)
#                     * ajout de couleurs (Laurent)
# 04/02/2001 - v. 1.1 * 2 listes de mots : une de noms communs, utilis�e 
#                       pour la premi�re lettre du mot, et une d'adjectifs,
#                       utilis�e pour le reste du mot. (By Raynor)
#                     * Possibili� de changer le bind : !acro <texte> au
#                       lieu de !texte. (By Raynor)
#                     * corrections mineures (Lucas)
# 31/01/2001 - v. 1.0 * rien � declarer :)
#                     * merci � Laurent pour la liste de mots !
#
# TODO :
# - S�paration des mots par des virgules, et ajout d'un 'et' entre l'
#   avant-dernier et le dernier mot.
# - Utilisation de listes diff�rentes selon le nombre de lettres du mot,
#   la position de la lettre dans le mot (s�rement dans longtemps)
#
# Usage :
# avec l'option acronospecialbind (par d�faut) :
# Il suffit de taper !<nick> ou !<mot> (si vous n'avez pas active l'option
# acronicksonly)
# sans l'option acronospecialbind :
# Il faut taper !acro <nick> ou !acro <mot> selon le cas.

# version (� ne pas changer sauf si vous voulez frimer ... =)
set v "1.4"

# Liste des channels sur lequel le script doit etre actif
set acrochans { #aide #mandarine }

# Decoder uniquement les nicks des personnes presentes sur le channel (1),
# ou decoder n'importe quoi (0) ?
set acronicksonly 1

# Utiliser un bind sur '!<mot>' (1), ou sur '!acro <texte>' (0) ?
set acronospecialbind 0

# Utiliser la liste de mots classiques (1), ou la liste trash (0) ?
# Attention, la liste de mots trash peut choquer. Contacter nori sur #iut-world
# pour vous plaindre ;o)

set acroclassic 1

# La liste de mots utilises pour decoder. Vous pouvez bien sur en rajouter.
# Si vous en rajoutez beaucoup, envoyez-les, on les mettra dans le script.

if $acroclassic {
set acroadj(a) { accueillant(e) attentionn�(e) adorable aimable admirable attirant(e) }
set acroadj(b) { brillant(e) b�liqueux(euse) }
set acroadj(c) { cool chou charmant(e) cachotier(e) }
set acroadj(d) { dr�le divin(e) d�vou�(e) }
set acroadj(e) { etonnant(e) envoutant(e) enjou�(e) exceptionnel(le) eloquent(e) enchanteur espiegle energique eblouissant(e) el�gant(e) }
set acroadj(f) { formidable factice farceur(euse) f�ministe furtif(ive) }
set acroadj(g) { gai(e) g�nial(e) gentil(le) galant(e) g�n�reux(euse) gracieux(euse) }
set acroadj(h) { h�sitant(e) h�roique humoristique harmonieux(euse) }
set acroadj(i) { inimitable imp�cable intelligent(e) irr�sistible irr�el(le) irremplacable imaginatif(ive) }
set acroadj(j) { joyeux(euse) jovial(e) jetable judicieux(euse) }
set acroadj(k) { kraquant(e) komik(e) kanon }
set acroadj(l) { lumineux(euse) lucide libre l�ger(�re) lubrique }
set acroadj(m) { mignon(e) merveilleux(euse) magnifique }
set acroadj(n) { naturel(le) n�ophyte nerveux(euse) nickel }
set acroadj(o) { original(e) ouvert(e) occidental(e) }
set acroadj(p) { poli(e) pertinent(e) pacifique paisible }
set acroadj(q) { quintescent(e) }
set acroadj(r) { rieur(euse) r�aliste rayonnant(e) rebelle rarissime raffin�(e) radieux(euse) rouge rigolo(te) ravissant(e) rapide }
set acroadj(s) { sublime sympa simple serviable}
set acroadj(t) { tendre tordant(e) terrible }
set acroadj(u) { unique universel(le) utile }
set acroadj(v) { voluptueux(euse) voyeur(euse) valeureux(euse) vaillant(e) }
set acroadj(w) { }
set acroadj(x) { xtraordinaire }
set acroadj(y) { }
set acroadj(z) { z�l�(e) }

set acronom(a) { ami alchimiste andro�de }
set acronom(b) { biblioth�caire barbare bijoutier }
set acronom(c) { carnivore cachalot }
set acronom(d) { danseur(euse) d�butant(e) d�tecteur devin }
set acronom(e) { escargot extraterrestre }
set acronom(f) { filou fermier finaud }
set acronom(g) { gars garde gloutton gymnaste }
set acronom(h) { hamster herbivore horticulteur hAx0r}
set acronom(i) { id�aliste indig�ne industriel infirmier informaticien ing�nieur }
set acronom(j) { joueur justicier }
set acronom(k) { kangourou kidnappeur  }
set acronom(l) { langouste lionceau loutre lutteur lynx }
set acronom(m) { machine magicien mammif�re mannequin mousquetaire }
set acronom(n) { nain navigateur nomade notaire nudiste }
set acronom(o) { officier oiseau orateur ouvrier }
set acronom(p) { phylosophe pacifiste panth�re patineur }
set acronom(q) { quinquag�naire }
set acronom(r) { radiologue ramoneur ravitalleur r�alisateur rebelle r�dacteur root }
set acronom(s) { salari� saboteur sanguinaire scaphandrier savant saxophoniste }
set acronom(t) { teintiurier torrero therapeute }
set acronom(u) { utilisateur }
set acronom(v) { vacancier v�g�tarien viellard visiteur }
set acronom(w) { wapiti wallaby }
set acronom(x) { }
set acronom(y) { yack yak }
set acronom(z) { z�bre zoologiste zouave } 

} else {

set acroadj(a) { aioli anus alcoolik alcoolique aigri } 
set acroadj(b) { betedesexe blonde bioman beauf bidochon bordel bang betoneuse bite bambou bebile bordel branlette bite boiteacaca belge barbare branleur branlette branle branletteespagnol b0nkZ } 
set acroadj(c) { crs crazy clito clitoris caisse calbute con cuni cochonne cochon connerie chaterton chicha couille colongrec cul chatte cuni calva caca chiasse cosmospace chien chienne chiennasse cancer chiuredemouche}
set acroadj(d) { dinde dixionvelcro dragueur drogu� d�prav� dun4n dictateur danks } 
set acroadj(e) { excr�ment encul� etron epitechiens echangiste echangisme }
set acroadj(f) { fripouille femelles fou folle fabian fdm fistfuking fist foutre fesse fion fuck fucking fock fiante freeben fumier }
set acroadj(g) { grossepute groslard gras gueu gueuze grossecaisse gueule glaviot gerbe gerbouille glaviot gland germain gongle gnou glaire } 
set acroadj(h) { Hirschmann } 
set acroadj(i) { idiot ivrogne impuissant impuissante ichoo } 
set acroadj(j) { join joeystarr jacouille } 
set acroadj(k) { krissophile kro kelgrosnain } 
set acroadj(l) { lamouze larusso larve levrette libertin} 
set acroadj(m) { mbalo mbalotisateur moulbite moustique m�creant moule militaire mochuda mochuding marmotte mancheabalais masturb masturbisationnageintensif mbalo minou merde mouatte morve maladie }
set acroadj(n) { nain nul nullard naze nerd nerdz } 
set acroadj(o) { obese oinj orgie orgieclandestine }
set acroadj(p) { putevierge poete pipi petoman peteur pd pingouin pouf pouffiasse pet puceau pipe poete pisse pouilleux pouilled� punk polyo poliotte polio petfoireux pederaste }
set acroadj(q) { qu quequette quebequoise } 
set acroadj(r) { raieducul rigolo rellik racaille rondelle relou rectum residu raclure }
set acroadj(s) { skyuser skyuseuse suducul superpute skateur suceur suceuse suxeur suxxx shadock suce slip salaud seins salope salopard salopio sexe sexual sexapiles sodom sodomise sodomite scato scatophile suceboule} 
set acroadj(u) { urine uso } 
set acroadj(v) { viagra vierge vaseline vomir vereux vomi verue} 
set acroadj(w) { windmaster windman wax } 
set acroadj(x) { xterminateur }
set acroadj(y) { yodgi yo yop }
set acroadj(z) { zob zoophile } 

set acronom(a) { aioli anus alcoolik alcoolique aigri  }
set acronom(b) { barbare branleur branlette branle branletteespagnol b0nkZ betedesexe blonde bioman beauf bidochon bordel bang betoneuse bite bambou bebile bordel branlette bite boiteacaca belge }
set acronom(c) { cancer chiure crs crazy clito clitoris caisse calbute con cuni cochonne cochon connerie chaterton chicha couille colongrec cul chatte cuni calva caca chiasse cosmospace chien chienne chiennasse }
set acronom(d) { d�prav� dun4n dictateur danks dinde dixionvelcro dragueur drogu� }
set acronom(e) { etron epitechiens echangiste echangisme excr�ment encul� }
set acronom(f) { fripouille femelles fou folle fabian fdm fistfuking fist foutre fiante fumier freeben fesse fion fuck fucking fock }
set acronom(g) { grossepute groslard gras gueu gueuze grossecaisse gueule glaviot gerbe gerbouille gnou glaire glaviot gland germain gongle }
set acronom(h) { Hirschmann }
set acronom(i) { idiot ivrogne impuissant ichoo impuissante }
set acronom(j) { join joeystarr jacouille }
set acronom(k) { krissiphile kro kelgrosnain }
set acronom(l) { lamouze larusso larve levrette libertin }
set acronom(m) { mbalo mbalotisateur moulbite moustique m�creant moule militaire mochuda mochuding marmotte mancheabalais masturb masturbisationnageintensif morve maladie mbalo minou merde mouatte }
set acronom(n) { nain nul nullard naze nerd nerdz }
set acronom(o) { obese oinj orgie orgieclandestine }
set acronom(p) { poneyfile putevierge poete pipi petoman peteur pd pingouin petfoireux pederaste pouf pouffiasse pet puceau pipe poete pisse pouilleux pouilled� punk polyo poliotte polio }
set acronom(q) { qu quequette quebecoise }
set acronom(r) { raieducul residu raclure rigolo rellik racaille rondelle relou rectum }
set acronom(s) { skyuser skyuseuse suducul superpute scato scatophile suceboule skateur suceur suceuse suxeur suxxx shadock suce slip salaud seins salope salopard salopio sexe sexual sexapiles sodom sodomise sodomite }
set acronom(t) { troudebal terremolactil thondelespace trouducul tapette tiroflanaistekelisateur testiboulles trique trick }
set acronom(u) { urine uso }
set acronom(v) { viagra vierge verue vaseline vomir vereux vomi }
set acronom(w) { windmaster windman wax }
set acronom(x) { xterminateur }
set acronom(y) { yodgi yo yop }
set acronom(z) { zob zoophile } 
}

###########################################################################
#################################### SCRIPT ###############################
###########################################################################

if ($acronospecialbind) { 
   foreach acrochan $acrochans {
      bind pubm - "$acrochan !*" pubm:acro
   }
} else {
   bind pub - !acro pub:acro
}

proc pubm:acro { nick uhost handle channel texte } {
   global acronospecialbind
   if $acronospecialbind { 
      set texte [join [split $texte]]
      set texte [string trim $texte]
      if ![string compare [string index $texte 0] "!"] {
         set mot [string range [lindex $texte 0] 1 end]
         dispacro $mot $channel
      }
   }
}

proc pub:acro { nick uhost handle channel texte } {
   global acronospecialbind
   if !$acronospecialbind {
      set texte [join [split $texte]]
      set texte [string trim $texte]
      set mot [lindex $texte 0]
      dispacro $mot $channel
   }
}

proc dispacro { texte channel } {
   global acronicksonly acroadj acronom
   if [onchan $texte $channel]||(!$acronicksonly) {
      set slen [expr [string length $texte] - 1]
      if [info exists acronom([string tolower [string index $texte 0]])] {
         set str2app $acronom([string tolower [string index $texte 0]])
         set str2app [lindex $str2app [rand [llength $str2app]]]
         lappend res "7[string toupper [string index $str2app 0]][string range $str2app 1 end]"
      } else {
         lappend res "7[string toupper [string index $texte 0]]"
      }
      for { set i 1 } { $i<=$slen } { incr i } {
         if [info exists acroadj([string tolower [string index $texte $i]])] {
            set str2app $acroadj([string tolower [string index $texte $i]])
            set str2app [lindex $str2app [rand [llength $str2app]]]
            lappend res "6[string toupper [string index $str2app 0]][string range $str2app 1 end]"
         } else {
            lappend res "6[string toupper [string index $texte $i]]"
         }
      }
      if [info exists res] {
         putserv "PRIVMSG $channel :[join $res]"
      }
   }
}

putlog "Acrostiches v.$v charg� (par Lucas & Raynor)"
