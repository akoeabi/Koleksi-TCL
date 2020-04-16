#############################################################################################
#                                                                                           #
# Idle Top 5!                                                                               #
# Based on Idle King script by Ozh.                                                         #
# That script was originally named "Idle des jeunes" in French, which is funny as hell.     #
#                                                                                           #
# Contact stuff :                                                                           #
# TrashF, TrashF@iki.fi, QuakeNet.                                                          #
#                                                                                          #
#############################################################################################

#just type !idle on channel to get the top 5 idlers

bind pub - !idle idle_getnick

proc idle_getnick {nick mask hand chan args} {
global botnick
	set idlaajia 0	
	set idle_1 "0"
	set idle_2 "0"
	set idle_3 "0"
	set idle_4 "0"
	set idle_5 "0"
	set idle_1_nick "N/A"
	set idle_2_nick "N/A"
	set idle_3_nick "N/A"
	set idle_4_nick "N/A"
	set idle_5_nick "N/A"
	foreach mec [chanlist $chan] {
		set idle_idle [getchanidle $mec $chan]
		if {$idle_idle > $idle_1 && $mec != $botnick && $mec != "L"} {set idle_1 $idle_idle ; set idle_1_nick $mec ; incr idlaajia }
	}
	foreach mec [chanlist $chan] {
		set idle_idle [getchanidle $mec $chan]
		if {$idle_idle > $idle_2 && $mec != $idle_1_nick && $mec != $botnick && $mec != "L"} {set idle_2 $idle_idle ; set idle_2_nick $mec ; incr idlaajia}
	}
	foreach mec [chanlist $chan] {
		set idle_idle [getchanidle $mec $chan]
		if {$idle_idle > $idle_3 && $mec != $idle_1_nick && $mec != $idle_2_nick && $mec != $botnick && $mec != "L"} {set idle_3 $idle_idle ; set idle_3_nick $mec ; incr idlaajia}
	}
	foreach mec [chanlist $chan] {
		set idle_idle [getchanidle $mec $chan]
		if {$idle_idle > $idle_4 && $mec != $idle_1_nick && $mec != $idle_2_nick && $mec != $idle_3_nick && $mec != $botnick && $mec != "L"} {set idle_4 $idle_idle ; set idle_4_nick $mec ; incr idlaajia}
	}
	foreach mec [chanlist $chan] {
		set idle_idle [getchanidle $mec $chan]
		if {$idle_idle > $idle_5 && $mec != $idle_1_nick && $mec != $idle_2_nick && $mec != $idle_3_nick && $mec != $idle_4_nick && $mec != $botnick && $mec != "L"} {set idle_5 $idle_idle ; set idle_5_nick $mec ; incr idlaajia}
	}

#here you can change the output method if you want.
if {$idlaajia > "5"} {set idlaajia 5}	
putchan $chan "# Idle Top $idlaajia at $chan #"
if {$idle_1_nick != "N/A"} { putchan $chan "# $idle_1 minutes <-- $idle_1_nick" }
if {$idle_2_nick != "N/A"} { putchan $chan "# $idle_2 minutes <-- $idle_2_nick" }
if {$idle_3_nick != "N/A"} { putchan $chan "# $idle_3 minutes <-- $idle_3_nick" }
if {$idle_4_nick != "N/A"} { putchan $chan "# $idle_4 minutes <-- $idle_4_nick" }
if {$idle_5_nick != "N/A"} { putchan $chan "# $idle_5 minutes <-- $idle_5_nick" }
}

putlog "Idle Top 5 by TrashF @ QNet loaded."
