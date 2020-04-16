set home(dir) "vipcheck/vipdata"
set home(designdir) "vipcheck/design"
set home(vipchanconfig) "vipcheck/vipchanconfig"
set home(vipidfile) "vipcheck/vipid"
set home(vipbantime) 60
set home(vipbanmsg) "You are known as vip in %chan. You are now welcome here. Banned for $home(vipbantime) min."

setudef flag vipop
setudef flag vipvoice
setudef flag vipban

bind JOIN - * check:vip:on:join
bind PUB n|m ~vip public:vip:commands

proc check:vip:on:join {nick host hand chan} {
	global botnick home
	if {![botisop $chan] || ($nick == $botnick) || ![file exists $home(dir).[chan:cleaner $chan]]} {
		return 0
	}
	bind raw - "319" get:chans
	set ::vip($nick) "[chan:cleaner $chan]"
	set ::viphost "$host"
	putquick "WHOIS $nick"
} 

proc get:chans {from key text} {
	regexp -all -nocase {^[^\s]+[\s]([^\s]+)[\s]:(.*)} $text temp nick data
	if {[info exist ::vip($nick)]} {
		set vipchans($::vip($nick)) "[join [get:vip:chans $nick]]"
		foreach x [split $data] { 
			if {[lsearch -exact [split $vipchans($::vip($nick))] [string tolower [string range $x 1 end]]] != -1 && [string index $x 0] == "@"} { 
				if {[onchan $nick $::vip($nick)]} {
					set vip(channel) [string range $x 1 end]
					if {[botisop $::vip($nick)]} {
						if {[channel get $::vip($nick) vipban] == 0} {
							if {![isop $nick $::vip($nick)]} {
								if {[channel get $::vip($nick) vipop] == 1} {
									putquick "MODE $::vip($nick) +o $nick"
								}
							}
							if {![isvoice $nick $::vip($nick)]} {
								if {[channel get $::vip($nick) vipvoice] == 1} {
									putquick "MODE $::vip($nick) +v $nick"
								}
							}
							set design [getvipdesign [string tolower $::vip($nick)]]
							incr:vip:id
							if {$design != 0} {
								set id [get:vip:id]
								regsub -all {:nick:} $design $nick design
								regsub -all {:host:} $design $::viphost design
								regsub -all {:chan:} $design $vip(channel) design
								regsub -all {:time:} $design [lindex [ctime [unixtime]] 3] design
								regsub -all {:channels:} $design [llength [lrange $text 2 end]] design
								regsub -all {:id:} $design $id design
								putquick "PRIVMSG $::vip($nick) :$design"
							} else {
								putquick "PRIVMSG $::vip($nick) :\0035,1±\0030 \002$nick\002 p\037G\037 de\037te\037c\037t\037ed and \037op\037ped \0035,1±\0030 \002\037H\037\002o\037s\037t: \002$::viphost\002 \0035,1±\0030 \002S\002ta\037t\037us: @$vip(channel) \0035,1±\003"
							}
							flushmode $::vip($nick)
							unset ::vip($nick)
							unbind raw - "319" get:chans
							return 0
						} else {
							if {![matchattr [nick2hand $nick] m|m $::vip($nick)]} {
								set reason $::home(vipbanmsg)
								regsub -all {%chan} $reason $vip(channel) reason
								regsub -all {%nick} $reason $nick reason
								regsub -all {%host} $reason [getchanhost $nick $::vip($nick)] reason
								regsub -all {%time} $reason [lindex [ctime [unixtime]] 3] reason
								regsub -all {%channels} $reason [llength [lrange $text 2 end]] reason
								newchanban $::vip($nick) *![getchanhost $nick $::vip($nick)] "vipban" $reason none
							}
						}
					} else {
		      			unset ::vip($nick)
						unbind raw - "319" get:chans
						return 0
		      		}
	      			return 0
	      		} else {
	      			unset ::vip($nick)
					unbind raw - "319" get:chans
					return 0
				}
			} 
		}
	}
	flushmode $::vip($nick)
	unset ::vip($nick)
	unbind raw - "319" get:chans
} 

# hi slug :)
proc chan:cleaner {i} {
	regsub -all -- \\\\ $i \\\\\\\\ i
	regsub -all -- \\\[ $i \\\\\[ i
	regsub -all -- \\\] $i \\\\\] i
	regsub -all -- \\\} $i \\\\\} i
	regsub -all -- \\\{ $i \\\\\{ i
	regsub -all -- \\\" $i \\\\\" i
	return $i
}

proc public:vip:commands { nick host hand chan text } {
 global home lastbind
  set vip(option) "[string tolower [lindex [split $text] 0]]"
  set vip(entry) "[string tolower [lindex [join $text] 1]]"
  if {[string index $vip(entry) 0] != "#"} {set vip(entry) "#$vip(entry)"}
  set ::vip($nick) "[chan:cleaner $chan]"
  if {![file exists $home(dir).$::vip($nick)]} {
    set vip(channel) "" 
  } else {
    set vip(channel) "[join [get:vip:chans $nick]]"
  }
  switch $vip(option) {
    add {
      if {[llength $vip(channel)] > 499} {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 \002\037S\002o\037rry the \002\037V\037\002ip-list for \002$chan\002 is full. \002\037Y\037\002ou can'\037t\037 add \037\002m\002\037ore Vip chan's. \0035,1±\0030" 
        return 0
      }
      if {[lsearch -exact [split $vip(channel)] $vip(entry)] != -1} {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 Channel already listed. \0035,1±\0030" 
      } else {
	  putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 \02\037Y\02\037eah successfully added \02\037$vip(entry)\02\037 to $chan `s VIP list. \0035,1±\0030" 
        write:vip:chans add $vip(entry) $::vip($nick)
      }
    }
    del {        
      if {[lsearch -exact [split $vip(channel)] $vip(entry)] != -1} {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 \02\037D\02\037one. It`s  removed - \02\037$vip(entry)\02\0035,1±\0030 " 
        write:vip:chans del $vip(entry) $::vip($nick)
      } else {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 \02I\02\037 haven`t \02\037$vip(entry)\02\037 in m\02\037Y\02\037 databse. \0035,1±\003" 
      }
    }
    list {        
      if {[llength $vip(channel)] == "0"} {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 No chans for $chan added. \0035,1±\0030"
      } else {
        putserv "PRIVMSG $::vip($nick) :\0035,1±\0030 \02\037V\02\037IP \037L\037ist for \02$chan\02 - \[[llength $vip(channel)]/500\] \0035,1±\0030"
        set count 0 ; set messages 1 ; set curmessages 1
        foreach added $vip(channel) {
          lappend chans($messages) $added
          incr count
          if {$count == 10} {
            incr messages ; set count 0
          }
        }
        while {$curmessages <= $messages} {
          if {[info exists chans($curmessages)]} {
            puthelp "Privmsg $::vip($nick) :\0035,1±\0030 [join $chans($curmessages)] \0035,1±\0030"
            unset chans($curmessages)
          }
          incr curmessages
        }
        puthelp "Privmsg $::vip($nick) :\0035,1±\0030 \037 E\037nd of \037L\037ist \0035,1±\0030"
      }             
    }
    design {
	set design [join [lrange $text 1 end]]
	if {$design != ""} {
		setvipdesign $chan $design
		putserv "PRIVMSG $chan :Design wurde auf: [unformat $design] geändert."
	} else {
		putserv "NOTICE $nick :Syntax: $::lastbind design <text> | variablen: :nick: :chan: :host: :time: :channels:"
	}
    }
    default {
      putserv "NOTICE $nick :Syntax: %vip <add|del|list> ?channel?"
    }
  }
}

proc write:vip:config {chan config1 config2} {
	global home
	set chan [string tolower $chan]
	set done 0
	if {[file exists $home(vipchanconfig)]} {
		set fr [open $home(vipchanconfig) r]
		set fw [open $home(vipchanconfig).save a]
		set text [read $fr]
		foreach line [split $text "\n"] {
			if {$line != ""} {
				if {[decyrpt split [lindex $line 0]] != $chan} {
					puts $fw $line
				} else {
					puts $fw "[lindex $line 0] $config1 $config2"
					set done 1
				}
			}
		}
		if {$done == 0} {
			puts $fw "[encrypt split $chan] $config1 $config2"
			set done 1
		}
		close $fw
		close $fr
		file delete $home(vipchanconfig)
		file rename $home(vipchanconfig).save $home(vipchanconfig)
		exec chmod 777 $home(vipchanconfig)
		return $done
	} else {
		set fw [open $home(vipchanconfig) w]
		puts $fw "[encrypt split $chan] $config1 $config2"
		set done 1
		return $done
	 }
}

proc get:vip:config {chan} {
	global home
	set config 0
	set chan [string tolower $chan]
	if {[file exists $home(vipchanconfig)]} {
		set fr [open $home(vipchanconfig) r]
		set text [read $fr]
		foreach line [split $text "\n"] {
			if {[decrypt split [lindex $line 0]] == $chan} {
				set config [lrange $line 1 end]
			}
		}
		close $fr
	}
	return $config
}

proc write:vip:chans { args } {
global home
  set option [lindex $args 0]
  set channel [lindex $args 1]
  set open [lindex $args 2]
  if {![file exists $home(dir).$open]} { 
    set sfile [open $home(dir).$open w] 
    puts -nonewline $sfile ""
    close $sfile
  }
  set file [open $home(dir).$open r]
  set vip(chans) ""
  switch $option {
    add {
      while {![eof $file]} {
        set get [gets $file]
        if {$get != ""} {lappend vip(chans) $get}
      }
      close $file
      lappend vip(chans) [encrypt split $channel]
      set bc [open $home(dir).$open w+]
      foreach entrys $vip(chans) {
        puts $bc $entrys
      }
      close $bc
    }
    del {
      while {![eof $file]} {
        set get [gets $file]
        if {![string equal -nocase $channel [decrypt split [lindex [split $get] 0]]] && $get != ""} {lappend vip(chans) $get}
      }
      close $file
      set bc [open $home(dir).$open w+]
      foreach entrys $vip(chans) {
        puts $bc $entrys
      }
      close $bc
    }
  }
}

proc get:vip:chans {nick} {
 global home
  set vipchans($::vip($nick)) ""
  set rd [open $home(dir).$::vip($nick) r]
  while {![eof $rd]} {
    set dt [gets $rd]
    if {$dt != ""} {
	foreach d $dt {
		lappend vipchans($::vip($nick)) [decrypt split $d]
	}
    }
  }
  close $rd
  return $vipchans($::vip($nick))
}


proc setvipdesign {chan design} {
	global home
	set done 0
	set chan [string tolower $chan]
	if {[file exists $home(designdir)]} {
		set fr [open $home(designdir) r]
		set fw [open $home(designdir).save a]
		set text [read $fr]
		foreach line [split $text "\n"] {
			if {$line != ""} {
				if {[decrypt split [lindex $line 0]] != $chan} {
					puts $fw $line
				} else {
					puts $fw "[lindex $line 0] [encrypt split $design]"
					set done 1
				}
			}
		}
		if {$done == 0} {
			puts $fw "[encrypt split $chan] [encrypt split $design]"
			set done 1
		}
		close $fr
		close $fw
		file delete $home(designdir)
		file rename $home(designdir).save $home(designdir)
		exec chmod 777 $home(designdir)
		return 1
	} else {
		set fw [open $home(designdir) w]
		puts $fw "[encrypt split $chan] [encrypt split $design]"
		close $fw
		return 1
	}
}

proc getvipdesign {chan} {
	global home
	set chan [string tolower $chan]
	if {[file exists $home(designdir)]} {
		set fr [open $home(designdir) r]
		set text [read $fr]
		foreach line [split $text "\n"] {
			if {$line != ""} {
				if {[decrypt split [lindex $line 0]] == $chan} {
					close $fr
					return [join [decrypt split [lrange $line 1 end]]]
				}
			}
		}
		close $fr
		return 0
	}
}

proc unformat {text} {
	set i [regexp -all {\002} $text]
	set zahl [expr $i/2.0]
	if {[string match "*?.5" $zahl]} {
		append text "\002"	
	}
	set i [regexp -all {\037} $text]
	set zahl [expr $i/2.0]
	if {[string match "*?.5" $zahl]} {
		append text "\037"	
	}
	set i [regexp -all {\026} $text]
	set zahl [expr $i/2.0]
	if {[string match "*?.5" $zahl]} {
		append text "\026"	
	}
	if {[string match "*\003*" $text]} {
		return "$text\003"
	}
	return $text
}

proc incr:vip:id {} {
	global home
	if {[file exists $home(vipidfile)]} {
		set fr [open $home(vipidfile) r]
		gets $fr line
		set num $line
		close $fr
		set fw [open $home(vipidfile) w]
		puts $fw [expr $num +1]
		close $fw
	} else {
		set fw [open $home(vipidfile) w]
		puts $fw 1
		close $fw
	}
	return 1
}

proc get:vip:id {} {
	global home
	if {[file exists $home(vipidfile)]} {
		set fr [open $home(vipidfile) r]
		gets $fr line
		set num $line
		close $fr
		return $num
	} else {
		return 0
	}
}
