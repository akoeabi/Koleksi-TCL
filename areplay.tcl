set repchan {
  "#makmur"
}

set repwords {
  "hi :heya %nick, nice to see you ^_^"
  "hello:well hey there %nick.."
  "asl:I'm 20, f, Makassar. and you?"
  "heh :%nick: eh?"
  "brb:be back soon!"
  "bye:%nick: Take care!"
  "gtg:%nick: by3 by3, see ya'"
  "how r:fine thankie ^-_^, how r u?"
  "how are:fine thankie ^-_^, how r u?"
  "* bot:%nick: huh?"
  "*salam*:%nick:wa alaikum asalam wa rehamtulla wa barakatahu"
  "away:%nick:We are Waiting"
  "ping *:%nick: We are Charging 10$ per byte. You are not in Lag!<ping reply>"
  "kiss*:mujh ko shemmo aa rehi hai ;)"
  "thanx:%nick: You are Welcome"
  "from:%nick:I am from Makassar"
  "tiket:%nick:Coba hubungi nick abi dia kerja di travel tuh."
  "love:hai Allah, Many people loves me but I love you."
  "gujranwala:I like Gujranwala too much, because this is my brith place."
  "pakistan:%nick:sing with me.. Dil Dil Pakistan - Jan Jan Pakistan"
  "thank:%nick:You are Welcome"
  "*sex*:Toba Toba"
}

set maxmsgrep 5:10

set msgfloodm {
  "you're performing MSG which considered as FLOOD..."
}

set msgrepignore 1
set utlarlg ""

proc replyuser {nick uhost hand rest} {
	global botnick repwords msgcount maxmsgrep msgfloodm msgrepignore utlarlg
	if {[string match "#*" [lindex $rest 0]]} {set repto [lindex $rest 0] ; set rest [lrange $rest 1 end]} else {set repto $nick}
	set repperf 0
	foreach repwrd $repwords {
		set rquestion [lindex [split $repwrd :] 0]
		set ranswer [string trim [lrange [split $repwrd :] 1 end] "{}"]
		if {[string match [string tolower $rquestion]* [string tolower $rest]]} {
			regsub -all "%nick" $ranswer "$nick" ranswer
			set repperf 1 ; putquick "PRIVMSG $repto :$ranswer" ; return 0
		}
	}
	if {!$repperf && $repto != $nick} {return 0}
	set repperf 0 ; set n [string tolower *!*@[lindex [split $uhost @] 1]]
	if {[info exists msgcount($n)]} {
		set msgcount{$n} [incr msgcount($n)] ; set currmsgcount $msgcount($n) ; set maxmsgreprecv [lindex [split $maxmsgrep :] 0]
		if {$currmsgcount >= $maxmsgreprecv} {
			set msgingrep [lindex $msgfloodm [rand [llength $msgfloodm]]]
			foreach msgreptimer [utimers] {if {[string match "unset msgcount($n)" [lindex $msgreptimer 1]]} {killutimer [lindex $msgreptimer 2]}}
			if {$repto == $nick} {putquick "NOTICE $nick :$utlarlg $msgingrep. Ignored for: $msgrepignore min(s)."}
			newignore *!*@[lindex [split $uhost @] 1] $botnick "MSG flood" $msgrepignore
			putlog "$utlarlg MSG flood ($msgcount($n)), received from $nick. Message replies will be stopped for $msgrepignore min(s)." ; unset msgcount($n) ; return 1
		} else {
			foreach msgreptimer [utimers] {if {[string match "unset msgcount($n)" [lindex $msgreptimer 1]]} {return 1}}
			utimer [lindex [split $maxmsgrep :] 1] "unset msgcount($n)"
		}
	} else {set msgcount($n) 1}
}

proc replychan {nick uhost hand chan rest} {
	global botnick repchan
	foreach targchan $repchan {if {[string match *[string tolower $targchan]* [string tolower $chan]]} {append reps "$chan $rest" ; replyuser $nick $uhost $hand $reps ; return 0}}
}

bind msgm - * replyuser
bind pubm - * replychan