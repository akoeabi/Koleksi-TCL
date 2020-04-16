set awaym {
"2Jun4di" 
"2A4bah"
"2Abi4AnTo"
"2MaKaS4SaR"
"Partnership 2TeL4KoM"
"Partnership 2TeLKoM13SeL"
}

set lgidx 0
proc lgrnd {} {
global lgidx notc
set lgidx [incr lgidx]
if {$lgidx == 1} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 2} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 3} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 4} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 5} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 6} {
set lgrnd "4T7c12L"
} elseif {$lgidx == 7} {
set lgrnd "4T7c12L"
} else {
set lgidx 0
set lgrnd $notc
}
}

proc remain {} {
global botnick uptime timezone notc notd vern longer awaym
set totalyear [expr [unixtime] - $uptime]
if {$totalyear >= 31536000} {
set yearsfull [expr $totalyear/31536000]
set years [expr int($yearsfull)]
set yearssub [expr 31536000*$years]
set totalday [expr $totalyear - $yearssub]
}
if {$totalyear < 31536000} {
set totalday $totalyear
set years 0
}
if {$totalday >= 86400} {
set daysfull [expr $totalday/86400]
set days [expr int($daysfull)]
set dayssub [expr 86400*$days]
set totalhour [expr $totalday - $dayssub]
}
if {$totalday < 86400} {
set totalhour $totalday
set days 0
}
if {$totalhour >= 3600} {
set hoursfull [expr $totalhour/3600]
set hours [expr int($hoursfull)]
set hourssub [expr 3600*$hours]
set totalmin [expr $totalhour - $hourssub]
}
if {$totalhour < 3600} {
set totalmin $totalhour
set hours 0
}
if {$totalmin >= 60} {
set minsfull [expr $totalmin/60]
set mins [expr int($minsfull)]
}
if {$totalmin < 60} {
set mins 0
}
if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "$years year, "} {set yearstext "$years years, "}
if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "$days day, "} {set daystext "$days days, "}
if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "$hours HoUR, "} {set hourstext "$hours HoURS, "}
if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "$mins MiNuTE"} {set minstext "$mins MiNuTES"}
if {[string length $mins] == 1} {set mins "0${mins}"}
if {[string length $hours] == 1} {set hours "0${hours}"}
set output "${yearstext}${daystext}${hours}:${mins}"
set output [string trimright $output ", "]
if {[getuser "config" XTRA "AWAY"]!=""} {
set longer "[getuser "config" XTRA "AWAY"] ([lgrnd]) 4«« 1Online seLama : $output Hrs 4»»"
} {
set awaymsg [lindex $awaym [rand [llength $awaym]]]
set longer "$awaymsg ([lgrnd]) 4«« 1Online seLama : $output Hrs 4»»"
}
}