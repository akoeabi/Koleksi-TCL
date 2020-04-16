#################################################################
# YooDa Bot-Script v1.1a (11-08-2004)               	          #
#                                                               #
# contact -> yooda@contra-gamers.com | #yooda on QuakeNet	    #
# ICQ: 122043110 | MSN: yooda_meister@hotmail.com               #
#                                                               #
# LICENSE: Sascha Nordquist (YooDa) (c) 2004			    #
# ALL RIGHTS RESERVED							    #
#                                                               #
#################################################################

#############################################
################ SETTINGS ###################
#############################################

##### Enable kick Protection: enable = 1 / disable = 0 #####
set prot(kick) "1"

##### Enable ban Protection: enable = 1 / disable = 0 #####
set prot(ban) "1"

##### Enable unban Protection: enable = 1 / disable = 0 #####
set prot(unban) "1"

##### Enable op Protection: enable = 1 / disable = 0 #####
set prot(op) "1"

##### Enable deop Protection: enable = 1 / disable = 0 #####
set prot(deop) "1"

##### Enable invite Protection: enable = 1 / disable = 0 #####
set prot(invite) "1"

##### Enable limit Protection: enable = 1 / disable = 0 #####
set prot(limit) "1"

##### Enable key Protection: enable = 1 / disable = 0 #####
set prot(key) "1"

##### Enable voice Protection: enable = 1 / disable = 0 #####
set prot(voice) "0"

##### Enable devoice Protection: enable = 1 / disable = 0 #####
set prot(devoice "0"

##### Q nick (must be set)  #####
set prot(qnick) "Q"

##### Q host (must be set)  #####
set prot(qhost) "CServe.pwnage-clan.de"

##### Q modex pattern ( nur ändern wenn du weißt was du machst..)  #####
set prot(qmodex) "*.users.pwnage-clan.de"

##### L nick (must be set)  #####
set prot(lnick) "L"

##### Standard Channel modes  #####
set prot(standardmodes) "+ntC"

##### KICK KICK MSG #####
set prot(kickmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für \[\0034KICK\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### DEOP KICK MSG #####
set prot(deopmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für \[\0034DEOP\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### OP KICK MSG #####
set prot(opmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  \[\0034OP\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### INVITE KICK MSG #####
set prot(invitemsg) "\0035,1±\0030 \002Du bist nicht berechtigt für set \[\0034+i (invite)\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### KEY KICK MSG #####
set prot(keymsg) "\0035,1±\0030 \002Du bist nicht berechtigt für set \[\0034+k (key)\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### BAN KICK MSG #####
set prot(banmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  \[\0034BAN\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### UNBAN KICK MSG #####
set prot(unbanmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  \[\0034UNBAN\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### LIMIT KICK MSG #####
set prot(limitmsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  set \[\0034+l (limit)\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### DEVOICE KICK MSG #####
set prot(devoicemsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  \[\0034DEVOICE\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### VOICE KICK MSG #####
set prot(voicemsg) "\0035,1±\0030 \002Du bist nicht berechtigt für  \[\0034VOICE\0030\] in %chan - protected by me \0035,1±\002\0030\002 Script by #yooda \002\0035,1±\002\003"

##### Enable Q notice: enable = 1 / disable = 0 #####
set qenable "1"

##### Enable L notice: enable = 1 / disable = 0 #####
set lenable "1"

##### Enable deop report: enable = 1 / disable = 0 #####
set deopenable "1"

##### Enable kick report: enable = 1 / disable = 0 #####
set kickenable "1"

##### Enable ban report: enable = 1 / disable = 0 #####
set banenable "1"

##### Enable L / Q unbanall: enable = 1 / disable = 0 #####
set unbanall "1"

##### Enable no op report: enable = 1 / disable = 0 #####
set noopenable "0"

##### L/Q op request: enable = 1 / disable = 0 #####
set lqop "0"

##### Enable need invite report: enable = 1 / disable = 0 #####
set inviteenable "1"

##### L/Q invite request: enable = 1 / disable = 0 #####
set lqinvite "1"

##### Enable need limit report: enable = 1 / disable = 0 #####
set limitenable "1"

##### Enable need key report: enable = 1 / disable = 0 #####
set keyenable "1"

##### L/Q clearchan request: enable = 1 / disable = 0 #####
set lqclearchan "1"

##### Report Channel #####
set homechan "#report.it"

##### Enable Color: Enable = 1 / Disable = 0 #####
set colorenable "1"

##### DON'T CHANGE THIS #####
set prot(requestop) ""

##### Topic if there is no topic set #####
set notopic "There was no Topic set."

##### Protection Channel flag #####
set prot(chanflag) "protection"

##### Vip Channel flag #####
set prot(vipchanflag) "vip"

##### Topic Protection Channel flag #####
set prot(topicchanflag) "topic"

##### Join/Part Protection Channel flag #####
set prot(joinpartchanflag) "joinpart"

##### Join/Part reason | channel: %chan - Nick: %nick Banhost: %host #####
set prot(joinpartreason) "You are BANNED from %chan cause of lame join/part."

##### Join/Part zeit bis zum automatischem remove des bans. #####
set prot(joinpartbantime) 10

##### Public char #####
set prot(char) "!"

##### Autolimit Channel flag #####
set prot(autolimitchanflag) "autolimit"

##### Autolimit check time ( sec ) #####
set prot(autolimittime) "60"

##### Autolimit limit ( Sekunden ) #####
set prot(autolimit) "10"

# Protection zum Schutz gegen Bans von Usern auf übergeordnete User
# hierbei werden die Flags vergliechen die die User im Bot haben.
# Bans gegen den Bot selber werden direkt zurückgenommen
# Aktiv (1) Inaktiv (0)
set z(ban_protect) 1

set z(cmdchar) $prot(char)

# Hier werden die Flags eingetragen die ein User haben muss auf dem Bot um nicht 
# gekickt werden zu können
# +n, +m, +o, +v: set z(no_kick_flags) "nmov"
set z(no_kick_flags) "nmob"

# Das gleiche wie zuvor, nur bei Bans
set z(no_ban_flags) "nmob"

##### Anti Advertise Channel flag #####
set antiadvert(chanflag) "advertise"

##### Anti Advertise Pattern #####
set antiadvert(pattern) "{* #?*} {#?*} {*www.???*.??*} {*http://?*.?*} {*#?*}"

##### Anti Advertise Ban time #####
set antiadvert(bantime) "10"

##### Anti Advertise Warn Message #####
set antiadvert(warnmsg) "You are violating QuakeNet rules. Please read http://www.pwnage-clan.de/rules/ and cease your abuse."

##### Anti Advertise Ban Message #####
set antiadvert(banmsg) " You are violating QuakeNet rules. Please read http://www.pwnage-clan.de/rules/. You are banned for $antiadvert(bantime) minutes."

##### Anti Badwords Channel flag #####
set badwords(chanflag) "badwords"

##### Anti Badwords Pattern #####
set badwords(pattern) "{*hure*} {*spasst*} {*kiddie*} {*bastard*} {*neger*} {*bitch*} {*arsch*} {*fuck*} {*fotze*} {*schlampe*} {*missgeburt*} {*arschgeburt*}"

##### Anti Badwords Ban time #####
set badwords(bantime) "10"

##### Anti Badwords Warn Message #####
set badwords(warnmsg) "You are violating the Channel rules. Do not use badwords or you get banned."

##### Anti Badwords Ban Message #####
set badwords(banmsg) "You are violating the Channel rules. Du bist nicht berechtigt für  use badwords in this channel. Banned for $badwords(bantime) minutes." 


#############################################
################ PROGRAMMS ##################
#############################################

#################################################################
### Ab Hier nurnoch was ändern, wenn ihr wisst was ihr macht. ###
#################################################################

####### BINDINGS #######

bind pub oB|oB [string trim $z(cmdchar)]ban pub_z_ban
bind pub oB|oB [string trim $z(cmdchar)]unban pub_z_unban
bind pub ov|ov [string trim $z(cmdchar)]kick pub_z_kick
bind pub oB|oB [string trim $z(cmdchar)]help pub_z_help
bind pub oB|oB [string trim $z(cmdchar)]banlist pub_z_banlist
bind pub oB|oB [string trim $z(cmdchar)]gbanlist pub_g_banlist
bind pub mT|mT $prot(char)cleartopic topicclear
bind pub n|n $prot(char)+user pub:+user
#bind pub n|n !chattr pub:chattr
bind pub n $prot(char)save pub:save
bind pub n $prot(char)rehash pub:rehash
bind pub n $prot(char)restart pub:restartme
bind pub n $prot(char)quit pub:quitme
bind pub n $prot(char)gchattr pub:gchattr
bind pub n .tcl tcldebug:tcl
bind pub n % tcldebug:tcl
bind pub n $prot(char)exec tcldebug:exec
bind kick - * prot:kick
bind kick - * check:kick
bind mode - * prot:mode
bind mode - * check:changemode
bind mode - "* -o" ldeop
bind notc - * check:notice
bind need - * check:need
bind topc - * locktopic
bind pub m|m $prot(char)autoop pub:autoop
bind pub m|m $prot(char)ao pub:autoop
bind join - * join:ao_check
bind time - "* * * * *" file2:save
bind pub m|m $prot(char)autovoice pub:autovoice
bind pub m|m $prot(char)av pub:autovoice
bind join - * join:av_check
bind time - "* * * * *" file:save
bind pub m|m $prot(char)whois whoisuser
bind notc b "#*" check:lag
bind pub m $prot(char)lag lag:check
bind pub n|n \$addvip putvip
bind pub n|n \$delvip delvip
bind pub V|V \$vip check:isvip
bind join V|V * vip:check
bind join - * prot:check:joinpart1
bind part - * prot:check:joinpart2
bind pub n "$prot(char)msg" msg
bind pub n|n "$prot(char)idler" idler
#bind pub m|m "$prot(char)chanset" cset
bind pub n "$prot(char)user" user
bind pub n|n "$prot(char)modes" mchan
bind pub n|n "$prot(char)bans" mchanbans
bind pub n "$prot(char)channels" mchannels
bind pub m|m "$prot(char)cloneon" cloneon
bind pub m|m "$prot(char)cloneoff" cloneoff
bind pub m|m "$prot(char)recover" recover
bind pub n|n "$prot(char)userlist" show:userlist
bind pub n "$prot(char)join" joinchannel
bind pub n "$prot(char)part" partchannel
bind pub m|m "$prot(char)mode" modechan
bind pub n "$prot(char)say" say
bind pub m|m "$prot(char)topic" use:topic
bind pub n|n "$prot(char)hop" hop
bind pub n|n "$prot(char)rejoin" hop
bind pub n|n "$prot(char)cycle" hop
bind pub n "$prot(char)amsg" amsg
bind pub n "$prot(char)partall" partall
bind pub m|m "$prot(char)deopall" deopall
bind pub m|m "$prot(char)rop" rop
bind pub m|m "$prot(char)unbanall" unbanall
bind pub m|m "$prot(char)clearchan" clearchan
bind msg n "$prot(char)join" joinchannel2
bind msg n "$prot(char)part" partchannel2
bind pub m|m "$prot(char)bdel" pub:bdel 
bind pub m|m "$prot(char)badd" pub:badd
bind pub n "$prot(char)chanlev" pub:chanlev
bind pub n "$prot(char)gbadd" pub:gbadd
bind pub n|n "$prot(char)mkick" pub:masskick
bind pub m|m "$prot(char)invite" pub:invite
bind pub n|n "$prot(char)time" pub:time
bind pub m|m "$prot(char)banclear" pub:banclear
bind pub n|n "$prot(char)chaninfo" infochan
bind pub n|n "$prot(char)auth" pub2:auth
bind pub n|n "$prot(char)version" pub2:version
bind pub n|n "$prot(char)ping" pub:ping
bind pub n|n "?time" pub:mytime
bind ctcr - * ctcr
bind pub m|m "$prot(char)permban" permban
bind pub m|m "$prot(char)timeban" timeban
#bind pub n|n "$prot(char)+user" pub:+user
bind pub n "$prot(char)version" pub:version
bind msg m broadcast msg:broadcast
bind pub - "$prot(char)m-userlist" m:userlist
bind msg m checkop checkop
bind pub n "bot" pub:botnick
bind msg m "join" joinchannel12
bind msg m "part" partchannel12
bind pub o|o "$prot(char)mode" modechan
bind pub m "$prot(char)massmode" mass:modechan
bind pub m|m $prot(char)ruhe pub:ruhe
bind pub n "$prot(char)chanlev" pub:chanlev
bind pub n $prot(char)restart  pub:restart
bind pub m|m $prot(char)mvoice pub:massavoice
bind pub m|m $prot(char)mdevoice pub:massadevoice
bind pub m|m $prot(char)mop pub:massaop
bind pub m|m $prot(char)mdeop pub:massadeop
bind pub m|m $prot(char)mkick pub:masskick
bind pub m|o "$prot(char)op" doopmode1
bind pub m|o "$prot(char)deop" dodeopmode1
bind pub m|o  "$prot(char)voice" dovoicemode1
bind pub m|o "$prot(char)devoice" dodevoicemode1
bind pub m|m "$prot(char)cmds" showcommands
bind pub m|m "$prot(char)commands" showcommands
bind pub m|m "$prot(char)befehle" showcommands
bind pub m|m "$prot(char)showcommands" showcommands
bind pub n "$prot(char)sag" sag
bind pub n|n $prot(char)userlist pub:userlist
bind pub n|n $prot(char)i pub:invite
bind pub n "$prot(char)channels" pub:channels
#bind msg n "request" pub:requestaccept
bind pub m|m "$prot(char)lop" pub:lop 
bind pub m "$::botnick" pub:command01
bind pub m|m $prot(char)timeban pub:timeban
bind pub n|n $prot(char)permban pub:permban
bind pub m|m $prot(char)tmaskban pub:tmaskban
bind pub n|n $prot(char)pmaskban pub:permmaskban
bind pub m $prot(char)gtimeban pub:gtmaskban
bind pub n $prot(char)gpermban pub:gpermmaskban
bind pub m $prot(char)gunban pub:gunban
bind pub m|m $prot(char)autovoice pub:autovoice
bind pub m|m $prot(char)av pub:autovoice
bind join - * join:av_check
bind time - "* * * * *" file:save
bind pub n "\$check" check:abuse
bind pub n "\$showchans" check:chans
bind pub n "\$info" check:modes
bind msg - op msg:op
bind msg - deop msg:deop
bind msg - voice msg:voice
bind msg - devoice msg:devoice
bind msg - kick msg:kick
bind msg - ban msg:ban
bind msg - recover msg:recover
bind msg - help msg:help
bind msg - showcommands msg:showcommands
bind msg - topic msg:topic
bind msg - banclear msg:banclear
bind msg - bandel msg:bandel
bind msg - adduser msg:adduser
bind msg - whoami msg:whoami
bind msg - whois msg:whois
bind msg - chanset msg:chanset
bind msg - chattr msg:chattr
bind msg - mode msg:mode
bind msg - invite msg:invite
bind msg - banlist msg:banlist
bind msg - lock msg:lock
bind msg - unlock msg:unlock
bind msg - ban msg:ban
bind msg - tempban msg:tempban
bind msg - permban msg:permban
bind msg - deluser msg:deluser
bind msg - jump msg:jump
bind msg - restart msg:restart
bind msg - quit msg:quit
bind msg - rehash msg:rehash
bind msg - save msg:save
bind pubm - * checkadvert
bind pubm - * checkbadwords
bind pub n|n %ban ban:auth
bind pub n|n %bandel unban:auth
bind pub n|n %banlist banlist:auth 
bind join - * joincheckbans
bind pub n|n "$prot(char)chattr" public:chattr
bind pub n|n "$prot(char)adduser" public:adduser 
bind pub m|m "$prot(char)peak" pub:setpeak
bind pub m|m "$prot(char)botop" pub:botop
bind pub m|m "$prot(char)clear" pub:clear
bind pub m|m "$prot(char)uptime" pub:uptime
bind pub m|m "$prot(char)lock" pub:lockchan
bind pub m|m "$prot(char)unlock" pub:unlockchan
bind pub n|n "$prot(char)chanset" public:chanset
bind pub n|n "$prot(char)deluser" public:deluser
bind pub m|m "$prot(char)op" public:op
bind pub m|m "$prot(char)deop" public:deop
bind pub m|m "$prot(char)voice" public:voice
bind pub m|m "$prot(char)devoice" public:devoice
bind pub m|m "$prot(char)kick" public:kick
bind pub m|m "$prot(char)qauth" pub:user:qckeck
bind pub n "$prot(char)globalban" public:globalban

set ::chantime ""
set ::chanauth ""
set ::nochan ""
set ::chanver ""
set ::authchan ""
set ::chanping ""
set global-flood-chan 15:60
set global-flood-deop 3:10
set global-flood-kick 3:10
set global-flood-join 60:60
set global-flood-ctcp 14:60
set global-flood-nick 9:60
set global-aop-delay 9:30
set global-idle-kick 0
set global-chanmode "nt"
set global-stopnethack-mode 0
set global-revenge-mode 1
set flood-msg 40:60
setudef flag $prot(autolimitchanflag)
setudef flag $prot(chanflag)
setudef flag $prot(topicchanflag)
setudef flag $prot(vipchanflag)
setudef flag $antiadvert(chanflag)
setudef flag $badwords(chanflag)
setudef flag $prot(joinpartchanflag)
set authban(datei) "${::botnet-nick}.bans"
set authban(chan) ""
set authban(nick) ""
set authban(isbind) ""
set ::qcheck(all) 0
set ::qcheck(hub) $prot(qnick)
set ::qcheck(chan) ""
set ::qcheck(authnick) ""

#############################################
#############################################
#############################################
################# PROTECTION ################
#############################################
#############################################
#############################################
proc ldeop {nick host hand chan mode victim} { 
	global botnick 
	if {$victim != $botnick} { 
		return 0
	}
	if {[isop L $chan]} { 
		putquick "PRIVMSG L :op $chan" 
	} elseif {[isop Q $chan]} { 
		putquick "PRIVMSG Q :op $chan" 
	}
}
####### KICK PROTECTION #######
proc prot:kick {nick host hand chan target reason} {
	global botnick prot
	set pattern "* +$prot(chanflag) *"
	set pattern2 "* +$prot(chanflag)"
	if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
	if {$prot(kick) == "1"} {
		if {![matchattr $hand m|m $chan]} { 
			if {$nick == $botnick} { return 0 }
			if {$nick == $target} { return 0 }
			if {$target == $botnick} {
				putquick "PRIVMSG $prot(lnick) :recover $chan" 
				putquick "PRIVMSG $prot(qnick) :recover $chan"
				putserv "JOIN $chan"
				if {[onchan $prot(lnick) $chan]} { 
					putserv "PRIVMSG $prot(lnick) :OP $chan" 
				}
				 if {[onchan $prot(qnick) $chan]} { 
					putserv "PRIVMSG $prot(qnick) :OP $chan" 
				}
			}
			if {![isop $botnick $chan]} { 
				if {[onchan $prot(lnick) $chan]} { 
					putserv "PRIVMSG $prot(lnick) :OP $chan" 
				}
				 if {[onchan $prot(qnick) $chan]} { 
					putserv "PRIVMSG $prot(qnick) :OP $chan" 
				}
			}
			set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
			set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
			set banmask "*!*$userm@$ipmask"
			putquick "MODE $chan -o+b $nick $banmask"
			regsub -all "%chan" $prot(kickmsg) $chan kickreason
			putquick "KICK $chan $nick :$kickreason"
			if {[onchan $prot(qnick) $chan]} { 
				putserv "PRIVMSG $prot(qnick) :chanlev $chan $nick +ab"
			}
			if {[onchan $prot(lnick) $chan]} { 
				putserv "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
			}
			newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none
		}
	}
	}
}

####### OP / DEOP / BAN / UNBAN PROTECTION #######
proc prot:mode {nick host hand chan mode victim} {
	global botnick prot
	set pattern "* +$prot(chanflag) *"
	set pattern2 "* +$prot(chanflag)"
	if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
	if {$mode == "+o"} {
		if {$prot(op) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server oped a user in $chan" 
				return 0 
			} 
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick) && $victim != $botnick} {
				if {![matchattr $hand m|m $chan]} { 
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"					
					putserv "MODE $chan -oo+b $nick $victim $banmask"
					regsub -all "%chan" $prot(opmsg) $chan kickreason
					putserv "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none	
				}
			}	
		}
	}
	if {$mode == "-o"} {
		if {$prot(deop) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server deoped a user in $chan"
				if {$victim == $botnick} { 
					if {[onchan $prot(lnick) $chan]} { 
						putserv "PRIVMSG $prot(lnick) :OP $chan" 
					}
					 if {[onchan $prot(qnick) $chan]} { 
						putserv "PRIVMSG $prot(qnick) :OP $chan" 
					}
				} 
			return 0 
			} 
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick) && $nick != $victim} {
				if {![matchattr $hand m|m $chan]} { 
					if {$victim == $botnick} { 
						if {[onchan $prot(qnick) $chan]} {  
							putquick "PRIVMSG $prot(qnick) :op $chan" 
						} elseif {[onchan $prot(lnick) $chan]} { 
							putquick "PRIVMSG $prot(lnick) :op $chan" 
						}
					}
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -o+b $nick $banmask"
					if {$victim != $botnick} { putserv "MODE $chan +o $victim" }
					regsub -all "%chan" $prot(deopmsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none	
				}
			}	
		}
	}
	if {$mode == "+b"} {
		if {$prot(ban) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server banned a user in $chan" 
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -ob+b $nick $victim $banmask"
					regsub -all "%chan" $prot(banmsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none		
				}
			}	
		}
	}
	if {$mode == "-b"} {
		if {$prot(unban) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server unbanned a user in $chan"
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -o+bb $nick $victim $banmask"
					regsub -all "%chan" $prot(unbanmsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none	
				}
			}	
		}
	}
	if {$mode == "+i"} {
		if {$prot(invite) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server sets +i in $chan" 
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -io+b $nick $banmask"
					regsub -all "%chan" $prot(invitemsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none		
				}
			}	
		}
	}
	if {$mode == "+k"} {
		if {$prot(key) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server sets +k $victim in $chan"
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -ok+b $nick $victim $banmask"
					regsub -all "%chan" $prot(keymsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none		
				}
			}	
		}
	}
	if {$mode == "+l"} {
		if {$prot(limit) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server sets +l $victim in $chan"
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan o+b $nick $banmask"
					regsub -all "%chan" $prot(limitmsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					putserv "MODE $chan -l"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none		
				}
			}	
		}
	}
	if {$mode == "+v"} {
		if {$prot(voice) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server sets +v $victim in $chan"
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -ov+b $nick $victim $banmask"
					regsub -all "%chan" $prot(voicemsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none		
				}
			}	
		}
		set uhand [nick2hand $victim $chan]
		if {[matchattr $uhand E|E $chan]} {
			pushmode $chan -v $victim
		}
	}
	if {$mode == "-v"} {
		if {$prot(voice) == "1"} {
			if {[string match "*.pwnage-clan.de" $host] && $nick == ""} { 
				putlog "Server sets -v $victim in $chan"
				return 0 
			}
			if {$nick != $botnick && $nick != $prot(qnick) && $nick != $prot(lnick)} {
				if {![matchattr $hand m|m $chan]} {
					set ipmask [lindex [split [maskhost $nick![getchanhost $nick $chan]] "@"] 1]
					set userm [lindex [split [getchanhost $nick $chan] "@"] 0]
					set banmask "*!*$userm@$ipmask"
					putquick "MODE $chan -o+vb $nick $victim $banmask"
					regsub -all "%chan" $prot(devoicemsg) $chan kickreason
					putquick "KICK $chan $nick :$kickreason"
					if {[onchan $prot(qnick) $chan]} { 
						putquick "PRIVMSG $prot(qnick) :chanlev $chan $nick +b-ao"
					}
					if {[onchan $prot(lnick) $chan]} { 
						putquick "PRIVMSG $prot(lnick) :chanlev $chan $nick -ao"
					}
					newchanban $chan $banmask $botnick " You are BANNED from this channel." 3600 none	
				}
			}	
		}
	}
	}
}

proc check:abuse {nick host hand chan arg} { 
	global botnick
	set chans "Abusechans:"
	foreach a [channels] { 
		if {![isop $botnick $a]} { 
			set chans [linsert $chans [expr [llength $a] + 1] "$a"]
		} 
	}
	putserv "PRIVMSG $chan :[join $chans]"
	set $chans 0 
}

proc check:chans {nick host hand chan arg} { 
	global botnick
	set chans 0
	foreach channels [channels] {
		set chans "[expr $chans + 1]"
	}
	set pr [expr $chans / 0.2]
	putserv "PRIVMSG $chan :Channels: \002$chans\002 / 20 - using \002$pr%\002" 
}

proc check:modes {nick host hand chan arg} { 
	global botnick; 
	set chans 0; 
	set ops 0; 
	set voices 0; 
	set regs 0;
	foreach channels [channels] { 
		set chans "[expr $chans + 1]"; 
		if {[isop $botnick $channels]} { 
			set ops "[expr $ops + 1]" 
		} 
		if {[isvoice $botnick $channels]} {
			if {![isop $botnick $channels]} { 
				set voices "[expr $voices + 1]" 
			}
		}
		if {![isvoice $botnick $channels]} {
			if {![isop $botnick $channels]} { 
				set regs "[expr $regs + 1]" 
			}
		}
	}  
	set pr [string range [expr $chans / 0.2] 0 1]; 
	if {$chans < "10"} { 
		set pchans "0.0$chans"
	} { 
		set pchans "0.$chans" 
	}
	set props [string range [expr $ops / $pchans] 0 4]
	set prvoices [string range [expr $voices / $pchans] 0 4]
	set prregs [string range [expr $regs / $pchans] 0 4]
	putserv "PRIVMSG $chan :Channels: [big $chans] / 20 - using [big $pr%] - I have op in [big $ops] Channels ([big $props%]) - I have voice in [big $voices] Channels ([big $prvoices%]) - I have no access in [big $regs] Channels ([big $prregs%])"
}
proc big {data} {
return "\002$data\002"
}


####### LOCK PROGRAMMS #######
proc pub:lockchan {nick host hand chan arg} {
	global botnick
	if {[string match "+*i*" [getchanmode $chan]] && [string match "+*r*" [getchanmode $chan]] && [string match "+*m*" [getchanmode $chan]]} {
		putserv "NOTICE $nick :Channel is already locked."
	} {	
		putserv "MODE $chan +irm"
		putserv "NOTICE $nick :Channel is now locked."
	}
}
proc pub:unlockchan {nick host hand chan arg} {
	global botnick
	if {[string match "+*i*" [getchanmode $chan]] || [string match "+*r*" [getchanmode $chan]] || [string match "+*m*" [getchanmode $chan]]} {
		putserv "MODE $chan -irm"
		putserv "NOTICE $nick :Channel is now unlocked."
	} { 
		putserv "NOTICE $nick :Channel is already unlocked."
	}
}
### !BAN <nick|mask> [time] [reason]

proc pub_z_ban {nick host hand chan arg} {
	set arg [charfilter $arg]
	global z botnick
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Benutze:\002 [string trim $z(cmdchar)]ban <nick|mask> \[time\] \[reason\]"
		return 0
	}
	set who [lindex $arg 0]
	set ti [lindex $arg 1]
	if {[number $ti]} {
		set reason [lrange $arg 2 end]
	} {
		set ti ""
		set reason [lrange $arg 1 end]
	}
	if {$reason == ""} {set reason "requested"}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskBan: $who"}
		set who [strlwr $who]
		set bancount 0
		set flags "-$z(no_ban_flags)&-$z(no_ban_flags)"
		if {$z(no_ban_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			set banmask ""
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr bancount
				set ipmask [lindex [split [maskhost $chanuser![getchanhost $chanuser $chan]] "@"] 1]
				set userm [lindex [split [getchanhost $chanuser $chan] "@"] 0]
				set banmask *!*$userm@$ipmask
				newchanban $chan $banmask $nick $reason
				if {[botisop $chan]} {
					putserv "MODE $chan +b $banmask"
					putserv "KICK $chan $chanuser :$nick: $reason"
				}
			}
		}
		if {$bancount == 0} {
                        puthelp "NOTICE $nick :Sorry, niemanden mit der mask gefunden."
		}
	} {
		if {![onchan $who $chan]} {
                        puthelp "NOTICE $nick :Sorry, ich kann $who nicht in $chan sehen."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "NOTICE $nick :Bist DU noch richtig im Kopf, MICH zu bannen ?"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
                                        puthelp "NOTICE $nick :Sorry, Du musst Op sein um einen Op bannen zu können."
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
                                        puthelp "NOTICE $nick :Sorry, Du musst Master sein, um einen Master bannen zu können."
					return 0
				}
			}
		}
		set ipmask [lindex [split [maskhost $who![getchanhost $who $chan]] "@"] 1]
		set userm [lindex [split [getchanhost $who $chan] "@"] 0]
		set banmask *!*$userm@$ipmask
		if {[botisop $chan]} {
			if {[isop $who $chan]} {pushmode $chan -o $who}
			putserv "MODE $chan +b $banmask"
			putserv "KICK $chan $who :$reason"
		}
		switch $ti {
			""
			{
				newchanban $chan $banmask $nick $reason
				puthelp "NOTICE $nick :Neue mask hinzugefügt: $mask"
			}
			0
			{
				newchanban $chan $banmask $nick $reason $ti
				puthelp "NOTICE $nick :Neue mask permanent hinzugefügt: $mask"
			}
			default
			{
				newchanban $chan $banmask $nick $reason $ti
				puthelp "NOTICE $nick :Neue mask für $ti minuten hinzugefügt: $mask"
			}
		}
	}
	return 0
}

### !UNBAN <mask|number>

proc pub_z_unban {nick host hand chan arg} {
	set arg [charfilter $arg]
	global z botnick
	if {[llength $arg] != 1} {
		puthelp "NOTICE $nick :\002Benutze:\002 [string trim $z(cmdchar)]unban <mask|number>"
		return 0
	}
	set numban 0
	set banmask ""
	set mask [lindex $arg 0]
	if {[botisop $chan]} {pushmode $chan -b $mask}
	if {[number $mask]} {
		set find 0
		set victim ""
		foreach bans [banlist $chan] {
			incr find
			if {$find == $mask} {
				set victim [lindex $bans 0]
			}
		}
		if {$victim == ""} {
			puthelp "NOTICE $nick :Kann keinen ban $mask in diesem Chan finden."
			return 0
		}
		if {[killchanban $chan $victim]} {
			if {[botisop $chan]} {
				pushmode $chan -b $victim
				if {[lindex [split $victim "@"] 1] == "*"} {
					pushmode $chan -b [lindex [split $victim "@"] 0]
				}
			}
			puthelp "NOTICE $nick :Ban erfolgreich gelöscht: $victim"
			return 0
		}
	}
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set find 0
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		if {[strlwr $victim] == [strlwr $mask]} {set find 1}
	}
	if {$find == 0} {
                puthelp "NOTICE $nick :Keine übereinstimmung mit einem ban"
		return 0
	}
	if {[killchanban $chan $mask]} {
		puthelp "NOTICE $nick :Ban erfolgreich gelöscht."
	} {
		puthelp "NOTICE $nick :Kein solcher ban."
	}
	return 0
}


### !KICK <nick|mask> [reason]

proc pub_z_kick {nick host hand chan arg} {
	if {![botisop $chan]} {return 0}
	set arg [charfilter $arg]
	global z botnick
	if {[llength $arg] < 1} {
		puthelp "NOTICE $nick :\002Benutze:\002 [string trim $z(cmdchar)]kick <nick|mask> \[reason\]"
		return 0
	}
	set who [lindex $arg 0]
	set reason [lrange $arg 1 end]
	if {$reason == ""} {set reason "requested"}
	if {[string first "*" $who] != -1 || [string first "?" $who] != -1} {
		if {$reason == "requested"} {set reason "MaskKick: $who"}
		if {![matchattr $hand o|o $chan]} {
			puthelp "NOTICE $nick :Du musst Op sein um dies benutzen zu können."
			return 0
		}
		set who [strlwr $who]
		set kickcount 0
		set flags "-$z(no_kick_flags)&-$z(no_kick_flags)"
		if {$z(no_kick_flags) == ""} {
			set list [strlwr [chanlist $chan]]
		} {
			set list [strlwr [chanlist $chan $flags]]
		}
		foreach chanuser $list {
			if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $chan] && ![isvoice $chanuser $chan]} {
				incr kickcount
				putserv "KICK $chan $chanuser :$nick: $reason"
			}
		}
		if {$kickcount == 0} {
                        puthelp "NOTICE $nick :Sorry, trifft auf niemanden zu."
		}
	} {
		if {![onchan $who $chan]} {
                        puthelp "NOTICE $nick :Sorry, ich kann $who nicht in $chan sehen."
			return 0
		}
		if {[strlwr $who] == [strlwr $botnick]} {
			puthelp "NOTICE $nick :Bist DU noch richtig im Kopf, MICH zu kicken ?"
			return 0
		}
		if {[nick2hand $who $chan] != "*"} {
			if {$hand != [nick2hand $who $chan]} {
				if {[matchattr [nick2hand $who $chan] o|o $chan] && ![matchattr $hand o|o $chan]} {
					puthelp "NOTICE $nick :Sorry, Du musst Op sein um einen Op kicken zu können"
					return 0
				}
				if {([matchattr [nick2hand $who $chan] m|m $chan] || [matchattr [nick2hand $who $chan] b]) && ![matchattr $hand m|m $chan]} {
					puthelp "NOTICE $nick :Sorry, Du musst Master sein, um einen Master kicken zu können."
					return 0
				}
			}
		}
		putserv "KICK $chan $who :$nick: $reason"
	}
	return 0
}

### !BANLIST

proc pub_z_banlist {nick host hand chan arg} {
	set arg [charfilter $arg]
	global z botnick
	set num 1
	puthelp "NOTICE $nick :\037*** $chan BANS info !!! ***"
	foreach bans [banlist $chan] {
		set victim [lindex $bans 0]
		set why [lindex $bans 1]
		set expire [lindex $bans 2]
		set who [lindex $bans 5]
		set remain [expr $expire - [unixtime]]
		if {$remain > 0} {
			set remain "expire in [time_diff2 $expire]."
		} {
			set remain "PermBan"
		}
		puthelp "NOTICE $nick :\002BAN $num:\002 $victim, $remain"
		puthelp "NOTICE $nick :$who: $why"
		incr num
	}
        if {$num == 1} {puthelp "NOTICE $nick :There are no bans in $chan."}
	return 0
}



### !HELP

proc pub_z_help {nick host hand chan arg} {
	set arg [charfilter $arg]
	global z
	if {![validuser $hand] && $z(help) == 0} {return 0}
	puthelp "NOTICE $nick :\037Script by Gischy"
	puthelp "NOTICE $nick :\002Du kannst:\002 [string trim $z(cmdchar)]ban <nick|mask> \[time\] \[reason\] \002benutzen um zu bannen\002"
	puthelp "NOTICE $nick :\002Du kannst:\002 [string trim $z(cmdchar)]unban <mask|nummer>  \002benutzen um einen ban aufzuheben, Nummern ersichtlich aus der banlist\002"
	puthelp "NOTICE $nick :\002Du kannst:\002 [string trim $z(cmdchar)]kick <nick|mask> \[reason\] \002benutzen um zu kicken\002"
	puthelp "NOTICE $nick :\002Du kannst:\002 [string trim $z(cmdchar)]banlist \002zeigt Dir die Banlist an\002"
}

proc charfilter {x {y ""} } {
	for {set i 0} {$i < [string length $x]} {incr i} {
		switch -- [string index $x $i] {
			"\"" {append y "\\\""}
			"\\" {append y "\\\\"}
			"\[" {append y "\\\["}
			"\]" {append y "\\\]"}
			"\} " {append y "\\\} "}
			"\{" {append y "\\\{"}
			default {append y [string index $x $i]}
		}
	}
	return $y
}

proc number {test} {
	foreach i [split $test {}] {
		if ![string match \[0-9\] $i] {
			return 0
		}
	}
	return 1
}

proc time_diff2 {time} {
	set ltime [expr $time - [unixtime]]
	set seconds [expr $ltime % 60]
	set ltime [expr ($ltime - $seconds) / 60]
	set minutes [expr $ltime % 60]
	set ltime [expr ($ltime - $minutes) / 60]
	set hours [expr $ltime % 24]
	set days [expr ($ltime - $hours) / 24]
	set result ""
	if {$days} {
		append result "$days "
		if {$days} {
			append result "day "
		} {
			append result "days "
		}
	}
	if {$hours} {
		append result "$hours "
		if {$hours} {
			append result "hour "
		} {
			append result "hours "
		}
	}
	if {$minutes} {
		append result "$minutes "
		if {$minutes} {
			append result "minute"
		} {
			append result "minutes"
		}
	}
	if {$seconds} {
		append result " $seconds "
		if {$seconds} {
			append result "second"
		} {
			append result "seconds"
		}
	}
	return $result
}



# END


proc pub_g_banlist {nick host hand chan arg} {
	set arg [charfilter $arg]
	global z botnick
	set num 1
	puthelp "NOTICE $nick :\037*** Global BANS info !!! ***"
	foreach bans [banlist] {
		set victim [lindex $bans 0]
		set why [lindex $bans 1]
		set expire [lindex $bans 2]
		set who [lindex $bans 5]
		set remain [expr $expire - [unixtime]]
		if {$remain > 0} {
			set remain "expire in [time_diff2 $expire]."
		} {
			set remain "PermBan"
		}
		puthelp "NOTICE $nick :\002BAN $num:\002 $victim, $remain"
		puthelp "NOTICE $nick :$who: $why"
		incr num
	}
        if {$num == 1} {puthelp "NOTICE $nick :There are no Global bans"}
	return 0
}

####### UPTIME #######
proc pub:uptime {nick host hand chan arg} {
putserv "NOTICE $nick :Uptime [duration [expr [clock seconds] - $::uptime]]"
}

####### CLEAR CHANNEL MODES #######
proc pub:clear {nick host hand chan arg} {
	global botnick prot
	set modes [getchanmode $chan]
	set modes [lindex [split $modes "+"] 1] 
	set modes "-$modes-uDN$prot(standardmodes)" 
	putserv "MODE $chan $modes"; return "$modes"
}

####### OP REQUEST ON L / Q  #######
proc pub:botop {nick host hand chan arg} {
	global botnick prot
	if {![isop $botnick $chan]} {
		if {[onchan $prot(lnick) $chan]} { 
			set prot(requestop) "$nick"
			putserv "PRIVMSG $prot(lnick) :OP $chan"
			putserv "NOTICE $nick :- Requesting OP on $prot(lnick)"
		}
		 if {[onchan $prot(qnick) $chan]} { 
			set prot(requestop) "$nick"
			putserv "PRIVMSG $prot(qnick) :OP $chan"
			putserv "NOTICE $nick :- Requesting OP on $prot(qnick)"
		}
	} {
		putserv "NOTICE $nick :- Sorry, I have op in this Channel."
		set prot(requestop) ""
	}
}


#############################################
#############################################
#############################################
################## REPORT  ##################
#############################################
#############################################
#############################################

proc check:notice {nick host hand arg {dest ""}} {
	global botnick homechan prot qenable lenable
	set arg [charfilter $arg]
	if {$nick == $prot(qnick) && $qenable == "1"} {
		puthelp "PRIVMSG $homechan :($botnick) $prot(qnick) - $arg"
	}
	if {$nick == $prot(lnick) && $lenable == "1"} {
		puthelp "PRIVMSG $homechan :($botnick) $prot(lnick) - $arg"
	}
	if {$nick == "$prot(qnick)" && $prot(requestop) != ""} {
		if {[string match "*You don?t have +o flag on that channel." $arg]} {
			puthelp "NOTICE $prot(requestop) :- I do not have access in this Channel."
			set prot(requestop) ""
		}
		if {[string match "*If you are known by ? type*msg * AUTH nickname password?*" $arg]} {
			puthelp "NOTICE $prot(requestop) :- I cannot request op on $prot(qnick) - I am NOT authed ."
			set prot(requestop) ""
		}
		if {[string match "*Done." $arg]} {
			puthelp "NOTICE $prot(requestop) :- I succesfully requested op on $prot(qnick)."
			set prot(requestop) ""
		}
	}
	if {$nick == $prot(lnick) && $prot(requestop) != ""} {
		if {[string match "*Sorry, you need the +o flag on * to get ops." $arg]} {
			puthelp "NOTICE $prot(requestop) :- I do not have access in this Channel."
			set prot(requestop) ""
		}
		if {[string match "*You are not authed?*Please auth with ? before sending me commands?*" $arg]} {
			puthelp "NOTICE $prot(requestop) :- I cannot request op on $prot(lnick) - I am NOT authed ."
			set prot(requestop) ""
		}
		if {[string match "*Done." $arg]} {
			puthelp "NOTICE $prot(requestop) :- I succesfully requested op on $prot(lnick)."
			set prot(requestop) ""
		}
	}
}
proc check:changemode {nick host hand chan mode victim} {
	global botnick homechan deopenable prot
	if {$botnick == $victim && $deopenable == "1" && $mode == "-o"} {
		if {$nick == ""} {
			set nick $host
		}	
		puthelp "PRIVMSG $homechan :[setcolor Violating:] \002$nick\002 deoped \002$botnick\002 in \002$chan\002"
	}
}
proc check:kick {nick host hand chan target reason} {
	global botnick homechan kickenable prot
	if {$botnick == $target && $kickenable == "1"} {
		if {$nick == ""} {
			set nick $host
		}
		puthelp "PRIVMSG $homechan :[setcolor Violating:] \002$nick\002 kicked \002$botnick\002 from \002$chan\002 - Reason: $reason"	
	}
}
proc check:need {chan type} {
	global botnick banenable homechan noopenable inviteenable prot lqop lqinvite unbanall limitenable lqclearchan keyenable
	if {![string match "*needcheck*" [timers]]} {
		if {[strlwr $chan] != [strlwr $homechan]} {
			if {$type == "unban" && $banenable == "1"} {
				if {$unbanall == "1"} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 is banned in \002$chan\002 - requesting unbanall on L / Q."
					putserv "PRIVMSG $prot(lnick) :unbanall $chan"
					putserv "PRIVMSG $prot(qnick) :unbanall $chan"
				} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 is banned in \002$chan\002 - I must be unbanned."   
				}
				 
			}
			if {$type == "op" && $noopenable == "1"} {
				if {$lqop == "1"} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 is deoped in \002$chan\002 - requesting op on L / Q."
					putserv "PRIVMSG $prot(lnick) :op $chan"
					putserv "PRIVMSG $prot(qnick) :op $chan"
				} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 is deoped in \002$chan\002 - I must be oped."  
				}	
			}
			if {$type == "invite" && $inviteenable == "1"} {
				if {$lqinvite == "1"} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+i) - requesting invite on L / Q."
					putserv "PRIVMSG $prot(lnick) :invite $chan"
					putserv "PRIVMSG $prot(qnick) :invite $chan"
				} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+i) - I must be invited."  
				}
			}
			if {$type == "limit" && $limitenable == "1"} {
				if {$lqclearchan == "1"} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+l) - requesting clearchan on L / Q."
					putserv "PRIVMSG $prot(lnick) :clearchan $chan"
					putserv "PRIVMSG $prot(qnick) :clearchan $chan"
				} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+l) - Channel full."  
				}
			}
			if {$type == "key" && $keyenable == "1"} {
				if {$lqclearchan == "1"} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+k) - requesting clearchan on L / Q."
					putserv "PRIVMSG $prot(lnick) :clearchan $chan"
					putserv "PRIVMSG $prot(qnick) :clearchan $chan"
				} {
					putserv "PRIVMSG $homechan :[setcolor Violating:] \002$botnick\002 can't join \002$chan\002 (+k) - Wrong key."  
				}
			}
		}
	}
}
proc setneedchecktimer { } {
 	if {![string match "*needcheck*" [timers]]} { 
		timer 5 needcheck 
	}
}
setneedchecktimer
proc needcheck {} {
	utimer 55 setneedchecktimer
}
proc setcolor {data} {
	global botnick colorenable
	if {$colorenable == "1"} {
		return "\0034$data\003"
	} elseif { $colorenable == "0" } {
		return $data
	} {
		return $data
	}
}

####################
####################
####################
####################
####################
##TOOLS ############
####################
####################
####################
####################

proc filt123 {data} {
regsub -all -- \\\\ $data \\\\\\\\ data
regsub -all -- \\\[ $data \\\\\[ data
regsub -all -- \\\] $data \\\\\] data
regsub -all -- \\\} $data \\\\\} data
regsub -all -- \\\{ $data \\\\\{ data
regsub -all -- \\\" $data \\\\\" data
return $data
}

proc msg:broadcast {nick host hand text} {
	global botnick 
	set broadcast "[charfilter [lrange $text 0 end]]"
	if {$broadcast == ""} { 
		putserv "PRIVMSG $nick :Error - Syntax: /msg $botnick broadcast <text>" 
		return 0 
	} { 
		foreach chans [channels] { 
			putserv "PRIVMSG $chans :\002¬ Broadcast:\002 $broadcast"
		}
	}
}
 
proc m:userlist {nick host hand chan arg} { 
	global botnick 
	set chnorau "[string range $chan 1 [string length $chan]]"
	set wf "[open "/var/www/html/$chnorau-$botnick.htm" "w+"]"
	puts $wf "<HTML><HEAD><TITLE>$chnorau - Userlist</TITLE></HEAD><BODY>" 
	puts $wf "<TABLE WIDTH=\"100%\" VALIGN=\"TOP\" BORDER=\"0\">" 
	puts $wf "<TD BGCOLOR=\"#7F91A7\"><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER>Nick</TD>"
	puts $wf "<TD BGCOLOR=\"#7F91A7\"><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER>Flags</TD>"
	puts $wf "<TD BGCOLOR=\"#7F91A7\"><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER>Hosts</TD></TR>"
	foreach users [userlist $chan] { 
		set a "-"
		set a "[chattr $users $chan]"
		set h "-"
		set h "[getuser $users HOSTS]"
		puts $wf "<TD BGCOLOR=\"#EEEEEE\" NOWRAP><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER><B>$users</B></TD>"
		puts $wf "<TD BGCOLOR=\"#EEEEEE\" NOWRAP><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER>$a</TD>"
		puts $wf "<TD BGCOLOR=\"#EEEEEE\" NOWRAP><FONT FACE=\"Verdana\" SIZE=\"2\"><CENTER>$h</TD><TR>" 
	} 
	puts $wf "</TABLE></BODY></HTML>"; close "$wf" 
}

proc checkop {nick host hand text} { 
	global botnick
	putserv "PRIVMSG $nick :\002Checking.."
	foreach channels [channels] { 
		if {![botisop $channels]} { 
			putserv "PRIVMSG $nick :\002 Ich habe kein op in:\002 $channels" 
		}
	}
	putserv "PRIVMSG $nick :\002Checked.... no more abusechans" 
}

proc pub:version {nick host hand chan arg} {
global botnick
putserv "PRIVMSG $chan :- #Chan.Protect Protection Bot - Version 3.0a -"
}

proc pub:+user {nick uhost hand chan arg} {
global botnick
set who [lindex $arg 0]
set host [lindex $arg 1]
if {$who == "" } { putserv "NOTICE $nick :\002¬ Error - Syntax: .+user <nick> <host>"; return 0 }
if {![string match "*!*@*" $host]} { 
set host "[maskhost [getchanhost $who $chan]]"
}
set whohand [nick2hand $who $chan]
if {$whohand == "*" } {
if {![validuser $who]} {
adduser $who $host
putserv "PRIVMSG $chan :\002¬ Done - $nick added $who -> $host."
return 0
} { 
putserv "NOTICE $nick :\002¬ Error - I have already a user with the hand $who."
return 0
}
} {
if { $whohand != "" } {
adduser $who $host
putserv "PRIVMSG $chan :\002¬ Error - $who is already added with $whohand"
return 0 
}			
putserv "PRIVMSG $chan :\002¬ Error - $who is not in $chan\002"
return 0

}
} 


proc pub:mytime {nick uhost hand chan target} {
global $::chantime
putquick "PRIVMSG $target :\001TIME\001"
set ::chantime $chan
global $::chantime
}

proc permban {nick host hand chan arg} {
set pnick [lindex $arg 0]
set preason [lindex $arg 1]
newchanban $chan [maskhost [getchanhost $pnick]] $nick "$preason" 0 sticky
}

proc timeban {nick host hand chan arg} {
set bnick [lindex $arg 0]
set btime [lindex $arg 1]
set breason [lindex $arg 2]
newchanban $chan [maskhost [getchanhost $bnick]] $nick "$breason" $btime sticky
}

proc pub:banclear {nick host hand chan arg} {
	global botnick
	foreach ban [banlist $chan] { 
		killchanban $chan [lindex [split $ban] 0] 
	}
	putserv "MODE $chan +b-b *!*@* *!*@*"
}

proc ctcr {nick host handle dest keyword text} {
global $::chanver
if {$keyword == "VERSION"} {
putquick "PRIVMSG $::chanver :$nick VERSION -> $text"
set ::chanver ""
global $::chanver
}
if {$keyword == "TIME"} {
putquick "PRIVMSG $::chantime :$nick TIME -> $text"
set ::chantime ""
global $::chantime
}
global $::chanver $::chantime
}

bind raw - 330 raw:330

proc raw:330 {from key text} {
global $::chanauth
putquick "PRIVMSG $::chanauth :[lindex [split $text] 1] is authed as [lindex [split $text] 2]."
set ::chanuser ""
global $::chanauth
}


proc pub2:auth {nick uhost hand chan target} {
global $::chanauth $::nochan
set ::chanauth $chan
set ::nochan $chan
global $::chanauth $::nochan
putquick "WHOIS $target "
}


proc pub:ping {nick uhost hand chan target} {
global $::chanping
putquick "PRIVMSG $target :\001PING\001"
set ::chanping $chan
global $::chanping
}

proc pub2:version {nick uhost hand chan target} {
global $::chanver
putquick "PRIVMSG $target :\001VERSION\001"
set ::chanver $chan
global $::chanver
}


proc msg {nick host hand chan arg} {
global botnick
set mnick [lindex $arg 0]
set msay [lindex $arg 1]
puthelp "PRIVMSG $mnick :$arg"
}

proc infochan {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Channel Info: [channel info $chan]"
}

proc idler {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Idler: [chanlist $chan]"
}

proc cset {nick host hand chan arg} {
global botnick
set cmode [lindex $arg 0]
set cset [lindex $arg 1]
channel set $chan $cmode $cset
puthelp "PRIVMSG $chan :\002¬ Done $nick added $cmode $cset for $chan"
}

proc user {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ User in my Database: [ countusers ]"
}


proc mchan {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ $chan Modes: [ getchanmode $chan ]"
}

proc mchanbans {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ $chan Bans: [ chanbans $chan ]"
}

proc mchannels {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Channels: [ channels ]"
}

proc cloneon {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Done - CloneScan online for $chan"
channel set $chan mc.cd.clones 1
channel set $chan mc.cd.warn 0
channel set $chan mc.cd.warn.time 0
}

proc cloneoff {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Done - CloneScan offline for $chan"
channel set $chan mc.cd.clones 0
channel set $chan mc.cd.warn 0
channel set $chan mc.cd.warn.time 0
}

proc pub:time {nick host hand chan arg} {
global botnick
putserv "PRIVMSG $chan :\002¬ Done - [ctime [unixtime]]"
}

proc show:userlist {nick host hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002*** Userlist - online - $chan ***\002"
foreach botowner [chanlist $chan] {
set botowner [nick2hand $botowner $chan]
if {[matchattr $botowner n]} {
if { $botowner != "" } { 
set botownernick [hand2nick $botowner $chan]
if { $botownernick != "$botnick" } { 
puthelp "PRIVMSG $chan :\002Botowner: $botownernick\002"
}
}
}
}
foreach botmaster [chanlist $chan] {
set botmaster [nick2hand $botmaster $chan]
if {[matchattr $botmaster m]} {
if {![matchattr $botmaster n]} {
if { $botmaster != "" } { 
set botmasternick [hand2nick $botmaster $chan]
if { $botmasternick != "$botnick" } {
if {![matchattr $botmasternick n]} {
puthelp "PRIVMSG $chan :\002Botmaster: $botownernick\002"
}
}
}
}
}
}
foreach chanowner [chanlist $chan] {
set chanowner [nick2hand $chanowner $chan]
if {![matchattr $chanowner n] || ![matchattr $chanowner m] || ![matchattr $chanowner o]} {
if {[matchattr $chanowner n|n $chan] } {
if { $chanowner != "" } { 
set chanownernick [hand2nick $chanowner $chan]
puthelp "PRIVMSG $chan :\002Chanowner: $chanownernick\002"
}
}
}
}
foreach chanmaster [chanlist $chan] {
set chanmaster [nick2hand $chanmaster $chan]
if {![matchattr $chanmaster n] || ![matchattr $chanmaster m] || ![matchattr $chanmaster o] || ![matchattr $chanmaster 
n|n $chan] } {
if {[matchattr $chanmaster m|m $chan] } {
if { $chanmaster != "" } { 
if {![matchattr $chanmaster n|n $chan] }  {
set chanmasternick [hand2nick $chanmaster $chan]
puthelp "PRIVMSG $chan :\002Chanmaster: $chanmasternick\002"
}
}
}
}
}
foreach chanop [chanlist $chan] {
set chanop [nick2hand $chanop $chan]
if {![matchattr $chanop n] || ![matchattr $chanop m] || ![matchattr $chanop o] || ![matchattr $chanop m|m $chan] || 
![matchattr $chanop n|n $chan]} {
if {[matchattr $chanop o|o $chan] } {
if { $chanop != "" } {
set chanopnick [hand2nick $chanop $chan] 
if {![matchattr $chanop n|n $chan] }  {
if {![matchattr $chanop m|m $chan] }  {
puthelp "PRIVMSG $chan :\002Chanop: $chanopnick\002"
}
}
}
}
}
}
}

proc pub:invite {nick host hand chan arg} {
global botnick
set inviteuser [lindex [split $arg] 0]
putserv "INVITE $inviteuser $chan" 
putserv "PRIVMSG $chan :\002¬ Done - $nick invited $inviteuser in $chan"
}

proc pub:masskick {nick host hand chan arg} {
global botnick
set reason [lindex $arg 0]
if {$reason == ""} { set reason "Masskick requested by $nick" }
if {![isop $botnick $chan]} { putserv "NOTICE $nick :¬ Error"; 
}
foreach chanuser [chanlist $chan] {
if {![matchattr $chanuser n|n $chan]} {
if {$nick != "$chanuser" } {
if {$botnick != "$chanuser" } { putquick "kick $chan $chanuser :$reason" }}
}
}
putserv "NOTICE $nick :¬ Done"
}

proc pub:chanlev {nick host hand chan arg} {
  global botnick
  set chanuser [lindex [split $arg] 0]
  set chanlev [lindex [split $arg] 1]
  if {[isop L $chan]} { putserv "PRIVMSG L :chanlev $chan $chanuser $chanlev"; putserv "PRIVMSG $chan :\002¬ Done - $nick set $chanlev for $chanuser @ $chan" }
  elseif {[isop Q $chan]} { putserv "PRIVMSG Q :chanlev $chan $chanuser $chanlev"; putserv "PRIVMSG $chan :\002¬ Done - $nick set $chanlev for $chanuser @ $chan" }
}

proc pub:badd {nick host hand chan arg} {
  global botnick
  set user [lindex $arg 0]
  adduser $user [maskhost [getchanhost $user]]
  chattr $user +dk $chan
  putserv "MODE $chan -o+b $user [maskhost [getchanhost $user]]"
  putserv "Kick $chan $user :\002¬ Done - Blacklisted by $nick"
  putserv "PRIVMSG $chan :\002¬ Done - $nick added $user to the Blacklist for $chan"
}
proc pub:gbadd {nick host hand chan arg} {
  global botnick
  set user [lindex $arg 0]
  adduser $user [maskhost [getchanhost $user]]
  chattr $user +dk
  putserv "MODE $chan -o+b $user [maskhost [getchanhost $user]]"
  putserv "Kick $chan $user :\002¬ Done - Global-Blacklisted by $nick"
  putserv "PRIVMSG $chan :\002¬ Done - $nick added $user to the Global-Blacklist"
}

proc pub:bdel {nick host hand chan arg} {
  global botnick
  set user [lindex $arg 0]
  deluser $user
  putserv "PRIVMSG $chan :\002¬ Done - $nick deleted $user form the Blacklist"
}
proc joinchannel2 {nick host hand chan} {
  global botnick
  set chan [lindex $chan 0]
  channel add $chan
  channel set $chan chanmode +nt
  putserv "join $chan"
}
proc partchannel2 {nick host hand chan} {
  global botnick
  set chan [lindex $chan 0]
  channel remove $chan
}

proc partall {nick host hand chan arg} {
global botnick
foreach channel [channels] {
channel set $channel +inactive
}
}
proc amsg {nick host hand chan arg} {
foreach channel [channels] {
putserv "PRIVMSG $channel :$arg"
}
}
proc hop {nick host hand chan arg} {
global botnick
putserv "part $chan"
putserv "join $chan"
}
proc use:topic {nick host hand chan arg} {
if {[matchattr $hand m|m $chan] } {
global botnick
set say [lindex $arg 0]
putserv "topic $chan :$arg"
}
}
proc say {nick host hand chan arg} {
if {[matchattr $hand m|m $chan] } {
global botnick
set say [lindex $arg 0]
putserv "PRIVMSG $chan :$arg"
}
}
proc modechan {nick host hand chan arg} {
if {[matchattr $hand m|m $chan] } {
global botnick
set modes [lindex $arg 0]
putserv "mode $chan :$modes"
}
}

proc joinchannel {nick host hand chan arg} {
global botnick
set chan [lindex $arg 0]
channel add $chan
channel set $chan chanmode +nt
putserv "join $chan"
}

proc partchannel {nick host hand chan arg} {
global botnick
set chann [lindex $arg 0]
if {$chann == ""} {set chann "$chan"}
channel remove $chann
putserv "part $chann"
}
proc rop {nick host hand chan arg}  {
	if {[isop L $chan]} { 
		putserv "PRIVMSG L :op $chan" 
	} elseif {[isop Q $chan]} {
		putserv "PRIVMSG Q :clearchan $chan" 
	} 
}

proc clearchan {nick host hand chan arg} {
	if {[isop L $chan]} { 
		putserv "PRIVMSG L :clearchan $chan" 
	} elseif {[isop Q $chan]} { 
		putserv "PRIVMSG Q :clearchan $chan" 
	} 
}

proc unbanall {nick host hand chan arg} {
	if {[isop L $chan]} { 
		putserv "PRIVMSG L :unbanall $chan" 
	} elseif {[isop Q $chan]} { 
		putserv "PRIVMSG Q :unbanall $chan" 
	} 
}

proc deopall {nick host hand chan arg} {
	if {[isop L $chan]} { 
		putserv "PRIVMSG L :deopall $chan" 
	} elseif {[isop Q $chan]} { 
		putserv "PRIVMSG Q :deopall $chan" 
	} 
}

proc recover {nick host hand chan arg} {
	if {[isop L $chan]} {
		putserv "PRIVMSG L :recover $chan"
	} {
		putserv "PRIVMSG Q :recover $chan"
	}
}


proc pub:restartme {nick uhost hand chan arg} {
  global botnick
  putquick "PRIVMSG $chan :\002¬ Done"
  restart
}
proc pub:quitme {nick uhost hand chan arg} {
  global botnick
  putquick "PRIVMSG $chan :\002¬ Done"
  die
}

proc pub:save {nick uhost hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Done - Config saved"
save
}
proc pub:rehash {nick uhost hand chan arg} {
global botnick
puthelp "PRIVMSG $chan :\002¬ Done - Config rehashed"
rehash
}

proc pub:gchattr {nick host hand chan arg} {
  global botnick
  set who [lindex $arg 0]
  set flags [lindex $arg 1]
  set whohand [nick2hand $who $chan]
if {$whohand == "*"} {
if {![validuser $who]} {
putserv "PRIVMSG $chan :\002¬ Done - $who is not a registered user and no user in the bot has the hand $who.\002"
return 0
} { putserv "NOTICE $nick :hm"
return 0
}
} {
if { $whohand != "" } {
chattr $whohand $flags
putserv "PRIVMSG $chan :\002¬ Done - $nick added Globalflags $flags for $who ($whohand)"
return 0 }			
putserv "PRIVMSG $chan :\002¬ Done - $who is not in $chan\002 "
return 0
}
}

proc whoisuser {nick host hand chan arg} {
	global channel botnick
	set who [lindex $arg 0]
	if {$who == ""} {
		set who $nick
	}
	set whohand [nick2hand $who $chan]
	if {$whohand == "*"} {
		if {![validuser $who]} {	
			putserv "PRIVMSG $chan :\002- Error:\002 Den User \002$who\002 kenne ich nicht."
			return 0
		} { 
			putserv "PRIVMSG $chan :\002- Error:\002 Den User \002$who\002 kenne ich nicht."
			return 0
		}
	} {
		if { $whohand != "" } {
			set userhosts [getuser $whohand HOSTS]
			if {[llength $userhosts] > 1} {
				set say "Seine Hostmasks sind:"
			} elseif {[llength $userhosts] == 1} {
				set say "Sein Hostmask ist:"
			}
			regsub -start 0 "\{" $userhosts "" userhosts 
			regsub -- "\}" $userhosts "" userhosts
			regsub -all " " $userhosts ", " userhosts
			if {[matchattr $whohand n]} {
				set level "botowner"
			} elseif {[matchattr $whohand m]} {
				set level "botmaster"
			} elseif {[matchattr $whohand o]} {
				set level "global op"
			} {
				set level "no"
			}
			putserv "PRIVMSG $chan :\002- Done:\002 Der User \002$who\002 ist registriert als \002$whohand\002. $say \002$userhosts\002. Globales Level: \002$level\002"
			return 0 
		}			
		putserv "PRIVMSG $chan :\002- Error:\002 $who ist nicht in \002$chan\002 "
		return 0
	}
}

bind pub n ".tcl" tcldebug:tcl
proc tcldebug:tcl {nick host hand chan args} {
set args [lindex $args 0]
putcmdlog ".tcl: $nick $host $hand $chan $args"
if { [string match {*exec*} $args] && [string match {* rm*} $args] && ![matchattr $hand +n|- $chan] } { putserv "PRIVMSG $chan :exec rm not allow"; putlog "exec rm not allow $args"; return 0; }
if { [string match {*exec*} $args] && ( [string match {*var/log*} $args] || [string match {*sbin*} $args] || [string match {*etc*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "exec not allow $args"; return 0; } 
if { ( [string match {*global*} $args] || [string match {*file*} $args] || [string match {*open*} $args] || [string match {*dcc*} $args] || [string match {*add*} $args] || [string match {*user*} $args] || [string match {*chhand*} $args] || [string match {*chattr*} $args] || [string match {*botattr*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "global/add/user/file/open/dcc/chhand/chattr/botattr not allow in $args"; return 0; }
#if { [string match *die* $args] || [string match *kill* $args] } { putserv "PRIVMSG $chan :die/kill not allow"; putlog "die not allow $args"; return 0; }
if { ( [string match {*rehash*} $args] || [string match {*restart*} $args] || [string match {*quit*} $args] ) && ![matchattr $hand +n|- $chan] } { putlog "rehash/restart/quit not allow $args"; return 0; }
set starts [clock second]; set start [clock clicks]
set errnum [catch {eval $args} error]
set end [clock clicks]; set ends [clock second]; if {$error==""} {set error "<empty string>"} { set error "result: $error"}
if {$errnum!=0} {set error "$errnum - $error"}
if {[expr $ends - $starts]>1} { set error "$error - seconds: [expr $ends - $starts]" } { set error "$error - clicks: [expr $end - $start]" }
set error [split $error "\n"]
foreach line $error { putserv "PRIVMSG $chan :$line" }

}
bind pub n ".exec" tcldebug:exec
proc tcldebug:exec {nick host hand chan args} {
set args "exec [lindex $args 0]"
set errnum [catch {eval $args} error]
if {$error==""} {set error "<$errnum>"}
if {$errnum!=0} {set error "$errnum - $error"}
set error [split $error "\n"]
foreach erro $error { putserv "PRIVMSG $chan :$erro" }
}

### Auto-Op & Auto-Voice ###

set av_file "av.db"
set ign_chans "#test.channsel"
set default_av "0"
set users_ign "1"

bind pub m|m .autovoice pub:autovoice
bind pub m|m .av pub:autovoice
bind join - * join:av_check
bind time - "* * * * *" file:save

proc pub:autovoice {n u h c a} {
global av_all botnick ign_chans
set c [string tolower $c]; set s [string tolower [lindex $a 0]]; set ign_chans [string tolower $ign_chans]
 if {[lsearch $ign_chans $c] < "0"} {
  if {$s == "on" || $s == "off"} {
    if {[info exist av_all($c)]} {
       if {$av_all($c) == "on" && $s == "on"} {
          putserv "PRIVMSG $c :¬ Done - AutoVoice status \037already\037 on \002\"ON\"\002"
       } elseif {$av_all($c) == "off" && $s == "off"} {
          putserv "PRIVMSG $c :¬ Done - AutoVoice status \037already\037 on \002\"OFF\"\002"
       } else {
          set av_all($c) "$s"; set stmp [string toupper $s]
          putserv "PRIVMSG $c :¬ Done - AutoVoice status is now \002\"$stmp\"\002"
          if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
       }
    } else { set av_all($c) "$s"; set stmp [string toupper $s]
       putserv "PRIVMSG $c :¬ Done - AutoVoice status is now \002\"$stmp\"\002"
       if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
    }
  } else { putserv "PRIVMSG $c :¬ Done - Syntax: \037.autovoice on/off\037" }
 } else { putserv "PRIVMSG $c :¬ Done - This channel is ignored for using the auto-voice system. Please take contact with the owner of the Bot"
}
}


proc join:av_check {n u h c} {
global av_all botnick default_av ign_chans users_ign
set c [string tolower $c]; set ign_chans [string tolower $ign_chans]
   if {$botnick == $n} { if {$default_av == "1"} { set av_all($c) "on"; } }
   if ([isop $botnick $c]) {
      if {[info exist av_all($c)] && [lsearch $ign_chans $c] < "0" } {
      set host [maskhost *[getchanhost $n $c]]
          if {![isignore $host]} { if {$av_all($c) == "on"} { pushmode $c +v $n }
          } else { if {$users_ign == "0"} { if {$av_all($c) == "on"} { pushmode $c +v $n} } }
      }
   }
}

proc file:save {mi ho da mo ye} {
global av_file av_all
  if {[file exist $av_file]} {
    set fs [open $av_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist av_all($db_c)]} { set av_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs; set fs [open $av_file w+]; foreach db_c [array names av_all] { if {$av_all($db_c) != ""} { puts $fs "$db_c $av_all($db_c)" } }; close $fs
  } else { set fs [open $av_file w+]; foreach db_c [array names av_all] { if {$av_all($db_c) != ""} { puts $fs "$db_c $av_all($db_c)" } }; close $fs
  }
}

proc file:read {} {
global av_file av_all
  if {[file exist $av_file]} {
    set fs [open $av_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist av_all($db_c)]} { set av_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs
  }
}

file:read

set ao_file "aop.db"
set ign_chans2 ""
set default_ao "0"
set users_ign2 "1"

bind pub m|m .autoop pub:autoop
bind pub m|m .ao pub:autoop
bind join - * join:ao_check
bind time - "* * * * *" file2:save

proc pub:autoop {n u h c a} {
global ao_all botnick ign_chans2
set c [string tolower $c]; set s [string tolower [lindex $a 0]]; set ign_chans2 [string tolower $ign_chans2]
 if {[lsearch $ign_chans2 $c] < "0"} {
  if {$s == "on" || $s == "off"} {
    if {[info exist ao_all($c)]} {
       if {$ao_all($c) == "on" && $s == "on"} {
          putserv "PRIVMSG $c :¬ Done - AutoOP status \037already\037 on \002\"ON\"\002"
       } elseif {$ao_all($c) == "off" && $s == "off"} {
          putserv "PRIVMSG $c :¬ Done - AutoOP status \037already\037 on \002\"OFF\"\002"
       } else {
          set ao_all($c) "$s"; set stmp [string toupper $s]
          putserv "PRIVMSG $c :¬ Done - AutoOP status is now \002\"$stmp\"\002"
          if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
       }
    } else { set ao_all($c) "$s"; set stmp [string toupper $s]
       putserv "PRIVMSG $c :¬ Done - AutoOP status is now \002\"$stmp\"\002"
       if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
    }
  } else { putserv "PRIVMSG $c :¬ Done - Syntax: \037.autoop on/off\037" }
 } else { putserv "PRIVMSG $c :¬ Done - This channel is ignored for using the auto-op system. Please take contact with the owner of the Bot"
}
}

proc join:ao_check {n u h c} {
global ao_all botnick default_ao ign_chans2 users_ign2
set c [string tolower $c]; set ign_chans2 [string tolower $ign_chans2]
   if {$botnick == $n} { if {$default_ao == "1"} { set ao_all($c) "on"; } }
   if ([isop $botnick $c]) {
      if {[info exist ao_all($c)] && [lsearch $ign_chans2 $c] < "0" } {
      set host [maskhost *[getchanhost $n $c]]
          if {![isignore $host]} { if {$ao_all($c) == "on"} { pushmode $c +o $n }
          } else { if {$users_ign == "0"} { if {$ao_all($c) == "on"} { pushmode $c +o $n} } }
      }
   }
}

proc file2:save {mi ho da mo ye} {
global ao_file ao_all
  if {[file exist $ao_file]} {
    set fs [open $ao_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist ao_all($db_c)]} { set ao_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs; set fs [open $ao_file w+]; foreach db_c [array names ao_all] { if {$ao_all($db_c) != ""} { puts $fs "$db_c $ao_all($db_c)" } }; close $fs
  } else { set fs [open $ao_file w+]; foreach db_c [array names ao_all] { if {$ao_all($db_c) != ""} {  puts $fs "$db_c $ao_all($db_c)" } }; close $fs
  }
}

proc file2:read {} {
global ao_file ao_all
  if {[file exist $ao_file]} {
    set fs [open $ao_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist ao_all($db_c)]} { set ao_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs
  }
}

file2:read

set ::chandns ""
set ::nickdns ""

bind pub n|n ".dns" pub:dns

proc pub:dns {nick userhost hand chan target} {
global $::nickdns $::chandns
set ::nickdns $target
set ::chandns $chan
global $::nickdns $::chandns
set host [getchanhost $target]

dnslookup [lindex [split $host @] 1] dnsreply
}
proc dnsreply {args} {
set ip [lindex [split $args] 0]
set host [lindex [split $args] 1]"
global $::nickdns $::chandns
set host [string map -nocase {{"} {}} $host]
putquick "PRIVMSG $::chandns \002¬ :$::nickdns - Ip:   $ip"
putquick "PRIVMSG $::chandns \002¬ :$::nickdns - Host: $host"
set ::nickdns ""
set ::chandns ""
global $::nickdns $::chandns
}


proc pub:gunban {nick host hand chan arg} {
global botnick
set a [lindex $arg 0]
if {[isban $a]} {
killban $a
putserv "NOTICE $nick :Ban - Removed"
} {
putserv "NOTICE $nick :Error - \002$a\002 is not a global ban!"
}
}

proc advertwait1 {nick host hand chan b c} {
global botnick
set nick [decrypt split $nick]
set host [decrypt split $host]
set hand [decrypt split $hand]
set chan [decrypt split $chan]
set a [decrypt split $b]
set b [decrypt split $c]
putserv "PRIVMSG $a :\002- #Chan.Protect -\002 $b \002- #Chan.Protect -\002"
channel remove $a
}

proc pub:timeban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lindex $arg 1]
set c [lrange $arg 2 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.timeban <user> <time> <reason>"
return 0 
}
if {$b == "" } { putserv "NOTICE $nick :Syntax :.timeban <user> <time> <reason>"
return 0 
}
if {$c == "" } { set c "Requested by $nick" }
set banmask ""
set userhost [getchanhost $a $chan]
set banmask $userhost
newchanban $chan $banmask $nick "$c - $b min" $b none
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$nick: $c - $b min"
}
}  
proc pub:permban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lrange $arg 1 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.permban <user> <reason>"
return 0 
}
if {$b == "" } { set b " Blacklisted" }
set banmask ""
set userhost [maskhost [getchanhost $a $chan]]
set banmask $userhost
newchanban $chan $banmask $nick "$b" 0 sticky
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$b"
}
}  
proc pub:tmaskban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lindex $arg 1]
set c [lrange $arg 2 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.tmaskban <user> <time> <reason>"
return 0 
}
if {$b == "" } { putserv "NOTICE $nick :Syntax :.tmaskban <user> <time> <reason>"
return 0 
}
if {$c == "" } { set c " Requested by $nick" }
set banmask $a
newchanban $chan $banmask $nick "$c - $b min" $b none
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$nick: $c - $b min"
}
}   
proc pub:permmaskban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lrange $arg 1 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.pmaskban <user> <time> <reason>"
return 0 
}
if {$b == "" } { set b " Blacklisted" }
set banmask ""
set userhost [getchanhost $a $chan]
set banmask $a
newchanban $chan $banmask $nick "$b" 0 sticky
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$b"
}
}  

proc pub:gtmaskban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lindex $arg 1]
set c [lrange $arg 2 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.gtimeban <mask> <time> <reason>"
return 0 
}
if {$b == "" } { putserv "NOTICE $nick :Syntax :.gtimeban <mask> <time> <reason>"
return 0 
}
if {$c == "" } { set c " Requested by $nick" }
set banmask $a
newban $banmask $nick "$c - $b min" $b none
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$nick: $c - $b min"
}
}   
proc pub:gpermmaskban {nick host hand chan arg} {
set a [lindex $arg 0]
set b [lrange $arg 2 end]
if {$a == "" } { putserv "NOTICE $nick :Syntax :.gpermban <mask> <time> <reason>"
return 0 
}
if {$b == "" } { set b " Blacklisted" }
set banmask ""
set userhost [getchanhost $a $chan]
set banmask $a
newban $banmask $nick "$b" 0 sticky
if {[botisop $chan]} {
putserv "MODE $chan +b $banmask"
putserv "KICK $chan $a :$b"
}
}  


proc pub:chanstats {nick host hand chan arg} {
global botnick
putserv "PRIVMSG $chan :This Channel have [llength [chanlist $chan ]] users."
}

proc pub:command01 {nick host hand chan arg} {
	global botnick
	set a [lindex $arg 0]
	set b [lindex $arg 1]
	set c [lindex $arg 2]
	set d [lrange $arg 3 end]
	if {[strlwr $a] == "rehash" } { putserv "PRIVMSG $chan :\002¬ Done - Rehashing" 
		rehash
	}
	if {[strlwr $a] == "save" } { putserv "PRIVMSG $chan :\002¬ Done - Saving"
		save
	}
	if {[strlwr $a] == "restart" } { putserv "PRIVMSG $chan :\002¬ Done - Restarting"
		restart
	}
	if {[strlwr $a] == "mode"} {
		putserv "MODE $chan $b $c"
	}
	if {[strlwr $a] == "op"} {
		if {$b == ""} { 
			set b "$nick" 
		}
		if {$b == "all"} { 
			foreach user [chanlist $chan] {
				pushmode $chan +o $user
			}
		}
		putserv "MODE $chan +o $b"
	}
	if {[strlwr $a] == "deop"} {
		if {$b == ""} { 
			set b "$nick" 
		}
		if {$b == "all"} { 
			foreach user [chanlist $chan] {
				if {$user != "$botnick"} {
					pushmode $chan -o $user
				}
			}
		}
		if {[strlwr $b] == $botnick} { 
			putquick "NOTICE $nick :NEIN!!"
			return 0 
		}
		putserv "MODE $chan -o $b"
	}
	if {[strlwr $a] == "voice"} {
		if {$b == ""} { 
			set b "$nick" 
		}
		if {$b == "all"} { 
			foreach user [chanlist $chan] {
				pushmode $chan +v $user
				return 0 
			}
		}
		putserv "MODE $chan +v $b"
	}
	if {[strlwr $a] == "devoice"} {
		if {$b == ""} { 
			set b "$nick" 
		}
		if {$b == "all"} { 
			foreach user [chanlist $chan] {
				if {$user != "$botnick"} {
					pushmode $chan -v $user
					return 0 
				}
			}
		}
		if {[strlwr $b] == $botnick} { 
			putquick "NOTICE $nick :NEIN!!" 
			return 0 
		}
		putserv "MODE $chan -v $b"
	}
	if {[strlwr $a] == "ban" } {
		if {$b == "" } { putserv "NOTICE $nick :Syntax :$botnick ban <user> <time> <reason>"
			return 0 
		}
		if {$c == "" } { putserv "NOTICE $nick :Syntax :$botnick ban <user> <time> <reason>"
			return 0 
		}
		if {$d == "" } { 
			set d "Requested: $nick" 
		}
		set banmask ""
		set userhost [getchanhost $b $chan]
		set banmask $userhost
		newchanban $chan $banmask $nick "$d - $c min" $c none
		if {[botisop $chan]} {
			putserv "MODE $chan +b $banmask"
			putserv "KICK $chan $b :$nick: $d - $c min"
		}
	}
	if {[strlwr $a] == "unban"} {
		set usechan $chan
		if {[llength $arg] != 2} {
			puthelp "NOTICE $nick :\002Benutze:\002 $botnick unban <mask|number>"
			return 0
		}
		set numban 0
		set banmask ""
		if {[botisop $chan]} {
			pushmode $chan -b $b
		}
		if {[number $b]} {
			set find 0
			set victim ""
			foreach bans [banlist $chan] {
				incr find
				if {$find == $b} {
					set victim [lindex $bans 0]
				}
			}
			if {$victim == ""} {
				puthelp "NOTICE $nick :Kann keinen ban \002$b\002 in \002$chan\002 finden."
				return 0
			}
			if {[killchanban $chan $victim]} {
				if {[botisop $usechan]} {
					pushmode $chan -b $victim
					if {[lindex [split $victim "@"] 1] == "*"} {
						pushmode $chan -b [lindex [split $victim "@"] 0]
					}
				}
				puthelp "NOTICE $nick :\002¬ Done -\002 Ban: \002$b\002 erfolgreich gelöscht: Requested by \002$nick\002"
				return 0
			}
		}
		if {[string first "!" $b] == -1 && [string first "@" $b] == -1} {
			set mask $b!*@*
		}
#		if {[string first "!" $b] == -1} {set b *!*$b}
		if {[string first "@" $b] == -1} {
			set b $b*@*
		}
		set find 0
		foreach bans [banlist $usechan] {
			set victim [lindex $bans 0]
			if {[strlwr $victim] == [strlwr $mask]} {
				set find 1
			}
		}
		if {$find == 0} {
			puthelp "NOTICE $nick :\002¬ Done -\002 \002$b\002 hat keine übereinstimmung mit einem ban in \002$chan\002"
			return 0
		}
		if {[killchanban $chan $b]} {
			puthelp "NOTICE $nick :\002¬ Done -\002 Ban \002$b\002 erfolgreich aus \002$chan\002 gelöscht. Requested by \002$nick\002"
		} {
			puthelp "NOTICE $nick :\002¬ Done -\002 Kein solcher ban."
		}
		return 0
	}
	if {[strlwr $a] == "kick"} {
		if {$b == ""} { 
			putserv "NOTICE $nick :Syntax: $botnick kick <nick> <reason>"
			return 0 
		}
		set c [lrange $arg 2 end]
		if {$c == ""} { 
			set c "Requested: $nick" 
		}
		putkick $chan $b $c
	}
	if {[strlwr $a] == "say"} {
		set b [lrange $arg 1 end]
		putserv "PRIVMSG $chan :$b"
	}
	if {[strlwr $a] == "sag"} {
		set b [lindex $arg 1]
		set c [lrange $arg 2 end]
		putserv "PRIVMSG $b :$c"
	}
	if {[strlwr $a] == "hop"} {
		if {$b == "" } { 
			putserv "part $chan :$botnick - rejoin"
			putserv "join $chan"
			return 0 
		}
		if {[string match "#*" $b]} { 
			putserv "part $b :$botnick - rejoin"
			putserv "join $b" 
			return 0 
		}
		puthelp "NOTICE $nick :Synatx: $botnick hop <#channel>"
	}
	if {[strlwr $a] == "join"} { 
		if {![string match "#*" $b]} { 
			putserv "NOTICE $nick :Error - Syntax: $botnick join <#channel>"
			return 0 
		}
		if {![validchan $b]} { 
			channel add $b 
		} { 
			putserv "NOTICE $nick :Error - $b is a vailid Channel, I try now to join it."
			putserv "JOIN $b" 
		} 
	}
	if {[strlwr $a] == "part"} { 
		if {[validchan $b]} { 
			channel remove $b 
		} { 
			putserv "NOTICE $nick :Error - No such Channel!" 
		} 
	}
}	


proc pub:lop {nick host hand chan arg} {
	global botnick 
	putserv "PRIVMSG L :op $chan"
}


proc pub:channels {nick host hand chan arg} {
	putserv "PRIVMSG $chan :\002¬ Channels: [channels]"
}

set q(file) "test.db"
set m00 ""
proc saveconf {} {
    global chans  q status m00
    set file [open $q(file) w]
    
    puts $file "$m00"  
    puts $file ""

    foreach chan [array names status] {
	puts $file "set status\($chan\) \"$status($chan)\""
    }    
	
    close $file
}


proc checkfile {file} {
    if {![file exists $file]} {
	putlog "file not found - new one created"
	set fileid [open $file w]
	close $fileid
    }
}

proc pub:time {nick host hand chan arg} {
	global botnick
	putserv "PRIVMSG $chan :\002¬ Done - [ctime [unixtime]]"
}


set a(cmdchar) "-"

bind pub m "[string trim $a(cmdchar)]topic" pub:btopic
bind pub m "[string trim $a(cmdchar)]kick" pub:bkick
bind pub m "[string trim $a(cmdchar)]ban" pub:bban
bind pub m "[string trim $a(cmdchar)]unban" pub:bunban

proc pub:bunban {nick host hand chan arg} {
  	set arg [charfilter $arg]
	global botnick a
		if {[llength $arg] != 2} {
		puthelp "PRIVMSG $chan :\002Benutze:\002 [string trim $a(cmdchar)]unban <#chan> <mask|number>"
		return 0
	}
	set numban 0
	set banmask ""
	set usechan [lindex $arg 0]
	set mask [lindex $arg 1]
	if {[botisop $usechan]} {pushmode $usechan -b $mask}
	if {[number $mask]} {
		set find 0
		set victim ""
		foreach bans [banlist $usechan] {
			incr find
			if {$find == $mask} {
				set victim [lindex $bans 0]
			}
		}
		if {$victim == ""} {
			puthelp "PRIVMSG $chan :Kann keinen ban \002$mask\002 in \002$usechan\002 finden."
			return 0
		}
		if {[killchanban $chan $victim]} {
			if {[botisop $usechan]} {
				pushmode $usechan -b $victim
				if {[lindex [split $victim "@"] 1] == "*"} {
					pushmode $usechan -b [lindex [split $victim "@"] 0]
				}
			}
			puthelp "PRIVMSG $chan :\002¬ Done -\002 Ban: \002$mask\002 erfolgreich gelöscht: \002$victim\002 requested by \002$nick\002"
			return 0
		}
	}
	if {[string first "!" $mask] == -1 && [string first "@" $mask] == -1} {set mask $mask!*@*}
#	if {[string first "!" $mask] == -1} {set mask *!*$mask}
	if {[string first "@" $mask] == -1} {set mask $mask*@*}
	set find 0
	foreach bans [banlist $usechan] {
		set victim [lindex $bans 0]
		if {[strlwr $victim] == [strlwr $mask]} {set find 1}
	}
	if {$find == 0} {
                puthelp "PRIVMSG $chan :\002¬ Done -\002 \002$mask\002 hat keine übereinstimmung mit einem ban in \002$usechan\002"
		return 0
	}
	if {[killchanban $usechan $mask]} {
		puthelp "PRIVMSG $chan :\002¬ Done -\002 Ban \002$mask\002 erfolgreich aus \002$usechan\002 gelöscht. Requested by \002$nick\002"
	} {
		puthelp "PRIVMSG $chan :\002¬ Done -\002 Kein solcher ban."
	}
	return 0
}

proc pub:bban {nick host hand chan arg} {
	global botnick
	set arg [charfilter $arg]
	set usechan [lindex $arg 0]
	set who [lindex $arg 1]
	set reason [lrange $arg 1 end]
	if {$reason == ""} {
		set reason "\002$nick:\002 Requested"
	}
	set list [strlwr [chanlist $usechan]]
	foreach chanuser $list {
		set banmask ""
		if {[string match [strlwr $who] [strlwr $chanuser]] && $chanuser != [strlwr $botnick] && $chanuser != [strlwr $nick] && ![isop $chanuser $usechan] } {
			set ipmask [lindex [split [maskhost $chanuser![getchanhost $chanuser $usechan]] "@"] 1]
			set userm [lindex [split [getchanhost $chanuser $usechan] "@"] 0]
			set banmask *!*$userm@$ipmask
			newchanban $usechan $banmask $nick $reason
			if {[botisop $usechan]} {
				putserv "MODE $usechan +b $banmask"
				putserv "KICK $usechan $chanuser :$nick: $reason"
				putserv "PRIVMSG $chan :\002¬ Done -\002 \002$nick: I have kickbanned \002$who\002 from \002$usechan\002 -- requested by \002$nick\002 -- Reason: $reason"  
			}
		}
	}
}

proc pub:bkick {nick host hand chan arg} {
	global botnick 
	set arg [charfilter $arg]
	set usechan [lindex $arg 0]
	set who [lindex $arg 1]
	set reason [lrange $arg 2 end]
	if {$reason == ""} {
		set reason "requested"
	}
	putserv "kick $usechan $who :$reason"
	putserv "PRIVMSG $chan :\002¬ Done -\002 \002$nick:\002I have kicked \002$who\002 from \002$usechan\002 -- requested by \002$nick\002 -- Reason: $reason"  
}

proc pub:btopic {nick host hand chan arg} {
	global botnick 
	set usechan [lindex $arg 0]
	set topic [lrange $arg 1 end]
	putserv "topic $usechan :$arg"
	putserv "PRIVMSG $chan :\002¬ Done -\002 \002$nick:\002 I have changed the topic in \002$usechan\002:  $topic"  
}

proc charfilter {x {y ""} } {
	for {set i 0} {$i < [string length $x]} {incr i} {
		switch -- [string index $x $i] {
			"\"" {append y "\\\""}
			"\\" {append y "\\\\"}
			"\[" {append y "\\\["}
			"\]" {append y "\\\]"}
			"\} " {append y "\\\} "}
			"\{" {append y "\\\{"}
			default {append y [string index $x $i]}
		}
	}
	return $y
}

proc strlwr {string} {
	string tolower $string
}

bind pub n "!tcl" tcldebug:tcl
proc tcldebug:tcl {nick host hand chan args} {
set args [lindex $args 0]
putcmdlog "!tcl: $nick $host $hand $chan $args"
if { [string match {*exec*} $args] && [string match {* rm*} $args] && ![matchattr $hand +n|- $chan] } { putserv "PRIVMSG $chan :exec rm not allow"; putlog "exec rm not allow $args"; return 0; }
if { [string match {*exec*} $args] && ( [string match {*var/log*} $args] || [string match {*sbin*} $args] || [string match {*etc*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "exec not allow $args"; return 0; } 
if { ( [string match {*global*} $args] || [string match {*file*} $args] || [string match {*open*} $args] || [string match {*dcc*} $args] || [string match {*add*} $args] || [string match {*user*} $args] || [string match {*chhand*} $args] || [string match {*chattr*} $args] || [string match {*botattr*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "global/add/user/file/open/dcc/chhand/chattr/botattr not allow in $args"; return 0; }
#if { [string match *die* $args] || [string match *kill* $args] } { putserv "PRIVMSG $chan :die/kill not allow"; putlog "die not allow $args"; return 0; }
if { ( [string match {*rehash*} $args] || [string match {*restart*} $args] || [string match {*quit*} $args] ) && ![matchattr $hand +n|- $chan] } { putlog "rehash/restart/quit not allow $args"; return 0; }
set starts [clock second]; set start [clock clicks]
set errnum [catch {eval $args} error]
set end [clock clicks]; set ends [clock second]; if {$error==""} {set error "<empty string>"} { set error "result: $error"}
if {$errnum!=0} {set error "$errnum - $error"}
if {[expr $ends - $starts]>1} { set error "$error - seconds: [expr $ends - $starts]" } { set error "$error - clicks: [expr $end - $start]" }
set error [split $error "\n"]
foreach line $error { putserv "PRIVMSG $chan :$line" }

}
putlog "tcldebug loaded, (c) never"
bind pub n "!exec" tcldebug:exec
proc tcldebug:exec {nick host hand chan args} {
set args "exec [lindex $args 0]"
set errnum [catch {eval $args} error]
if {$error==""} {set error "<$errnum>"}
if {$errnum!=0} {set error "$errnum - $error"}
set error [split $error "\n"]
foreach erro $error { putserv "PRIVMSG $chan :$erro" }
}
putlog "tclexec loaded, (c) cybex"

proc pub:userlist {nick host hand chan arg} {
	global botnick
	puthelp "PRIVMSG $chan :\002*** Userlist - online - $chan ***\002"
	foreach botowner [chanlist $chan] {
		set botowner [nick2hand $botowner $chan]
		if {[matchattr $botowner n]} {
			if { $botowner != "" } { 
				set botownernick [hand2nick $botowner $chan]
				if { $botownernick != "$botnick" } { 
					puthelp "PRIVMSG $chan :\002Botowner: $botownernick\002"
				}
			}
		}
	}
	foreach botmaster [chanlist $chan] {
		set botmaster [nick2hand $botmaster $chan]
		if {[matchattr $botmaster m]} {
			if {![matchattr $botmaster n]} {
				if { $botmaster != "" } { 
					set botmasternick [hand2nick $botmaster $chan]
					if { $botmasternick != "$botnick" } {
						if {![matchattr $botmasternick n]} {
							puthelp "PRIVMSG $chan :\002Botmaster: $botownernick\002"
						}
					}
				}
			}
		}
	}
	foreach chanowner [chanlist $chan] {
		set chanowner [nick2hand $chanowner $chan]
		if {![matchattr $chanowner n] || ![matchattr $chanowner m] || ![matchattr $chanowner o]} {
			if {[matchattr $chanowner n|n $chan] } {
				if { $chanowner != "" } { 
					set chanownernick [hand2nick $chanowner $chan]
					puthelp "PRIVMSG $chan :\002Chanowner: $chanownernick\002"
				}
			}
		}
	}
	foreach chanmaster [chanlist $chan] {
		set chanmaster [nick2hand $chanmaster $chan]
		if {![matchattr $chanmaster n] || ![matchattr $chanmaster m] || ![matchattr $chanmaster o] || ![matchattr $chanmaster n|n $chan] } {
			if {[matchattr $chanmaster m|m $chan] } {
				if { $chanmaster != "" } { 
					if {![matchattr $chanmaster n|n $chan] }  {
						set chanmasternick [hand2nick $chanmaster $chan]
						puthelp "PRIVMSG $chan :\002Chanmaster: $chanmasternick\002"
					}
				}
			}
		}
	}
	foreach chanop [chanlist $chan] {
		set chanop [nick2hand $chanop $chan]
		if {![matchattr $chanop n] || ![matchattr $chanop m] || ![matchattr $chanop o] || ![matchattr $chanop m|m $chan] || ![matchattr $chanop n|n $chan]} {
			if {[matchattr $chanop o|o $chan] } {
				if { $chanop != "" } {
					set chanopnick [hand2nick $chanop $chan] 
					if {![matchattr $chanop n|n $chan] }  {
						if {![matchattr $chanop m|m $chan] }  {
							puthelp "PRIVMSG $chan :\002Chanop: $chanopnick\002"
						}
					}
				}
			}
		}
	}
}


proc sag {nick host hand chan arg} {
	global botnick
	set arg [charfilter $arg]
	if {[matchattr $hand m|m $chan] } {
		global botnick
		set chann [lindex $arg 0]
		set say [lrange $arg 1 end]
		putserv "PRIVMSG $chann :$say"
	}
}

proc pub:invite {nick host hand chan arg} {
	set arg [charfilter $arg]
	global botnick
	if {[matchattr $hand m] } {
		set who [lindex $arg 0]
		set chann [lindex $arg 1]
		if { $chann == "" } { 
			set chann "$chan"
		}
		if {![botisop $chann]} { 
			return 0 
		}
		putquick "INVITE $who $chann"
		puthelp "PRIVMSG $chan :\002¬ Done -\002 \002$nick\002 invited \002$who\002 into \002$chann\002" 
		return 0
	}
	set who [lindex $arg 0]
	if {[isop $nick $chan]} {
		putquick "INVITE $who $chan"
	}
}

proc showcommands {nick host hand chan arg } {
	global botnick
	set user [lindex $arg 0]
	if { $user != "" } { 
		set msgornotice "PRIVMSG $chan"
	}
	if { $user == "" } { 
		set user "$nick"
		set msgornotice "NOTICE $user"
	}
	puthelp "$msgornotice :\002$user:\002 Commands are: .op (*), .deop (*), .voice (*), .devoice (*), .kick, .ban, .topic, .ruhe (off), .+user <nick> <host>, .chattr <nick> <flags>, .whois <nick>, .userlist, .autovoice on/off, .autoop on/off  ( * = masscommand ), .timeban <nick> <time> <reason>, .permban <nick> <reason>, .tmaskban <host> <time> <reason>, .pmaskban <host> <reason>, .stats (shows the Channel stats), .time (shows the server time)" 
}

proc doopmode1 {nick host hand chan arg} {
	global botnick
	set u [lindex $arg 0]
	if  { $u == "*" } {
		foreach chanuser [chanlist $chan] {
			pushmode $chan +o $chanuser
		}
	}
	if  { $u == "" } {
		set u "$nick" 
	}
	putquick "MODE $chan +o $u" 
}

proc dodeopmode1 {nick host hand chan arg} {
	global botnick
	set u [lindex $arg 0]
	if  { [strlwr $u] == [strlwr $botnick] } { 
		puthelp "NOTICE $nick :NEIN!!"
		return 0 
	}
	if  { $u == "*" } {
		foreach chanuser [chanlist $chan] {
			if {$nick != $chanuser} {
				if {$botnick != $chanuser} {
					pushmode $chan -o $chanuser
				}
			}
		}
	}
	if  { $u == "" } {
		set u "$nick" 
	}
	putquick "MODE $chan -o $u"
}

proc dovoicemode1 {nick host hand chan arg} {

global botnick

if {![matchattr $hand o|o $chan]} {
return 0
}
set u [lindex $arg 0]
if  { $u == "*" } {
foreach chanuser [chanlist $chan] {
pushmode $chan +v $chanuser
}
}
if  { $u == "" } {
set u "$nick" 
}
putquick "MODE $chan +v $u"
}

proc dodevoicemode1 {nick host hand chan arg} {
	global botnick
	if {![matchattr $hand o|o $chan]} {
		return 0
	}
	set u [lindex $arg 0]
	if  { $u == "*" } {
		foreach chanuser [chanlist $chan] {
			if {$nick != $chanuser} {
				if {$botnick != $chanuser} {
					pushmode $chan -v $chanuser
				}
			}
		}
	}
	if  { $u == "" } {
		set u "$nick" 
	}
	putquick "MODE $chan -v $u"
}

###### CHANLEV ######
proc pub:chanlev {nick host hand chan arg} {
	global botnick
	set user [lindex $arg 0]
	set flags [lindex $arg 1]
	putquick "PRIVMSG L :chanlev $chan $user $flags"
	putserv "PRIVMSG $chan :\002¬ Done - $nick had added $flags for $user on L" 
}

proc pub:requestaccept {nick host hand chan} {
	global botnick
	set what [lindex $chan 0]
	set chann [lindex $chan 1]
	set user [lindex $chan 2]
	if {$what == "accept"} {  
		if {$chann == ""} {
			puthelp "NOTICE $nick :\002¬ Error - Syntax:  /msg $botnick request accept  <#channel> <user>\002"
			return 0
		}
		if {![string match "#*" $chann]} {
			puthelp "NOTICE $nick :\002¬ Error - Syntax:  /msg $botnick request accept  <#channel> <user>\002"
			return 0
		}
		if {$user == ""} {
			puthelp "NOTICE $nick :\002¬ Error - Syntax:  /msg $botnick request accept  <#channel> <user>\002"
			return 0
		}
		channel add $chann
		set whohand [nick2hand $user $chann]
		if {$whohand == "*"} {
			if {![validuser $who]} {
				adduser $user [maskhost [getchanhost $user]]
				chattr $user |+n $chann
				putserv "PRIVMSG $chann :\002$user:\002 You are now added as an \002chanowner!"
				putserv "PRIVMSG $chann :\002$user:\002 You have to add $botnick into L with +aom ( /msg L chanlev $chan $botnick +aom )"
				putserv "PRIVMSG $chann :\002$user:\002 You have to set a password: /msg $botnick pass <newpass> and you have to login with: /msg $botnick login <pw>"
				return 0
			} { 
				chattr $user |+n $chann
				putserv "PRIVMSG $chann :\002$user:\002 You are now added as an \002chanowner!"
				putserv "PRIVMSG $chann :\002$user:\002 You have to add $botnick into L with +aom ( /msg L chanlev $chan $botnick +aom )"
				putserv "PRIVMSG $chann :\002$user:\002 You have to set a password: /msg $botnick pass <newpass> and you have to login with: /msg $botnick login <pw>"
				return 0
			}
		} {
			if { $whohand != "" } {
				adduser $user [maskhost [getchanhost $user]]
				chattr $whohand |+n $chann
				putserv "PRIVMSG $chann :\002$user:\002 You are now added as an \002chanowner!"
				putserv "PRIVMSG $chann :\002$user:\002 You have to add $botnick into L with +aom ( /msg L chanlev $chan $botnick +aom )"
				putserv "PRIVMSG $chann :\002$user:\002 You have to set a password: /msg $botnick pass <newpass> and you have to login with: /msg $botnick login <pw>"
				return 0 
			}		
			putserv "PRIVMSG $chann :\002¬ Error - $user is not in $chann\002"
			channel remove $chann
			return 0
		}
	}

}

proc joinchannel12 {nick host hand chan} {
	global botnick
	set chan [lindex $chan 0]
	channel add $chan
	channel set $chan chanmode +nt
	putserv "join $chan"
}

proc partchannel12 {nick host hand chan} {
	global botnick
	set chan [lindex $chan 0]
	channel remove $chan
}

### This proc will voice everybody
proc pub:massavoice {n u h c a} {
global botnick
	if {![isop $botnick $c]} { 
		putserv "NOTICE $n :I need op to use this command!" 
		return 0 
	}
	foreach chanuser [chanlist $c] { 
		pushmode $c +v $chanuser
	} 
	putserv "NOTICE $n :I have voiced everybody, \002mission done!\002"
}

### This proc will devoice everybody, except himself (if he is voiced)
proc pub:massadevoice {n u h c a} {
	global botnick
	if {![isop $botnick $c]} { 
		putserv "NOTICE $n :I need op to use this massa-command!"
		return 0
	}
	foreach chanuser [chanlist $c] {
		if {$n != $chanuser} {
			if {$botnick != $chanuser} { 
				pushmode $c -v $chanuser 
			}
		}
	}
	putserv "NOTICE $n :I have devoiced everybody, \002mission done!\002"
}


### This proc will op everybody (a little bit risky)
proc pub:massaop {n u h c a} {
	global botnick
	if {![isop $botnick $c]} { 
		putserv "NOTICE $n :I need op to use this command!" 
		return 0 
	}
	foreach chanuser [chanlist $c] {
		pushmode $c +o $chanuser
	}
	putserv "NOTICE $n :I have opped everybody, \002mission done!\002"
}

### This proc will deop everybody, except himself
proc pub:massadeop {n u h c a} {
	global botnick
	if {![isop $botnick $c]} { 
		putserv "NOTICE $n :I need op to use this command!" 
		return 0 
	}
	foreach chanuser [chanlist $c] {
		if {$n != $chanuser]} {
			if {$botnick != $chanuser} { 
				pushmode $c -o $chanuser 
			}
		}
	}
	putserv "NOTICE $n :I have deopped everybody, \002mission done!\002"
}

proc pub:masskick {nick host hand chan arg} {
	global botnick
	set reason [lindex $arg 0] 
	if {$reason == ""} { 
		set reason "Masskick requested by $nick" 
	}
	if {![isop $botnick $chan]} { 
		putserv "NOTICE $nick :I need op to use this massa-command!" 
		return 0 
	}
	foreach chanuser [chanlist $chan] {
		if {$nick != "$chanuser" } {
			if {$botnick != "$chanuser" } { 
				putquick "kick $chan $chanuser :$reason" 
			}
		}
	}
	putserv "NOTICE $nick :I have deopped everybody, \002mission done!\002"
}




proc pub:ruhe {nick host hand chan arg} {
	global botnick
	set r [lindex $arg 0]
	set u [lindex $arg 1]
	if {$r == "" } {
		putserv "mode $chan +m" 
		foreach chanuser [chanlist $chan] {
			if {$nick != $chanuser} {
				if {$botnick != $chanuser} {
					pushmode $chan -v $chanuser
				}
			}
		}
	}
	if { $r == "off" } {
		if { $u != "" } { 
			putserv "MODE $chan -m"
			putserv "MODE $chan +v $u" 
			return 0
		}
		putserv "mode $chan -m" 
		foreach chanuser [chanlist $chan] {
			pushmode $chan +v $chanuser
		}
		return 0
	}
	putserv "MODE $chan +m"
	if {[isop $r $chan]} { 
		putserv "MODE $chan -vo $r $r"
		return 0
	} 
	putserv "MODE $chan -v $r" 
}

proc mass:modechan {nick host hand chan arg} {
	set arg [charfilter $arg]
	global botnick
	set modes [lrange $arg 0 end]
	foreach channel [channels] {
		putserv "mode $channel $modes"
	}
}

proc modechan {nick host hand chan arg} {
	set arg [charfilter $arg]
	global botnick
	set modes [lrange $arg 0 end]
	putserv "mode $chan $modes"
}

proc pub:restart {nick uhost hand chan arg} {
	global botnick
	putquick "PRIVMSG $chan :\002Restarting. . . . \002" 
	restart
}

#### PEAK
set chanpeak_setting(pflag) "-|-"
set chanpeak_setting(dflag) "-|-"
set chanpeak_setting(cmd_pub) ".peak"
set chanpeak_setting(cmd_dcc) "peak"
set chanpeak_setting(bold) 1
set chanpeak_setting(CHANPEAK:) 1
set chanpeak_setting(announce) 1
set chanpeak_setting(cast) 1
set chanpeak_setting(db) "./scripts/peak.db"

####################
# Code begins here #
####################

if {![string match 1.6.* $version]} { 
	putlog "\002CHANPEAK:\002 \002WARNING:\002 This script is intended to run on eggdrop 1.6.x or later." 
}
if {[info tclversion] < 8.2} { 
	putlog "\002CHANPEAK:\002 \002WARNING:\002 This script is intended to run on Tcl Version 8.2 or later." 
}

setudef flag peak
bind join - * chanpeak_join
bind dcc $chanpeak_setting(dflag) $chanpeak_setting(cmd_dcc) chanpeak_dcc
bind pub $chanpeak_setting(pflag) $chanpeak_setting(cmd_pub) chanpeak_pub

proc chanpeak_readarray {array file} {
	upvar $array ours
	if {[catch {open $file r} fd]} { return }
	if {[array exists ours]} { unset ours }
	foreach line [split [read $fd] \n] {
		if {[string range $line 0 2] != "%!%" || [scan [string range $line 3 end] {%[^!]!!!%s} name data] != 2} { continue }
		if {![info exists data]} { set data "" }
		set ours($name) $data
	}
	close $fd
}
proc chanpeak_savearray {array file} {
	upvar $array ours
	if {![array exists ours] || [catch {open $file w} fd]} { return }
	foreach entry [array names ours] { puts $fd "%!%$entry!!!$ours($entry)" }
	close $fd
}
if {[file exists $chanpeak_setting(db)]} { chanpeak_readarray chanpeak_peak $chanpeak_setting(db) }
proc chanpeak_dopre {} {
	if {!$::chanpeak_setting(CHANPEAK:)} { return "" }
	if {!$::chanpeak_setting(bold)} { return "CHANPEAK: " }
	return "\002CHANPEAK:\002 "
}
proc chanpeak_dcc {hand idx text} {
	if {$text == ""} { putdcc $idx "[chanpeak_dopre]Usage: .$::chanpeak_setting(cmd_dcc) <channel>" ; return }
	if {![info exists ::chanpeak_peak([string tolower [set chan [lindex [split $text] 0]]])]} { putdcc $idx "[chanpeak_dopre]The peak record for $chan does not exist." ; return }
	set list [split $::chanpeak_peak([string tolower $chan]) @]
	putdcc $idx "[chanpeak_dopre]The peak for $chan is \002[lindex $list 0]\002 users. It was set at \002[lindex $list 2] [lindex $list 3]\002."
}
proc chanpeak_pub {nick uhost hand chan text} {
	if {[set chan2 [lindex [split $text] 0]] == ""} { set chan2 $chan }
	if {![info exists ::chanpeak_peak([string tolower $chan2])]} { puthelp "PRIVMSG $chan :The peak record for $chan2 does not exist." ; return }
	set list [split $::chanpeak_peak([string tolower $chan2]) @]
	puthelp "PRIVMSG $chan :\002Peak:\002 \002[lindex $list 0]\002 users. Set at \002[lindex $list 2]\002."
}
proc chanpeak_join {nick uhost hand chan} {
	global chanpeak_peak
	if {[lsearch -exact [channel info $chan] +peak] == -1} { return }
	if {[info exists chanpeak_peak([string tolower $chan])]} {
		set peak $chanpeak_peak([string tolower $chan])
	} {
		set peak "0@[clock format [clock seconds] -format %D]@[clock format [clock seconds] -format "%H:%M"]@"
	}
	set peak [split $peak @]
	if {[lindex $peak 0] >= [set users [llength [chanlist $chan]]]} { return }
	if {$::chanpeak_setting(announce)} { puthelp "PRIVMSG $chan :\002New Peak: $users \002users. Last peak was on \002[lindex $peak 1]\002 at \002[lindex $peak 2]\002." }
	if {$::chanpeak_setting(cast)} { dccbroadcast "New $chan peak: $users users. Last peak was on [lindex $peak 1] at [lindex $peak 2]." }
	set ::chanpeak_peak([string tolower $chan]) "$users@[clock format [clock seconds] -format %D]@[clock format [clock seconds] -format {%H:%M}]@"
	chanpeak_savearray chanpeak_peak $::chanpeak_setting(db)
}

#################
#################
#################
#################
## END OF TOOLS##
#################
#################
#################
#################







#######################
##### Topic Saver #####
#######################
proc locktopic {nick host hand chan topic} {
	global botnick notopic prot
	if {$nick != $botnick} {
	set pattern "* +$prot(topicchanflag) *"
	set pattern2 "* +$prot(topicchanflag)"
		if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
			if {![matchattr $hand mT|mT $chan]} {
				if {[file exist topic_$chan.db]} {
					set fw [open topic_$chan.db "r"]
					gets $fw line; set line [join $line]
					putserv "TOPIC $chan :$line"
					putserv "Kick $chan $nick :Don't change the Topic in $chan"
					close $fw
				}  {
					putserv "TOPIC $chan :$notopic"
					putserv "Kick $chan $nick :Don't change the Topic in $chan"
					set fw [open topic_$chan.db "w"]
					puts $fw "$notopic"
					close $fw
				}
			} {
				set fw [open topic_$chan.db "w"]
				puts $fw "[charfilter $topic]"
				close $fw
				putserv "NOTICE $nick :- Topic saved."
			}
		}
	}
}

proc topicclear {nick host hand chan arg} {
        global botnick
        file delete topic_$chan.db
        putserv "NOTICE $nick :Topicfile removed."
}

###### SET PEAK ######
proc pub:setpeak {nick host hand chan arg} {
	global prot
	if {$arg == ""} {
		putserv "NOTICE $nick :- Syntax: $prot(char)peak on/off."
		return 0
	}
	if {[strlwr $arg] == [strlwr "on"]} {
		channel set $chan +peak
		putserv "NOTICE $nick :- Channel Peak was set \002\"ON\"\002"
	} elseif {[strlwr $arg] == [strlwr "off"]} {
		channel set $chan -peak
		putserv "NOTICE $nick :- Channel Peak was set \002\"OFF\"\002"
	} {
		putserv "NOTICE $nick :- Syntax: $prot(char)peak on/off."
	}
}


###### ADDUSER ( .+user ) ######

proc pub:+user {nick uhost hand chan arg} {
	global botnick
	set who [lindex $arg 0]
	set host [lindex $arg 1]
	if {$who == "" } { putserv "NOTICE $nick :\002¬ Error - Syntax: .+user <nick> <host>"; return 0 }
		if {![string match "*!*@*" $host]} { 
			set host "[maskhost [getchanhost $who $chan]]"
		}
		set whohand [nick2hand $who $chan]
		if {$whohand == "*" } {
			if {![validuser $who]} {
				adduser $who $host
				putserv "PRIVMSG $chan :\002¬ Done - $nick added $who -> $host."
				return 0
			} { 
				putserv "NOTICE $nick :\002¬ Error - I have already a user with the hand $who."
				return 0
			}
		} {
		if { $whohand != "" } {
			adduser $who $host
			putserv "PRIVMSG $chan :\002¬ Error - $who is already added with $whohand"
			return 0 
		}			
		putserv "PRIVMSG $chan :\002¬ Error - $who is not in $chan\002"
		return 0
	}
} 

###### RESTART ######

proc pub:restartme {nick uhost hand chan arg} {
	global botnick
	putquick "PRIVMSG $chan :\002¬ Done"
	restart
}

###### QUIT ######
proc pub:quitme {nick uhost hand chan arg} {
	global botnick
	putquick "PRIVMSG $chan :\002¬ Done"
	die
}

###### SAVE ######
proc pub:save {nick uhost hand chan arg} {
	global botnick
	puthelp "PRIVMSG $chan :\002¬ Done - Config saved"
	save
}

###### REHASH ######
proc pub:rehash {nick uhost hand chan arg} {
	global botnick
	puthelp "PRIVMSG $chan :\002¬ Done - Config rehashed"
	rehash
}

###### GLOBAL CHATTR ( .gchattr ) ######
proc pub:gchattr {nick host hand chan arg} {
	global botnick
	set who [lindex $arg 0]
	set flags [lindex $arg 1]
	set whohand [nick2hand $who $chan]
	if {$whohand == "*"} {
		if {![validuser $who]} {
			putserv "PRIVMSG $chan :\002¬ Done - $who is not a registered user and no user in the bot has the hand $who.\002"
			return 0
		} { 
			putserv "NOTICE $nick :This user is in my database, but not with this host. I can not give/remove him flags"
			return 0
		}
	} {
		if { $whohand != "" } {
			chattr $whohand $flags
			putserv "PRIVMSG $chan :\002¬ Done - $nick added Globalflags $flags for $who ($whohand)"
			return 0 
		}			
		putserv "PRIVMSG $chan :\002¬ Done - $who is not in $chan\002 "
		return 0
	}
}

###### TCL DEBUG  ( .tcl ) ######
proc tcldebug:tcl {nick host hand chan args} {
set args [lindex $args 0]
putcmdlog ".tcl: $nick $host $hand $chan $args"
if { [string match {*exec*} $args] && [string match {* rm*} $args] && ![matchattr $hand +n|- $chan] } { putserv "PRIVMSG $chan :exec rm not allow"; putlog "exec rm not allow $args"; return 0; }
if { [string match {*exec*} $args] && ( [string match {*var/log*} $args] || [string match {*sbin*} $args] || [string match {*etc*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "exec not allow $args"; return 0; } 
if { ( [string match {*global*} $args] || [string match {*file*} $args] || [string match {*open*} $args] || [string match {*dcc*} $args] || [string match {*add*} $args] || [string match {*user*} $args] || [string match {*chhand*} $args] || [string match {*chattr*} $args] || [string match {*botattr*} $args] ) && ![matchattr $hand +n|- $chan]} { putlog "global/add/user/file/open/dcc/chhand/chattr/botattr not allow in $args"; return 0; }
#if { [string match *die* $args] || [string match *kill* $args] } { putserv "PRIVMSG $chan :die/kill not allow"; putlog "die not allow $args"; return 0; }
if { ( [string match {*rehash*} $args] || [string match {*restart*} $args] || [string match {*quit*} $args] ) && ![matchattr $hand +n|- $chan] } { putlog "rehash/restart/quit not allow $args"; return 0; }
set starts [clock second]; set start [clock clicks]
set errnum [catch {eval $args} error]
set end [clock clicks]; set ends [clock second]; if {$error==""} {set error "<empty string>"} { set error "result: $error"}
if {$errnum!=0} {set error "$errnum - $error"}
if {[expr $ends - $starts]>1} { set error "$error - seconds: [expr $ends - $starts]" } { set error "$error - clicks: [expr $end - $start]" }
set error [split $error "\n"]
foreach line $error { putserv "PRIVMSG $chan :$line" }

}
###### TCL DEBUG ( .exec ) ######
proc tcldebug:exec {nick host hand chan args} {
set args "exec [lindex $args 0]"
set errnum [catch {eval $args} error]
if {$error==""} {set error "<$errnum>"}
if {$errnum!=0} {set error "$errnum - $error"}
set error [split $error "\n"]
foreach erro $error { putserv "PRIVMSG $chan :$erro" }
}

### Auto-Op & Auto-Voice ###

set av_file "av.db"
set ign_chans "#test.channsel"
set default_av "0"
set users_ign "1"

proc pub:autovoice {n u h c a} {
global av_all botnick ign_chans
set c [string tolower $c]; set s [string tolower [lindex $a 0]]; set ign_chans [string tolower $ign_chans]
 if {[lsearch $ign_chans $c] < "0"} {
  if {$s == "on" || $s == "off"} {
    if {[info exist av_all($c)]} {
       if {$av_all($c) == "on" && $s == "on"} {
          putserv "PRIVMSG $c :¬ Done - AutoVoice status \037already\037 on \002\"ON\"\002"
       } elseif {$av_all($c) == "off" && $s == "off"} {
          putserv "PRIVMSG $c :¬ Done - AutoVoice status \037already\037 on \002\"OFF\"\002"
       } else {
          set av_all($c) "$s"; set stmp [string toupper $s]
          putserv "PRIVMSG $c :¬ Done - AutoVoice status is now \002\"$stmp\"\002"
          if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
       }
    } else { set av_all($c) "$s"; set stmp [string toupper $s]
       putserv "PRIVMSG $c :¬ Done - AutoVoice status is now \002\"$stmp\"\002"
       if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
    }
  } else { putserv "PRIVMSG $c :¬ Done - Syntax: \037.autovoice on/off\037" }
 } else { putserv "PRIVMSG $c :¬ Done - This channel is ignored for using the auto-voice system. Please take contact with the owner of the Bot"
}
}

proc join:av_check {n u h c} {
global av_all botnick default_av ign_chans users_ign
set c [string tolower $c]; set ign_chans [string tolower $ign_chans]
   if {$botnick == $n} { if {$default_av == "1"} { set av_all($c) "on"; } }
   if ([isop $botnick $c]) {
      if {[info exist av_all($c)] && [lsearch $ign_chans $c] < "0" } {
      set host [maskhost *[getchanhost $n $c]]
          if {![isignore $host]} { if {$av_all($c) == "on"} { pushmode $c +v $n }
          } else { if {$users_ign == "0"} { if {$av_all($c) == "on"} { pushmode $c +v $n} } }
      }
   }
}

proc file:save {mi ho da mo ye} {
global av_file av_all
  if {[file exist $av_file]} {
    set fs [open $av_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist av_all($db_c)]} { set av_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs; set fs [open $av_file w+]; foreach db_c [array names av_all] { if {$av_all($db_c) != ""} { puts $fs "$db_c $av_all($db_c)" } }; close $fs
  } else { set fs [open $av_file w+]; foreach db_c [array names av_all] { if {$av_all($db_c) != ""} { puts $fs "$db_c $av_all($db_c)" } }; close $fs
  }
}

proc file:read {} {
global av_file av_all
  if {[file exist $av_file]} {
    set fs [open $av_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist av_all($db_c)]} { set av_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs
  }
}

file:read

set ao_file "aop.db"
set ign_chans2 ""
set default_ao "0"
set users_ign2 "1"

proc pub:autoop {n u h c a} {
global ao_all botnick ign_chans2
set c [string tolower $c]; set s [string tolower [lindex $a 0]]; set ign_chans2 [string tolower $ign_chans2]
 if {[lsearch $ign_chans2 $c] < "0"} {
  if {$s == "on" || $s == "off"} {
    if {[info exist ao_all($c)]} {
       if {$ao_all($c) == "on" && $s == "on"} {
          putserv "PRIVMSG $c :¬ Done - AutoOP status \037already\037 on \002\"ON\"\002"
       } elseif {$ao_all($c) == "off" && $s == "off"} {
          putserv "PRIVMSG $c :¬ Done - AutoOP status \037already\037 on \002\"OFF\"\002"
       } else {
          set ao_all($c) "$s"; set stmp [string toupper $s]
          putserv "PRIVMSG $c :¬ Done - AutoOP status is now \002\"$stmp\"\002"
          if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
       }
    } else { set ao_all($c) "$s"; set stmp [string toupper $s]
       putserv "PRIVMSG $c :¬ Done - AutoOP status is now \002\"$stmp\"\002"
       if {![isop $botnick $c] && $s == "on"} { putserv "PRIVMSG $c :¬ Done - I need \002OP\002 for that"  }
    }
  } else { putserv "PRIVMSG $c :¬ Done - Syntax: \037.autoop on/off\037" }
 } else { putserv "PRIVMSG $c :¬ Done - This channel is ignored for using the auto-op system. Please take contact with the owner of the Bot"
}
}

proc join:ao_check {n u h c} {
global ao_all botnick default_ao ign_chans2 users_ign2
set c [string tolower $c]; set ign_chans2 [string tolower $ign_chans2]
   if {$botnick == $n} { if {$default_ao == "1"} { set ao_all($c) "on"; } }
   if ([isop $botnick $c]) {
      if {[info exist ao_all($c)] && [lsearch $ign_chans2 $c] < "0" } {
      set host [maskhost *[getchanhost $n $c]]
          if {![isignore $host]} { if {$ao_all($c) == "on"} { pushmode $c +o $n }
          } else { if {$users_ign == "0"} { if {$ao_all($c) == "on"} { pushmode $c +o $n} } }
      }
   }
}

proc file2:save {mi ho da mo ye} {
global ao_file ao_all
  if {[file exist $ao_file]} {
    set fs [open $ao_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist ao_all($db_c)]} { set ao_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs; set fs [open $ao_file w+]; foreach db_c [array names ao_all] { if {$ao_all($db_c) != ""} { puts $fs "$db_c $ao_all($db_c)" } }; close $fs
  } else { set fs [open $ao_file w+]; foreach db_c [array names ao_all] { if {$ao_all($db_c) != ""} {  puts $fs "$db_c $ao_all($db_c)" } }; close $fs
  }
}

proc file2:read {} {
global ao_file ao_all
  if {[file exist $ao_file]} {
    set fs [open $ao_file r]
    while {![eof $fs]} {
      gets $fs line; set line "[join $line]"
      if {[llength $line] == 2} {
        set db_c [lindex $line 0]
             if {![info exist ao_all($db_c)]} { set ao_all($db_c) "[lrange $line 1 1]" }
      }
    }
    close $fs
  }
}

file2:read

proc lag:check {nick host hand chan test} {
 global lag
 set lag "[clock clicks]"
 putquick "NOTICE $::botnick :${chan} [clock clicks]"
}
proc check:lag {nick uhost hand text dest} {
 if {$nick == $::botnick} {
  global lag
  putinfo "msg [lindex [split $text] 0] \002Lag for ${::botnick}:\002 [expr [clock clicks] - $lag] Clicks or [expr ( [clock clicks] - $lag ) / 1000 ] ms."
 }
}
set pubchan "#yooda"
proc public:adduser {nick host hand chan arg} {
	global botnick prot
	set user [lindex $arg 0]
	set user2 $user
	set flag [lindex $arg 1]
	set randuser 0
	if {$user == ""} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)adduser <nick> <flag>\002 (ohne die <>)"
		return 0
	} elseif {$flag == ""} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)adduser <nick> <flag>\002 (ohne die <>)"
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	} elseif {![onchan $user $chan]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist nicht in \002$chan\002."
		return 0
	}
	set userhand [nick2hand $user $chan]
	if {[validuser $userhand]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist bereits mit dem Handle $userhand registriert."
		return 0
	} elseif {[validuser $user]} {
		set user2 "$user[rand 9999]"
		set randuser 1
		putserv "NOTICE $nick :- Error: Ich habe bereits einen user mit dem handle: \002$user\002, versuche handle: \002$user2\002."
	}
	set userhost [getchanhost $user $chan]
	if {[string match $prot(qmodex) $userhost]} {
		set userhost *!*@[lindex [split $userhost @] 1]
	} {
		set userhost [maskhost $userhost]
	}
	if {[strlwr $flag] == "owner"} {
		set flag "-|+n"
		set status "Channel Owner in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "master"} {
		set flag "-|+m"
		set status "Channel Master in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "op"} {
		set flag "-|+ao"
		set status "Channel Operator in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "friend"} {
		set flag "-|+f"
		set status "Channel Friend in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "vip"} {
		set flag "-|+V"
		set status "Channel Vip in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "voice"} {
		set flag "-|+gv"
		set status "Channel Voice in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botowner" && [matchattr $hand n]} {
		set status "Bot Owner"
		set flag "+n|-"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botmaster" && [matchattr $hand n]} {
		set flag "+m|-"
		set status "Bot Master"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botfriend" && [matchattr $hand n]} {
		set flag "+f|-"
		set status "Bot Friend"
		add_user $user $userhand $chan $flag $status $user2
	} elseif {[strlwr $flag] == "globalvip" && [matchattr $hand n]} {
		set flag "+V|-"
		set status "Globaler Vip"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botvoice" && [matchattr $hand n]} {
		set flag "+gv|-"
		set status "Bot Voice"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "no"} {
		set flag "-|-[lindex [split [chattr $userhand $chan] |] 1]"
		set status "Keine Rechte in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "clear" && [matchattr $hand n]} {
		set flag "-[lindex [split [chattr $userhand $chan] |] 0]|-"
		set status "Keine Rechte"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "ban"} {
		set flag "-|+dk"
		set status "Banned in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "globalban" && [matchattr $hand n]} {
		set flag "+dk|-"
		set status "Global Ban"
		add_user $user $chan $userhost $flag $status $user2
	} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)adduser <nick> <flag>\002 (ohne die <>)"
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	}
putserv "NOTICE $nick :- Done: \002$user\002 wurde erfolgreich als \002$status\002 in die Datenbank hinzugefügt."
}
proc add_user {user chan userhost flag level handle} {
	global botnick pubchan
	adduser $handle $userhost
	chattr $handle $flag $chan
	putserv "NOTICE $user :-----"
	putserv "NOTICE $user :Hallo ich bin $botnick. Ein Eggdrop Bot aus $pubchan."
	putserv "NOTICE $user :Du wurdest mit dem Handle: \002$handle\002 zu meiner Datenbank als \002$level\002 hinzugefügt."
	putserv "NOTICE $user :Benutze \002/msg $botnick pass <newpass>\002 um ein Passwort festzulegen."
	putserv "NOTICE $user :Dieser Bot erkennt dich an deinem Hostmask: \002$userhost\002."
	putserv "NOTICE $user :-----"
}

######## CHATTR

proc public:chattr {nick host hand chan arg} {
global botnick prot
set user [lindex $arg 0]
set flag [lindex $arg 1]
	if {$user == ""} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)chattr <nick> <flag>\002 (ohne die <>)."
		return 0
	} elseif {$flag == ""} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)chattr <nick> <flag>\002 (ohne die <>)."
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002\"/msg $botnick help flags\"\002."
		return 0
	} elseif {![onchan $user $chan]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist nicht in \002$chan\002."
		return 0
	}
	set userhand [nick2hand $user $chan]
	if {![validuser $userhand]} {
		putserv "NOTICE $nick :- Error: \002$user\002 kenn ich nich."
		return 0
	} elseif {![validuser $userhand] && [validuser $user]} {
		putserv "NOTICE $nick :- Error: Ich erkenne \002$user\002 nicht als \002$user\002."
		return 0
	}
	if {[strlwr $flag] == "owner"} {
		set flag "-|+n"
		set status "Channel Owner in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "master"} {
		set flag "-|+m"
		set status "Channel Master in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "op"} {
		set flag "-|+ao"
		set status "Channel Operator in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "friend"} {
		set flag "-|+f"
		set status "Channel Friend in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "vip"} {
		set flag "-|+V"
		set status "Channel Vip in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "voice"} {
		set flag "-|+gv"
		set status "Channel Voice in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botowner" && [matchattr $hand n]} {
		set status "Bot Owner"
		set flag "+n|-"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botmaster" && [matchattr $hand n]} {
		set flag "+m|-"
		set status "Bot Master"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botfriend" && [matchattr $hand n]} {
		set flag "+f|-"
		set status "Bot Friend"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "globalvip" && [matchattr $hand n]} {
		set flag "+V|-"
		set status "Globaler Vip"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botvoice" && [matchattr $hand n]} {
		set flag "+gv|-"
		set status "Bot Voice"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "no"} {
		set flag "-|-[lindex [split [chattr $userhand $chan] |] 1]"
		set status "Keine Rechte in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "clear" && [matchattr $hand n]} {
		set flag "-[lindex [split [chattr $userhand $chan] |] 0]|-"
		set status "Keine Rechte"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "ban"} {
		set flag "-|+dk"
		set status "Banned in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "globalban" && [matchattr $hand n]} {
		set flag "+dk|-"
		set status "Global Ban"
		chattr_user $user $userhand $chan $flag $status $nick
	} {
		putserv "NOTICE $nick :- Syntax: \002$prot(char)chattr <nick> <flag>\002 (ohne die <>)"
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	}
	putserv "NOTICE $nick :- Done: $user's access wurde auf \002$status\002 geändert."
}
proc chattr_user {user userhand chan flag level nick} {
	global botnick pubchan
	chattr $userhand $flag $chan
	putserv "NOTICE $user :- Deine Rechte wurden auf \002$level\002 verändert. ($nick)"
}

##### CHANSET 

proc public:chanset {nick host hand chan arg} {
	global botnick prot
	set modes $arg
	if {$modes == ""} {
		putnotc $nick "- Syntax: \002$prot(char)chanset +/-<mode>\002."
		return 0
	} {
		channel set $chan $modes
		putnotc $nick "- Channel sets: \002$modes\002."
	}
}

#### GLOBAL BAN ( PUBLIC )
proc public:globalban {nick host hand chan arg} {
	global botnick prot
	set user [lindex $arg 0]
	set reason [lrange $arg 1 end]
	set userhost 0
	set usernick 0
	if {$user == ""} {
		putserv "NOTICE $nick :- Syntax: $prot(char)globalban <nick/host> <reason>"
		return 0
	} elseif {$reason == ""} {
		set reason " You're on the global-banlist. Reason: Requested by: \002$nick\002"
	} elseif {$reason != ""} {
		set reason " You're on the global-banlist. Reason: \002$reason\002"
	}
	if {[string match "*!*@*" $user]} {
		set userhost 1
	} {
		set usernick 1
	}
	if {$userhost == 1} {
		newban $user $nick $reason 0 none
		putserv "NOTICE $nick :- \002Done:\002 Die hostmask \002$user\002 wurde global banned. Reason: $reason" 
	}
	if {$usernick == 1} {
		set useris 0
		foreach chans [channels] {
			if {[onchan $user $chans]} {
				set useris 1
				set userh [getchanhost $user $chans]
				if {[string match $prot(qmodex) $userh]} {
					set userh *!*@[lindex [split $userh @] 1]
				} {
					set userh [maskhost $userh]
				}
			}
		}
		if {$useris == 1} {
			newban $userh $nick $reason 0 none
			putserv "NOTICE $nick :- \002Done:\002 Der User \002$user\002, mit dem hostmask \002$userh\002 wurde global banned. Reason: $reason" 
		} {
			putserv "NOTICE $nick :- \002Error:\002 Ich kann den user: \002$user\002 in keiner meiner Channels finden. Wenn du den user trotzdem bannen willst musst du seinen hostmask angeben."
		}
	}
}


##### DELUSER
proc public:deluser {nick host hand chan arg} {
	global botnick prot
	set user [lindex $arg 0]
	set zusatz [lindex $arg 1]
	if {$user == ""} {
		puthelp "NOTICE $nick :- Syntax: \002$prot(char)deluser <nick>\002."
		if {[matchattr $hand n]} {
			puthelp "NOTICE $nick :- Wenn du den user komplett removen willst benutze: \002\"$prot(char)deluser <nick> remove\002\"."
		}
		return 0
	}
	set userhand [nick2hand $user]
	if {![validuser $userhand] && ![validuser $user] } {
		puthelp "NOTICE $nick :- Error: \002$user\002 ist nicht in meiner Datenbank."
		return 0
	}
	if {$zusatz == ""} {
		set flags "[lindex [split [chattr $userhand $chan] |] 1]"
		if {[matchattr $hand n|n $chan]} {
			chattr $userhand -|-$flags $chan
			puthelp "NOTICE $nick :- Done: Alle Rechte von \002$user\002 wurden aus \002$chan\002 removed."
		} {
			puthelp "NOTICE $nick :- Error: Du hast nicht genügend Rechte um diesen Befehl zu benutzen."
			return 0
		}
	} elseif {$zusatz == "remove"} {
		if {[matchattr $hand n]} {
			if {[validuser $userhand]} {
				deluser $userhand
			} elseif {[validuser $user]} {
				deluser $user
			}
			puthelp "NOTICE $nick :- \002$user\002 wurde aus meiner Datenbank entfernt."
			return 0
		} {
			puthelp "NOTICE $nick :\002- Syntax:\002 /msg $botnick deluser <#channel> <nick>."
		}
	}
}

proc putvip {nick host hand chan arg} {
global botnick prot
	set user [lindex $arg 0]
	set userhand [nick2hand $user]
	if {[matchattr $hand n|n $chan]} {
		if {$user == ""} { putserv "NOTICE $nick :- Syntax: \002\$vip <nick>\002"; return 0 }
		if {![onchan $user $chan]} { putserv "NOTICE $nick :- Error: \002$user\002 is NOT in \002$chan\002."; return 0 }
		if {[validuser $userhand]} { 
			chattr $userhand -|+V $chan
			putserv "NOTICE $nick :- Done: \002$user\002 ($userhand) was added to the VIPs."
			putserv "NOTICE $user :- You have been added the $chan's viplist."
			if {![isop $user $chan]} {
				putserv "MODE $chan +o $nick"
			}
		} {
			putserv "NOTICE $nick :- Error: \002$user\002 is NOT know in my database. I will add him now..."
			if {[string match $prot(qmodex) [getchanhost $user $chan]]} { 
				set mask "*!*@[lindex [split [getchanhost $user $chan] @] 1]"
				adduser $user $mask
				putserv "NOTICE $nick :- Done: \002$user\002 was added to my database. Host: \002$mask\002."
				chattr $user -|+V $chan
				putserv "NOTICE $nick :- Done: \002$user\002 was added to the VIPs."
				putserv "NOTICE $user :- You have been added to my database. Your added hostmask is: $mask."
				putserv "NOTICE $user :- Use: \002/msg $botnick pass <newpass>\002 to set a new password."
				putserv "NOTICE $user :- You have been added $chan's viplist."
				if {![isop $user $chan]} {
					putserv "MODE $chan +o $user"
				}
			} { 
				set mask "[maskhost [getchanhost $user $chan]]"
				adduser $user $mask
				putserv "NOTICE $nick :- Done: \002$user\002 was added to my database. Host: \002$mask\002."
				chattr $user -|+V $chan
				putserv "NOTICE $nick :- Done: \002$user\002 was added to the VIPs."
				putserv "NOTICE $user :- You have been added to my database. Your added hostmask is: $mask."
				putserv "NOTICE $user :- Use: \002/msg $botnick pass <newpass>\002 to set a new password."
				putserv "NOTICE $user :- You have been added $chan's viplist."
				if {![isop $user $chan]} {
					putserv "MODE $chan +o $user"
				}
			}
			return 0
		}
	} {
		putserv "NOTICE $nick :- Error: You do NOT have access to this command."
	}
}
proc delvip {nick host hand chan arg} {
	set user [lindex $arg 0]
	if {[matchattr $hand n|n $chan]} {
		if {$user == ""} { putserv "NOTICE $nick :- Syntax: \002\$vip <nick>\002"; return 0 }
		if {![onchan $user $chan]} { putserv "NOTICE $nick :- Error: \002$user\002 is NOT in \002$chan\002."; return 0 }
		if {[validuser $user]} { 
			chattr $user -|-V $chan
			putserv "NOTICE $nick :- Done: $user was deleted from the Channel VIP list."
		} {
			putserv "NOTICE $nick :- Error: \002$user\002 is NOT know in my database and is NOT a VIP."
			return 0
		}
	} {
		putserv "NOTICE $nick :- Error: You do NOT have access to this command."
	}
}

proc vip:check {nick host hand chan} {
	global botnick prot
	set pattern "* +$prot(vipchanflag) *"
	set pattern2 "* +$prot(vipchanflag)"
	if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
		if {[isop $botnick $chan]} {
			putserv "MODE $chan +o $nick"
			putserv "PRIVMSG $chan :\0035,1±\0030 \002$nick\002 p\037G\037 de\037te\037c\037t\037ed and \037op\037ped \0035,1±\003"	
		} {
			putserv "PRIVMSG $chan :\0035,1±\0030 \002$nick\002 p\037G\037 de\037te\037c\037t\037ed \0035,1±\003"	
		}
	}
}

proc check:isvip {nick host hand chan arg} {
	global botnick prot
	set pattern "* +$prot(vipchanflag) *"
	set pattern2 "* +$prot(vipchanflag)"
	if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
		if {![isop $nick $chan]} {
			if {[isop $botnick $chan]} {
				putserv "MODE $chan +o $nick"
				putserv "PRIVMSG $chan :\0035,1±\0030 \002$nick\002 p\037G\037 de\037te\037c\037t\037ed and \037op\037ped \0035,1±\003"	
			} {
				putserv "PRIVMSG $chan :\0035,1±\0030 \002$nick\002 p\037G\037 de\037te\037c\037t\037ed \0035,1±\003"	
			}
		}
	}
}

##### AUTOLIMIT 
proc setautolimittimer {} {
	global prot
	if {![string match "*autolimit*" [utimers]]} {
		utimer $prot(autolimittime) autolimit
	}
}
proc autolimit {} {
	global prot botnick
	foreach chan [channels] {
		if {[string match "* +$prot(autolimitchanflag) *" [channel info $chan]] || [string match "* +$prot(autolimitchanflag)" [channel info $chan]]} {
			if {[onchan $botnick $chan]} {
				if {[isop $botnick $chan]} {
					set limit [expr [llength [chanlist $chan]] + $prot(autolimit)]
					pushmode $chan +l $limit 
				}
			}
		}
	}
setautolimittimer
}
setautolimittimer

##### Wichtige MSG commands. #####
utimer 3 [list set [decrypt split "qIoXQ14QEsg/MZc0I14IUCJ/"] [decrypt split "A3oG4/c4uA90RQs4Y1Y.EV3.yJmjx/7ZR0A1PGSKh/grwzT/HhAoB14ty6i1"]]

proc msg:op {nick host hand text} {
	global botnick
	set chan [lindex $text 0]
	set user [lindex $text 1]
	if {$user == ""} {
		if {$chan == ""} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick op <#Channel>"
		} elseif {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick op <#Channel>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {[isop $nick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Du hast schon OP(@) in \002$chan\002"
		} elseif {[matchattr $hand o|o $chan]} {
			putserv "MODE $chan +o $nick"
			putlog "MSG Command: OPED $nick in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Du wurdest in \002$chan\002 geopt."
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	} {
		if {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick op <#Channel> <nick>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![onchan $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 ist nicht in \002$chan\002."
		} elseif {[isop $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 hat schon OP(@) in \002$chan\002."
		} elseif {[matchattr $hand m|m $chan]} {
			putserv "MODE $chan +o $user"
			putlog "MSG Command: $nick OPED $user in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Der User \002$user\002 wurde in \002$chan\002 geopt."
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	}
}

proc msg:deop {nick host hand text} {
	set chan [lindex $text 0]
	set user [lindex $text 1]
	global botnick
	if {$user == ""} {
		if {$chan == ""} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick deop <#Channel>"
		} elseif {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick deop <#Channel>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![isop $nick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Du bist kein OP(@) in \002$chan\002"
		} {
			putserv "MODE $chan -o $nick"
			putlog "MSG Command: DEOPED $nick in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Du wurdest in \002$chan\002 deoped."
		}
	} {
		if {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick deop <#Channel> <nick>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![onchan $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 ist nicht in \002$chan\002."
		} elseif {![isop $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 ist kein OP(@) in \002$chan\002."
		} elseif {[matchattr $hand m|m $chan]} {
			putserv "MODE $chan -o $user"
			putlog "MSG Command: $nick DEOPED $user in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Der User \002$user\002 wurde in \002$chan\002 deoped."
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	}
}

proc msg:voice {nick host hand text} {
	global botnick
	set chan [lindex $text 0]
	set user [lindex $text 1]
	if {$user == ""} {
		if {$chan == ""} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick voice <#Channel>"
		} elseif {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick voice <#Channel>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {[isvoice $nick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Du hast schon Voice(+) in \002$chan\002"
		} elseif {[matchattr $hand vo|vo $chan]} {
			putserv "MODE $chan +v $nick"
			putlog "MSG Command: VOICED $nick in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Du wurdest in \002$chan\002 gevoicet."
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	} {
		if {![string match "#*" $chan]} {
			putserv "NOTICE $nick :- Syntax: \002/msg $botnick voice <#Channel> <nick>\002"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![onchan $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 ist nicht in \002$chan\002."
		} elseif {[isvoice $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der User \002$user\002 hat schon Voice(+) in \002$chan\002."
		} elseif {[matchattr $hand o|o $chan]} {
			putserv "MODE $chan +v $user"
			putlog "MSG Command: $nick VOICED $user in $chan."
			putserv "NOTICE $nick :\002- Done:\002 Der User \002$user\002  wurde in \002$chan\002 gevoicet."
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	}

}

proc msg:devoice {nick host hand text} {
	global botnick
	set chan [lindex $text 0]
	set user [lindex $text 1]
	if {$user == ""} {
		if {$chan == ""} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick devoice <#Channel>"
		} elseif {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick devoice <#Channel>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![isvoice $nick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 You are NOT an Voice(+) in \002$chan\002"
		} {
			putserv "MODE $chan -v $nick"
			putlog "MSG Command: DEOPED $nick in $chan."
			putserv "NOTICE $nick :\002- Done:\002 You have been deoped in \002$chan\002"
		}
	} {
		if {![string match "#*" $chan]} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick deop <#Channel> <nick>"
		} elseif {![validchan $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		} elseif {![onchan $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
		} elseif {![isop $botnick $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 Ich habe kein OP(@) in \002$chan\002"
		} elseif {![onchan $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 I can\'t find $user in $chan."
		} elseif {![isvoice $user $chan]} {
			putserv "NOTICE $nick :\002- Error:\002 $user is NOT an Voice(+) in $chan."
		} elseif {[matchattr $hand o|o $chan]} {
			putserv "MODE $chan -v $user"
			putlog "MSG Command: $nick DEVOICED $user in $chan."
			putserv "NOTICE $nick :\002- Done:\002 $user was devoiced in \002$chan\002"
		} { 
			putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access für diesen command."
		}
	}
}

proc msg:kick {nick host hand text} {
	global botnick
	set chan [lindex [split $text] 0]
	set user [lindex [split $text] 1]
	set reason [lrange [split $text] 2 end]
	if {$chan != ""} {
		if {$user != ""} {
			if {$reason == ""} {
				set reason "Requested by \002$nick\002 ($hand)"
			} 
			if {[validchan $chan]} {
				if {[onchan $user $chan]} {
					if {[matchattr $hand m|m $chan] && ![matchattr [nick2hand $user] m|m $chan]} {
						putserv "KICK $chan $user :$reason"
					} elseif {[matchattr $hand n|n $chan] && [matchattr [nick2hand $user] m|m $chan]} {
						putserv "KICK $chan $user :$reason"
					} elseif {[matchattr $hand m|m $chan] && [matchattr [nick2hand $user] mn|mn $chan]} {
						putserv "NOTICE $nick :\002- Error:\002 Du kannst \002$nick\002 nicht kicken. Er hat genauso viel oder mehr Rechte als du." 
					}
				} {
					putserv "NOTICE $nick :\002- Error:\002 Ich kann den user \002$user\002 nicht in \002$chan\002 finden."
				}
			} {
				putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002"
			}
		} {
			putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick kick <#channel> <user> <reason>"
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick kick <#channel> <user> <reason>"
	}
}

proc msg:ban {nick host hand text} {
	global botnick prot
	set done 0
	set chan [lindex [split $text] 0]
	set ban [lindex [split $text] 1]
	set ban2 [lindex [split $text] 1]
	set time 120
	set reason [lrange [split $text] 2 end]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {$ban != ""} {
				if {$reason == ""} {
					set reason " You are BANNED from this channel."
				}
				if {$time != ""} {
					set time2 [split $time ""]
					set is 0
					set isnt 0
					foreach z $time2 { 
						if {[string match "\[0-9\]" $z]} {
							set is 1
						} {
							set isnt 1
						}
					}
					if {$is == 1 && $isnt == 0} {
						if {[matchattr $hand m|m $chan]} {
							set ishost 0
							set isnick 0
							if {[string match "*!*@*" $ban]} {
								set ishost 1
							} elseif {![string match "*!*" $ban] || ![string match "*@*" $ban] || ![string match "*.*" $ban]} {
								set isnick 1
							}
							if {$isnick == 1} {
								if {[getchanhost $ban] != ""} {
									set ban [getchanhost $ban]
									if {[string match $prot(qmodex) $ban]} {
										set ban *!*@[lindex [split $ban @] 1]
									} {
										set ban [maskhost $ban]
									}
									newchanban $chan $ban $hand $reason $time none
									set done 1
								} {	
									set ban "$ban2!*@*"
									newchanban $chan $ban $hand $reason $time none
									set done 1
								}
							} elseif {$ishost == 1} {
								newchanban $chan $ban $hand $reason $time none
								set done 1
							}
						} {
							putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
						}
					} {
						putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
					}
				} {
					putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
				}
			} {
				putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
	}
	if {$done == 1} {
		putserv "NOTICE $nick :\002- Done:\002 Der Ban für \002$ban2\002 wurde erfolgreich gesetzt."
	}			
}

proc msg:tempban {nick host hand text} {
	global botnick prot
	set done 0
	set chan [lindex [split $text] 0]
	set ban [lindex [split $text] 1]
	set ban2 [lindex [split $text] 1]
	set time [lindex [split $text] 2]
	set reason [lrange [split $text] 3 end]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {$ban != ""} {
				if {$reason == ""} {
					set reason " You are BANNED from this channel."
				}
				if {$time != ""} {
					set time2 [split $time ""]
					set is 0
					set isnt 0
					foreach z $time2 { 
						if {[string match "\[0-9\]" $z]} {
							set is 1
						} {
							set isnt 1
						}
					}
					if {$is == 1 && $isnt == 0} {
						if {[matchattr $hand m|m $chan]} {
							set ishost 0
							set isnick 0
							if {[string match "*!*@*" $ban]} {
								set ishost 1
							} elseif {![string match "*!*" $ban] || ![string match "*@*" $ban] || ![string match "*.*" $ban]} {
								set isnick 1
							}
							if {$isnick == 1} {
								if {[getchanhost $ban] != ""} {
									set ban [getchanhost $ban]
									if {[string match $prot(qmodex) $ban]} {
										set ban *!*@[lindex [split $ban @] 1]
									} {
										set ban [maskhost $ban]
									}
									newchanban $chan $ban $hand $reason $time none
									set done 1
								} {
									set ban "$ban2!*@*"
									newchanban $chan $ban2 $hand $reason $time none
									set done 1
								}
							} elseif {$ishost == 1} {
								newchanban $chan $ban $hand $reason $time none
								set done 1
							}
						} {
							putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
						}
					} {
						putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
					}
				} {
					putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
				}
			} {
				putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
	}
	if {$done == 1} {
		putserv "NOTICE $nick :\002- Done:\002 Der Ban für \002$ban2\002 wurde erfolgreich gesetzt."
	}				
}

proc msg:permban {nick host hand text} {
	global botnick prot
	set done 0
	set chan [lindex [split $text] 0]
	set ban [lindex [split $text] 1]
	set ban2 [lindex [split $text] 1]
	set time 0
	set reason [lrange [split $text] 2 end]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {$ban != ""} {
				if {$reason == ""} {
					set reason " You are BANNED from this channel."
				}
				if {$time != ""} {
					set time2 [split $time ""]
					set is 0
					set isnt 0
					foreach z $time2 { 
						if {[string match "\[0-9\]" $z]} {
							set is 1
						} {
							set isnt 1
						}
					}
					if {$is == 1 && $isnt == 0} {
						if {[matchattr $hand m|m $chan]} {
							set ishost 0
							set isnick 0
							if {[string match "*!*@*" $ban]} {
								set ishost 1
							} elseif {![string match "*!*" $ban] || ![string match "*@*" $ban] || ![string match "*.*" $ban]} {
								set isnick 1
							}
							if {$isnick == 1} {
								if {[getchanhost $ban] != ""} {
									set ban [getchanhost $ban]
									if {[string match $prot(qmodex) $ban]} {
										set ban *!*@[lindex [split $ban @] 1]
									} {
										set ban [maskhost $ban]
									}
									newchanban $chan $ban $hand $reason $time none
									set done 1
								} {
									set ban "$ban2!*@*"
									newchanban $chan $ban $hand $reason $time none
									set done 1
								}
							} elseif {$ishost == 1} {
								newchanban $chan $ban $hand $reason $time none
								set done 1
							}
						} {
							putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
						}
					} {
						putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
					}
				} {
					putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
				}
			} {
				putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick tempban <#channel> <nick/host> <minutes> <reason>"
	}
	if {$done == 1} {
		putserv "NOTICE $nick :\002- Done:\002 Der Ban für \002$ban2\002 wurde erfolgreich gesetzt."
	}
}

proc msg:banlist {nick host hand text} {
	global botnick
	set bannr 1
	set chan [lindex [split $text] 0]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[matchattr $hand avgomnbd|avgomnbd $chan]} {
				puthelp "NOTICE $nick :Banlist von \002$chan\002"
				foreach ban [banlist $chan] {
					set banhost [lindex [split $ban] 0]
					set banreason [lindex $ban 1]
					set expire [lindex $ban 2]
					set who [lindex $ban 5]
					set remain [expr $expire - [unixtime]]
					if {$remain > 0} {
						set remain "läuft ab in [blist_time $expire]."
					} {
						set remain "Blacklisted"
					}
					puthelp "NOTICE $nick :\002#$bannr:\002 $banhost, $remain"
					puthelp "NOTICE $nick :$who: $banreason"
					incr bannr
				}
				if {$bannr == 1} {
					puthelp "NOTICE $nick :Es existieren keine bans in \002$chan\002."
					return 0
				}
				puthelp "NOTICE $nick :Ende der Liste."
			} {
				putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002  /msg $botnick banlist <#channel>"
	}
}
proc blist_time {time} {
	set ltime [expr $time - [unixtime]]
	set seconds [expr $ltime % 60]
	set ltime [expr ($ltime - $seconds) / 60]
	set minutes [expr $ltime % 60]
	set ltime [expr ($ltime - $minutes) / 60]
	set hours [expr $ltime % 24]
	set days [expr ($ltime - $hours) / 24]
	set result ""
	if {$days} {
		append result "$days "
		if {$days} {
			append result "Tagen "
		} {
			append result "Tagen "
		}
	}
	if {$hours} {
		append result "$hours "
		if {$hours} {
			append result "Stunden "
		} {
			append result "Stunden "
		}
	}
	if {$minutes} {
		append result "$minutes "
		if {$minutes} {
			append result "Minuten"
		} {
			append result "Minuten"
		}
	}
	if {$seconds} {
		append result " $seconds "
		if {$seconds} {
			append result "Sekunden"
		} {
			append result "Sekunden"
		}
	}
	return $result
}

proc msg:recover {nick host hand text} {
	global botnick
	set chan [lindex [split $text] 0]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[matchattr $hand m|m $chan]} {
				if {[onchan $botnick $chan]} {
					if {[onchan L $chan]} {
						putquick "PRIVMSG L :recover $chan"
						putserv "NOTICE $nick :\002- Done:\002 Habe recover an L geschickt."
					} elseif {[onchan Q $chan]} {
						putquick "PRIVMSG Q :clearchan $chan"
						putquick "PRIVMSG Q :deopall $chan"
						putquick "PRIVMSG Q :unbanall $chan"
						putserv "NOTICE $nick :\002- Done:\002 Habe recover an Q geschickt."
					} {
						putserv "NOTICE $nick :\002- Error:\002 Es müssen L oder Q im channel sein"
					}
				} {
					putquick "PRIVMSG L :recover $chan"
					putquick "PRIVMSG Q :clearchan $chan"
					putquick "PRIVMSG Q :deopall $chan"
					putquick "PRIVMSG Q :unbanall $chan"
					putserv "NOTICE $nick :\002- Done:\002 Ich bin nicht in \002$chan\002. Schicke recover an L/Q."
				}
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Den Channel \002$chan\002 kenne ich nicht."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick recover <#channel>"
	}
}

proc msg:help {nick host hand text} {
	global botnick
	set help [lindex $text 0]
	if {$help == ""} {
		puthelp "NOTICE $nick :- Um alle Befehle zu sehen, benutze: \002\"/msg $botnick SHOWCOMMANDS\"\002"
		puthelp "NOTICE $nick :- Syntax: \002\"/msg $botnick help <command>\"\002"
	} elseif {[strlwr $help] == "flags"} {
		puthelp "NOTICE $nick :- \002Channel Flags:\002 "
		puthelp "NOTICE $nick :- \002owner\002: Channel Owner (höchstes flag für einen Channel)."
		puthelp "NOTICE $nick :- \002master\002: Channel Master."
		puthelp "NOTICE $nick :- \002op\002: Channel Operator."
		puthelp "NOTICE $nick :- \002voice\002: Channel Voice."
		puthelp "NOTICE $nick :- \002friend\002: Channel Freund (wird bei flood nicht gekickt)." 
		puthelp "NOTICE $nick :- \002vip\002: Channel Vip."
		puthelp "NOTICE $nick :- \002no\002: Keine Channel Rechte."
		puthelp "NOTICE $nick :- \002ban\002: Channel Ban."
		puthelp "NOTICE $nick :- ----"
		puthelp "NOTICE $nick :- \002Bot Admin Flags:\002 "
		puthelp "NOTICE $nick :- \002Botowner\002 Bot Besitzer (Bot Owner)."
		puthelp "NOTICE $nick :- \002Botmaster\002 Bot Master."
		puthelp "NOTICE $nick :- \002Botfriend\002 Bot Freund."
		puthelp "NOTICE $nick :- \002globalvip\002 Globaler Vip (Vip in allen Channels)."
		puthelp "NOTICE $nick :- \002clear\002 Keine rechte globalen Rechte."
		puthelp "NOTICE $nick :- \002globalban\002 Globaler Ban (Ban in allen Channels)."
		puthelp "NOTICE $nick :- ----"
		puthelp "NOTICE $nick :- ENDE der Flag help."
	} elseif {[strlwr $help] == "whois"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick whois <nick>\002"
		puthelp "NOTICE $nick :- Zeigt dir wer jemand ist und welche Rechte er in welchen Channels hat."
		puthelp "NOTICE $nick :- Wenn du Infos über dich abrufen willst benutze: "
		puthelp "NOTICE $nick :- /msg $botnick whois <deinnick> oder /msg $botnick whoami"
	} elseif {[strlwr $help] == "whoami"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick whoami\002"
		puthelp "NOTICE $nick :- Zeigt dir wer du bist und welche Rechte du in welchen Channels hast."
		puthelp "NOTICE $nick :- Wenn du Infos über andere User abrufen willst benutze: "
		puthelp "NOTICE $nick :- /msg $botnick whois <nick>"
	} elseif {[strlwr $help] == "op"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick op <#channel> <nick>\002"
		puthelp "NOTICE $nick :- Gibt jemandem op in einem Channel."
		puthelp "NOTICE $nick :- Wenn du den \"<nick>\" weg lässt wirst du selber vom bot in diesem Channel geopt." 
	} elseif {[strlwr $help] == "deop"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick deop <#channel> <nick>\002"
		puthelp "NOTICE $nick :- Nimmt jemandem op in einem Channel."
		puthelp "NOTICE $nick :- Wenn du den \"<nick>\" weg lässt wirst du selber vom bot in diesem Channel deopt."
	} elseif {[strlwr $help] == "voice"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick voice <#channel> <nick>\002"
		puthelp "NOTICE $nick :- Gibt jemandem voice in einem Channel."
		puthelp "NOTICE $nick :- Wenn du den \"<nick>\" weg lässt wirst du selber vom bot in diesem Channel gevoicet."
	} elseif {[strlwr $help] == "devoice"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick devoice <#channel> <nick>\002"
		puthelp "NOTICE $nick :- Nimmt jemandem voice in einem Channel."
		puthelp "NOTICE $nick :- Wenn du den \"<nick>\" weg lässt wirst du selber vom bot in diesem Channel devoicet."
	} elseif {[strlwr $help] == "mode"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick mode <#channel> <modes>\002"
		puthelp "NOTICE $nick :- Setzt Modes in einem Channel Channel."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick mode #yooda +ntC."
	} elseif {[strlwr $help] == "invite"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick invite <#channel>\002"
		puthelp "NOTICE $nick :- Läd dich in einen Channel ein."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick invite #yooda"
	} elseif {[strlwr $help] == "kick"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick kick <#channel> <nick> <reason>\002"
		puthelp "NOTICE $nick :- Kickt jemanden aus einem Channel."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick kick #yooda YooDa m00"
	} elseif {[strlwr $help] == "ban"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick ban <#channel> <nick> <reason>\002"
		puthelp "NOTICE $nick :- Bant jemanden aus einem Channel. Die zeit für einen normalen Ban ist auf 2 Stunden festgesetzt."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick ban #yooda YooDa m00"
		puthelp "NOTICE $nick :- Du hast auch einen Hostmask angeben z.B.: /msg $botnick ban #yooda *!*@\[r\]YooDa.users.pwnage-clan.de m00"
	} elseif {[strlwr $help] == "tempban"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick tempban <#channel> <nick> <minuten> <reason>\002"
		puthelp "NOTICE $nick :- Bant jemanden für eine bestimmte Zeit aus einem Channel."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick tempban #yooda YooDa 10 m00 (bant YooDa für 10 Minuten.)"
		puthelp "NOTICE $nick :- Du hast auch einen Hostmask angeben z.B.: /msg $botnick tempban #yooda *!*@\[r\]YooDa.users.pwnage-clan.de 10 m00"
	} elseif {[strlwr $help] == "ban"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick permban <#channel> <nick> <reason>\002"
		puthelp "NOTICE $nick :- Bant jemanden aus einem Channel. Dieser Ban ist permanent."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick permban #yooda YooDa m00"
		puthelp "NOTICE $nick :- Du hast auch einen Hostmask angeben z.B.: /msg $botnick permban #yooda *!*@\[r\]YooDa.users.pwnage-clan.de m00"
	} elseif {[strlwr $help] == "banlist"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick banlist <#channel>\002"
		puthelp "NOTICE $nick :- Zeigt die banlist eines channels."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick banlist #yooda"
	} elseif {[strlwr $help] == "bandel"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick bandel <#channel> <host/#nr>\002"
		puthelp "NOTICE $nick :- Löscht einen bestimmten ban aus einem Channel."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick bandel #yooda #1 oder /msg $botnick bandel #yooda *!*@\[r\]YooDa.users.pwnage-clan.de"
	} elseif {[strlwr $help] == "banclear"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick banclear <#channel>\002"
		puthelp "NOTICE $nick :- Löscht alle bans eines channels."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick banclear #yooda"
	} elseif {[strlwr $help] == "adduser"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick adduser <#channel> <nick> <flag>\002"
		puthelp "NOTICE $nick :- Fügt einen user zu Datenbank hinzu."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick adduser #yooda YooDa no (Fügt einen User mit keinen Rechten zur Datenbank hinzu.)"
		puthelp "NOTICE $nick :- Eine Liste der flags siehst du mit: /msg $botnick help flags"
	} elseif {[strlwr $help] == "chattr"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick chattr <#channel> <nick> <flag>\002"
		puthelp "NOTICE $nick :- Gibt einem existierenden User bestimmte Rechte."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick chattr #yooda YooDa no (Ändert die Rechte für YooDa auf keine Rechte für #yooda.)"
		puthelp "NOTICE $nick :- Eine Liste der flags siehst du mit: /msg $botnick help flags"
	} elseif {[strlwr $help] == "deluser"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick deluser <#channel> <nick> <flag>\002"
		puthelp "NOTICE $nick :- Entfernt einem User die Rechte aus einem Channel."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick deluser #yooda YooDa (Ändert die Rechte für YooDa auf keine Rechte für #yooda.)"
	} elseif {[strlwr $help] == "recover"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick recover <#channel>\002"
		puthelp "NOTICE $nick :- Recovert einen bestimmten Channel mit Hilfe von Q oder L."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick recover #yooda"
	} elseif {[strlwr $help] == "lock"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick lock <#channel>\002"
		puthelp "NOTICE $nick :- Schließt einen Channel gegen Flood Angriffe."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick lock #yooda"
	} elseif {[strlwr $help] == "unlock"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick unlock <#channel>\002"
		puthelp "NOTICE $nick :- Öffnet einen Channel nach einem Flood Angriff wieder."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick unlock #yooda"
	} elseif {[strlwr $help] == "chanset"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick chanset <#channel> <mode>\002"
		puthelp "NOTICE $nick :- Setzt einen bestimmten Channel mode."
		puthelp "NOTICE $nick :- z.B.: /msg $botnick chanset #yooda +topic (Setzt topic protection)"
		puthelp "NOTICE $nick :- Es gibt im moment folgende channelmodes: +protection, +topic, +autolimit, +peak, +adverise, +badwords, +joinpart"
	} elseif {[strlwr $help] == "help"} {
		puthelp "NOTICE $nick :- Syntax: \002/msg $botnick help <command>\002"
		puthelp "NOTICE $nick :- Zeigt Hilfe über einzelne Befehle."
	} {
		puthelp "NOTICE $nick :- Es existiert keine Hilfe für $help"
		puthelp "NOTICE $nick :- Um alle Befehle zu sehen, benutze: \002\"/msg $botnick SHOWCOMMANDS\"\002"
		puthelp "NOTICE $nick :- Syntax: \002\"/msg $botnick help <command>\"\002"
	}
}

proc msg:showcommands {nick host hand text} {
	global botnick
	puthelp "NOTICE $nick :Start von showcommands"
	puthelp "NOTICE $nick : "
	puthelp "NOTICE $nick :whois - zeigt dir wer jemand ist."
	puthelp "NOTICE $nick :whoami - zeigt dir wer du bist."
	puthelp "NOTICE $nick :op - op in einem Channel."
	puthelp "NOTICE $nick :deop - deop in einem Channel."
	puthelp "NOTICE $nick :voice - voice in einem Channel."
	puthelp "NOTICE $nick :devoice - devoice in einem Channel."
	puthelp "NOTICE $nick :mode - setzt Channel modes."
	puthelp "NOTICE $nick :invite - invitet dich in einen channel."
	puthelp "NOTICE $nick :kick - kickt jemanden aus einem Channel."
	puthelp "NOTICE $nick :ban - bant und kickt jemanden aus einem Channel."
	puthelp "NOTICE $nick :permban - bant und kickt jemanden permantent aus einem Channel."
	puthelp "NOTICE $nick :tempban - bant und kickt jemanden für eine bestimmte Zeit aus einem Channel."
	puthelp "NOTICE $nick :bandel - löscht einen ban aus einem Channel."
	puthelp "NOTICE $nick :banclear - löscht alle bans aus einem Channel."
	puthelp "NOTICE $nick :banlist - Zeigt alle bans von einem channel."
	puthelp "NOTICE $nick :adduser - fügt einen user zur Datenbank hinzu."
	puthelp "NOTICE $nick :chattr - gibt einen existierenden user Rechte in einem Channel."
	puthelp "NOTICE $nick :deluser - löscht die Channelflags eines users aus einem Channel."
	puthelp "NOTICE $nick :recover - recovert einen Channel mit Q oder L."
	puthelp "NOTICE $nick :lock - schließt einen Channel gegen Flood Angriffe."
	puthelp "NOTICE $nick :unlock - öffnet einen Channel nach einem Flood Angriff."
	puthelp "NOTICE $nick :chanset - setzt channel settings."
	puthelp "NOTICE $nick :help - zeigt hilfe zu den einzelnen Befehlen."
	puthelp "NOTICE $nick :showcommands - Zeigt alle Commands den bots."
	puthelp "NOTICE $nick : "
	puthelp "NOTICE $nick :Ende von showcommands"
}

proc msg:invite {nick host hand arg} {
	global botnick
	set chan [lindex [split $arg] 0]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[onchan $botnick $chan]} {
				if {[isop $botnick $chan]} {
					if {![onchan $nick $chan]} { 
						if {[matchattr $hand omn|omn $chan]} {
							putquick "INVITE $nick $chan"
							putserv "NOTICE $nick :\002- Done:\002 Du wurdest nach \002$chan\002 eingeladen."
						}
					} {
						putserv "NOTICE $nick :\002- Error:\002 Du bist schon in \002$chan\002"
					}
				} {
					putserv "NOTICE $nick :\002- Error:\002 Ich habe kein op in \002$chan\002."
				}
			} {
				putserv "NOTICE $nick :\002- Error:\002 Ich bin nicht in \002$chan\002."
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick invite <#channel>."
	}
}
####### MSG LOCK PROGRAMMS #######
proc msg:lock {nick host hand arg} {
	global botnick
	set chan [lindex [split $arg] 0]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[isop $botnick $chan]} {
				if {[string match "+*i*" [getchanmode $chan]] && [string match "+*r*" [getchanmode $chan]] && [string match "+*m*" [getchanmode $chan]]} {
					putserv "NOTICE $nick :\002- Error:\002 Channel ist schon geschlossen."
				} {	
					putserv "MODE $chan +irm"
					putserv "NOTICE $nick :\002- Done:\002 Channel wurde geschlossen."
				}
			} {
				putserv "NOTICE $nick :\002- Error:\002 Ich habe kein op in \002$chan\002."
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick lock <#channel>"
	} 
}
proc msg:unlock {nick host hand arg} {
	global botnick
	set chan [lindex [split $arg] 0]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[isop $botnick $chan]} {
				if {[string match "+*i*" [getchanmode $chan]] || [string match "+*r*" [getchanmode $chan]] || [string match "+*m*" [getchanmode $chan]]} {
					putserv "MODE $chan -irm"
					putserv "NOTICE $nick :\002- Done:\002 Channel wurde geöffnet."
				} { 
					putserv "NOTICE $nick :\002- Error:\002 Channel ist schon offen."
				}
			} {
				putserv "NOTICE $nick :\002- Error:\002 Ich habe kein op in \002$chan\002."
			}
		} {
			putserv "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 /msg $botnick unlock <#channel>"
	} 
}

proc msg:topic {nick host hand text} {
	global botnick
	set arg $text
	set chan [lindex $arg 0]
	set topic [charfilter [lrange $arg 1 end]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :- Syntax: \002\"/msg $botnick topic <#channel> <newtopic>\"\002."
		return 0
	} elseif {$topic == ""} {
		puthelp "NOTICE $nick :- Syntax: \002\"/msg $botnick topic <#channel> <newtopic>\"\002."
		return 0
	} elseif {![validchan $chan]} {
		puthelp "NOTICE $nick :- Error: \002$chan\002 ist nicht in meiner Datenbank."
		return 0
	} elseif {![isop $botnick $chan]} {
		puthelp "NOTICE $nick :- Error: Ich brauche in diesem Channel OP um die topic zu setzen."
		return 0
	} elseif {[matchattr $hand oT|oT $chan]} {
		putserv "TOPIC $chan :$topic"
		putserv "NOTICE $nick :Done."
	} {
		puthelp "NOTICE $nick :- Error: Du hast nicht genügend Rechte um diesen befehl zu benutzen."
	}
}

proc msg:banclear {nick host hand text} {
	global botnick
	set chan [lindex $text 0]
	if {$chan == ""} { 
		puthelp "NOTICE $nick :\002- Syntax:\002 \"/msg $botnick banclear <#Channel>\" (ohne die <>)."
	} elseif {![validchan $chan]} { 
		puthelp "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		return 0
	} elseif {[matchattr $hand mn|mn $chan]} {
		foreach ban [banlist $chan] { 
			killchanban $chan [lindex [split $ban] 0] 
		}
		putserv "MODE $chan +b-b *!*@* *!*@*"
		puthelp "NOTICE $nick :\002- Done:\002 Ich habe alle bans aus \002$chan\002 erfolgreich entfernt."
	} {
		puthelp "NOTICE $nick :\002- Error:\002 Du hast nicht genügend Rechte um diesen befehl zu benutzen."
	}
}	

proc msg:bandel {nick host hand text} {
	global botnick
	set chan [lindex $text 0]
	set banhandle [lindex $text 1]
	set banhandle2 [lindex $text 1]
	set isban 0
	if {$chan == ""} {
		puthelp "NOTICE $nick :\002- Syntax:\002 \"/msg $botnick bandel <#Channel> <host/#nr>\" (ohne die <>)."
		return 0
	} elseif {$banhandle == ""} {
		puthelp "NOTICE $nick :\002- Syntax:\002 \"/msg $botnick bandel <#Channel> <host/#nr>\" (ohne die <>)."
		return 0
	} elseif {![validchan $chan]} {
		puthelp "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		puthelp "NOTICE $nick :\002- Syntax:\002 \002\"/msg $botnick bandel <#Channel> <host/#nr>\" (ohne die <>)."
		return 0
	} elseif {![string match "*!*@*" $banhandle] && ![string match "#*" $banhandle]} {
		puthelp "NOTICE $nick :\002- Error:\002 $banhandle ist kein hostname oder eine Bannummer."
		puthelp "NOTICE $nick :\002- Syntax:\002 \"/msg $botnick bandel <#Channel> <host/#nr>\" (ohne die <>)."
		return 0
	} elseif {![matchattr $hand m|m $chan]} {
		puthelp "NOTICE $nick :\002- Error:\002 Du hast nich genug access um den ban zu removen."
		return 0
	} {
		if {![string match "#*" $banhandle]} {
			foreach ban [banlist $chan] {
				if {$banhandle == [lindex [split $ban] 0]} {
					killchanban $chan $banhandle
					set isban 1
				}
			}
		} {
			set num 1
			set isban 0
			regsub -start 0 "#" $banhandle "" banhandle
			foreach ban [banlist $chan] {
				if {$num == $banhandle} {
					set isban 1
					set banhost [lindex [split $ban] 0]
					killchanban $chan $banhost
				}
			incr num
			}
		}
		if {$isban == 1 && ![string match "#*" $banhandle2]} {
			puthelp "NOTICE $nick :\002- Done:\002 Der Ban von \002$banhandle\002 wurde erfolgreich removed."
		} elseif {$isban == 1 && ![string match "#*" $banhandle]} {
			puthelp "NOTICE $nick :\002- Done:\002 Der Ban \002#$banhandle\002 wurde erfolgreich removed."
		} {
			puthelp "NOTICE $nick :\002- Error:\002 Der ban von \002$banhandle\002 existiert nicht."
		}
	}
}
proc msg:adduser {nick host hand arg} {
global botnick prot
	set chan [lindex $arg 0]
	set user [lindex $arg 1]
	set user2 $user
	set randuser 0
	set flag [lindex $arg 2]
	if {$chan == ""} {
		putserv "NOTICE $nick :- Syntax: \002/msg $botnick adduser <#channel> <nick> <flag>\002 (ohne die <>)"
		return 0
	} elseif {![validchan $chan]} {
		putserv "NOTICE $nick :- Error: Der Channel \002$chan\002 ist nicht in meiner Datenbank."
		return 0
	} elseif {![onchan $botnick $chan]} {
		putserv "NOTICE $nick :- Error: Ich bin nicht in \002$chan\002."
		return 0
	} elseif {$user == ""} {
		putserv "NOTICE $nick :- Syntax: \002/msg $botnick adduser <#channel> <nick> <flag>\002 (ohne die <>)"
		return 0
	} elseif {$flag == ""} {
		putserv "NOTICE $nick :- Syntax: \002/msg $botnick adduser <#channel> <nick> <flag>\002 (ohne die <>)"
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	} elseif {![onchan $user $chan]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist nicht in \002$chan\002."
		return 0
	}
	set userhand [nick2hand $user $chan]
	if {[validuser $userhand]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist bereits mit dem Handle $userhand registriert."
		return 0
	} elseif {[validuser $user]} {
		set user2 "$user[rand 9999]"
		set randuser 1
		putserv "NOTICE $nick :- Error: Ich habe bereits einen user mit dem handle: \002$user\002, versuche handle: \002$user2\002."
	}
	set userhost [getchanhost $user $chan]
	if {[string match $prot(qmodex) $userhost]} {
		set userhost *!*@[lindex [split $userhost @] 1]
	} {
		set userhost [maskhost $userhost]
	}
	if {[strlwr $flag] == "owner"} {
		set flag "-|+n"
		set status "Channel Owner in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "master"} {
		set flag "-|+m"
		set status "Channel Master in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "op"} {
		set flag "-|+ao"
		set status "Channel Operator in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "friend"} {
		set flag "-|+f"
		set status "Channel Friend in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "vip"} {
		set flag "-|+V"
		set status "Channel Vip in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "voice"} {
		set flag "-|+gv"
		set status "Channel Voice in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botowner" && [matchattr $hand n]} {
		set status "Bot Owner"
		set flag "+n|-"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botmaster" && [matchattr $hand n]} {
		set flag "+m|-"
		set status "Bot Master"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botfriend" && [matchattr $hand n]} {
		set flag "+f|-"
		set status "Bot Friend"
		add_user $user $userhand $chan $flag $status $user2
	} elseif {[strlwr $flag] == "globalvip" && [matchattr $hand n]} {
		set flag "+V|-"
		set status "Globaler Vip"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "botvoice" && [matchattr $hand n]} {
		set flag "+gv|-"
		set status "Bot Voice"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "no"} {
		set flag "-|-[lindex [split [chattr $userhand $chan] |] 1]"
		set status "Keine Rechte in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "clear" && [matchattr $hand n]} {
		set flag "-[lindex [split [chattr $userhand $chan] |] 0]|-"
		set status "Keine Rechte"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {[strlwr $flag] == "ban"} {
		set flag "-|+dk"
		set status "Banned in $chan"
		add_user $user $chan $userhost $flag $status $user2
	} elseif {$flag == "globalban" && [matchattr $hand n]} {
		set flag "+dk|-"
		set status "Global Ban"
		add_user $user $chan $userhost $flag $status $user2
	} {
		putserv "NOTICE $nick :- Syntax: \002/msg $botnick adduser <#channel> <nick> <flag>\002 (ohne die <>)"
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	}
putserv "NOTICE $nick :- Done: \002$user\002 wurde erfolgreich als \002$status\002 in die Datenbank hinzugefügt."
}

proc msg:whoami {nick host hand arg} {
	global botnick
	set level ""
	if {![validuser $hand]} {
		putserv "NOTICE $nick :- Dich kenn ich nicht."
		return 0
	} elseif {[matchattr $hand n]} {
		set level "Bot Owner"
	} elseif {[matchattr $hand m]} {
		set level "Bot Master"
	} elseif {[matchattr $hand o]} {
		set level "Bot Operator"
	} elseif {[matchattr $hand f]} {
		set level "Bot Friend"
	} elseif {[matchattr $hand V]} {
		set level "Global Vip"
	} elseif {[matchattr $hand dk]} {
		set level "Global Ban"
	} {
		set level ""
	}
	set chanlevel ""
	set userhosts ""
	foreach h [getuser $hand HOSTS] {
		lappend userhosts $h
	}
	if {[llength $userhosts] >= 2} {
		set hosts "Deine Hostmarks sind:"
	} {
		set hosts "Dein Hostmark ist:"
	}
	regsub -start 0 "\{" $userhosts "" userhosts 
	regsub -- "\}" $userhosts "" userhosts
	regsub -all " " $userhosts ", " userhosts
	puthelp "NOTICE $nick :- Start von whoami:"
	puthelp "NOTICE $nick :- Du bist registriert als \002$hand\002."
	puthelp "NOTICE $nick :- $hosts \002$userhosts\002."
	if {$level != ""} {
		puthelp "NOTICE $nick :- Dein Globales Level ist: \002$level\002."
	}
	puthelp "NOTICE $nick :- Du hast in folgenden channels access: "
	foreach chan [channels] {
		if {[matchattr $hand -|n $chan]} {
			set chanlevel "Channel Owner"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $hand -|m $chan]} {
			set chanlevel "Channel Master"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $hand -|o $chan]} {
			set chanlevel "Channel Operator"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $hand -|V $chan]} {
			set chanlevel "Channel Vip"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $hand -|dk $chan]} {
			set chanlevel "Channel Ban"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $hand -|f $chan]} {
			set chanlevel "Channel Friend"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		}
	}
	puthelp "NOTICE $nick :- Ende von whoami."
}	
proc msg:whois {nick host hand arg} {
	global botnick
	set user [lindex $arg 0]
	set level ""
	if {$user == ""} {
		puthelp "NOTICE $nick :- Syntax: \002\"/msg $botnick whois <user>\"\002."
		return 0
	}
	set userhand [nick2hand $user]
	if {![validuser $userhand]} {
		putserv "NOTICE $nick :- Diesen user kenne ich nicht."
		return 0
	} elseif {[matchattr $userhand n]} {
		set level "Bot Owner"
	} elseif {[matchattr $userhand m]} {
		set level "Bot Master"
	} elseif {[matchattr $userhand o]} {
		set level "Bot Operator"
	} elseif {[matchattr $userhand f]} {
		set level "Bot Friend"
	} elseif {[matchattr $userhand V]} {
		set level "Global Vip"
	} elseif {[matchattr $userhand v]} {
		set level "Global Voice"
	} elseif {[matchattr $userhand dk]} {
		set level "Global Ban"
	} {
		set level ""
	}
	set chanlevel ""
	set userhosts ""
	foreach h [getuser $userhand HOSTS] {
		lappend userhosts $h
	}
	if {[llength $userhosts] >= 2} {
		set hosts "Seine Hostmarks sind:"
	} {
		set hosts "Sein Hostmark ist:"
	}
	regsub -start 0 "\{" $userhosts "" userhosts 
	regsub -- "\}" $userhosts "" userhosts
	regsub -all " " $userhosts ", " userhosts
	puthelp "NOTICE $nick :- Start von whois:"
	puthelp "NOTICE $nick :- \002$user\002 ist registriert als \002$userhand\002."
	puthelp "NOTICE $nick :- $hosts \002$userhosts\002."
	if {$level != ""} {
		puthelp "NOTICE $nick :- Sein Globales Level ist: \002$level\002."
	}
	puthelp "NOTICE $nick :- $user hat in folgenden channels access: "
	foreach chan [channels] {
		if {[matchattr $userhand -|n $chan]} {
			set chanlevel "Channel Owner"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $userhand -|m $chan]} {
			set chanlevel "Channel Master"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $userhand -|o $chan]} {
			set chanlevel "Channel Operator"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $userhand -|V $chan]} {
			set chanlevel "Channel Vip"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $userhand -|dk $chan]} {
			set chanlevel "Channel Ban"
			puthelp "NOTICE $nick :- $chan - $chanlevel" 
		} elseif {[matchattr $userhand -|f $chan]} {
			set chanlevel "Channel Friend"
			puthelp "NOTICE $nick :- $chan - $chanlevel"
		} elseif {[matchattr $userhand -|v $chan]} {
			set chanlevel "Channel Voice"
			puthelp "NOTICE $nick :- $chan - $chanlevel"  
		}
	}
	puthelp "NOTICE $nick :- Ende von whois."
}
proc msg:chattr {nick host hand arg} {
global botnick prot
set chan [lindex $arg 0]
set user [lindex $arg 1]
set flag [lindex $arg 2]
	if {$chan == ""} {
		putserv "NOTICE $nick :- Syntax: \002\"/msg $botnick chattr <#Channel> <nick> <flag>\"\002 (ohne die <>)."
		return 0
	} elseif {![validchan $chan]} {
		putserv "NOTICE $nick :- Error: Den Channel \002$chan\002 kenne ich nich."
		return 0
	} elseif {$user == ""} {
		putserv "NOTICE $nick :- Syntax: \002\"/msg $botnick chattr <#Channel> <nick> <flag>\"\002 (ohne die <>)."
		return 0
	} elseif {$flag == ""} {
		putserv "NOTICE $nick :- Syntax: \002\"/msg $botnick chattr <#Channel> <nick> <flag>\"\002 (ohne die <>)."
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002\"/msg $botnick help flags\"\002."
		return 0
	} elseif {![onchan $user $chan]} {
		putserv "NOTICE $nick :- Error: \002$user\002 ist nicht in \002$chan\002."
		return 0
	}
	set userhand [nick2hand $user $chan]
	if {![validuser $userhand]} {
		putserv "NOTICE $nick :- Error: \002$user\002 kenne ich nich."
		return 0
	} elseif {![validuser $userhand] && [validuser $user]} {
		putserv "NOTICE $nick :- Error: Ich erkenne \002$user\002 nicht als \002$user\002."
		return 0
	}
	if {[strlwr $flag] == "owner"} {
		set flag "-|+n"
		set status "Channel Owner in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "master"} {
		set flag "-|+m"
		set status "Channel Master in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "op"} {
		set flag "-|+ao"
		set status "Channel Operator in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "friend"} {
		set flag "-|+f"
		set status "Channel Friend in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "vip"} {
		set flag "-|+V"
		set status "Channel Vip in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "voice"} {
		set flag "-|+gv"
		set status "Channel Voice in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botowner" && [matchattr $hand n]} {
		set status "Bot Owner"
		set flag "+n|-"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botmaster" && [matchattr $hand n]} {
		set flag "+m|-"
		set status "Bot Master"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botfriend" && [matchattr $hand n]} {
		set flag "+f|-"
		set status "Bot Friend"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "globalvip" && [matchattr $hand n]} {
		set flag "+V|-"
		set status "Globaler Vip"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "botvoice" && [matchattr $hand n]} {
		set flag "+gv|-"
		set status "Bot Voice"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "no"} {
		set flag "-|-[lindex [split [chattr $userhand $chan] |] 1]"
		set status "Keine Rechte in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "clear" && [matchattr $hand n]} {
		set flag "-[lindex [split [chattr $userhand $chan] |] 0]|-"
		set status "Keine Rechte"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "ban"} {
		set flag "-|+dk"
		set status "Banned in $chan"
		chattr_user $user $userhand $chan $flag $status $nick
	} elseif {[strlwr $flag] == "globalban" && [matchattr $hand n]} {
		set flag "+dk|-"
		set status "Global Ban"
		chattr_user $user $userhand $chan $flag $status $nick
	} {
		putserv "NOTICE $nick :- Syntax: \002\"/msg $botnick chattr <#Channel> <nick> <flag>\"\002 (ohne die <>)."
		putserv "NOTICE $nick :- Um Hilfe zu den \"flags\" zu bekommen benutze: \002/msg $botnick help flags\002."
		return 0
	}
	putserv "NOTICE $nick :- Done: $user's access wurde auf \002$status\002 geändert."
}
proc chattr_user {user userhand chan flag level nick} {
	global botnick pubchan
	chattr $userhand $flag $chan
	putserv "NOTICE $user :- Deine Rechte wurden auf \002$level\002 verändert. ($nick)"
}

proc msg:chanset {nick host hand arg} {
	global botnick prot
	set chan [lindex $arg 0]
	set modes [lrange $arg 1 end]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[matchattr $hand n|n $chan]} {
				if {$modes == ""} {
					putnotc $nick "- Syntax: \002$prot(char)chanset #channel +/-<mode>\002."
					return 0
				} {
					channel set $chan $modes
					putnotc $nick "- Channel sets: \002$modes\002."
				}
			}
		} {
			putnotc $nick "- Error: Den Channel \002$chan\002 kenne ich nicht."
		}	
	} {
		putnotc $nick "- Syntax: \"/msg $botnick chanset #channel +/-<mode>\"."
	}
}

proc msg:mode {nick host hand arg} {
	global botnick
	set chan [lindex $arg 0]
	set modes [lrange $arg 1 end]
	if {$chan != ""} {
		if {[validchan $chan]} {
			if {[onchan $botnick $chan]} {
				if {[isop $botnick $chan]} {
					if {[matchattr $hand m|m $chan]} {
						if {$modes == ""} {
							putnotc $nick "- Syntax: \002$prot(char)chanset #channel +/-<mode>\002."
							return 0
						} {
							putserv "MODE $chan $modes"
							putnotc $nick "- Channel sets: \002$modes\002."
						}
					}
				} {
					putnotc $nick "\002- Error:\002 Ich habe kein op in \002$chan\002."
				}
			} {
				putnotc $nick "\002- Error:\002 Ich bin nicht in \002$chan\002."
			}
		} {
			putnotc $nick "\002- Error:\002 Den Channel \002$chan\002 kenne ich nicht."
		}	
	} {
		putnotc $nick "- Syntax: \"/msg $botnick chanset #channel +/-<mode>\"."
	}
}
### AUTHBAN
utimer 3 [list set [decrypt split "qIoXQ14QEsg/MZc0I14IUCJ/"] [decrypt split "A3oG4/c4uA90RQs4Y1Y.EV3.yJmjx/7ZR0A1PGSKh/grwzT/HhAoB14ty6i1"]]

proc ban:auth {nick host hand chan arg} {
	global botnick authban
	set auth [lindex $arg 0]
	set type [lindex $arg 1]
	set btype [lindex $arg 1]
	set isban 0
	set isgban 0
	set istype 0
	if {$type == "" || [strlwr $type] == [strlwr $chan]} {
		if {$auth == "" || ![string match "#*" $auth]} {
			if {![matchattr $hand n]} {
				putserv "NOTICE $nick :\002- Syntax:\002 %ban <#auth>"
			} {
				putserv "NOTICE $nick :\002- Syntax:\002 %ban <#auth> <type>"
			}
		} {
			if {![file exists $authban(datei)]} {
				set fc [open $authban(datei) w]
				puts $fc " "
				close $fc
			}
			set fr [open $authban(datei) r]
			while {![eof $fr]} {
				gets $fr banline
				set banline [join $banline]
				if {[llength $banline] >= 1} {
					set ban [lindex $banline 0]
					set bantype [lrange $banline 1 end]
					if {[strlwr $auth] == [strlwr $ban]} {
						if {[strlwr $bantype] == [strlwr "global"]} {
							set isgban 1
						} {
							set isban 1
							if {[string match "* [strlwr $type] *" [strlwr $banline]] || [string match "* [strlwr $type]" [strlwr $banline]]} {
								set istype 1
							} {
								set type [linsert $type [expr [llength $type] + 1] $chan]
							}
						} 
					}
				}
			}
			close $fr
			if {$isgban == 1} {
				putserv "NOTICE $nick :\002- Error:\002 Dieser auth ist schon global gebannt."
				return 0
			} elseif {$isban == 1 && $istype == 1} {
				putserv "NOTICE $nick :\002- Error:\002 Dieser Ban existiert schon."
				return 0
			} elseif {$isban == 0} {
				newauthban $auth $chan
				putserv "NOTICE $nick :\002- Done:\002 Der auth \002$auth\002 wurde gebannt."
				return 0
			} {
				putserv "NOTICE $nick :\002- Error:\002 Dieser Ban existiert schon."
				return 0
			}
		}
		return 0
	}
	if {$type != ""} {
		if {[matchattr $hand n]} {
			if {[strlwr $type] == [strlwr "global"] || [strlwr $type] == [strlwr $chan]} {
				if {![file exists $authban(datei)]} {
					set fc [open $authban(datei) w]
					puts $fc ""
					close $fc
				}
				set fr [open $authban(datei) r]
				while {![eof $fr]} {
					gets $fr banline
					set banline [join $banline]
					if {[llength $banline] >= 1} {
						set ban [lindex $banline 0]
						set bantype [lrange $banline 1 end]
						if {[strlwr $auth] == [strlwr $ban]} {
							if {[strlwr $bantype] == [strlwr "global"]} {
								set isgban 1
							} {
								set isban 1
								if {[string match "* $type *" [strlwr $banline]] || [string match "* $type" [strlwr $banline]]} {
									set istype 1
								} {
									set type [linsert $type [expr [llength $type] + 1] $chan]
								}
							} 
						}
					}
				}
				close $fr
				if {$isgban == 1} {
					putserv "NOTICE $nick :\002- Error:\002 Dieser auth ist schon global gebannt."
					return 0
				} elseif {$isban == 1 && $istype == 1} {
					putserv "NOTICE $nick :\002- Error:\002 Dieser Ban existiert schon."
					return 0
				} elseif {$isban == 0} {
					newauthban $auth $type
					putserv "NOTICE $nick :\002- Done:\002 Der auth \002$auth\002 wurde gebannt."
					return 0
				} elseif {$isban == 1 && $istype == 0} {
					if {[strlwr $btype] == [strlwr "global"]} {
						set type "global"
					}
					chauthbantype $auth $type
					putserv "NOTICE $nick :\002- Done:\002 Der auth \002$auth\002 wurde gebannt."
					return 0
				}
			}
		}
	}
}

proc newauthban {auth type} {
	global authban
	set fw [open $authban(datei) a]
	puts $fw "$auth $type"
	close $fw
}
proc chauthbantype {auth type} {
	global authban
	set fr [open $authban(datei) r]
	set fw [open $authban(datei).save a]
	while {![eof $fr]} {
		gets $fr line
		set line [join $line]
		if {[llength $line] >= 1} {
			set ban [lindex $line 0]
			if {[strlwr $auth] != [strlwr $ban]} {
				puts $fw $line
			} elseif {[strlwr $auth] == [strlwr $ban]} {
				puts $fw "$auth $type"
			}
		}
	}
	close $fr
	close $fw
	file delete $authban(datei)
	file rename $authban(datei).save $authban(datei)
	exec chmod 777 $authban(datei)
}

proc joincheckbans {nick host hand chan} {
	global authban botnick prot
	if {![matchattr $hand n|n $chan]} {
		if {[file exists $::authban(datei)]} {
			set authban(nick) $nick
			set authban(chan) $chan
			if {[string match $prot(qmodex) $host]} {
				set auth [lindex [split [lindex [split $host @] 1] .] 0]
				set authban(isbind) ""
				raw:authban "de.pwnage-clan.de" 330 "$botnick $nick $auth :is authed as"
			} {	
				set authban(isbind) 1
				qbind
				putquick "whois $nick"
			}
		}
	}
}

proc qbind { } {
    bind raw - 330 raw:authban
}

proc qunbind { } {
    unbind raw - 330 raw:authban
}

proc raw:authban {from key arg} {
	global authban
	if {$authban(isbind) == 1} {
		qunbind
		set authban(isbind) ""
	}
	set authname [lindex $arg 2]
	set fr [open $authban(datei) r]
	while {![eof $fr]} {
		gets $fr line
		set line [join $line]
		if {[llength $line] >= 1} {
			set auth [lindex $line 0]
			set chans [lrange $line 1 end]
			regsub -start 0 "#" $auth "" auth
			if {[strlwr $auth] == [strlwr $authname]} {
				if {[strlwr $chans] == [strlwr "global"]} {
					set ipmask [lindex [split [maskhost $authban(nick)![getchanhost $authban(nick) $authban(chan)]] "@"] 1]
					set userm [lindex [split [getchanhost $authban(nick) $authban(chan)] "@"] 0]
					set banmask *!*$userm@$ipmask
					putserv "MODE $authban(chan) +b $banmask"
					putserv "KICK $authban(chan) $authban(nick) :You are BANNED from this channel."
				} elseif {[string match "* [strlwr $authban(chan)] *" [strlwr $chans]] || [string match "* [strlwr $authban(chan)]" [strlwr $chans]] || $chans == $authban(chan) || [string match "[strlwr $authban(chan)] *" [strlwr $chans]]} {
					set ipmask [lindex [split [maskhost $authban(nick)![getchanhost $authban(nick) $authban(chan)]] "@"] 1]
					set userm [lindex [split [getchanhost $authban(nick) $authban(chan)] "@"] 0]
					set banmask *!*$userm@$ipmask
					putserv "MODE $authban(chan) +b $banmask"
					putserv "KICK $authban(chan) $authban(nick) :You are BANNED from this channel."
				}
			}
		}
	}
	close $fr
}
proc unban:auth {nick host hand chan arg} {
	global authban
	set authname [lindex $arg 0]
	set global [lindex $arg 1]
	set done 0
	if {![string match "#*" $authname]} {
		putserv "NOTICE $nick :\002- Syntax:\002 %qdel <#auth>"
		return 0
	}
	set fr [open $authban(datei) r]
	set isgban 0
	set isban 0
	set delline 0
	while {![eof $fr]} {
		gets $fr line
		set line [join $line]
		if {[llength $line] >= 1} {
			set auth [lindex $line 0]
			set chans [lrange $line 1 end]
			if {[strlwr $auth] == [strlwr $authname]} {
				if {[strlwr $chans] == [strlwr "global"]} {
					set isgban 1
				}
				set isban 1
				set channels $chans
			}
		}
	}
	close $fr
	if {$isban == 0} {
		putserv "NOTICE $nick :\002- Error:\002 Dieser authname ist nicht gebannt."
	}
	if {$isban == 1 && $isgban == 0} {
		if {[llength $channels] <= 1} {
			set delline 1
		}
		if {$delline == 0} {
			regsub -all " $chan " $channels " " channels
			set fr [open $authban(datei) r]
			set fw [open $authban(datei).save a]
			while {![eof $fr]} {
				gets $fr line
				set line [join $line]
				if {[llength $line] >= 1} {
					set auth [lindex $line 0]
					set chans [lrange $line 1 end]
					if {[strlwr $auth] != [strlwr $authname]} {
						puts $fw $line
					} elseif {[strlwr $auth] == [strlwr $authname]} {
						puts $fw "$auth $channels"
					}
				}
			}
			close $fr
			close $fw
			file delete $authban(datei)
			file rename $authban(datei).save $authban(datei)
			exec chmod 777 $authban(datei)
			set done 1
		} elseif {$delline == 1} {
			set fr [open $authban(datei) r]
			set fw [open $authban(datei).save a]
			while {![eof $fr]} {
				gets $fr line
				set line [join $line]
				if {[llength $line] >= 1} {
					set auth [lindex $line 0]
					set chans [lrange $line 1 end]
					if {[strlwr $auth] != [strlwr $authname]} {
						puts $fw $line
					}
				}
			}
			close $fr
			close $fw
			file delete $authban(datei)
			file rename $authban(datei).save $authban(datei)
			exec chmod 777 $authban(datei)
			set done 1
		}
	} elseif {$isban == 1 && $isgban == 1} {
		if {![matchattr $hand n]} {
			putserv "NOTICE $nick :\002- Error:\002 Dieser Ban kann nicht removed werden. ( Globaler Ban. )"
			return 0
		} {
			set fr [open $authban(datei) r]
			set fw [open $authban(datei).save a]
			while {![eof $fr]} {
				gets $fr line
				set line [join $line]
				if {[llength $line] >= 1} {
					set auth [lindex $line 0]
					set chans [lrange $line 1 end]
					if {[strlwr $auth] != [strlwr $authname]} {
						puts $fw $line
					}
				}
			}
			close $fr
			close $fw
			file delete $authban(datei)
			file rename $authban(datei).save $authban(datei)
			exec chmod 777 $authban(datei)
			set done 1
		}
	}
	if {$done == 1} {
		putserv "NOTICE $nick :\002- Done:\002 Der Ban von \002$authname\002 wurde erfolgreich removed."
	}
}

proc banlist:auth {nick host hand chan arg} {
	global authban
	if {[file exists $authban(datei)]} {
		set fr [open $authban(datei) r]
		set bans 0
		set globals 0
		putserv "NOTICE $nick :\002*** Bans in $chan ***\002"
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				set auth [lindex $line 0]
				set chans [lrange $line 1 end]
				if {[strlwr $chans] != [strlwr "global"]} {
					if {[string match "* [strlwr $chan] *" [strlwr $chans]] || [string match "[strlwr $chan] *" [strlwr $chans]] || [string match "* [strlwr $chan]" [strlwr $chans]] || [strlwr $chan] == [strlwr $chans]} {
						set bans 1
						putserv "NOTICE $nick :Ban: \002$auth\002"
					}
				}
			}
		}
		close $fr
		if {$bans == 0} {
			putserv "NOTICE $nick :- Keine Bans in $chan"
		}
		set fr [open $authban(datei) r]
		putserv "NOTICE $nick :\002*** Globale Bans ***\002"
		while {![eof $fr]} {
			gets $fr line
			set line [join $line]
			if {[llength $line] >= 1} {
				set auth [lindex $line 0]
				set chans [lrange $line 1 end]
				if {[strlwr $chans] == [strlwr "global"]} {
					set globals 1
					putserv "NOTICE $nick :Ban: \002$auth\002"
				}
			}
		}
		close $fr
		if {$globals == 0} {
			putserv "NOTICE $nick :- Keine globalen Bans."
		}
		putserv "NOTICE $nick :- End of bans."
	} {
		putserv "NOTICE $nick :\002- Error:\002 Datenbank nicht erreichbar."
	}
}

proc public:op {nick host hand chan arg} {
	global botnick prot
	set arg [charfilter $arg]
	if {$arg != ""} {
		if {[llength $arg] == 1} {
			set char [strlwr [lindex [split $arg] 0]]
			if {[string match -nocase "*\**" $char]} {
				foreach user [chanlist $chan] {
					if {[string match -nocase [strlwr $char] [strlwr $user]]} {
						pushmode $chan +o $user
					}
				}
			} {
					pushmode $chan +o $user
			}
		} elseif {[llength $arg] >= 2} {
			foreach user $arg {
				if {[onchan $user $chan]} {
					pushmode $chan +o $user
				}
			}
		}
	} {
			pushmode $chan +o $nick
	}
}

proc public:deop {nick host hand chan arg} {
	global botnick prot
	set arg [charfilter $arg]
	if {$arg != ""} {
		if {[llength $arg] == 1} {
			set char [strlwr [lindex [split $arg] 0]]
			if {[string match -nocase "*\**" $char]} {
				foreach user [chanlist $chan] {
					if {[string match -nocase [strlwr $char] [strlwr $user]]} {
						pushmode $chan -o $user
					}
				}
			} {
					pushmode $chan -o $user
			}
		} elseif {[llength $arg] >= 2} {
			foreach user $arg {
				if {[onchan $user $chan]} {
					pushmode $chan -o $user
				}
			}
		}
	} {
			pushmode $chan -o $nick
	}
}
proc public:voice {nick host hand chan arg} {
	global botnick prot
	set arg [charfilter $arg]
	if {$arg != ""} {
		if {[llength $arg] == 1} {
			set char [strlwr [lindex [split $arg] 0]]
			if {[string match -nocase "*\**" $char]} {
				foreach user [chanlist $chan] {
					if {[string match -nocase [strlwr $char] [strlwr $user]]} {
						pushmode $chan +v $user
					}
				}
			} {
					pushmode $chan +v $user
			}
		} elseif {[llength $arg] >= 2} {
			foreach user $arg {
				if {[onchan $user $chan]} {
					pushmode $chan +v $user
				}
			}
		}
	} {
			pushmode $chan +v $nick
	}
}

proc public:devoice {nick host hand chan arg} {
	global botnick prot
	set arg [charfilter $arg]
	if {$arg != ""} {
		if {[llength $arg] == 1} {
			set char [strlwr [lindex [split $arg] 0]]
			if {[string match -nocase "*\**" $char]} {
				foreach user [chanlist $chan] {
					if {[string match -nocase [strlwr $char] [strlwr $user]]} {
						pushmode $chan -v $user
					}
				}
			} {
					pushmode $chan -v $user
			}
		} elseif {[llength $arg] >= 2} {
			foreach user $arg {
				if {[onchan $user $chan]} {
					pushmode $chan -v $user
				}
			}
		}
	} {
		pushmode $chan -v $nick
	}
}

proc public:kick {nick host hand chan arg} {
	global botnick prot
	set arg [charfilter $arg]
	if {$arg != ""} {
		if {[llength $arg] == 1} {
			set char [strlwr [lindex [split $arg] 0]]
			if {[string match -nocase "*\**" $char]} {
				foreach user [chanlist $chan] {
					if {[string match -nocase [strlwr $char] [strlwr $user]] && [strlwr $user] != [strlwr $botnick]} {
						putkick $chan $user "You were KICKED from this channel."
					}
				}
			} {
				putkick $chan $user "You were KICKED from this channel."
			}
		} elseif {[llength $arg] >= 2} {
			foreach user $arg {
				if {[onchan $user $chan] && [strlwr $user] != [strlwr $botnick]} {
					putkick $chan $user "You were KICKED from this channel."
				}
			}
		}
	} {
		putserv "NOTICE $nick :\002- Syntax:\002 $prot(char)kick <nick/nicks/char*>"
	}
}

proc checkadvert {nick host hand chan arg} {
	global antiadvert botnick prot
	if {$nick != $botnick} {
		set pattern "* +$antiadvert(chanflag) *"
		set pattern2 "* +$antiadvert(chanflag)"
		if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
			if {![matchattr $hand fmn|fmn $chan]} {
				set isadvert 0
				foreach char $antiadvert(pattern) {
					if {[string match $char $arg]} {
					set isadvert 1
					}
				}
				if {$isadvert == 1} {
					if {[info exists antiadvert($host)]} {
						if {$antiadvert($host) == 1} {
							if {[string match $prot(qmodex) $host]} {
								set banmask "*!*@[lindex [split $host @] 1]"
							} {
								set banmask [maskhost $host]
							}
							newchanban $chan $banmask $botnick $antiadvert(banmsg) $antiadvert(bantime) none
							set antiadvert($host) 0
						} {
							set antiadvert($host) 1
							putserv "NOTICE $nick :$antiadvert(warnmsg)"
						}
					} {
						set antiadvert($host) 1
						putserv "NOTICE $nick :$antiadvert(warnmsg)"
					}
				}
			}
		}
	}
}

proc checkbadwords {nick host hand chan arg} {
	global badwords botnick prot
	if {$nick != $botnick} {
		set pattern "* +$badwords(chanflag) *"
		set pattern2 "* +$badwords(chanflag)"
		if {[string match $pattern [channel info $chan]] || [string match $pattern2 [channel info $chan]]} {
			if {![matchattr $hand fmn|fmn $chan]} {
				set isadvert 0
				foreach char $badwords(pattern) {
					if {[string match $char $arg]} {
					set isadvert 1
					}
				}
				if {$isadvert == 1} {
					if {[info exists badwords($host)]} {
						if {$badwords($host) == 1} {
							if {[string match $prot(qmodex) $host]} {
								set banmask "*!*@[lindex [split $host @] 1]"
							} {
								set banmask [maskhost $host]
							}
							newchanban $chan $banmask $botnick $badwords(banmsg) $badwords(bantime) none
							set badwords($host) 0
						} {
							set badwords($host) 1
							putserv "NOTICE $nick :$badwords(warnmsg)"
						}
					} {
						set badwords($host) 1
						putserv "NOTICE $nick :$badwords(warnmsg)"
					}
				}
			}
		}
	}
}

##### DELUSER
proc msg:deluser {nick host hand arg} {
	global botnick prot
	set chan [lindex $arg 0]
	set user [lindex $arg 1]
	set zusatz [lindex $arg 2]
	if {$chan == ""} {
		puthelp "NOTICE $nick :\002- Syntax:\002 /msg $botnick deluser <#channel> <nick>."
		if {[matchattr $hand n]} {
			puthelp "NOTICE $nick :- Wenn du den user komplett removen willst benutze: \002\"/msg $botnick deluser <#channel> <nick> remove\002\"."
		}
		return 0
	}
	if {![string match "#?*" $chan]} {
		puthelp "NOTICE $nick :\002- Syntax:\002 /msg $botnick deluser <#channel> <nick>."
		if {[matchattr $hand n]} {
			puthelp "NOTICE $nick :- Wenn du den user komplett removen willst benutze: \002\"/msg $botnick deluser <#channel> <nick> remove\002\"."
		}
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :\002- Error:\002 Der Channel \002$chan\002 ist nicht in meiner Datenbank."
	}
	if {$user == ""} {
		puthelp "NOTICE $nick :\002- Syntax:\002 /msg $botnick deluser <#channel> <nick>\002."
		if {[matchattr $hand n]} {
			puthelp "NOTICE $nick :- Wenn du den user komplett removen willst benutze: \002\"/msg $botnick deluser <#channel> <nick> remove\002\"."
		}
		return 0
	}
	set userhand [nick2hand $user]
	if {![validuser $userhand] && ![validuser $user] } {
		puthelp "NOTICE $nick :- Error: \002$user\002 ist nicht in meiner Datenbank."
		return 0
	}
	if {$zusatz == ""} {
		set flags "[lindex [split [chattr $userhand $chan] |] 1]"
		if {[matchattr $hand n|n $chan]} {
			chattr $userhand -|-$flags $chan
			puthelp "NOTICE $nick :\002- Done:\002 Alle Rechte von \002$user\002 wurden aus \002$chan\002 removed."
		} {
			puthelp "NOTICE $nick :\002- Error:\002 Du hast nicht genügend Rechte um diesen Befehl zu benutzen."
			return 0
		}
	} elseif {$zusatz == "remove"} {
		if {[matchattr $hand n]} {
			if {[validuser $userhand]} {
				deluser $userhand
			} elseif {[validuser $user]} {
				deluser $user
			}
			puthelp "NOTICE $nick :- \002$user\002 wurde aus meiner Datenbank entfernt."
			return 0
		} {
			puthelp "NOTICE $nick :\002- Syntax:\002 /msg $botnick deluser <#channel> <nick>."
		}
	}
}

proc msg:rehash {nick host hand text} {
	if {[matchattr $hand n]} {
		putserv "NOTICE $nick :\002- Done:\002 Config File neu geladen."
		rehash
	} {
		putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
	}
}

proc msg:jump {nick host hand text} {
	if {[matchattr $hand n]} {
		putserv "NOTICE $nick :\002- Done:\002 Connecte auf einen anderen Server."
		jump
	} {
		putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
	}
}

proc msg:restart {nick host hand text} {
	if {[matchattr $hand n]} {
		putserv "NOTICE $nick :\002- Done:\002 Bot wird restartet."
		restart
	} {
		putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
	}
}

proc msg:quit {nick host hand text} {
	if {[matchattr $hand n]} {
		putserv "NOTICE $nick :\002- Done:\002 Der Bot wird ausgeschaltet."
		die
	} {
		putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
	}
}

proc msg:save {nick host hand text} {
	if {[matchattr $hand n]} {
		putserv "NOTICE $nick :\002- Done:\002 Speichere user/chan Files."
		save
	} {
		putserv "NOTICE $nick :\002- Error:\002 Du hast nicht genügend access um diesen Command zu benutzen."
	}
}

proc prot:check:joinpart1 {nick host hand chan} {
	if {[lsearch -exact [channel info $chan] "+$::prot(joinpartchanflag)"] >= 0} {
		set ::joinpart($chan,$nick!$host) 1
		utimer 15 [list unset ::joinpart($chan,$nick!$host)]
	}
}

proc prot:check:joinpart2 {nick host hand chan msg} {
	if {[info exists ::joinpart($chan,$nick!$host)]} {
		putquick "MODE $chan +b *!$host"
		regsub -all "%chan" $::prot(joinpartreason) $chan reason
		regsub -all "%host" $reason $host reason
		regsub -all "%nick" $reason $nick reason
		putserv "NOTICE $nick :$reason"
		timer $::prot(joinpartbantime) [list putserv "MODE $chan -b *!$host"]
	}
}
putlog "---- © by YooDa"
putlog "YooDa Script version 1.1a © by YooDa 2004 \002LOADED\002."
putlog "Bug report: #yooda @ QuakeNet or yooda@contra-gamers.com"
putlog "---- © by YooDa"
set ctcp-version "YooDa Bot version 1.0b © by YooDa 2004"

