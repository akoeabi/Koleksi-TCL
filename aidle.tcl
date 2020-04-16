### Anti-Idle v1.2
### by Progeny <progeny@azzurra.org>
### irc.azzurra.org - #EggHelp

# - Using -
# Type in partyline:
# .chanset #channel maxidle <time in minutes>
# If set 0 channel's check will be ignored.

# Punishing method (1 = Kick, 2 = Kick/Ban)
set pmethod 2
# Ban time in minutes.
set bantime 20
# Kick's reason
set aidlereason "Mohon tidak parkir nick di channel official Allnetwork. Channel ini khusus untuk bantuan dan bukan untuk parkir nick. idle :  20 minute - Tempban :  2  minute."
# Exception's flags
set flags n|n
# Kick op? (0 = Yes, 1 = No)
set kickop 1
# Kick voice? (0 = Yes, 1 = No)
set kickvoice 0
#Check for idling users every minutes.
bind time - * aidle:checkidle

setudef int maxidle

proc aidle:checkidle { min hour day month year } {
global botnick flags kickop kickvoice
	foreach chan [channels] {
		if {![channel get $chan "maxidle"]} {continue}
		foreach nick [chanlist $chan] {
			if {$nick == $botnick} {continue}
			if {([isop $nick $chan]) && ($kickop)} {continue}
			if {([isvoice $nick $chan]) && ($kickvoice)} {continue}
			if {[matchattr [nick2hand $nick] $flags] == 1} {continue}
			if {[getchanidle $nick $chan] > [channel get $chan "maxidle"]} {
			aidle:punish $chan $nick [channel get $chan "maxidle"]
			}
		}
	
	}
}

proc aidle:punish { channel nick idletime } {
global pmethod aidlereason bantime
regsub -all "%idletime" $aidlereason $idletime aidlereason
	switch $pmethod {
	1 { putserv "KICK $channel $nick :$aidlereason" }
	2 { newchanban $channel "*![getchanhost $nick]" "Anti-Idle" "Mohon tidak parkir nick di channel official Allnetwork. Channel ini khusus untuk bantuan dan bukan untuk parkir nick. idle :  %idletime minute - Tempban :  20  minute." $bantime }
	}
}

putlog "Anti-Idle v1.2 loaded"
