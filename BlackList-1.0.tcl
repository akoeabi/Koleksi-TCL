#################################################################
#								#
#			-Blacklist Client-			#
#								#
#	(C) Copyright 2005 by SD-Mr9To5 (#Skrewdriver)		#
#								#
#		Don´t touch the fucking Copyright		#
#	You can use my script, but don´t change anything	#
#								#
#################################################################

#################################################################
#	Settings				-Client-	#
#---------------------------------------------------------------#

#package require mysqltcl
#load /usr/local/lib/mysqltcl-2.51/libmysqltcl2.51.so
load /usr/lib/mysqltcl-2.30/libmysqltcl2.30.so

set blist(author) "SD-Mr9To5"
set blist(authorchan) "#Skrewdriver"
set blist(ppass) "Uv5Vo.ViB63/K.gVn/Pv4qe1"
set blist(version) "1.0"
set blist(puser) "eggdrop"
set blist(phost) "localhost"
set blist(pdb) "irc"
set blist(pass) [decrypt $blist(author) $blist(ppass)]
set blist(connected) [mysqlconnect -host $blist(phost) -user $blist(puser) -password $blist(pass) -db $blist(pdb)]

#################################################################
#	Bindings				-Client-	#
#---------------------------------------------------------------#

bind join - * blist_check

#################################################################
#	Programmcode				-Client-	#
#---------------------------------------------------------------#

proc blist_check { nick host hand chan } {
	global botnick blist
	if {[botisop $chan] != 0 } {
		set help(host) [getchanhost $nick $chan]
		set help(banuser) "0"
		set user(ident) [lindex [split $help(host) "@"] 0]
		set user(host) [lindex [split $help(host) "@"] 1]
		set user(provider) [lindex [split [maskhost $help(host)] @] 1]
		if { [string match "*.users.quakenet.org" $help(host)] == 0 } {
			# check banned providers
			set result [mysqlquery $blist(connected) "SELECT * FROM provider WHERE host='$user(provider)'"]
			if {[set row [mysqlnext $result]] != "" } { set help(banuser) "[lindex $row 2] (ID:[lindex $row 0])" }
			mysqlendquery $result
			if { $help(banuser) == 0 } {
				set result [mysqlquery $blist(connected) "SELECT * FROM blacklist WHERE host='*!*$user(ident)@$user(provider)'"]
				if {[set row [mysqlnext $result]] != "" } { set help(banuser) "[lindex $row 2] (ID:[lindex $row 0])" }
				mysqlendquery $result
			}
			if { $help(banuser) == 0 } {
				set result [mysqlquery $blist(connected) "SELECT * FROM blacklist WHERE host='*!*@$user(host)'"]
				if {[set row [mysqlnext $result]] != "" } { set help(banuser) "[lindex $row 2] (ID:[lindex $row 1])" }
				mysqlendquery $result
			}
			set help(banmask) *!*$user(ident)@$user(provider)
		} else {
			# check banned x user
			set result [mysqlquery $blist(connected) "SELECT * FROM blacklist WHERE host='*!*@$user(host)'"]
			if {[set row [mysqlnext $result]] != "" } { set help(banuser) "[lindex $row 2] (ID:[lindex $row 0])" }
			mysqlendquery $result
			set help(banmask) *!*@$user(host)
		}
		# ban the user
		if { $help(banuser) != "0" } {
			newchanban $chan $help(banmask) $botnick $help(banuser) 30
		}
	}
}

#---------------------------------------------------------------#
#	Ende					-Client-	#
#################################################################

putlog "||- Blacklist Checker v.$blist(version) by $blist(author) $blist(authorchan) on Qnet"

