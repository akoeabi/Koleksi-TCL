set antiadvert(chanflag) "advert"
set antiadvert(pattern) "{* #?*} {#?*} {*www.???*.??*} {*http://*.*}"
set antiadvert(warnmsg) "You are violating QuakeNet rules. Please read http://www.quakenet.org/rules/ and cease your abuse."
set antiadvert(banmsg) " You are violating QuakeNet rules. Please read http://www.quakenet.org/rules/. You are banned for 10 minutes."

setudef flag $antiadvert(chanflag)

bind pubm - * checkadvert

proc checkadvert {nick host hand chan arg} {
	global antiadvert botnick
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
						if {[string match "*.users.quakenet.org" $host]} {
							set banmask "*!*@[lindex [split $host @] 1]"
						} {
							set banmask [maskhost $host]
						}
						newchanban $chan $banmask $botnick $antiadvert(banmsg) 10 none
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