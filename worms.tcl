# to enable the worms irc party script for your channel type '.chanset #channel +worms'
# the default command to fight with a player is '!fight <nickname>'


# {{{ worms irc party

    # {{{ configuration

        # {{{ variables

            set worms(trigger)    "!"

            set worms(protection) "300"
            set worms(default,hp) "150"

            set worms(version)    "1.0"
            set worms(author)     "#host-arena"

        # }}}
        # {{{ copyright

            putlog "\[worms-script\] version $worms(version) scripted by $worms(author)"

        # }}}
        # {{{ bindings

            bind PUB  -|- "$worms(trigger)fight"  game:worms:fight
            bind PUB  -|- "$worms(trigger)waffen" game:worms:weapons:overview
            bind PUB  -|- "$worms(trigger)ja"     game:worms:accept
            bind PUB  -|- "$worms(trigger)nein"   game:worms:reject
            bind PUBM -|- "*"                     game:worms:weapons

        # }}}
        # {{{ flags
 
            setudef flag worms

        # }}}
        # {{{ available commands

            if {[array exists commands]} {
                array unset commands
            }

            array set commands {
                sex          "3"
                antiterror   "0"
                bierflasche  "0"
                schlag       "0"
                gay          "0"
                oma          "3"
                tritt        "0"
                geschenk     "5"
                oper         "2"
                wombat       "0"
                suicid       "0"
                omfg         "1"
                voodoo       "1"
                licht        "0"
                reallife     "5"
            }

        # }}}
        # {{{ messages

            if {[array exists messages]} {
                array unset messages
            }

            array set messages {

               reallife-1    {"-00" "-20" ":p1: zerrt :p2: ins Reallife der beim Anblick der Grafik wahnsinnig wird... "}
               reallife-2    {"-00" "-15" ":p1: jagt :p2: ins Reallife der drückt wie wild auf seiner Tastatur rum um das Programm zu beenden"}
               reallife-3    {"-00" "-05" ":p2: versteht die Welt nicht mehr als er plötzlich durch einen hinterlistigen Trick von :p1: im Reallife steht..."}

               voodoo-1      {"-00" "-00" ":p1: beschwört die bösen Voodoogeister um mit :p2: die Healthpoints zu tauschen... *DONNER* *BLITZ!* *GROLL*"}
               voodoo-2      {"-05" "-00" "Die Voodoogeister scheinen nicht auf :p1:'s Seite zu sein. Kein Healthpoint-Tausch mit :p2:. Zur Strafe ziehen die Geister :p1: Healthpoints ab"}

               omfg-1        {"-15" "-15" "Du wolltest es nicht anders :p1:! Attention: 5 Tomahawk-Marschflugkörper inklusive Nuklearsprengköpfen sind auf dem weg zu dir und :p2:! Das macht Freude was!?!"}
               omfg-2        {"-11" "-00" ":p1:, dein Antrag an die U.S.Army, 5 Tomahawk-Marschflugkörper inklusive Nuklearsprengköpfen auf :p2:'s Koordinaten zu lenken wurde abgelehnt. (Reason: No nuclearwars without US!) Pech gehabt."}

               suicid-1      {"-200" "-00" ":p1: zieht den Selbstmord vor, anstatt sich wie ein Mann dem Kampf zu stellen! Rest in peace... pussy!"}
               suicid-2      {"-200" "-00" "*TICK* *TICK* *TICK*... was ist denn das? *BOOOooooooM!* Ouh, es war :p1:'s Selbstzerstörungsmodus xD Gratulation :p2:, er fand dich so zum kotzen das er sich selbst umbringt!"}

               wombat-1      {"-00" "-10" ":p1: hetzt :p2: ein hyperaktives und tollwütiges Nasenhaarwombat auf den Hals... *wuahhhhh* *beiss* *phEdS*"}
               wombat-2      {"-00" "-00" "Das von :p1: entsendete 'krass-konkrete-aggro-Nasenhaarwombat' findet :p2: einfach nicht! Hat er sich etwa versteckt? *schnüffel* *such*"}
               wombat-3      {"-00" "-00" "Zufälligerweise hat :p2: auch ein Nasenhaarwombat mitgebracht... Tja :p1:, nun gibts ne Peepshow anstatt nem Kampf, die Wombats scheinen sich zu mögen... *RRRRrrr*"}
               wombat-4      {"-00" "-15" "Laaaaauuuuf :p2: ... laaaaauuuuf! :p1:'s Nasenhaarwombat ist derbe schnell! Viel Spaß mit dem Tierchen im Nacken..."}
               wombat-5      {"-00" "-20" "Ohohoh :p2:! :p1: hat soeben ein Kamikaze-Nasenhaarwombat in deine Richtung geschickt... zu spät! *BOOoooM!* *KRACH*"}

               antiterror-1  {"-00" "-10" "Als ehem. Mitglied der GSG9 ist es für :p1: kein Problem :p2: im Nahkampf zu bashen! *SLAP* *BASH* ELITÄR!"}
               antiterror-2  {"-00" "-00" ":p1: hat wohl beim Anti-Terrorlehrgang lieber gepennt als aufzupassen. :p2: hat keine Mühe :p1:`s Angriffen auszuweichen... Tzs..."}
               antiterror-3  {"-00" "-05" ":p1: würde mit seiner 'Arctic Warfare Magnum' aus 2Km Entfernung das linke Auge einer Fliege wegknallen. Diesmal trafs :p2:'s Kniescheibe... *AUA!*"}
               antiterror-4  {"-00" "-20" "OMG! Der rote Punkt auf :p2:'s Brustkorb verrät uns, dass :p1: :xtra: mit einem elektr. Reflexvisier ausgerüstet hat... *BUuuMM*... Fleischwunde! "}
               antiterror-5  {"-00" "-00" "Also bitte :p1: ... Du willst ein ehem. NAVY SEAL sein? Nenene, wer beim abfeuern einer P8 aus 10m :p2: nicht trifft, ist ein shice FAKER! Sowas...pff"}

               bierflasche-1 {"-00" "-15" ":p1: zieht :p2: von hinten eine 'Clausthaler-Alkoholfrei' Bierflasche übern Schädel... *SPLASH*"}
               bierflasche-2 {"-00" "-00" ":p1: schnappt sich eine Becksflasche, zerschlägt sie am Tisch und fuchtelt damit unkoordiniert vor :p2:'s Nase rum *fuchtel*"}
               bierflasche-3 {"-00" "-10" ":p1: wirft seine letzte Flasche Bier nach :p2:... *fuuupp* ... HEADSHOT!"}
               bierflasche-4 {"-00" "-20" ":p1: schüttelt seine Weißbierflasche... *SCHÄUM* ... *SPRITZ* ... owwww :p2: genau ins Auge!"}
               bierflasche-5 {"-00" "-00" ":p1: versucht eine 'Löwenbräu' Bierflasche zur Analsonde umzufunktionieren... *mit Gleitgel einreib* ... *aus der Hand fall* *schplitter*... mhm, war wohl etwas zu flutschig. :p2: :'rooooofl!'"}

               tritt-1       {"-00" "-10" "Mit einem Tritt aus vollem Lauf vernichtet :p1: :p2:'s zukünftige Familienplanung! Süßer die Glocken nie klingen! Weihnachten im Großhirn..."}
               tritt-2       {"-00" "-15" "WOW! Ein 'Hurricane-Kick' von :p1: reisst :p2: zu Boden. Damit hatte keiner gerechnet!"}
               tritt-3       {"-00" "-00" ":p1: ist wohl 'Halbseiten-Spasstiker' denn seine Tritte würden :p2: nichtmal treffen, wenn dieser 2m groß und 4m breit wäre... AMATEUR!"}
               tritt-4       {"-00" "-10" "*KICK* *KICK* *KICK*... Mit einer wahnsinns Fußtrittorgie gelingt es :p1: den überraschten :p2: auf den 'Boden der Tatsachen' zurück zu bringen."}
               tritt-5       {"-15" "-00" ":p2: weicht dem Tritt von :p1: mit einer geschickten Seitwärtsbewegung aus *DREHMOVE* und befördert :p1: per Low-Spin-Kick in den Strassegraben. EN EINZ :p2:!"}

               schlag-1      {"-00" "-20" ":p1: zückt einen :xtra: aus seiner Hosentasche... *BANG* *POW*...immer mitten in die Fresse rein! Tja :p2:, morgen Zahnarztbesuch mh?!"}
               schlag-2      {"-00" "-10" ":p1:'s geballte Fäuste fliegen :p2: um die Ohren... *ZONK* *KLATSCH* Jau, :p2: schlürft die nächsten Tage wohl Suppe."}
               schlag-3      {"-00" "-00" ":p1: sollte mehr Fleisch essen, denn seine Schläge prallen von :p2: ab wie Gummidildos... VERSAGER!"}
               schlag-4      {"-00" "-00" "Elegant tänzelt :p2: umher und weicht jedem Schlag von :p1: aus... Ist wohl nicht dein Tag :p1: !?"}
               schlag-5      {"-00" "-10" "Mit der flachen Hand verpasst :p1: :p2: ein paar saftige Ohrfeigen... *KLATSCH* :p1: bist du etwa ein Mädchen?!!"}

               geschenk-1    {"-00" "-10" ":p1: überreicht :p2: ein kleines Geschenk... *aufpack* Naaaa? Freust du dich über die Uranbrennstäbe? Extra frisch ausm Atomkraftwerk! *strahl*"}
               geschenk-2    {"-00" "-20" "Um :p2: eine Freude zu machen gibts von :p1: einen Bordellgutschein im Werte von 50 Euro... Leider hatte der Blasehase Herpes, ehhhhh!"}
               geschenk-3    {"-00" "+15" ":p2: darf sich nun wirklich freuen! Aus der Torte von :p1: hüpft nämlich :xtra: und stripped ne Runde für :p2:! WOoOoOW!!!"}
               geschenk-4    {"+15" "+15" ":p1: schenkt :p2: ne Tüte Kekse... Erstma mittach! *knabber* ... ihr seid sooo süß ihr zwei!!!"}
               geschenk-5    {"-00" "-10" "Auf :p1:'s Present in Form einer :xtra: hätte :p2: mit Sicherheit gerne verzichtet! Brrrrrrrr..."}

               oper-1        {"-00" "-15" "Uuuuups :p2: ... einmal disconnect per KILL? :xtra: ist wohl ein Freund von :p1:... Das nennt man PECH mh?!"}
               oper-2        {"-10" "-00" "Nanana :p1:! In #feds nen G-line für :p2: requesten mag :xtra: garnich so! Ergo: 2 Tage G-line für :p1:. (Reason: Fuck Off And Die!)"}
               oper-3        {"-00" "-20" "Mhm?! —› #:p2: can't join channel (access denied on this server)... :xtra: ist :p1:'s Beschwerde nachgegangen und hat :p2:'s privaten Channel für ne Woche dicht gemacht!"}
               oper-4        {"-00" "-10" ":p1: hat es geschafft :p2:'s Q-Auth zu haxXxorn! 15 Channels gepwnd, #help gefloodet... :p2: darf sich auf einen Authsuspend freuen! Thx 2 :xtra: :P *HMPF*"}
               oper-5        {"-20" "-20" "Da sowohl :p1: und :p2: des öfteren heute in #feds aufgefallen sind, hat :xtra: entschieden: einmal 30min G-line für jeden von euch! (Reason: Clean your finger before point at my spots!)"}

               gay-1         {"-00" "-10" ":p1: schwult :p2: so derbe an, dass dieser weg rennt und vom LKW überfahren wird... *KRACH*"}
               gay-2         {"-00" "-15" ":p1: zerrt :p2: in eine Schwulendisco und verrammelt alle Ausgänge... *SCHREI* ... Willkommen zur wöchentlichen 'Gaylord-Gangbang-Party' :p2: ... have phun!"}
               gay-3         {"-00" "-00" ":p1: möchte :p2: zeigen, was es heißt ein Hinterlader zu sein... *Hose runterzerr* ... Errektionsprobleme :p1: ?"}
               gay-4         {"-00" "-20" ":p1: packt seinen neu erworbenen 'Rosettenpunisher 3000+' aus und penetriert damit :p2: bis dieser mit blutendem Loch zusammenbricht."}
               gay-5         {"-15" "-00" ":p1: rechnet nicht damit das :p2: wirklich gay ist, seine Anschwulversuche gehen nach hinten los, denn :p2: weiß gekonnt mit seinem Pferderiemen umzugehen! *POW* *POW*"}

               oma-1         {"-00" "-15" ":p1: schickt :p2: mal seine Oma zu Besuch... *SCHLAPPER* *KNUDSCH* ... Mhm, lecker... Senioren-Nahkampf!"}
               oma-2         {"-00" "-20" ":p2: traut seinen Augen nicht als eine wild gewordene Oma mit erhobenem Gehstock auf ihn zuhumpelt... *SLAP* *BUMM* *ZACK*... :p1:'s Oma wins!"}
               oma-3         {"-00" "-00" ":p1:'s senile und von Alzheimer geplagte Oma zieht einen großen Bogen um :p2: und kehrt zu :p1: zurück... Oma:'Junger...junger Mann, lassense ma moi Handtasch gehn!'"}
               oma-4         {"-00" "-10" "*KICK*... ouuh das war ein gekonnter Fusstritt von :p1:... In hohem Tempo fliegt die Oma in Richtung :p2:... *DONG*... direkter Magentreffer, sensationell!"}
               oma-5         {"-00" "-00" "Was ist das? :p1: doped seine arme Oma mit 'Doppelherz - die Kraft der zwei Herzen'... War wohl eine Überdosis :p1: !?! Oma klappt zusammen wie ein Taschenmesser und bleibt reglos liegen."}

               sex-1         {"-00" "-20" "Ouhhhjaaaaa! 'Bück dich, ich beglück dich!' denkt sich :p1: und gibts :p2: so richtig derbe! *MUAH*"}
               sex-2         {"-00" "-00" "Soso... es tut :p1: schrecklich leid :p2:, aber leider floss der Liebesnektar schon bevor es los ging. Vorzeitiger Samenerguss nennt man das. *PÜHH*"}
               sex-3         {"-00" "-10" ":p1: wirft sich in einem unbeobachteten Moment auf :p2: und demonstriert wo der Frosch die Locken hat xD"}
               sex-4         {"-00" "-15" ":p1: scheint so rattig zu sein, dass er sich schon an :p2:'s Bein erleichtern muss *JUCKEL*, Bahhhh!"}
               sex-5         {"+05" "+05" "Mmmmmmmmmmh, so sieht Blümchensex aus! :p1: und :p2: scheinen mehr für einander zu empfinden! *SCHMUS* *POPP*"}

               licht-1       {"-10" "-00" ":p1:'s Taschenlampe scheint defekt zu sein, er klöpft wild darauf rum *KLOPF* plötzlich, ein helles Licht, geblendet rennt er gegen eine Wand und :p2: lacht sich tot *LACH*"}
               licht-2       {"-00" "-20" ":p2: zockt gemütlich im Keller, als :p1: den Rolladen aufreisst und :p2: beim Tageslicht förmlich eingeht..."}
               licht-3       {"-00" "-15" ":p1: und :p2: stehen sich gegenüber, :p2: zieht seine Waffe und :p1: zieht *HMMM* einen Spiegel, mit dem er die Sonnenstrahlen direkt in :p2:'s Gesicht weiter leitet ... *OWNED*"}
               licht-4       {"-00" "-10" ":p1: hat :p2: ziemlich in die Enge getrieben, packt nun seinen Super Strahler 10.000 W aus *FETTES GRINSEN* und frittiert :p2: von Kopf bis Fuß damit..."}
               licht-5       {"-15" "-00" ":p1: jagt hinter :p2: her, stolpert über das Verlängerungskabel *KLATSCH* und fängt bitterlich an zu weinen als er seinen kaputten Strahler da liegen sieht *HEUL* *HEUL* *HEUL*"}

               x-schlag-1     {"Schlagring" "Baseballschläger" "Eisendildo" "Golfschläger"}

               x-geschenk-3   {"Heidi Klum" "Claudia Schiffer" "Naomi Campell" "Giselle Bündchen"}
               x-geschenk-5   {"Bombe" "Tränengasgranate" "Giftschlange" "Fixxerspritze"}

               x-antiterror-4 {"seine MP5" "seine AK47" "sein G36" "sein G3"}

               x-oper-1       {"Deckard" "meeb" "gpq" "Nomad" "stevoo" "magpie" "paul" "minimoo" "MikeC"}
               x-oper-2       {"Deckard" "meeb" "gpq" "Nomad" "stevoo" "magpie" "paul" "minimoo" "MikeC"}
               x-oper-3       {"Deckard" "meeb" "gpq" "Nomad" "stevoo" "magpie" "paul" "minimoo" "MikeC"}
               x-oper-4       {"Deckard" "meeb" "gpq" "Nomad" "stevoo" "magpie" "paul" "minimoo" "MikeC"}
               x-oper-5       {"Deckard" "meeb" "gpq" "Nomad" "stevoo" "magpie" "paul" "minimoo" "MikeC"}

            }

        # }}}

    # }}}
    # {{{ procs

        # {{{ calculate the flood protection duration

            proc flood:duration { unixtime } {

                set minutes 0
                set seconds 0

                while {$unixtime >= 60} {
                    incr minutes 1
                    incr unixtime -60
                }

                while {$unixtime > 0} {
                    incr seconds 1
                    incr unixtime -1
                }

                set m Minute
                set s Sekunde

                if {(${minutes} != "1")} {
                    append m n
                }

                if {(${seconds} != "1")} {
                    append s n 
                }

                return "${minutes} $m und ${seconds} $s"

            }

        # }}}
        # {{{ fight with a player 

            proc game:worms:fight { nickname hostname handle channel arguments } {
                global botnick commands worms

                if {![channel get $channel "worms"] || [info exists worms(running,$channel)]} {
                    return 0
                }

                if {[info exists worms(last,game,$channel)]} {


                    set worms(differenz,flood,$channel) [expr [unixtime] - $worms(last,game,$channel)]

                    if {$worms(differenz,flood,$channel) < $worms(protection)} {
                        putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 Flood Protection ist noch für [flood:duration [expr $worms(protection) - $worms(differenz,flood,$channel)]] aktiv. • \002(\002 Script by $worms(author) \002)\002"
                        return 0
                    }

                }

                set worms(player1,$channel) [join [string trim $nickname]]
                set worms(player2,$channel) [join [string trim [lindex $arguments 0]]]

                if {[string equal -nocase $worms(player2,$channel) $nickname] || ([string length $worms(player2,$channel)] == "1") || [string equal -nocase $worms(player2,$channel) $botnick]} {
                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $nickname vs. $worms(player2,$channel) • \002(\002 Fehler bei der Gegnerwahl, versuchs nochmal. \002)\002 \002‹\002"
                    return 0
                }

                putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $nickname vs. $worms(player2,$channel) • \002(\002 $worms(player2,$channel)  willst du annehmen \037\[$worms(trigger)ja\]\037 oder ablehnen \037\[$worms(trigger)nein\]\037 \002)\002 \002‹\002"

                set worms(running,$channel) 1

                set worms(timer,$channel)   [utimer 30 [list game:worms:auto:finish $nickname $worms(player2,$channel) $channel]]

                set worms($worms(player1,$channel),hp,$channel) $worms(default,hp)
                set worms($worms(player2,$channel),hp,$channel) $worms(default,hp)
   
                foreach command [array names commands] {

                   if {[info exists worms(weapon,$command,used,$channel)]} {
                        unset worms(weapon,$command,used,$channel)
                   }

                }

            }

        # }}}
        # {{{ auto stop current game

            proc game:worms:auto:finish { player1 player2 channel } {
                global commands messages worms

                putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $player1 vs. $player2 • \002(\002 $player2 scheint wohl zu pG zu sein. \002)\002 \002‹\002"

                if {[info exists worms(running,$channel)]} {
                    unset worms(running,$channel)
                }

                set worms(last,game,$channel) [unixtime]

            }

        # }}}
        # {{{ no game [reject]
 
            proc game:worms:reject { nickname hostname handle channel arguments } {
                global commands messages worms

                if {![info exists worms(running,$channel)]} {
                    return 0
                }

                if {[string equal -nocase $worms(player2,$channel) "$nickname"]} {

                    set worms(last,game,$channel) [unixtime]

                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) vs. $nickname • \002(\002 $nickname ist ein Mädchen und hat die Herrausforderung abgelehnt. \002)\002 \002‹\002"

                    if {[info exists worms(running,$channel)]} {
                        unset worms(running,$channel)
                    }

                    if {[info exists worms(timer,$channel)]} {
                        killutimer $worms(timer,$channel); unset worms(timer,$channel)
                    }

                }

            }

        # }}}
        # {{{ lets fight [accept]
 
            proc game:worms:accept { nickname hostname handle channel arguments } {
                global commands messages worms

                if {![info exists worms(running,$channel)]} {
                    return 0
                }

                if {[string equal -nocase $worms(player2,$channel) "$nickname"]} {

                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) vs. $worms(player2,$channel) • \002(\002 Let's Fight, Waffenübersicht \[$worms(trigger)waffen\], $nickname macht den Anfang \002)\002 \002‹\002" 

                    if {[info exists worms(timer,$channel)]} {
                        killutimer $worms(timer,$channel); unset worms(timer,$channel)
                    }

                    set worms(current,player,$channel) $nickname

                }

            }

        # }}}
        # {{{ regsub worms messages

            proc game:worms:regsub { message player1 player2 xtra } {

                if {![info exists xtra]} {
                    set xtra ""
                }

                regsub -all -- {:p1:}   $message "$player1" message
                regsub -all -- {:p2:}   $message "$player2" message

                regsub -all -- {:xtra:} $message "$xtra"    message

                return $message

            }

        # }}}
        # {{{ no answer current player [auto abort]

            proc game:no:answer { player channel } {
                global commands messages worms

                if {[string equal -nocase $player "$worms(player2,$channel)"]} {
                    set worms(winner,$channel) $worms(player1,$channel)
                } else {
                    set worms(winner,$channel) $worms(player2,$channel)
                }

                putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) \[$worms($worms(player1,$channel),hp,$channel) hp\] vs. $worms(player2,$channel) \[$worms($worms(player2,$channel),hp,$channel) hp\] • \002(\002 Keine Antwort vom Gegenspieler, auto. Abbruch. Winner \037$worms(winner,$channel)\037 \002)\002 \002‹\002"

                if {[info exists worms(timer,$channel)]} {
                    unset worms(timer,$channel)
                }

                if {[info exists worms(running,$channel)]} {
                    unset worms(running,$channel)
                }

                set worms(last,game,$channel) [unixtime]

            }

        # }}}
        # {{{ calculate players hp

            proc game:worms:calc:damage { channel message dmgp1 dmgp2 weapon xtra } {
                global commands messages worms

                if {[info exists worms(timer,$channel)]} {
                    killutimer $worms(timer,$channel); unset worms(timer,$channel)
                }

                if {[string equal -nocase $worms(current,player,$channel) "$worms(player2,$channel)"]} {
                    set worms(other,player,$channel) $worms(player1,$channel)
                } else {
                    set worms(other,player,$channel) $worms(player2,$channel)
                }

                putserv "PRIVMSG $channel :[game:worms:regsub "$message" "$worms(current,player,$channel)" "$worms(other,player,$channel)" "$xtra"]"

                set worms($worms(current,player,$channel),hp,$channel) [expr $worms($worms(current,player,$channel),hp,$channel) $dmgp1]


                if {[string equal -nocase $worms(current,player,$channel) "$worms(player2,$channel)"]} {
                    set worms(current,player,$channel) $worms(player1,$channel)
                } elseif {($worms(current,player,$channel) == "$worms(player1,$channel)")} {
                    set worms(current,player,$channel) $worms(player2,$channel)
                }

                set worms($worms(current,player,$channel),hp,$channel) [expr $worms($worms(current,player,$channel),hp,$channel) $dmgp2]

                if {($worms($worms(player1,$channel),hp,$channel) <= 0)} {

                    set worms(winner,$channel) $worms(player2,$channel)
                    set worms(looser,$channel) $worms(player1,$channel)

                    set worms($worms(player1,$channel),hp,$channel) 0

                } elseif {($worms($worms(player2,$channel),hp,$channel) <= 0)} {

                    set worms(winner,$channel) $worms(player1,$channel)
                    set worms(looser,$channel) $worms(player2,$channel)

                    set worms($worms(player2,$channel),hp,$channel) 0

                }

                if {[info exists worms(looser,$channel)]} {

                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) \[$worms($worms(player1,$channel),hp,$channel) hp\] vs. $worms(player2,$channel) \[$worms($worms(player2,$channel),hp,$channel) hp\] • \002(\002 Spielende $worms(winner,$channel) \037gewinnt\037 gegen $worms(looser,$channel) \002)\002 \002‹\002"

                    set worms(last,game,$channel) [unixtime]

                    if {[info exists worms(running,$channel)]} {
                       unset worms(running,$channel)
                    }

                    unset worms(winner,$channel)
                    unset worms(looser,$channel)

                } else {
                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) \[$worms($worms(player1,$channel),hp,$channel) hp\] vs. $worms(player2,$channel) \[$worms($worms(player2,$channel),hp,$channel) hp\] • \002(\002 Nächster Spieler am Zug: \037$worms(current,player,$channel)\037 \002)\002 \002‹\002"

                    set worms(timer,$channel) [utimer 30 [list game:no:answer $worms(current,player,$channel) $channel]]
                }

                if {[info exists worms($worms(player1,$channel),weapons,$channel)]} {
                    unset worms($worms(player1,$channel),weapons,$channel)
                }

                if {[info exists worms($worms(player2,$channel),weapons,$channel)]} {
                    unset worms($worms(player2,$channel),weapons,$channel)
                }

            }

        # }}}
        # {{{ player weapon choose

            proc game:worms:weapons { nickname hostname handle channel arguments } {
                global commands messages worms

                if {![info exists worms(running,$channel)] || ![info exists worms(current,player,$channel)] || ![string equal [join [string index $arguments 0]] "[join $worms(trigger)]"]} {
                    return 0
                }

                if {[string equal -nocase $nickname "$worms(current,player,$channel)"]} {

                    set worms(use,weapon,$channel)   [string tolower [string trim [string range [lindex $arguments 0] 1 end]]]
                    set worms(found,weapon,$channel) 0

                    foreach {command value} [array get commands] {

                        if {($value != "0")} {
                            set worms(max,use,$command,$channel) $value
                        }

                        if {[string equal -nocase $worms(use,weapon,$channel) "$command"]} {
                            incr worms(found,weapon,$channel)
                        }

                    }

                    if {($worms(found,weapon,$channel) != "0")} {

                        if {![info exists worms(weapon,$worms(use,weapon,$channel),$worms(current,player,$channel),$channel)]} {
                            set worms(weapon,$worms(use,weapon,$channel),$worms(current,player,$channel),$channel) 1
                        } else {
                            incr worms(weapon,$worms(use,weapon,$channel),$worms(current,player,$channel),$channel)
                        }

                        if {[info exists worms(max,use,$worms(use,weapon,$channel),$channel)] && [info exists worms(weapon,$worms(use,weapon,$channel),used,$channel)]} {

                            if {($worms(weapon,$worms(use,weapon,$channel),used,$channel) == "$worms(max,use,$worms(use,weapon,$channel),$channel)") || ($worms(weapon,$worms(use,weapon,$channel),used,$channel) > $worms(max,use,$worms(use,weapon,$channel),$channel))} {
                                putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) \[$worms($worms(player1,$channel),hp,$channel) hp\] vs. $worms(player2,$channel) \[$worms($worms(player2,$channel),hp,$channel) hp\] • \002(\002 Waffe zu oft benutzt \037$worms(current,player,$channel)\037 immernoch am Zug \002)\002 \002‹\002"
                                return 0
                            }

                        }

                        if {![info exists worms(weapon,$worms(use,weapon,$channel),used,$channel)]} {
                            set worms(weapon,$worms(use,weapon,$channel),used,$channel) 1
                        } else {
                            incr worms(weapon,$worms(use,weapon,$channel),used,$channel)
                        }

                        set worms(ids,command,$channel) 0

                        foreach {command} [array names messages "$worms(use,weapon,$channel)-*"] {
                            incr worms(ids,command,$channel)
                        }

                        set worms(random,$channel)      [expr [rand $worms(ids,command,$channel)] + 1]
                        set worms(message,$channel)     [join [lindex [lindex [array get messages "$worms(use,weapon,$channel)-$worms(random,$channel)"] 1] 2]]
                        set worms(dmg,player1,$channel) [join [lindex [lindex [array get messages "$worms(use,weapon,$channel)-$worms(random,$channel)"] 1] 0]]
                        set worms(dmg,player2,$channel) [join [lindex [lindex [array get messages "$worms(use,weapon,$channel)-$worms(random,$channel)"] 1] 1]]
                        set worms(xtra,temp,$channel)   [lindex [array get messages "x-$worms(use,weapon,$channel)-$worms(random,$channel)"] 1]

                        set worms(xtra,$channel)        {}

                        if {([llength $worms(xtra,temp,$channel)] != "0")} {
                            set worms(xtra,$channel) [join [lindex $worms(xtra,temp,$channel) [rand [llength $worms(xtra,temp,$channel)]]]]
                        }

                        set worms(dmg,player1,count,$channel)  [expr round([string range $worms(dmg,player1,$channel) 1 end])]
                        set worms(dmg,player2,count,$channel)  [expr round([string range $worms(dmg,player2,$channel) 1 end])]

                        set worms(dmg,player1,faktor,$channel) [string index $worms(dmg,player1,$channel) 0]
                        set worms(dmg,player2,faktor,$channel) [string index $worms(dmg,player2,$channel) 0]

                        if {($worms(dmg,player1,$channel) != "0")} {
                            set worms(dmg,player1,$channel) $worms(dmg,player1,faktor,$channel)[expr [rand 10] + $worms(dmg,player1,count,$channel)]
                        }

                        if {($worms(dmg,player2,$channel) != "0")} {
                            set worms(dmg,player2,$channel) $worms(dmg,player2,faktor,$channel)[expr [rand 10] + $worms(dmg,player2,count,$channel)]
                        }

                        if {($worms(use,weapon,$channel) == "voodoo")} {

                            if {($worms(dmg,player1,$channel) == "-00") && ($worms(dmg,player2,$channel) == "-00")} {

                                if {[string equal -nocase $nickname "$worms(player1,$channel)"]} {
                                    set worms(temp,hp,$channel)                     $worms($worms(player1,$channel),hp,$channel)
                                    set worms($worms(player1,$channel),hp,$channel) $worms($worms(player2,$channel),hp,$channel)
                                    set worms($worms(player2,$channel),hp,$channel) $worms(temp,hp,$channel)
                                } else {
                                    set worms(temp,hp,$channel)                     $worms($worms(player2,$channel),hp,$channel)
                                    set worms($worms(player2,$channel),hp,$channel) $worms($worms(player1,$channel),hp,$channel)
                                    set worms($worms(player1,$channel),hp,$channel) $worms(temp,hp,$channel)
                                }

                            }

                        }

                        game:worms:calc:damage $channel $worms(message,$channel) $worms(dmg,player1,$channel) $worms(dmg,player2,$channel) $worms(use,weapon,$channel) $worms(xtra,$channel)

                    }

                }

            }

        # }}}
        # {{{ show available weapons

             proc game:worms:weapons:overview { nickname hostname handle channel arguments } {
                global commands messages worms

                if {![info exists worms(running,$channel)] || ![info exists worms(current,player,$channel)]} {
                    return 0
                }

                if {[string equal -nocase $nickname "$worms(current,player,$channel)"]} {

                    putserv "PRIVMSG $channel :\002› S\002tatus\002:\002 $worms(player1,$channel) \[$worms($worms(player1,$channel),hp,$channel) hp\] vs. $worms(player2,$channel) \[$worms($worms(player2,$channel),hp,$channel) hp\] • \002(\002 \037$nickname\037 ist an der Reihe [llength [array names commands]] Waffen stehen zur Verfügung \002)\002 \002‹\002"

                    set worms(temp,weapons,$channel) {}

                    foreach {command allowed} [array get commands] {

                        if {![info exists worms(weapon,$command,used,$channel)]} {
                            set worms(weapon,$command,used,$channel) 0
                        }

                        if {($allowed != "0")} {
                            lappend worms(temp,weapons,$channel) "$worms(trigger)${command} ($worms(weapon,$command,used,$channel)x (max. ${allowed}x))"
                        } else {
                            lappend worms(temp,weapons,$channel) "$worms(trigger)${command} ($worms(weapon,$command,used,$channel)x)"
                        }

                        if {([llength $worms(temp,weapons,$channel)] == "8")} {
                            putserv "PRIVMSG $channel :[join $worms(temp,weapons,$channel) ", "]"
                            set worms(temp,weapons,$channel) {}
                        }

                    }

                    if {([llength $worms(temp,weapons,$channel)] != "0")} {
                        putserv "PRIVMSG $channel :[join $worms(temp,weapons,$channel) ", "]"
                    }

                }

            }

        # }}}

    # }}}

# }}}