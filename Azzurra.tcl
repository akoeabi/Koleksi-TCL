#################################################################
#                      	       Azzurra				#
#  		Script per il network AzzurraNet		#
#								#
#            Written by IRC Club Staff (SerialCRACK)		#
#################################################################

### SETS
set identified 0
set CS_no_access 0
# Imposta qui la password del nick del bot.
# N.B.: E' obbligatorio registrare il nick se si vuole usare
#       questo script ed il bot deve essere almeno VOp nel canale.
set NS_pass ""

### BINDS
bind evnt - init-server init_NS_id
bind notc S "*Da questo momento risulti identificato." NS:ided
bind notc S "Accesso negato." CS:no_access
bind need - "* invite" azzurra:invite
bind need - "* unban" azzurra:unban
bind need - "* op" azzurra:op

if {![info exists NS:pass]} {die "TCL (Azzurra.tcl (E' necessario registrare il nick per poter usare questo script.))"}
adduser NickServ NickServ!service@azzurra.org
adduser ChanServ ChanServ!service@azzurra.org
chattr NickServ -hp+fS
chattr ChanServ -hp+fS

### PROCS
proc init_NS_id {type} {NS:id}

proc NS:id {} {
	global NS_pass
	putserv "PRIVMSG NickServ :identify $NS_pass"
}

proc NS:ided {nick host hand text dest} {set identified 1}

proc CS:no_access {nick host hand text dest} {set CS_no_access 1}

proc azzurra:invite {chan type} {
	global identified
	if {$identified == 1} {
		putlog "Azzurra.tcl -- Tento di invitarmi sul canale $chan tramite ChanServ."
		putquick "PRIVMSG ChanServ :invite $chan"
		putserv "JOIN $chan"
	} else {NS:id}
}

proc azzurra:unban {chan type} {
	global identified
	if {$identified == 1} {
		putlog "Azzurra.tcl -- Tento di rimuovermi il ban su $chan tramite ChanServ."
		putquick "PRIVMSG ChanServ :unban $chan me"
		putserv "JOIN $chan"
	} else {NS:id}
}

proc azzurra:op {chan type} {
	global identified CS_no_access botnick
	if {$identified == 1} {
		if {$CS_no_access == 0} {
			putlog "Azzurra.tcl -- Tento di riprendermi l'op su $chan tramite ChanServ."
			putquick "PRIVMSG ChanServ :op $chan $botnick"
		} else {putlog "Azzurra.tcl -- Non è possibile riprendere l'op su $chan : \"Accesso negato\"."}
	} else {set CS_no_access 0 ; NS:id}
}

putlog "TCL Script: Azzurra v1.0 created by IRC Club Staff - http://irc-club.6go.net"