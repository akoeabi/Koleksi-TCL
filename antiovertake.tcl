#################################################################
# Meltdowns Anti-Overtake V0.3 (18-11-2003) 	                #
# -Quakenet-optimized-                                          #
# übersetzt von physicus <physicus@smart-irc.de>                #
#								                #
# http://scripts.udp.at                                         #
#                                                               #
# Beschreibung:    Bans für overtakers (Channelübernahme)       #
#								                #
# Anwendung: +Kicking 3 ops in 30 secs                          #
#		 +Banning the bot, botowner or bot-channel-op	    #
#		 +Setting invite, key or limit < 10		          #
#								                #
# +Unbans, invites, etc when bot cannot join the chan		    #
#  (L or Q must be in the chan)					    #
# +Removes overtakers  Q/L-flags				          #
#								                # 
# Kontakt: meltdown@gmx.at | #lamer or #meltdown on ircnet      #
#################################################################
#
# Installation: +trage tcl in die Botconfig ein
# 		    +type "!meltsat on" in Deinem Channel eingeben
#
#################################################################
# Neu in 0.3 :
#
# verschiedene Einstellungen aufgenommen
# aufgenommen "unban-vitcims nach overtake"
# verschiedene Sachen gefixet: aber die sind nicht erwänenswert 
#
#################################################################
#
# Einstellungen:
#

set overtake(protect) "m|o"
# Setze die Protects. (m=botmaster, o=channelop)

set overtake(bots) 1
# Protect bots mit +b-flag ?



set overtake(flags) "-amotv"
# flags, die bei einem overtake entfernt werden (wähle nur flags, die Du nicht brauchst(q+l) (!))

set overtake(bantype) 2
# 1:*!ident@subnet, 2:*!ident@IP, 3:*!ident@IP, 4:nick!*@*

set overtake(needs) 1
# Setzt Du 0 in dieser line ist das Script nicht aktiv "needs" (need-op, need-invite,...)
# es ist also ratsam die Einstellungen auf 1 zu lassen.


########## ! ACHTING ! ab hier bitte nichts Ändern hier beginnt der Code ##########

setudef flag antitake

bind mode - * proc_change
bind kick - * proc_kick
bind PUB m|m !meltsat activate_at_script


proc proc_kick { nick uhost hand chan target reason} {
global violator
	if {$nick == $::botnick} { return 0 }
	if {[matchattr $hand m|m]} { return 0 }
	if {[string last +antitake [channel info $chan]] == -1 } { return 0 }
	if {[wasop $target $chan]} {
		if {![info exists violator($nick)]} { 
                        set violator($nick) 1
                        utimer 30 "unset violator($nick)"
		} else { 
                        incr violator($nick)
		}
		if {$violator($nick) >= 3} { 
			rflags_kick $nick $chan $uhost [getchanhost $target $chan] 
		}
	}
}

proc proc_change { nick uhost hand chan mode victim } {
global overtake
	if {$mode == "-o" } {
		if {$victim == $::botnick} { putserv "PRIVMSG [qlcheck $chan] :op $chan" }
	}
        if {[string last +antitake [channel info $chan]] == -1 } { return 0 }
	if {$mode == "+b"} {
		if {![botisop $chan]} { return 0 }
		if {[matchattr $hand m]} {return 0}
		if {[string match $victim $::botname]} {rflags_kick $nick $chan $uhost $victim}
		foreach i [chanlist $chan] {
			if {[string match $victim "$i\![getchanhost $i]"]} {
				if {[matchattr [nick2hand $i] $overtake(protect) $chan]} {
					rflags_kick $nick $chan $uhost $victim
				}
			}
		}
	}

	if {($mode == "+i") || ($mode == "+k")} { 
		if {$nick == $::botnick} { return 0 }
		if {[matchattr $hand m|m]} { return 0 }
		rflags_kick $nick $chan $uhost 0 
	}
	if {$mode == "+l"} { 
		if {$nick == $::botnick} { return 0 }
	        if {[matchattr $hand m|m]} { return 0 }
		if {$victim < 10} {  rflags_kick $nick $chan $uhost 0 }
	}
		
}
proc rflags_kick {nick chan uhost victim} {
global overtake
	set overtakerhost [ot:getbanmask $nick $uhost]
        pushmode $chan -o $nick
        pushmode $chan -b $victim
        pushmode $chan +b $overtakerhost
        flushmode "$chan"
        putserv "NOTICE $nick :If this was a mistake, contact the channelowner"
	set service [qlcheck $chan]
	if {$service != ""} {
		putserv "PRIVMSG $service :chanlev $chan $nick $overtake(flags)"
	        putserv "NOTICE $nick :Removed flags. If this was a mistake, contact the channelowner"
	}
        putkick $chan $nick "Overtaker"
	ot:unban $chan $overtakerhost
}

proc qlcheck {chan} {
        if {[onchan Q $chan]} {
          set service "Q"
        } elseif {[onchan L $chan]} {
          set service "L"
        } else {
          set service "";
        }
return $service
}

proc ot:getbanmask {nick uhost} {
global overtake
 set account [string range $uhost 0 [expr [string last @ $uhost] -1]]
 set domain [string range $uhost [expr [string last @ $uhost] +1] end]
 set sitemask "*!*[string trimleft [maskhost $uhost] *!]"
 switch $overtake(bantype) {
  1 {set sitemask "*!*[string trimleft [maskhost $uhost] *!]"}
  2 {set sitemask "*!*$uhost"}
  3 {set sitemask "*!*@$domain"}
  4 {set sitemask "$nick!*@*"}
                        }
regsub -all -- {~} $sitemask "" sitemask
return $sitemask
}

proc activate_at_script {nick uhost hand chan args} {
global overtake
        switch $args {
                  on {	channel set $chan +antitake 
			if {([qlcheck $chan] != "") && ($overtake(needs) == 1)} {
				channel set $chan need-op "putserv \"PRIVMSG [qlcheck $chan] :op $chan\""
				channel set $chan need-invite "putserv \"PRIVMSG [qlcheck $chan] :invite $chan\""
				channel set $chan need-key "putserv \"PRIVMSG [qlcheck $chan] :invite $chan\""
				if {[qlcheck $chan] == "Q"} {
					channel set $chan need-limit "putserv \"PRIVMSG [qlcheck $chan] :limit $chan 9999\""
		                        channel set $chan need-unban "putserv \"PRIVMSG [qlcheck $chan] :invite $chan\""
				}
				if {[qlcheck $chan] == "L"} {
					channel set $chan need-limit "putserv \"PRIVMSG L :clearchan $chan\""
					channel set $chan need-unban "putserv \"PRIVMSG L :unbanall $chan\""
				}
			}
			putserv "PRIVMSG $chan :MeltsAT activated"}
                  off {	
                        channel set $chan -antitake
			if {([qlcheck $chan] != "") && ($overtake(needs) == 1)} {
                        channel set $chan need-op ""
                        channel set $chan need-invite ""
			channel set $chan need-key ""
			channel set $chan need-limit ""
			channel set $chan need-unban ""
			}
			putserv "PRIVMSG $chan :MeltsAT deactivated"}
                  default {
                                if {[lsearch -exact [channel info $chan] +antitake] > -1} {
                                         putserv "PRIVMSG $chan :MeltsAT is currently ACTIVATED."
                                } else { putserv "PRIVMSG $chan :MeltsAT is currently DEACTIVATED."
                                }
                  }
        }
}


proc ot:unban { chan badhost } {
set x 0
foreach i [chanbans #testchan1] { 
	if {![string match "*$badhost*" $i]} { 
		incr x
		pushmode $chan -b [lindex $i 0]
		if {$x >=6} { flushmode $chan ; set x 0 }
	}
} 	
	flushmode $chan
}

putlog "AntiOvertake Loaded By physicus"

