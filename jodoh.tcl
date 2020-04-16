#########################################
# 			    						#
# ReLease Date   : 30 Januari 2010  	#                 
# 							   			#
# DediCateD      : Ukhuwahnet@DALnet	#
#                                   	#  
#########################################

##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set jodohowner "abah" 

# Update
set jodohupdate "09.08.2010"
set jodohversion "20.10"

# location
set jodohcountry "Indonesia"
set jodohstate "Makassar"

# End configuration

#########################################################################################
## THIS SCRIPT IS ANOTHER SIMPLE AND SILLY TIMEKILLER...IT CALCULATES THE COMPATIBILITY #
## BETWEEN TWO USERS...THAT'S ALL...JUST LOAD THE SCRIPT INTO YOUR BOT AND IT SHOULD BE #
## ALL READY TO GO...TO USE IT, TYPE '!match' AND HAVE FUN! 8)				    #
#########################################################################################

bind pub - !jodoh Matcher
proc Matcher {nick uhost hand chan args} {
regsub -nocase \[{}] $args "" args
set origargs $args
if {[llength $args] < 2} {
 putserv "privmsg $chan :Penggunaan !jodoh <nick1> <nick2>"
 return
}

set counter 0
set compatmarker 0
while {$counter != [string length $args]} {
 if {[string range $args $counter $counter] == "l"} {incr compatmarker 2}
 if {[string range $args $counter $counter] == "o"} {incr compatmarker 2}
 if {[string range $args $counter $counter] == "v"} {incr compatmarker 2}
 if {[string range $args $counter $counter] == "e"} {incr compatmarker 2}
 if {[string range $args $counter $counter] == "y"} {incr compatmarker 3}
 if {[string range $args $counter $counter] == "o"} {incr compatmarker 1}
 if {[string range $args $counter $counter] == "u"} {incr compatmarker 3}
 incr counter
}

set compatability 0
if {$counter > 0} {set compatability [expr 5 - ([string length $args] /2)]}
if {$counter > 2} {set compatability [expr 10 - ([string length $args] /2)]}
if {$counter > 4} {set compatability [expr 20 - ([string length $args] /2)]}
if {$counter > 6} {set compatability [expr 30 - ([string length $args] /2)]}
if {$counter > 8} {set compatability [expr 40 - ([string length $args] /2)]}
if {$counter > 10} {set compatability [expr 50 - ([string length $args] /2)]}
if {$counter > 12} {set compatability [expr 60 - ([string length $args] /2)]}
if {$counter > 14} {set compatability [expr 70 - ([string length $args] /2)]}
if {$counter > 16} {set compatability [expr 80 - ([string length $args] /2)]}
if {$counter > 18} {set compatability [expr 90 - ([string length $args] /2)]}
if {$counter > 20} {set compatability [expr 100 - ([string length $args] /2)]}

if {$compatability < 0} {set compatability 0}
if {$compatability > 100} {set compatability 100}
if {$compatability < 50} {
  set jodoh "3»4®3«0-6tidak jodoh..segera hubungi mbah dukun!0-3»4®3«"
} elseif {$compatability < 75} {
  set jodoh "3»4®3«0-6Jodoh, tapi harus serius.....0-3»4®3«"
} elseif {$compatability < 90} {
  set jodoh "3»4®3«0-6bisa jadi jodoh nih...usaha terus ya0-3»4®3«"
} else {
  set jodoh "3»4®3«0-6Jodoh banget nih... nikah aja... jgn lupa undang yah...0-3»4®3«"
}
putserv "privmsg $chan :10Kecocokan antara4 $origargs 10sebesar3 $compatability% ($jodoh)"
return
}

putlog "TCL Name : TCL Jodoh edited by $jodohowner $jodohcountry $jodohstate $jodohversion $jodohupdate"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"
putlog "Loaded Status : Success ...!!!"