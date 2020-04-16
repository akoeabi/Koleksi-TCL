# $id: anti_maling.tcl v1.0 eggdrop-1.6.x Agust 22th, 2006 zexel@telkom.net Exp $
#
# this tcl is prevent from bot stealing that use NETGATE tCl variant
# the tcl done 100% cause my "dick head" get sick and my mind go fly with my girl
#
# DEDICATED to :
# 1. my SELF as ZEXEL           <--- sure, not wrong! (100% absolutely right) Thank's to Allah SWT for the knowledge
# 2. my girls as JENOVA ALMASHY <--- the one, and still the one forever! I hope. (the situation is side on me and now I find
#                                    someone (absolutely "HER") to replace you for the temporary cause of long distance between
#                                    our love! But always to remember song from IRWANSYAH - PECINTA WANITA "not" *REPEAT* "not"
#                                    RATU - BUAYA DARAT! Beside that, I like your nice breats, your good ass and absolutely your
#                                    great "pussy" (that's why I cant lose u and like to fucking you when we always meet) event
#                                    you're a Christian Protestant! I call that a MOSLEM POWER!
# 3. FAZAR as him self          <--- my HOMOs that make me learn what's the love and always inject my ASS (ketawa gw ngakax)
# 4. Seach as AGUS "pler"       <--- he's very like my ASS and I give him my SHIT (mencretz dah loe)
# 5. All people on #BanjarCity and #BetaTest <--- our BLACKY-BLACKY community (gux gux aux aux aux... au... you know what I mine!)
# 6. CyberCafe SkyNET on Banjarmasin         <--- wnet yg pelit gak bs ngutang neh! :P
# 7. CyberCafe SPACE-NET on Banjarmasin      <--- my base camp and where is the cracker, frauder and carder belongs to activity &
#                                                 get into one community "AT THE MIDNIGHT!"
# 8. SISWA+ Team                             <--- my own BAND that the crew now get study on Jakarta's (damn... I've triple stroke now!)
# 9. RACUN Team                              <--- are they still exist? who's know? Let the future answer that...
# 10. #NETGATE @ DALnet                      <--- great tCl (The Protector For The Protection!) my home base channel
# 11. SoDoKeRz CrEW                          <--- I'm apart from they too now...
#
# NOTE:
# 1. Don't doubt my english cause I've great "TOEFL" on it!
# 2. This tCl is modified little apart from busuk.tcl (jes_ on #BUSUK) and add-on from netgate.tcl (odon on #NETGATE)
#    that mixed into one!
# 3. I'm not ripper yet, cause I respect the author works! Especially from #BUSUK & #NETGATE @ DALnet IRC with added they name
#    in this tCl.
# 4. Thank's to "jes_" from #BUSUK and "odon" from #NETGATE
# 5. Don't me contact about this tCl, cause you're "NOT DESERVE FOR IT!"
# 6. !!! FUCK YOU AND ALL WHOLE OF YOUR FAMILY !!! YOU'RE DESERVE FOR IT!
# 7. This tCl has been become as internal protection for ARABIAN-X bot (it's my) for offically!
#
# End of messages from ZEXEL - NeTGaTE StaFF (ThE dEbUger and cODeR division)
setudef flag exploit
proc pub_+exploit {nick uhost hand chan rest} {
	global notc 
	if {![matchattr $nick Q]} {
		puthelp "NOTICE $nick :$notc 4Denied..!"
		return 0
	}
	if {[string match "*+expoit*" [channel info $chan]]} {
		puthelp "NOTICE $nick :$notc $chan 4Ready!!"
		return 0
	}  
	catch { channel set $chan +exploit }
	puthelp "NOTICE $nick :$notc EXPLOIT Bot Kick (@) & Report $chan \[9ON\]"
	saveuser
}
proc pub_-exploit {nick uhost hand chan rest} {
	global notc 
	if {![matchattr $nick Q]} {
		puthelp "NOTICE $nick :$notc 4Denied..!"
		return 0
	}
	if {[string match "*-exploit*" [channel info $chan]]} {
		puthelp "NOTICE $nick :$notc EXPLOIT Bot Kick (@) & Report $chan already 4Disable."
		return 0
	}
	catch { channel set $chan -exploit }
	puthelp "NOTICE $nick :$notc EXPLOIT Bot Kick (@) & Report $chan \[4Off\]"
	saveuser
}
bind ctcr - * anti_maling
proc anti_maling {nick uhost hand dest key couk} {
	global botnick pingchan wait_ping notb ps owner
	catch { unset wait_ping }
	if {$nick == $botnick} {return 0}
	if {$nick == $ps} {return 0}
	if {$nick == $owner} {return 0}
	set home "#BANJARCITY"
	if {[string match "*a*" [string tolower $couk]] || [string match "*i*" [string tolower $couk]] || [string match "*u*" [string tolower $couk]] || [string match "*e*" [string tolower $couk]] || [string match "*o*" [string tolower $couk]] } {
		if {[string match "*adduser*" [string tolower $couk]] } {
			set targetnick "${nick}!*@*"
			newignore $targetnick $botnick "*" 1000
			set enemy [lindex [split $couk " "] 1]
			set mencretz [lindex [split $couk " "] 2]
			putlog $mencretz
			set mencretz [lindex [split $mencretz ";"] 0]
			newignore $mencretz $botnick "*" 1000
			set targetnick "${enemy}!*@*"
			newignore $targetnick $botnick "*" 1000
			puthelp "PRIVMSG $nick :You coba tuk menambah user lagi sama aq atas nama $enemy neh! Mo nyolong aq ya... Mencretz!!! [lgrnd]"
			puthelp "NOTICE $nick :You coba tuk menambah user lagi sama aq atas nama $enemy neh! Mo nyolong aq ya... Mencretz!!! [lgrnd]"
			puthelp "PRIVMSG $home :si $nick coba tuk menambah user lagi sama aq atas nama $enemy neh!"
			foreach x [channels] {
				if {![botisop $x] && [onchan ${nick} $x]} {
					if {[string match "*+exploit*" [channel info $x]]} {
						putserv "PRIVMSG $x :MALING Bot detected from $nick $uhost"
					}
				}
				if {[botisop $x] && [onchan ${nick} $x]} {
					puthelp "PRIVMSG $x :si $nick coba tuk menambah user lagi sama aq atas nama $enemy neh! Mo nyolong aq ya..."
					putquick "MODE $x -k+b 7Anti.Exploit.Detected $nick"
					putquick "KICK $x $nick :4,1 PERHATIAN: 9si $nick adalah MALING BOT!!! Harap berhati-hati! Malu donk klo nyolong bot... "
				}
			}
			return 0
		} elseif {[string match "*die*" [string tolower $couk]] } {
			set targetnick "${nick}!*@*"
			newignore $targetnick $botnick "*" 1000
			puthelp "PRIVMSG $targetnick :You coba tuk DC'in aq neh yeee... Dasar rese $nick ini mo nyolong aq gak bs... Mencretz!!! [lgrnd]"
			puthelp "NOTICE $targetnick :You coba tuk DC'in aq neh yeee... Dasar rese $nick ini mo nyolong aq gak bs... Mencretz!!! [lgrnd]"
			puthelp "PRIVMSG $home :si $nick coba tuk DC'in aq neh!"
			foreach x [channels] {
				if {![botisop $x] && [onchan ${nick} $x]} {
					if {[string match "*+exploit*" [channel info $x]]} {
						putserv "PRIVMSG $x :MALING Bot detected from $nick $uhost"
					}
				}
				if {[botisop $x] && [onchan ${nick} $x]} {
					puthelp "PRIVMSG $x :si $nick coba tuk DC'in aq neh yeee... Dasar rese $nick ini mo nyolong aq gak bs... Mencretz!!!"
					putquick "MODE $x -k+b 7Anti.Exploit.Detected $targetnick"
					putquick "KICK $x $nick :4,1 PERHATIAN: 9si $nick adalah MALING BOT!!! Harap berhati-hati! Malu donk klo nyolong bot... "
				}
			}			
			return 0
		} else {
			set targetnick "${nick}!*@*"
			newignore $targetnick $botnick "*" 1000
			puthelp "PRIVMSG $targetnick :You mo mencoba-coba sesuatu sama aq! Mo nyolong bot ya $nick... Mencretz!!! [lgrnd]"
			puthelp "NOTICE $targetnick :You mo mencoba-coba sesuatu sama aq! Mo nyolong bot ya $nick... Mencretz!!! [lgrnd]"
			puthelp "PRIVMSG $home :si $nick mo mencoba-coba sesuatu sama aq!"
			foreach x [channels] {
				if {![botisop $x] && [onchan ${nick} $x]} {
					if {[string match "*+exploit*" [channel info $x]]} {
						putserv "PRIVMSG $x :MALING Bot detected from $nick $uhost"
					}
				}
				if {[botisop $x] && [onchan ${nick} $x]} {
					puthelp "PRIVMSG $x :si $nick mo mencoba-coba sesuatu sama aq! Mo nyolong bot ya $nick... Mencretz!!!"
					putquick "MODE $x -k+b 7Anti.Exploit.Detected $targetnick"
					putquick "KICK $x $nick :4,1 PERHATIAN: si 9$nick adalah MALING BOT!!! Harap berhati-hati! Malu donk klo nyolong bot... "
				}
			}
			return 0
		}
		return 0
	}
}
putlog "#########################################"
putlog "# ANTI-MALING1.0 is now fully loaded... #"
putlog "#              by ZEXEL - NeTGaTE StaFF #"
putlog "#      (ThE dEbUger and cODeR division) #"
putlog "#########################################"

########################
# ZEXEL love girls,    # <- the fact!
# cause they're stupid # <- absolutely 100%! don't ask why? ask your self, honey!
########################