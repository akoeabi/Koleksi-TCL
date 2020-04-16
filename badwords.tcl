# description: Kicks/Bans people who say bad words. Words/pharses are stored in a file. Op protect is allowed. You can add/del/list words/pharses via priv msg. You don't need to rehash/restart your bot. You can define ban duration time etc. Script is very simple to use.

# Author: tomekk 
# e-mail:  tomekk/@/oswiecim/./eu/./org 
# home page: http://tomekk.oswiecim.eu.org/ 
# 
# Version 0.9
# 
# This file is Copyrighted under the GNU Public License. 
# http://www.gnu.org/copyleft/gpl.html 

# added: now addr/delr commands are working for pharses
# fixed: some code fixes

# YOU HAVE TO REWRITE YOUR DATABASE, BECAUSE OLDER DB VERSIONS WERE WITHOUT REGEXPES ! (0.7 and older)
# OLD FORMAT: 'WORD', NEW FORMAT WITH REGS: '* WORD *', WITHOUT THIS CHANGE THIS WORD WILL MATCH ONLY 'WORD' AT THE BEGINNING OF TEXT LINE, ** SEE EXAMPLES ***

# old db format:
# word1
# word2
# in new if you want the same effect, will be:
# word
# word2
# word *
# word2 *
# * word
# * word2
# * word1 *
# * word2 *

# if you have many words, and you don't want to rewrite them all again you can use shell tcl converter from: http://forum.egghelp.org/viewtopic.php?t=16460&start=15
# or, you can delete whole script dir and restart your bot, script will make new, clean files, but after you have to add all of your 'words' again

# some examples:
	# you want to punish users for word 'test', no matter on which place in text line
	# /msg <botnick> bword add *test*, this will match: test, text test, test text, text test text, texttesttext

	# you want to punish users for single word 'test'
	# /msg <botnick> bword addr test, this will match: test, text test, test text, text test text

	# you want to punish users for 'test' and some text after it
	# /msg <botnick> bword add test *, this will match: test text

	# you want to punish users for pharse which starts with 'test' and ends with 'cool'
	# /msg <botnick> bword add test*cool, this will match: test text cool, testcool

	# you want to punish users for 'test', 'tess', 'tesx', 'tesa'
	# /msg <botnick> bword add test?, this will match: test, tess, tesx, tesa, but no tes - ? means any char, not null

	# you want to punish users for pharse witch starts with 'test', ends with 'cool' and with '*' between
	# /msg <botnick> bword add test*\**cool, this will match: test text* cool, test*cool, test *text cool, test text*text cool,  etc.

	# you want to punish users for 'hello?'
	# /msg <botnick> bword add hello\?, this will match: hello?
	
	# you want punish users for 'test<single_number>test'
	# /msg <botnick> bword add test[0-9]test, this will match: test0test, test1test, test2test etc.

	# of course you can make more complicated sequences, like:
	# /msg <botnick> bword add hello?*here*, this will match: hello? some1 here?, hello? tom are u here?????, hello! hello! are u here????

	# etc etc, i think this is simple ;)
	# remember, if you want to use chars: * ? [ ] \ like non special chars, you need to escape them with \, like: \* \? \[ \] \\

# USE '/msg <botnick> bword' for more information

# check for 'badwords' on channels:
set bdw_channels {#ALbaChat #Ndihme}

# host allowed to use 'bword' commands
set bdw_hosts {EviL@Zemra-62A8FC95.hsd1.fl.comcast.net *EviL@*.bigpond.net.au some@zemra.org}

# sets ban type 
# 1)  *!*@*.domain.com 
# 2)  *!*@some.domain.com 
# 3)  *nick*!*@some.domain.com 
# 4)  *!*ident*@some.domain.com 
set btype 4 

# 1 - protect ops, 0 - don't
# 1 means that user with +o can use 'badwords'
set protectops 1

# 1 - enable ban, 0 - disable ban (just kick after bad word)
set want_ban 1

# wait 'waitb' times before ban, works only when want_ban is set to 1
# if you want to ban user after one bad word, set 'waitb' to 0 
set waitb 0

# 'waitb' info type, works only when want_ban is set to 1
# 1 - kick after bad word and ban after 'waitb' times 
# 2 - write message after bad word to the nick, 'nick: message' and ban after 'waitb' times 
# 3 - do nothing, just ban after 'waitb' times
set waitb_type 2

# kick message.
set kmsg "bad word! - kick"

# ban message.
set bmsg "banned!"

# if you set 'waitb' to 2, then here is a option to set this message 
set waitb_message "Kujdes fjalorin - Watch your language!" 

# ban duration time (minutes) 
# 0 - infinite 
set ban_duration 0

# "offence" duration time, how long bot should remember last bad word time (minutes) 
# 0 - infinite 
set offence_duration 0 

# reload words/pharses db every x minutes (this means that the new word will work after X minutes)
set reload_words_db_every 2

# dirs and files, better leave it as it is ;)
# base directory 
set dirname "badwords.db" 

# users directory 
set usersdir "$dirname/lusers" 

# banned hosts file 
set banned_hosts "$dirname/bndhosts" 

# dbase with bad words 
set bw_dbase "$dirname/words_bank.db" 

##################################################################
if {[file exists $dirname] == 0} {
	file mkdir $dirname
	set crtdb [open $bw_dbase a+]
        puts $crtdb "fuck\nshit\n* fuck *\n* shit *\nfuck *\nshit *\n* shit\n* fuck"
        close $crtdb
}

if {[file exists $usersdir] == 0} {
	file mkdir $usersdir
}

proc create_db { dbname definfo } {
	if {[file exists $dbname] == 0} {
		set crtdb [open $dbname a+]
		puts $crtdb "$definfo"
		close $crtdb
	}
}

proc readdb { rdb } {
	set fs_open [open $rdb r]
	gets $fs_open dbout
	close $fs_open

	return $dbout
}

proc get_all_bwords { } {
	global bw_dbase

	set bf [open $bw_dbase r]
	set allwords [read $bf]
	close $bf

	set bw_split [split $allwords "\n"]
        return $bw_split
}

proc add_new_bword { bword } {
	global bw_dbase

	set bfile_handle [open $bw_dbase a]
	puts $bfile_handle "$bword"
	close $bfile_handle
}

proc add_new_bnd_host { new_host  } {
	global banned_hosts

	set bnd_hosts [open $banned_hosts a]
	puts $bnd_hosts $new_host
	close $bnd_hosts
}

proc delete_bword { dbword {dlall 0}} {
	global bw_dbase

	set old_bwdb [get_all_bwords]
	
	set file_tow [open $bw_dbase w]
	
	if {$dlall == 0} {
		foreach chk_bw $old_bwdb {
			if {$chk_bw != $dbword} {
				if {$chk_bw != ""} {
					puts $file_tow $chk_bw
				}
			}
		}
	}
	close $file_tow
}

proc check_bw_exist { chword } {
	set old_chbwdb [get_all_bwords]

        set bw_exist 0

	foreach check_bword $old_chbwdb {
		if {[string match $chword $check_bword]} {
			 set bw_exist 1
		 }
	}
	return $bw_exist
}

proc ban_checker_timer { } {
	ban_checker

	if {[string match *ban_checker_timer* [utimers]] != 1} {
		utimer 20 ban_checker_timer
	}
}

proc words_reload_timer { } {
	global nasty_words reload_words_db_every

	set nasty_words [get_all_bwords]

	putlog "tkbadword.tcl - reloading words db"

	if {[string match *words_reload_timer* [timers]] != 1} {
		timer $reload_words_db_every words_reload_timer
	}
}

set nasty_words [get_all_bwords]

bind pubm - "*" word_fct
bind msgm - "*" bpmsg_fct

proc word_fct { nick uhost hand chan arg } {
  	global botnick protectops usersdir waitb waitb_type waitb_message want_ban kmsg bmsg offence_duration ban_duration bdw_channels nasty_words

	if {[lsearch $bdw_channels $chan] == -1} {
		return                                
	} 

	if {$protectops == 1} {
		if {[isop $nick $chan] == 1} {
			return
		}
	}	

	set kill 0

	set ban_status 0

	set bb_msg $kmsg

	if {[isop $botnick $chan]} {
		foreach i [string tolower $nasty_words] {
			if {$i != ""} {
				if {[string match $i [string tolower $arg]]} {
					set kill 1
				}
			}
		}
		
		if {$kill == 1} {
			if {$want_ban == 1} {
				set time_in_seconds [clock seconds]
				set user_ban_mask [banmask $uhost $nick]

				if {$waitb == 0} {
					putquick "MODE $chan +b $user_ban_mask"

					if {$ban_duration > 0}  {
						add_new_bnd_host "$chan&$user_ban_mask&$time_in_seconds"
					}

					set bb_msg $bmsg

					putkick $chan $nick $bb_msg

					set ban_status 1
				} {
					if {[file exists $usersdir/$nick] == 0} {
						create_db "$usersdir/$nick" "$uhost&1&$time_in_seconds"
					} { 
						set each_user_data [split [readdb "$usersdir/$nick"] "&"]
						set ident [lindex $each_user_data 0]
						set times [lindex $each_user_data 1]
						set first_time [lindex $each_user_data 2]

						if {([expr $time_in_seconds - $first_time] >= [expr $offence_duration * 60]) && ($offence_duration > 0)} {
							file delete $usersdir/$nick
							create_db "$usersdir/$nick" "$uhost&1&$time_in_seconds"
						} {
							file delete $usersdir/$nick

							set overall [expr $times + 1]

							create_db "$usersdir/$nick" "$ident&$overall&$first_time"
							set ident [lindex [split [readdb "$usersdir/$nick"] "&"] 0]

							if {$uhost == $ident} {				
								if {$overall >= $waitb} {
									putquick "MODE $chan +b $user_ban_mask"

									if {$ban_duration > 0} {
										add_new_bnd_host "$chan&$user_ban_mask&$time_in_seconds"
									}

									file delete $usersdir/$nick
									set bb_msg $bmsg

									putkick $chan $nick $bb_msg

									set ban_status 1
								}
							} { 
								file delete $usersdir/$nick
								create_db "$usersdir/$nick" "$uhost&1"
							}
						}	
					}

					if {($ban_status == 0) && ($waitb_type < 3)} {
						if {$waitb_type == 1} {
							putkick $chan $nick $bb_msg
						} {
							putquick "PRIVMSG $chan :$nick: $waitb_message"
						}
					}
				}
			} {
				putkick $chan $nick $bb_msg
			}
		}
	}
}

proc bpmsg_fct { nick uhost hand arg } {
	global bdw_hosts

	set check_host 0

	foreach def_host $bdw_hosts {
		if {$def_host != ""} {
			if {[string match $def_host $uhost]} {
				set check_host 1
				break
			}
		}
	}

	if {$check_host == 0} {
		return
	}

	set all_bargs [split [string tolower $arg]]
	set bargs_opt1 [lindex $all_bargs 0]
	set bargs_opt2 [lindex $all_bargs 1]
	set bargs_opt_newords [join [lrange $all_bargs 2 end]]

	set bw_list [list]
	
	# yeah, can be switch, who cares! ;-)
	if {$bargs_opt1 == "bword"} {
		if {$bargs_opt2 != ""} {
			if {$bargs_opt2 == "add"} {
				if {$bargs_opt_newords != ""} {
					if {[check_bw_exist $bargs_opt_newords]} {
						putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' allready exists"
					} {
						putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' has been added"
						add_new_bword $bargs_opt_newords
					}
				} {
					putquick "PRIVMSG $nick :use: /msg <botnick> bword add <word/pharse>"
				}
			} elseif {$bargs_opt2 == "addr"} {
				if {$bargs_opt_newords != ""} {
					if {[check_bw_exist $bargs_opt_newords]} {
						putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' allready exists"
					} {
						putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' with regexps has been added"
						add_new_bword $bargs_opt_newords
						add_new_bword "$bargs_opt_newords *"
						add_new_bword "* $bargs_opt_newords"
						add_new_bword "* $bargs_opt_newords *"
					}
				} {
					putquick "PRIVMSG $nick :use: /msg <botnick> bword addr <word>"
				}
			} elseif {$bargs_opt2 == "list"} {
				set list_bwords [get_all_bwords]

				if {$list_bwords != ""} {
					foreach bw_word $list_bwords {
						lappend bw_list "$bw_word"
					}
					putquick "PRIVMSG $nick :[join $bw_list ", "]"
				} else {
					putquick "PRIVMSG $nick :db is empty"
				}
			} elseif {$bargs_opt2 == "delr"} {
				if {$bargs_opt_newords != ""} {
					if {[check_bw_exist $bargs_opt_newords]} {
						delete_bword $bargs_opt_newords
						delete_bword "$bargs_opt_newords *"
						delete_bword "* $bargs_opt_newords"
						delete_bword "* $bargs_opt_newords *"
						putquick "PRIVMSG $nick :word: '$bargs_opt_newords' with regexps has been deleted"
					} {
						putquick "PRIVMSG $nick :word: '$bargs_opt_newords' not found"
					}
				} {
					putquick "PRIVMSG $nick :use: /msg <botnick> bword delr <word>"
				}
			} elseif {$bargs_opt2 == "del"} {
				if {$bargs_opt_newords != ""} {
					if {$bargs_opt_newords == "delall"} {
						delete_bword 0 1
						putquick "PRIVMSG $nick :all words/pharses have been deleted"
					} {
						if {[check_bw_exist $bargs_opt_newords]} {
							delete_bword $bargs_opt_newords
							putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' has been deleted"
						} {
							putquick "PRIVMSG $nick :word/pharse: '$bargs_opt_newords' not found"
						}
					}
				} {
					putquick "PRIVMSG $nick :use: /msg <botnick> bword del <word/pharse>"
					putquick "PRIVMSG $nick :if you want to delete all words use: /msg <botnick> del delall"
				}
			}
				
		} {
			putquick "PRIVMSG $nick :use: /msg <botnick> bword <add|addr|del|delr|list>"
		}
	}
}

proc banmask { host nick } {
	global btype

	switch -- $btype {

		1 {
			set mask "*!*@[lindex [split [maskhost $host] "@"] 1]"
		  }

                2 {
			set mask "*!*@[lindex [split $host @] 1]"
                  }

                3 {
  			set mask "*$nick*!*@[lindex [split $host "@"] 1]"
	          }

		4 {
		        set mask "*!*[lindex [split $host "@"] 0]*@[lindex [split $host "@"] 1]"
		  }

		  return $mask
       }
}

proc ban_checker { } {
	global banned_hosts ban_duration

	if {([file exists $banned_hosts]) && ($ban_duration > 0)} {
		set hosts_hand [open $banned_hosts r]
		set give_me_hosts [read $hosts_hand]
		close $hosts_hand

		set time_in_seconds [clock seconds]

		set rewrite_hosts_hand [open $banned_hosts w]
		foreach banned_h [split $give_me_hosts "\n"] {
			if {$banned_h != ""} {
				set split_banned_h [split $banned_h "&"]
				set host_ban_chan [lindex $split_banned_h 0]
				set host_ban_mask [lindex $split_banned_h 1]
				set need_ban_time [lindex $split_banned_h 2]
	
				if {[expr $time_in_seconds - $need_ban_time] >= [expr $ban_duration * 60]} {
					putquick "MODE $host_ban_chan -b $host_ban_mask"
				} {
					puts $rewrite_hosts_hand "$host_ban_chan&$host_ban_mask&$need_ban_time"
				}
			}
		}
		close $rewrite_hosts_hand
	}
}

if {[string match *ban_checker_timer* [utimers]] != 1} {
	utimer 20 ban_checker_timer
}

if {[string match *words_reload_timer* [timers]] != 1} {
	timer $reload_words_db_every words_reload_timer
}

putlog "tkbadword.tcl ver 0.9 by tomekk loaded"
