# set it to 1 when you wanna cleanup the userbase on rehash ..
set AntiSpam(Reset) "0"



if {$botnick=="Dev-L" || $username=="Devel2"} { set AntiSpam(Reset) "0" }

set AntiSpam(Chans) [string tolower "#cybex"]

if { $botnick == "Berlin" || $botnick == "Honecker" || $username=="Berlin" || $username=="b0rkBerlin" } { set AntiSpam(Chans) [string tolower "#berlin"] }
#if { $botnick == "Dev-L" || $username=="Devel2" } { set AntiSpam(Chans) [string tolower "#cybEx.test #cyBex #cybex.stdin #cybex.stdout"]; }
#if { $botnick == "Dev-L" || $username=="Devel2" } { set AntiSpam(Chans) [string tolower [channels]]; }
if { $botnick == "Dev-L" || $username=="Devel2" } { set AntiSpam(Chans) [string tolower "#cybex #cybex.stdin #raum1 #raum2"]; }
if {$AntiSpam(Reset)} { set AntiSpam(AddUsers) 0; set AntiSpam(Users) [list]; set AntiSpam(AddWhat) 0; set AntiSpam(What) [list]; }
if {![info exist AntiSpam(Users)]=="1"} { set AntiSpam(AddUsers) 0; set AntiSpam(Users) [list] }
if {![info exist AntiSpam(Where)]=="1"} { set AntiSpam(AddWhere) 0; set AntiSpam(Where) [list]; }
if {![info exist AntiSpam(What)]=="1"} { set AntiSpam(AddWhat) 0; set AntiSpam(What) [list]; }

set AntiSpam(OnJoinHigh) {
	"-Join-Spamer- -%s_join%-"
	"-Spamer- -%s_chan%-"
}
set AntiSpam(OnJoin) {
	"-Join-Spamer- -%s_join%-"
	"-Spamer- -%s_chan%-"
}
# cut out AntiSpam(OnJoin)
#	"Boah, gerade mal %jointime% Sekunde(n) hier drin und schon Werbung!"
#	"Man man, %nick% .. Werbung nach nur %jointime% Sekunde(n)!"

set AntiSpam(RepeatHigh) {
	"-Repeat-Spamer- -%s_repeat%-"
	"-Spamer- -%s_chan%-"
}
#	"Du nervt langsam, du bist schon der %sn%. der für den Scheiss hier Werbung macht!"
set AntiSpam(Repeat) {
	"-Repeat-Spamer- -%s_repeat%-"
	"-Spamer- -%s_chan%-"
}
set AntiSpam(ToFastHigh) {
	"-Fast-Spamer- -%s_tofast%-"
	"-Spamer- -%s_chan%-"
}
set AntiSpam(ToFast) {
	"-Fast-Spamer- -%s_tofast%-"
	"-Spamer- -%s_chan%-"
}

#bind time - "?0 * * * *" AntiSpamUpdate;
#bind time - "?3 * * * *" AntiSpamUpdate;
bind time - "?5 * * * *" AntiSpamUpdate;
#bind time - "?8 * * * *" AntiSpamUpdate;
#bind time - "* * * * *" AntiSpamUpdate;
bind pubm - * AntiSpamScanPUBM;
bind ctcp - ACTION AntiSpamScanACTION;

bind join - * AntiSpamJoin;

set Msg(msg) "";

proc AntiSpamMakeMSG { } {
	global AntiSpam Msg;

	regsub -all {%nick%}  $Msg(msg) $Msg(nick) Msg(msg) ;
	regsub -all {%chan%} $Msg(msg) $Msg(channel) Msg(msg) ;

	regsub -all {%s_all%} $Msg(msg) $AntiSpam(Stat) Msg(msg) ;
	regsub -all {%s_tjoin%} $Msg(msg) $AntiSpam(StatJoin) Msg(msg) ;
	regsub -all {%s_trepeat%} $Msg(msg) $AntiSpam(StatRepeat) Msg(msg) ;
	regsub -all {%s_ttofast%} $Msg(msg) $AntiSpam(StatFast) Msg(msg) ;

	regsub -all {%s_chan%} $Msg(msg) $AntiSpam(Stat$Msg(channel)) Msg(msg) ;
	regsub -all {%s_user%} $Msg(msg) $AntiSpam(StatUser) Msg(msg) ;

	regsub -all {%s_join%} $Msg(msg) $AntiSpam(StatJoin$Msg(channel)) Msg(msg) ;
	regsub -all {%s_repeat%} $Msg(msg) $AntiSpam(StatRepeat$Msg(channel)) Msg(msg) ;
	regsub -all {%s_tofast%} $Msg(msg) $AntiSpam(StatFast$Msg(channel)) Msg(msg) ;

	regsub -all {%cn%} $Msg(msg) $Msg(channum) Msg(msg) ;
	regsub -all {%un%} $Msg(msg) $Msg(usernum) Msg(msg) ;
	regsub -all {%sn%} $Msg(msg) $Msg(spamnum) Msg(msg) ;
	regsub -all {%jointime%} $Msg(msg) $Msg(jointime) Msg(msg) ;
	regsub -all {%lasttime%} $Msg(msg) $Msg(spamtime) Msg(msg) ;
	return $Msg(msg);
}

proc AntiSpamUpdate { args } {
	set UpdateBegin [clock clicks];
	global AntiSpam botnick;
	set found -1; set ut [unixtime]; set strnothing ""; set strremove ""; set strupdate "";
	set Num 0; foreach Field $AntiSpam(Users) {
		set update 0; set NNum [lsearch -exact $AntiSpam(Users) $Field]; set Num $NNum;
		array set User [lindex $AntiSpam(Users) $Num];
		#putcmdlog "[array get User]"
		#putcmdlog "$update - $User(update)";
		set IsVoice 0; foreach chan [channels] {
			#putcmdlog "matchattr $User(Hand) |v $chan [matchattr $User(Hand) |v $chan] || matchattr $User(Hand) |g $chan [matchattr $User(Hand) |g $chan] || matchattr $User(Hand) v| $chan [matchattr $User(Hand) v| $chan] || matchattr $User(Hand) g| $chan [matchattr $User(Hand) g| $chan]"
			if {$User(Hand)!="*"} { if {[matchattr $User(Hand) |v $chan] || [matchattr $User(Hand) |g $chan] || [matchattr $User(Hand) v| $chan] || [matchattr $User(Hand) g| $chan]} { set IsVoice 1 } }
			if {[isvoice $User(Nick) $chan]} { set IsVoice 1 }
		}
		set IsOp 0; foreach chan [channels] {
			if {$User(Hand)!="*"} { if {[matchattr $User(Hand) |o $chan] || [matchattr $User(Hand) o| $chan]} { set IsOp 1 } }
			if {[isop $User(Nick) $chan]} { set IsOp 1 }
		}
		set DecrTime -1;
		if {$User(Max)=="0"} { set DecrTime 5 }

		if {$User(Hand)!="*" &&  $IsOp &&  $IsVoice && $DecrTime==-1} { set DecrTime 15 }
		if {$User(Hand)=="*" &&  $IsOp &&  $IsVoice && $DecrTime==-1} { set DecrTime 30 }

		if {$User(Hand)!="*" &&  $IsOp ||  $IsVoice && $DecrTime==-1} { set DecrTime 30 }
		if {$User(Hand)!="*" &&  $IsOp ||  $IsVoice && $DecrTime==-1} { set DecrTime 30 }
		if {$User(Hand)=="*" &&  $IsOp ||  $IsVoice && $DecrTime==-1} { set DecrTime 60 }
		if {$User(Hand)=="*" &&  $IsOp ||  $IsVoice && $DecrTime==-1} { set DecrTime 60 }

		if {$User(Hand)!="*" && !$IsOp && !$IsVoice && $DecrTime==-1} { set DecrTime 120 }
		if {$User(Hand)=="*" && !$IsOp && !$IsVoice && $DecrTime==-1} { set DecrTime 240 }
		if {$DecrTime==-1} { set DecrTime 1440 }
		set DecrTime [expr $DecrTime * 60]
		#set DecrTime [expr $DecrTime * 5]
		if {${User(update)}!=""} {
			set utdiff $ut; incr utdiff -${User(update)};
		} {
			set utdiff $ut
		}
		#set update 1;
		#if {$User(Num)==0} {set User(Num) 1};
		#set update 1;
		if {$utdiff>$DecrTime} {
			if {$User(Num)>0} {
				incr User(Num) -1;
				set update 1;
				#putcmdlog "#$Num $User(Nick) $User(Num) $utdiff > $DecrTime ($ut-$User(update)) mins IsVoice $IsVoice IsOP $IsOp "
			} {set update 1}
		} else {
			#putcmdlog "#$Num $User(Nick) $User(Num) $utdiff < $DecrTime ($ut-$User(update)) mins IsVoice $IsVoice IsOP $IsOp "
		}
		#putcmdlog "$User(Nick) $update if {$utdiff>$DecrTime} $DecrTime $User(Num)>0 $User(Max)<10"
		if {$update} {
			set User(update) [unixtime];
			if {![info exist User(Max)]} { set User(Max) 1 }
			if {$User(Num)==0 && $User(Max)<10} {
				#putcmdlog "Remove $Num $User(Nick) from Spam-List ([array get User])"
				#putcmdlog "Remove $NNum / $Num $User(Nick) from Spam-List"
				if {$User(Max)>1} { lappend strremove [join $User(Nick)]; }
				set AntiSpam(Users) [lreplace $AntiSpam(Users) $Num $Num];
				continue;
			} else {
				#putcmdlog "Make Update $Num $User(Nick) $User(Num) - $utdiff <> $DecrTime - [array get User]"
				if {$User(Num)>0} { lappend strupdate [join "$User(Nick) $User(Num)"]; }
				set AntiSpam(Users) [lreplace $AntiSpam(Users) $Num $Num [array get User]];
			}
		} else {
			if {$botnick=="Dev-L"} {
				if {![info exist User(Max)]} { set User(Max) 1 }
				#if {$User(Max)>1} { lappend strnothing [join $User(Nick)]; }
				#putcmdlog "Make nothing $Num $User(Nick) $User(Num) - $utdiff <> $DecrTime -  [expr $ut - $User(join)] [expr $ut - $User(Last)]"
			}
		}
		incr Num;
	}
	set strall ""
	if {$strremove!=""} { set strall "$strall# Remove: [join $strremove] #"; }
	if {$strupdate!=""} { set strall "$strall# Update: [join $strupdate] #"; }
	#if {$strnothing!=""} { set strall "$strall# Nothing: [join $strnothing] #"; }
	if {$strall!=""} { cydebug "ALL [llength AntiSpam(Users)]: [join $strall]" }

	set UpdateEnd [clock clicks];
	if {[expr ($UpdateEnd-$UpdateBegin)/1000000]>2} { putcmdlog "Update braucht bereits [expr ($UpdateEnd-$UpdateBegin)/1000000.] sekunden" }
}

proc AntiSpamStrip {text} {
	regsub -all {\003[\d+],[\d+]} $text {} text; 
	regsub -all {\003[\d+]} $text {} text; 
	regsub -all {\003} $text {} text; 
	regsub -all {\002} $text {} text; 
	regsub -all {\026} $text {} text; 
	regsub -all {\037} $text {} text; 
	return $text 
}

proc AntiSpamScan { nick uhost handle channel text } {
	global AntiSpam Msg botnick;
	if {[checkUSER [nick2hand $nick]]!=0} { return }
	set SpamFound 0; set IsKicked 0; set Reason 0; set IsVoice "";
	set oldtext $text;
	set text [AntiSpamStrip $text]
	if {[string match -nocase "#*" $text] || [string match -nocase "* #*" $text] || [string match -nocase "* ?#*" $text] || [string match -nocase "* ??#*" $text] || [string match -nocase "* ???#*" $text]} { 
		set what [string tolower [lindex $text [lsearch [split $text] *#*]]];
		incr SpamFound 1; set SpamFoundType "channel" 
		if {$what=="#berlin"} { 
			#putcmdlog "spam is #berlin"; 
			return 
		}
	}
	if {![isvoice $nick $channel] && [string match -nocase "*www.*.*" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.de *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.com *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.org *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.net *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.vu *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.name *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.biz *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*.info *" $text]} { incr SpamFound 2; set SpamFoundType "website"; }
	if {![isvoice $nick $channel] && [string match -nocase "*://*" $text]} { incr SpamFound 4; set SpamFoundType "website"; }
	putcmdlog "SpamFound:$SpamFound; n:$nick; c:$channel; t:$text;"
	if {$SpamFound!=0} {

		set mask [maskhost [join $nick]!*$uhost]; set execute 0;
		set mfound -1; set nfound -1; set hfound -1; set found -1;
		set cfound 0; foreach chan $AntiSpam(Chans) { if {[string equal -nocase $channel $chan]} { break; }; incr cfound; }
		putcmdlog "Found $cfound ([llength $AntiSpam(Chans)]), chan $channel, allchans $AntiSpam(Chans)";
		if {$cfound==[llength $AntiSpam(Chans)]} { return }
		set Num 0; foreach Field $AntiSpam(Users) {
			array set User [lindex $AntiSpam(Users) $Num];
			#putcmdlog "[array get User]"
			if {![info exist User(Channe)]} { set User(Channel) $channel; }
			if {$User(Channel)==$channel} { set cfound 1 }
			if {$mfound=="-1"} { foreach Mask $User(Mask) { if {[string equal -nocase $Mask $mask]} { set mfound $Num } } }
			if {$nfound=="-1"} { foreach Nick $User(Nick) { if {[string equal -nocase $Nick $nick]} { set nfound $Num } } }
			if {$handle!="*"}  { if {[string equal -nocase $User(Hand) $handle]} { set hfound $Num } }
			if {$mfound!="-1" && $nfound!="-1" && $cfound} { break; }
			incr Num;
		}
		if {$hfound!="-1"} {
			set found $hfound;
		} elseif {$mfound!="-1"} {
			set found $mfound;
		} elseif {$nfound!="-1"} {
			set found $nfound;
		} else { set found "-1" }
		if {$found!="-1"} {
			array set User [lindex $AntiSpam(Users) $found]
			if {$nfound=="-1"} { lappend User(Nick) $nick; set nfound $found; }
			if {$mfound=="-1"} { lappend User(Mask) $nick; set mfound $found; }
			if {$hfound=="-1" && $handle!="*"} { set User(Hand) $handle; set hfound $found; }
			if {![info exist User(Max)]} { set User(Max) 1 }
			if {$User(Num)>$User(Max)} { set User(Max) $User(Num) }
			set User(update) [unixtime];
			set User(Chan) $channel;
			set AntiSpam(Users) [lreplace $AntiSpam(Users) $found $found [array get User]];
			set FreshAdd 0;
		} else {
			cydebug "Adduser $nick from $channel"; incr AntiSpam(AddUsers);
			set User(Mask) [list]; lappend User(Mask) $mask;
			set User(Last) [unixtime];
			set User(update) [unixtime];
			set User(Nick) [list]; lappend User(Nick) $nick;
			set User(Hand) $handle;
			set User(Chan) $channel;
			set User(join) [expr [unixtime]-121];
			set User(Max) 1;
			set User(Num) 0;
			set User(Score) 0;
			set FreshAdd 1;
			set execute 0;
			lappend AntiSpam(Users) [array get User];
			set found $Num;
		}
		putcmdlog "Spam $SpamFound Found from $nick!$uhost ($handle) in $channel - [array get User] - $text"

		set JoinTimeDiff [expr [unixtime] - $User(join)]
		set SpamTimeDiff [expr [unixtime] - $User(Last)]
		#putcmdlog "[array set User [lindex $AntiSpam(Users) $found]]"
		if {![info exist AntiSpam(Stat)]} {
			set AntiSpam(Stat) 1;
			set AntiSpam(StatFast) 1;
			set AntiSpam(StatRepeat) 1;
			set AntiSpam(StatJoin) 1;
		}
		if {![info exist AntiSpam(Stat$channel)]} {
			set AntiSpam(Stat$channel) 1;
			set AntiSpam(StatFast$channel) 1;
			set AntiSpam(StatRepeat$channel) 1;
			set AntiSpam(StatJoin$channel) 1;
		}
		#if {$nick=="cybex" || $nick=="FFL|CyBex" || $nick=="FFL\|CyBex"} {set User(Num) 0}
		set Msg(channel) $channel;
		set Msg(nick) $nick;
		set Msg(jointime) $JoinTimeDiff;
		set Msg(spamtime) $SpamTimeDiff;
		set Msg(channum) $AntiSpam(Stat$channel);
		set Msg(spamnum) $AntiSpam(Stat$channel);
		set Msg(usernum) $User(Num);
		set AntiSpam(StatUser) $User(Num);
		#set nick [split $nick]; set uhost [split $uhost]; set channel [split $channel];
		if {$JoinTimeDiff>=0 && $JoinTimeDiff<120 && !$FreshAdd && !$IsKicked} {
			# kick onjoin
			set Msg(spamnum) $AntiSpam(StatJoin$channel);
			set User(update) [unixtime];
			set Msg(msg) [lindex $AntiSpam(OnJoin) [rand [llength $AntiSpam(OnJoin)]]]
			set reason [AntiSpamMakeMSG];  set reason [join $reason];
			foreach Chan $AntiSpam(Chans) { if {[string equal -nocase $Chan [string tolower $channel]]} {
				set Reason 1; set IsKicked 1; incr User(Num);
				#putserv "PRIVMSG $channel :KICK $nick ($reason)"
				if {$User(Num)>0 && $User(Num)<1} {
					putcydebug 0 "NOTICE $nick :WARNUNG: Join SPAM ist hier nich erwünscht..."
					putcmdlog "Nr $User(Num)"
					set execute 0;
				} elseif {$User(Num)>0 && $User(Num)<4} {
					set execute 1; modeBANKICK $channel $nick $uhost $handle 1 $reason
				} elseif {$User(Num)>3 && $User(Num)<6} {
					set execute 2; modeBANKICK $channel $nick $uhost $handle 3 $reason
				} elseif {$User(Num)>5 && $User(Num)<9} {
					set execute 3; modeBANKICK $channel $nick $uhost $handle 5 $reason
				} elseif {$User(Num)>8 && $User(Num)<11} {
					set execute 4; modeBANKICK $channel $nick $uhost $handle 15 $reason
				} elseif {$User(Num)>10 && $User(Num)<50} {
					set execute 5; modeKICKBANREKICK $channel $nick $uhost $handle 120 $reason
				} elseif {$User(Num)>49} {
					set execute 6; modeKICKBANREKICK $channel $nick $uhost $handle 0 $reason
				}
			} }
		}

		if {[isvoice $nick $channel] || [isop $nick $channel]} {
			#putcmdlog "IsVoice $SpamTimeDiff<60 && !$FreshAdd && !$IsKicked"
			set IsVoice "+";
			if {$SpamTimeDiff<60 && !$FreshAdd && !$IsKicked} {
				set Msg(spamnum) $AntiSpam(StatFast$channel);
				# kick tofast
				set User(update) [unixtime];
				set Msg(msg) [lindex $AntiSpam(ToFast) [rand [llength $AntiSpam(ToFast)]]]
				set reason [AntiSpamMakeMSG]; set reason [join $reason];
				foreach Chan $AntiSpam(Chans) { if {[string equal -nocase $Chan [string tolower $channel]]} {
					set Reason 3; set IsKicked 1; incr User(Num);
					#putserv "PRIVMSG $channel :KICK $nick ($reason)"
					if {$User(Num)<4} {
						cydebug "\{$channel\/ToFast\/IsVoiced\} ToFast $User(Nick) Do nothing"
						set execute 0;
					} elseif {$User(Num)>2 && $User(Num)<7} {
						putcydebug 0 "NOTICE $nick :WARNUNG #[expr $User(Num)-3]: Schnell hintereinander Spam ist hier nich erwünscht.."
						set execute 1;
					} elseif {$User(Num)>6 && $User(Num)<12} {
						putcmdlog "$User(Num)"
						set execute 2; modeKICK $channel $nick $handle $reason
					} elseif {$User(Num)>11 && $User(Num)<17} {
						set execute 3; modeBANKICK $channel $nick $uhost $handle 1 $reason
					} elseif {$User(Num)>16 && $User(Num)<22} {
						set execute 4; modeBANKICK $channel $nick $uhost $handle 5 $reason
					} elseif {$User(Num)>21 && $User(Num)<27} {
						set execute 5; modeBANKICK $channel $nick $uhost $handle 15 $reason
					} elseif {$User(Num)>26 && $User(Num)<50} {
						set execute 6; modeKICKBANREKICK $channel $nick $uhost $handle 120 $reason
					} elseif {$User(Num)>49} {
						set execute 7; modeKICKBANREKICK $channel $nick $uhost $handle 0 $reason
					}
				} }
			}
		} else {
			#putcmdlog "IsNoVoice"
			if {$SpamTimeDiff<240 && !$FreshAdd && !$IsKicked} {
				set Msg(spamnum) $AntiSpam(StatFast$channel);
				# kick tofast
				set User(update) [unixtime];
				set Msg(msg) [lindex $AntiSpam(ToFast) [rand [llength $AntiSpam(ToFast)]]]
				set reason [AntiSpamMakeMSG]; set reason [join $reason];
				foreach Chan $AntiSpam(Chans) { if {[string equal -nocase $Chan [string tolower $channel]]} {
					set Reason 3; set IsKicked 1; incr User(Num);
					#putserv "PRIVMSG $channel :KICK $nick ($reason)"
					if {$User(Num)>1 && $User(Num)<4} {
						set execute 0; putcydebug 0 "NOTICE $nick :WARNUNG #$User(Num): Schnell hintereinander Spam ist hier nich erwünscht.."
					} elseif {$User(Num)>2 && $User(Num)<5} {
						set execute 1; modeBAN $channel $nick $uhost $handle 2 "3 Minuten stumm";
						putcydebug 0 "NOTICE $nick :Du bist soeben für 3 Minuten deine Stimme losgeworden!";
					} elseif {$User(Num)>4 && $User(Num)<10} {
						set execute 2; modeKICK $channel $nick $handle $reason;
						putcydebug 0 "NOTICE $nick :Bis spaeter, vielleicht!";
					} elseif {$User(Num)>9 && $User(Num)<15} {
						set execute 3; modeBANKICK $channel $nick $uhost $handle 3 $reason
					} elseif {$User(Num)>14 && $User(Num)<20} {
						set execute 4; modeBANKICK $channel $nick $uhost $handle 9 $reason
					} elseif {$User(Num)>19 && $User(Num)<25} {
						set execute 5; modeBANKICK $channel $nick $uhost$handle  27 $reason
					} elseif {$User(Num)>24 && $User(Num)<50} {
						set execute 6; modeKICKBANREKICK $channel $nick $uhost $handle 120 $reason
					} elseif {$User(Num)>49} {
						set execute 7; modeKICKBANREKICK $channel $nick $uhost $handle 0 $reason
					}
				} }
			}
		}
		if {$Reason==1} { set Reason "Join Spam"; incr AntiSpam(Stat); incr AntiSpam(Stat$channel); incr AntiSpam(StatJoin); incr AntiSpam(StatJoin$channel); }
		if {$Reason==2} { set Reason "Repeat Spam"; incr AntiSpam(Stat); incr AntiSpam(Stat$channel); incr AntiSpam(StatRepeat); incr AntiSpam(StatRepeat$channel); }
		if {$Reason==3} { set Reason "ToFast Spam"; incr AntiSpam(Stat); incr AntiSpam(Stat$channel); incr AntiSpam(StatFast); incr AntiSpam(StatFast$channel); }
		if {$IsKicked || $FreshAdd} {
			putlog "SPAM #$found / Joined $JoinTimeDiff / Spamed $SpamTimeDiff / Nick $IsVoice$nick ($User(Nick)) / #$User(Num) / host $uhost / handle $handle / chan $channel / G:$Reason E:$execute / What: $text "
		}
		if {![info exist User(Max)]} { set User(Max) 1 }
		if {$User(Num)>$User(Max)} { set User(Max) $User(Num) }
		set User(Last) [unixtime];
		set AntiSpam(Users) [lreplace $AntiSpam(Users) $found $found [array get User]];
	}
}

proc AntiSpamJoin { nick uhost handle channel } {
	global AntiSpam;
	set mask [maskhost $nick!*$uhost];
	set Num -1; set mfound -1; set nfound -1; set hfound -1; set found -1;
	foreach Field $AntiSpam(Users) {
		incr Num;
		array set User [lindex $AntiSpam(Users) $Num];
		foreach Mask $User(Mask) { if {[string equal -nocase $Mask $mask]} { set mfound $Num } }
		foreach Nick $User(Nick) { if {[string equal -nocase $Nick $nick]} { set nfound $Num } }
		if {$handle!="*"}  { if {[string equal -nocase $User(Hand) $handle]} { set hfound $Num } }
		if {$mfound!="-1" && $nfound!="-1"} { break; }
	}
	if {$hfound!="-1"} {
		set found $hfound;
	} elseif {$mfound!="-1"} {
		set found $mfound;
	} elseif {$nfound!="-1"} {
		set found $nfound;
	} else { set found "-1" }
	if {$found!="-1"} {
		array set User [lindex $AntiSpam(Users) $found]
		set User(Last) [unixtime];
		set User(join) [unixtime];
		set User(update) [unixtime];
		set User(Chan) $channel;
		if {$nfound=="-1"} { lappend User(Nick) $nick; set nfound $found; }
		if {$mfound=="-1"} { lappend User(Mask) $nick; set mfound $found; }
		if {$hfound=="-1" && $handle!="*"} { set User(Hand) $handle; set hfound $found; }
		set AntiSpam(Users) [lreplace $AntiSpam(Users) $found $found [array get User]];
	} else {
		set User(Mask) [list]; lappend User(Mask) $mask;
		set User(Last) [unixtime];
		set User(update) [unixtime];
		set User(Nick) [list]; lappend User(Nick) $nick;
		set User(Hand) $handle;
		set User(join) [unixtime];
		set User(Chan) $channel;
		set User(Score) 0;
		set User(Max) 0;
		set User(Num) 0; incr AntiSpam(AddUsers);
		lappend AntiSpam(Users) [array get User];
	}
}

proc AntiSpamScanPUBM { nick uhost handle channel text } {
	AntiSpamScan $nick $uhost $handle $channel $text;
}
proc AntiSpamScanACTION { nick uhost handle channel keyword text} {
	set text "$keyword $text"
	AntiSpamScan $nick $uhost $handle $channel $text;
}
### Please let it be default
set AntiSpam(Name) 		"AntiSpam"
set AntiSpam(version) 		"v 0.5.3"
set AntiSpam(Author1) 		"CyBex"
set AntiSpam(Steps) 		"0"

proc AntiSpamInit {} { global AntiSpam }

AntiSpamInit
return
