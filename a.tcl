# CrazyCat Programming Factory
#   ___     ____      ____
#  / __)___(  _ \ ___( ___)
# ( (__(___))___/(___))__)
#  \___)   (__)      (__)
#
# http://www.c-p-f.org
#
######################################
#
# chanrelay.tcl 2.0
#
######################################
#
# A way to link your channels
#
######################################

## DESCRIPTION ##
#
# This TCL is a complete relay script wich works with botnet.
# All you have to do is to include this tcl in all the eggdrop who
# are concerned by it.
#
# You can use it as a spy or a full duplex communication tool.
#
# It don't mind if the eggdrops are on the same server or not,
# it just mind about the channels and the handle of each eggdrop.

## EVOLUTION ##
#
# Based on chanrelay 1.2 (from myself),
# this new version doesn't know any limitation
# whith number of eggdrops or channels.
#
# BUT, because there's a BUT, the system is now a de/multiplexer:
# Each bot transmit to all others, and each receive (so send to his chan)
# from all others.

## CONFIGURATION ##

# Fill the values as you want but don't forget to keep the same order between each array.
set eggdrops {"suramz" "suramz"}
set chans {"#jatimcom" "#jatimcom"}
set networks {"mesra.kl.my.dal.net" "203.147.62.70"}
# Remember that all is case sensitive, so don't write DuMmY if your eggdrop is named dummy :)

# Do you want to use bold (1), underline (2) or nothing (0) to higtlight nicknames ?
set high "1"

# Do yo want to indicate from wich network comes the message (y/n)?
set snet "y"

# Do you want the bot transmit actions from the channel (y/n)?
set transmit "y"; # default value is yes

# Do you want the bot recept actions (y/n)?
set receive "y"; # default value is yes

# transmission configuration
set trans_pub "y"; # transmit the pub
set trans_act "y"; # transmit the actions (/me)
set trans_nick "y"; # transmit the nick changement
set trans_join "y"; # transmit the join
set trans_part "y"; # transmit the part
set trans_quit "y"; # transmit the quit
set trans_topic "y"; # transmit the topic changements
set trans_kick "y"; # transmit the kicks
set trans_mode "y"; #transmit the mode changements

# reception configuration
set recv_pub "y"; # recept the pub
set recv_act "y"; # recept the actions (/me)
set recv_nick "y"; # recept the nick changement
set recv_join "y"; # recept the join
set recv_part "y"; # recept the part
set recv_quit "y"; # recept the quit
set recv_topic "y"; # recept the topic changements
set recv_kick "y"; # recept the kicks
set recv_mode "y"; #recept the mode changements

############################################################
#
# The TCL begins here, if you don't know what to do, don't do anything :)
#
############################################################

bind msg o|o "rc.status" help:status
bind msg - "rc.help" help:cmds

if { $high == "1" } {
	set hlnick "\002"
} elseif { $high == "2" } {
	set hlnick "\037"
} else {
	set hlnick ""
}

bind msg o|o "rc.light" set:light
bind msg o|o "rc.net" set:snet

if { $transmit == "y" } {
	bind msg o|o "trans" set:trans
	if { $trans_pub == "y" } { bind pubm - * trans_pub }
	if { $trans_act == "y" } { bind ctcp - "ACTION" trans_act }
	if { $trans_nick == "y" } { bind nick - * trans_nick }
	if { $trans_join == "y" } { bind join - * trans_join }
	if { $trans_part == "y" } { bind part - * trans_part }
	if { $trans_quit == "y" } { bind sign - * trans_quit }
	if { $trans_topic == "y" } { bind topc - * trans_topic }
	if { $trans_kick == "y" } { bind kick - * trans_kick }
	if { $trans_mode == "y" } { bind mode - * trans_mode }
}

if { $receive =="y" } {
	bind msg o|o "recv" set:recv
	if { $recv_pub == "y" } { bind bot - ">pub" recv_pub }
	if { $recv_act == "y" } { bind bot - ">act" recv_act }
	if { $recv_nick == "y" } { bind bot - ">nick" recv_nick }
	if { $recv_join == "y" } { bind bot - ">join" recv_join }
	if { $recv_part == "y" } { bind bot - ">part" recv_part }
	if { $recv_quit == "y" } { bind bot - ">quit" recv_quit }
	if { $recv_topic == "y" } { bind bot - ">topic" recv_topic }
	if { $recv_kick == "y" } { bind bot - ">kick" recv_kick }
	if { $recv_mode == "y" } { bind bot - ">mode" recv_mode }
}	

# proc setting the type of highlight
proc set:light {nick host handle arg } {
	global hlnick
	if { $arg == "bo" } {
		set hlnick "\002"
	} elseif { $arg == "un" } {
		set hlnick "\037"
	} elseif { $arg == "off" } {
		set hlnick ""
	} else { putquick "NOTICE $nick :you must chose \002(bo)\002ld , \037(un)\037derline or (off)" }
}

proc set:snet {nick host handle arg } {
	global snet
	if { $arg == "yes" } {
		set snet "y"
	} elseif { $arg == "no" } {
		set snet "n"
	} else { putquick "NOTICE $nick :you must chose yes or no" }
}
# proc setting of transmission by msg
proc set:trans { nick host handle arg } {
	global botnick transmit
	if { $transmit == "y" } {
		if { $arg == "" } {
			putquick "NOTICE $nick :you'd better try /msg $botnick trans help"
		}
		if { [lindex [split $arg] 0] == "help" } {
			putquick "NOTICE $nick :usage is /msg $botnick trans <value> on|off"
			putquick "NOTICE $nick :with <value> = pub, act, nick, join, part, quit, topic, kick, mode"
			return 0
		} else {
			set proc_change "trans_[lindex [split $arg] 0]"
			switch [lindex [split $arg] 0] {
				"pub" { set type pubm }
				"act" { set type ctcp }
				"nick" { set type nick }
				"join" { set type join }
				"part" { set type part }
				"quit" { set type sign }
				"topic" { set type topc }
				"kick" { set type kick }
				"mode" { set type mode }
			}
			if { [lindex [split $arg] 1] == "on" } {
				bind $type - * $proc_change
			} elseif { [lindex [split $arg] 1] == "off" } {
				unbind $type - * $proc_change
			} else {
				putquick "NOTICE $nick :[lindex [split $arg] 1] is not a correct value, choose \002on\002 or \002off\002"
			}
		}
	} else {
		putquick "NOTICE $nick :transmission is not activated, you can't change anything"
	}
}

# proc setting of reception by msg
proc set:recv { nick host handle arg } {
	global botnick receive
	if { $receive == "y" } {
		if { $arg == "" } {
			putquick "NOTICE $nick :you'd better try /msg $botnick recv help"
		}
		if { [lindex [split $arg] 0] == "help" } {
			putquick "NOTICE $nick :usage is /msg $botnick recv <value> on|off"
			putquick "NOTICE $nick :with <value> = pubm, act, nick, join, part, quit, topic, kick, mode"
			return 0
		} else {
			set change ">[lindex [split $arg] 0]"
			set proc_change "recv_[lindex [split $arg] 0]"
			if { [lindex [split $arg] 1] == "on" } {
				bind  bot - $change $proc_change
			} elseif { [lindex [split $arg] 1] == "off" } {
				unbind bot - $change $proc_change
			} else {
				putquick "NOTICE $nick :[lindex [split $arg] 1] is not a correct value, choose \002on\002 or \002off\002"
			}
		}
	} else {
		putquick "NOTICE $nick :reception is not activated, you can't change anything"
	}
}

####################################################
#
# Transmission
#

# proc used by all others for transmission
proc trans_bot { usercmd chan usernick text } {
	global eggdrops chans botnick
	set transmsg [concat $usercmd $usernick $text]
	set me [lsearch $eggdrops $botnick]
	if {$chan == [lindex $chans $me]} {
		putallbots $transmsg
	} else {
		return 0
	}
}

# proc transmission of pub (trans_pubm = y)
proc trans_pub {nick uhost hand chan text} {
	trans_bot ">pub" $chan $nick $text
}

# proc transmission of action (trans_act = y)
proc trans_act {nick uhost hand chan key text} {
	set arg [concat $key $text]
	trans_bot ">act" $chan $nick $arg
}

# proc transmission of nick changement
proc trans_nick {nick uhost hand chan newnick} {
	trans_bot ">nick" $chan $nick $newnick
}

# proc transmission of join
proc trans_join {nick uhost hand chan} {
	trans_bot ">join" $chan $chan $nick\($uhost\)
}

# proc transmission of part
proc trans_part {nick uhost hand chan text} {
	set arg [concat $chan $text]
	trans_bot ">part" $chan $nick $arg
}

# proc transmission of quit
proc trans_quit {nick host hand chan text} {
	trans_bot ">quit" $chan $nick $text
}

# proc transmission of topic changement
proc trans_topic {nick uhost hand chan topic} {
	set arg [concat $chan $topic]
	trans_bot ">topic" $chan $nick $arg
}

# proc transmission of kick
proc trans_kick {nick uhost hand chan victim reason} {
	set arg [concat $victim $chan $reason]
	trans_bot ">kick" $chan $nick $arg
}

# proc transmission of mode changement
proc trans_mode {nick uhost hand chan mc {victim ""}} {
	if {$victim != ""} {append mc " $victim" }
	set text [concat $nick $chan $mc]
	trans_bot ">mode" $chan $nick $text
}

####################################################
#
# Reception
#

# proc reception of pub
proc recv_pub {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :$speaker> [lrange $arg 1 end]"
	} else {
		return 0
	}
}

# proc reception of action
proc recv_act {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :* $speaker [lrange $arg 2 end]"
	} else {
		return 0
	}
}

# proc reception of nick changement
proc recv_nick {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :*** $speaker is now known as [lrange $arg 1 end]"
	} else {
		return 0
	}
}

# proc reception of join
proc recv_join {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 1] $him]
		putquick "PRIVMSG $recvchan :--> $speaker has joined channel [lindex [split $arg] 0]"
	} else {
		return 0
	}
}

# proc reception of part
proc recv_part {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :<-- $speaker has left channel [lindex [split $arg] 1] ([lrange $arg 2 end])"
	} else {
		return 0
	}
}

# proc reception of quit
proc recv_quit {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :-//- $speaker has quit ([lrange $arg 1 end])"
	} else {
		return 0
	}
}

# proc reception of topic changement
proc recv_topic {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 0] $him]
		putquick "PRIVMSG $recvchan :*** $speaker changes topic of [lindex [split $arg] 1] to '[lrange $arg 2 end]'"
	} else {
		return 0
	}
}
# proc reception of kick
proc recv_kick {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 1] $him]
		putquick "PRIVMSG $recvchan :*** $speaker has been kicked from [lindex [split $arg] 2] by [lindex [split $arg] 0]: [lrange $arg 3 end]"
	} else {
		return 0
	}
}

# proc reception of mode changement
proc recv_mode {frm_bot command arg} {
	global eggdrops chans hlnick botnick snet networks
	if {[set him [lsearch $eggdrops $frm_bot]] >= 0} {
		set me [lsearch $eggdrops $botnick]
		set recvchan [lindex $chans $me]
		set speaker [make_user [lindex [split $arg] 1] $him]
		putquick "PRIVMSG $recvchan :*** $speaker set mode [lrange $arg 2 end]"
	} else {
		return 0
	}
}

proc make_user { unick thenb } {
	global snet networks hlnick
	if { $snet == "y" } {
			set speaker [concat "$hlnick$unick (from [lindex $networks $thenb])$hlnick"]
		} else {
			set speaker $hlnick$unick$hlnick
		}
	return $speaker
}

######################################
# proc for helping
#

# proc status
proc help:status { nick host handle arg } {
	global trans_pub trans_act trans_nick trans_join trans_part trans_quit trans_topic trans_kick trans_mode recv_pub recv_act recv_nick recv_join recv_part recv_quit recv_topic recv_kick recv_mode hlnick transmit receive chan1 chan2
	putquick "PRIVMSG $nick :\002 Global status\002"
	putquick "PRIVMSG $nick :\037type\037   -- | trans -|- recept |"
	putquick "PRIVMSG $nick :global -- | -- $transmit -- | -- $receive -- |"
	putquick "PRIVMSG $nick :pub    -- | -- $trans_pub -- | -- $recv_pub -- |"
	putquick "PRIVMSG $nick :act    -- | -- $trans_act -- | -- $recv_act -- |"
	putquick "PRIVMSG $nick :nick   -- | -- $trans_nick -- | -- $recv_nick -- |"
	putquick "PRIVMSG $nick :join   -- | -- $trans_join -- | -- $recv_join -- |"
	putquick "PRIVMSG $nick :part   -- | -- $trans_part -- | -- $recv_part -- |"
	putquick "PRIVMSG $nick :quit   -- | -- $trans_quit -- | -- $recv_quit -- |"
	putquick "PRIVMSG $nick :topic  -- | -- $trans_topic -- | -- $recv_topic -- |"
	putquick "PRIVMSG $nick :kick   -- | -- $trans_kick -- | -- $recv_kick -- |"
	putquick "PRIVMSG $nick :mode   -- | -- $trans_mode -- | -- $recv_mode -- |"
	putquick "PRIVMSG $nick :nicks appears as $hlnick$nick$hlnick"
	putquick "PRIVMSG $nick :[lindex $chan1 0] is on [lindex $chan1 1] and transmit to [lindex $chan1 2]"
	putquick "PRIVMSG $nick :[lindex $chan2 0] is on [lindex $chan2 1] and transmit to [lindex $chan2 2]"
	putquick "PRIVMSG $nick :\002 END of STATUS"
}

# proc help
proc help:cmds { nick host handle arg } {
	global botnick
	putquick "NOTICE $nick :/msg $botnick trans <type> on|off to change the transmissions"
	putquick "NOTICE $nick :/msg $botnick recv <type> on|off ti change the receptions"
	putquick "NOTICE $nick :/msg $botnick rc.status to see my actual status"
	putquick "NOTICE $nick :/msg $botnick rc.help for this help"
	putquick "NOTICE $nick :/msg $botnick rc.light <bo|un|off> to bold, underline or no higlight"
	putquick "NOTICE $nick :/msg $botnick rc.net <yes|no> to show the network"
}

# End !
putlog "CHANRELAY 2.0 by \002CrazyCat\002 loaded - http://library.c-p-f.org"