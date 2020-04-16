#Complete Channel Administration Script (CCA Script)

set ccasfeatures {
" ---------------------------------------------------------------------------------------"
"       Complete Channel Administration Script v1.14  Written (from scratch) By Loki`"
"             This script includes support for:"
" ---------------------------------------------------------------------------------------"
"   Auto-Banning XDCC/TDCC Bots"
"   Monitoring and Auto-Banning Onjoins/Onparts (including virus DCC's)"
"   Monitoring for SPAM and Mass MSG'ing and Auto-Banning"
"   Auto-Banning of SPAM-type recruiters"
"   Auto-Banning of Join/Parts (2 min ban) to avoid floods and SPAM"
"   Auto-Kicking of people using annoying script ads in the channel"
"   Auto-Kicking of people listing websites in the channel"
"   Auto-Kicking of people using ! or @ triggers"
"   Auto-Kicking of people using excessive !!!!!!!!!!!'s and/or ??????????'s"
"   Auto-Kicking of people begging within 60 seconds of joining"
"   Auto-Sending of channel rules upon CTCP request"
"   Auto-Sending of customizable text upon CTCP request"
" ---------------------------------------------------------------------------------------"
"               Feature Updates:"
" ---------------------------------------------------------------------------------------"
"11/16/2001 - 1.12      Added the following:"
"                               Added a 5 strike ban warning system (allows up to 5 warnings b4 perm banning)"
"                               Auto-banning of IRC Flooders (allows 2 warnings b4 perm ban)"
"                               Refined the autoban criteria (you can edit this urself, but now the defaults are better)"
"                               Color (green) script logging (so you can pick it out faster)"
"                               2 timed channel messages (fully customizable)"
"                               Added support for ACTION script ad checking (/me checking)"
"11/21/2001 - 1.13      Added the following:"
"                               !override       - Allows you to reverse an auto permban"
"                               All auto permbans are now announced in a channel of ur choice (allowing for an override)"
"                               Added an advertising timer, meant for advertising in channels NOT occupied by other groups"
"                               Added auto-banning of join/parts to avoid flooding and SPAM (2 min ban)"
"11/24/2001 - 1.14      Added the following:"
"                               Fixed a MAJOR bug - Moved ccasbase.tcl load statement (prevented script from running)"
"                               Fixed a delayed banning issue (the mask was put as *!*@, not as the actual mask)"
"                               Added !ccasfeatures trigger (just in case you want to flaunt your new script) ;)"
"                               Added !ccashelp trigger - Lists currently supported triggers (for +o only)"
"12/10/2001 - 1.15      Added the following:"
"                               Added support for non op onjoin checking bot (it will msg other bots to ban)"
"12/19/2001 - 2.0       Added the Following:"
"                               Added non-op support for onjoin virus sends"
"                               Added MUCH better support for !unban trigger"
"                               Added a GLOBAL switch for !unban trigger (ie: !unban *!*@*blah.com global)"
"                               Changed the auto-permban to use a global ban instead of a channel ban"
"12/21/2001 - 2.01      Added the following:"
"                               Changed onpart banning to not have every bot needlessly perm-ban the same guy"
}

set triggerhelp {
"---------------------------------------------------------------------------------------"
"               Basic channel OP triggers support:"
"---------------------------------------------------------------------------------------"
"  Perm Banning:"
"       !ban <nick> [reason]"
"       !perm <nick> [reason]"
"       !ban <hostmask> [reason]"
"       !perm <hostmask> [reason]"
"---------------------------------------------------------------------------------------"
"  Kick/Banning (60min ban):"
"       !kb <nick> [reason]"
"---------------------------------------------------------------------------------------"
"  Kicking:"
"       !k <nick> [reason]"
"       !kick <nick> [reason]"
"---------------------------------------------------------------------------------------"
"  Unbanning of both channel and/or global bans:"
"       !unban <hostmask> [global]"
"---------------------------------------------------------------------------------------"
"               User Maintenance:"
"---------------------------------------------------------------------------------------"
"       !addserv <nick>         - Adds a user with +v flags (meant for FTP Advertisers)"
"       !addbot <nick>          - Adds a user with +vf flags (meant for sitebots)"
"       !addop <nick> [global]  - Adds a user with +opf flags (meant for new OPs)"
"---------------------------------------------------------------------------------------"
"       !delserv <nick>         - Removes +v ppl from the bot (essentially the same as !deluser)"
"---------------------------------------------------------------------------------------"
"       !deluser <nick>         - Removes users from the bot (essentially the same as !delserv)"
"---------------------------------------------------------------------------------------"
"       !chattr <nick> <flags>  - Changes users flags"
"       !chpass <nick>          - Resets password to nothing, and msg's the user to set a new one"
"       !addhost <nick> [host]  - Adds user's current host to the bot (must have same nick)"
"---------------------------------------------------------------------------------------"
"               Misc. Triggers:"
"---------------------------------------------------------------------------------------"
"       !override               - Overrides the most recent Auto Perm-Ban"
""
" Created by Loki` (#FTP4Warez on EFNet)"
}

#Version History:
#
#10/02/2001 - 1.0       Initial Release
#10/05/2001 - 1.1b      Added the following:
#                               !addbot <nick>          - Adds a user with +vf flags (meant for sitebots)
#                               !chattr <nick> <flags>  - Changes users flags
#                               !chpass <nick>          - Resets password to nothing, and msg's the user to set a new one
#                               !addhost <nick> [host]  - Adds user's current host to the bot (must have same nick)
#10/21/2001 - 1.1       Redesigned to work completely within netset.tcl (NetBots.TCL is a must.. get it!)
#11/16/2001 - 1.12      Added the following:
#                               Added a 5 strike ban warning system (allows up to 5 warnings b4 perm banning)
#                               Auto-banning of IRC Flooders (allows 2 warnings b4 perm ban)
#                               Refined the autoban criteria (you can edit this urself, but now the defaults are better)
#                               Color (green) script logging (so you can pick it out faster)
#                               2 timed channel messages (fully customizable)
#                               Added support for ACTION script ad checking (/me checking)
#11/21/2001 - 1.13      Added   !override               - Allows you to reverse an auto permban
#                               All auto permbans are now announced in a channel of ur choice (allowing for an override)
#                               Added an advertising timer, meant for advertising in channels NOT occupied by other groups
#                               Added auto-banning of join/parts to avoid flooding and SPAM (2 min ban)
#11/24/2001 - 1.14      Added the following:
#                               Fixed a MAJOR bug - Moved ccasbase.tcl load statement (prevented script from running)
#                               Fixed a delayed banning issue (the mask was put as *!*@, not as the actual mask)
#                               Added !ccasfeatures trigger (just in case you want to flaunt your new script) ;)
#                               Added !ccashelp trigger - Lists currently supported triggers (for +o only)
#12/10/2001 - 1.15      Added the following:
#                               Added support for non op onjoin checking bot (it will msg other bots to ban)
#12/19/2001 - 2.0       Added the Following:
#                               Added non-op support for onjoin virus sends
#                               Added MUCH better support for !unban trigger
#                               Added a GLOBAL switch for !unban trigger (ie: !unban *!*@*blah.com global)
#                               Changed the auto-permban to use a global ban instead of a channel ban
#12/21/2001 - 2.01      Added the following:
#                               Changed onpart banning to not have every bot needlessly perm-ban the same guy
#                               Fixed a bug in the non-op banning proc.. Under certain circumstances it would error out

#------------------------------------------------------------------------------------------------------------
# The following	conversion makes sure that all the characters in the approved channel list
# are lower case.
#------------------------------------------------------------------------------------------------------------
set approved_chans [string tolower $approved_chans]

#------------------------------------------------------------------------------------------------------------
# The following two if{} statements make sure that there is a space at the beginning and 
# end of the approved channel list.
#------------------------------------------------------------------------------------------------------------
if {[string index $approved_chans 0] != " "} {
   set approved_chans " $approved_chans"
}
if {[string index $approved_chans [expr [string length $approved_chans]-1]] != " "} {
   set approved_chans "$approved_chans "
}

#------------------------------------------------------------------------------------------------------------
# The following conversion makes sure that all the characters in the spamcheck channel list
# are lower case.
#------------------------------------------------------------------------------------------------------------
set spamcheck_chans [string tolower $spamcheck_chans]

#------------------------------------------------------------------------------------------------------------
# The following two if{} statements make sure that there is a space at the beginning and 
# end of the spamcheck channel list.
#------------------------------------------------------------------------------------------------------------
if {[string index $spamcheck_chans 0] != " "} {
   set spamcheck_chans " $spamcheck_chans"
}
if {[string index $spamcheck_chans [expr [string length $spamcheck_chans]-1]] != " "} {
   set spamcheck_chans "$spamcheck_chans "
}

#------------------------------------------------------------------------------------------------------------
# The following proc makes a proper hostmask for use with banning, etc..
#------------------------------------------------------------------------------------------------------------
proc getmask {nick chan} {
  set mask [string trimleft [maskhost [getchanhost $nick $chan]] *!]
  set mask *!*$mask
  return $mask
}

#------------------------------------------------------------------------------------------------------------
# The following	proc makes a proper hostmask for use with banning, etc..
#------------------------------------------------------------------------------------------------------------
proc warnban {nick mask chan bantime warn rest} {
  global color1loki rulebreaker pbannounce
        if {$warn == 0} { set rulebreaker($mask) "0 [unixtime]" }
        if {![info exists rulebreaker($mask)]} {
                set rulebreaker($mask) "$warn [unixtime]"
        }
        if {[expr [unixtime] - [lindex $rulebreaker($mask) 1]] > 259200} {
                set rulebreaker($mask) "$warn [unixtime]"
        }
        if {[lindex $rulebreaker($mask) 0] < 1} {
                foreach activeban [banlist $chan] {
                        if {[lindex $activeban 0] == $mask} {return 1}
                }
                puthelp "PRIVMSG $nick :$color1loki You have triggered an AutoBan: $rest \(Perm Ban\)"
                putlog "\0033 4 $nick \($mask\) has been Auto Perm Banned"
                puthelp "PRIVMSG $pbannounce :4 $nick \($mask\) has been Auto Perm Banned from $chan \(5 Reason: $rest\) Type !override to undo"
                set rulebreaker(overmask) "$mask"
                newban $mask "Autoban" $rest 20000
                unset rulebreaker($mask)
                putkick $chan $nick "AutoBan: $rest \(Perm Banned\)"
        } elseif {[lindex $rulebreaker($mask) 0] == 1} {
                foreach activeban [banlist $chan] {
                        if {[lindex $activeban 0] == $mask} {
                                set rulebreaker($mask) "[expr [lindex $rulebreaker($mask) 0] - 1] [lindex $rulebreaker($mask) 1]"
                                return 1
                        }
                }
                if {$bantime != 0} {
                        puthelp "PRIVMSG $nick :$color1loki You have triggered an AutoBan: $rest \[Last Warning\] \($bantime min ban\)"
                        newchanban $chan $mask "Autoban" $rest $bantime
                }
                set rulebreaker($mask) "[expr [lindex $rulebreaker($mask) 0] - 1] [lindex $rulebreaker($mask) 1]"
                putkick $chan $nick "AutoBan: $rest !-Last Warning-! \($bantime min ban\)"
        } else {
                foreach activeban [banlist $chan] {
                        if {[lindex $activeban 0] == $mask} {
                                set rulebreaker($mask) "[expr [lindex $rulebreaker($mask) 0] - 1] [lindex $rulebreaker($mask) 1]"
                                return 1
                        }
                }
                if {$bantime != 0} {
                        puthelp "PRIVMSG $nick :$color1loki You have triggered an AutoBan: $rest \[1st Warning\] \($bantime min ban\)"
                        newchanban $chan $mask "Autoban" $rest $bantime
                }
                set rulebreaker($mask) "[expr [lindex $rulebreaker($mask) 0] - 1] [lindex $rulebreaker($mask) 1]"
                putkick $chan $nick "AutoBan: $rest !-Warning-! \($bantime min ban\)"
        }
return 1
}

#------------------------------------------------------------------------------------------------------------
# The following processes the !override trigger command
#------------------------------------------------------------------------------------------------------------
  bind pub o "!override" pboverride

proc pboverride {nick uhost hand chan rest} {
global rulebreaker pbannounce
        if {$rest != ""} {return 0}
        if {[lsearch -exact $pbannounce [string tolower $chan]] < 0} {return 0}
        if {[info exists rulebreaker(overmask)] == 0} {
                return 0
        }
        if {[killban $rulebreaker(overmask)] == 1} {
                puthelp "PRIVMSG $chan :\0035 Auto PermBan successfully overridden"
                unset rulebreaker(overmask)
                putlog "\0035 $nick is overriding the last permban \($rulebreaker(overmask)\)"
        } else {
                puthelp "PRIVMSG $chan :\0035 Error in override, please remove manually"
                return 0
        }
}

#------------------------------------------------------------------------------------------------------------
# The following processes the onjoin bans for onjoin detection bots (if any)
#------------------------------------------------------------------------------------------------------------
bind bot - "ojdetected" ojbotmsgban

proc ojbotmsgban {frombot trigger rest} {
        set nick [lindex $rest 0]
        if {[lindex $rest 2] == "unknown"} {
                foreach chan [channels] {
                        if [onchan $nick $chan] {
                                if [isop $nick $chan] {return 0}
                                set mask [getmask $nick $chan]
                                if [isban $mask] {return 0}
                                if [isban $mask $chan] {return 0}
                                if [botisop $chan] {
                                        putlog "\0033 Banning $nick because $frombot asked me to"
                                        warnban $nick $mask $chan [lindex $rest 3] [lindex $rest 4] [lrange $rest 5 end]
                                        return 1
                                }
                        }
                }
                putlog "$frombot asked me to find and ban $nick, but I don't see him anywhere"
                return 1
        }
        putlog "\0033 Banning $nick because $frombot asked me to"
        warnban [lindex $rest 0] [lindex $rest 1] [lindex $rest 2] [lindex $rest 3] [lindex $rest 4] [lrange $rest 5 end]
        return 1
}


putlog "\0033 CCA Script v2.01 (Written by Loki` #FTP4Warez) Loaded Succesfully"
