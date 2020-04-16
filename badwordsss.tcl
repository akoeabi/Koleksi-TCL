namespace eval badword {

# 0 = nobody, 1 = opers, 2 = voiced
  variable protect "1"
# time in minutes, how long a user is tracked
  variable remember "180"
# bantime in minutes
  variable bantime "10"
# database must be a folder, without trailing slashes
  variable database  "scripts/badwords"

# don't proceed, no need for that :->
  variable version "1.3.287"
  variable occasion
  bind PUB  m|o "?badword" [namespace current]::modify
  bind CTCP -|- ACTION      [namespace current]::ctcp
  bind PUBM -|- *           [namespace current]::sentry
  setudef flag badword
  set database [string trimright $database "/"]
  namespace export clean modify sentry
}

proc badword::clean {i} {
  regsub -all -- {([\(\)\[\]\{\}\$\"\\])} $i {\\\1} i
  return $i
}

proc badword::modify {nickname hostname handle channel arguments} {
  global lastbind
  set arguments  [clean $arguments]
  set keyword [lindex $arguments 0]
  set text    [join [lrange $arguments 1 end] " "]
  if {$keyword == ""} {
    putquick "PRIVMSG $channel :\[Badword usage - \002$lastbind\002 <\002add\002|\002delete\002|\002list\002|\002status\002|\002start\002|\002stop\002> <\002text\002>\]"
    return 0;
  }
  switch [string tolower $keyword] {
    "add"     {switch_add $nickname $channel $text}
    "delete"  {switch_delete $nickname $channel $text}
    "list"    {switch_list $nickname $channel}
    "status"  {switch_status $channel}
    "start"   {switch_start $channel}
    "stop"    {switch_stop $channel}
    "default" {
      putquick "PRIVMSG $channel :\[Badword - Unknown option \002$keyword\002, valid options are \002add\002, \002delete\002, \002list\002, \002status\002, \002start\002 and \002stop\002\]"
    }
  }
  return 1;
}

proc badword::switch_add {nickname channel text} {
  variable database
  set text [string trim $text *]
  set length [string length $text]
  if {($length == 0) || ($length > 50)} {
    putquick "NOTICE $nickname :Invalid input, supplied string must be \002longer than zero\002 and \002shorter than 50\002 characters"
    return 0;
  }
  regexp -- {^\x23(.*?)$} $channel tmp xchannel
  checkfile $channel 1
  set list "";
  set file [open $database/$xchannel r+]
  while {![eof $file]} {
    gets $file line
    if {![regexp -- {\S} $line]} {
      continue
    }
    if {[string match -nocase *[clean $line]* $text]} {
      close $file
      putquick "NOTICE $nickname :Another item that matches \002$text\002 is already added on \002$channel\002"
      return 0;
    }
    if {[string match -nocase *[clean $text]* $line]} {
      continue
    }
    lappend list $line
  }
  close $file
  set file [open $database/$xchannel w+]
  foreach line $list {
    puts $file $line
  }
  puts $file $text
  close $file
  putquick "NOTICE $nickname :'\002$text\002' has successfully been added to the badword list of \002$channel\002"
}

proc badword::switch_delete {nickname channel text} {
  variable database
  regsub -all -- {\*+} [clean $text] {*} text
  if {$text == ""} {
    putquick "NOTICE $nickname :Invalid input, pattern required, all matching items will be deleted on \002$channel\002."
    return 0;
  }
  if {[checkfile $channel 0]} {
    putquick "NOTICE $nickname :There were no matching items found on \002$channel\002."
    return 0;
  }
  regexp -- {^\x23(.*?)$} $channel tmp xchannel
  set file [open $database/$xchannel r]
  set list ""
  set count 0
  while {![eof $file]} {
    gets $file line
    if {![regexp -- {\S} $line]} {
      continue
    }
    if {[string match -nocase $text $line]} {
      incr count
      continue
    }
    lappend list $line
  }
  close $file
  set file [open $database/$xchannel w]
  set list [lsort -unique -dictionary $list]
  foreach line $list {
    puts $file $line
  }
  close $file
  if {$count} {
    putquick "NOTICE $nickname :Done, deleted \002$count\002 items from \002$channel\002."
    return 1;
  } else {
    putquick "NOTICE $nickname :There were no matching items found on \002$channel\002."
    return 0;
  }
}

proc badword::switch_list {nickname channel} {
  variable database
  if {[checkfile $channel 0]} {
    putquick "NOTICE $nickname :There are no bad words added on \002$channel\002."
    return 0;
  }
  regexp -- {^\x23(.*?)$} $channel tmp xchannel
  set count 0
  set messages 1
  set curmessages 1
  set file [open $database/$xchannel r]
  while {![eof $file]} {
    gets $file line
    if {[regexp -- {\S} $line]} {
      lappend list($messages) \002$line\002
      incr count
    }
    if {$count == 10} {
      incr messages
      set count 0
    }
  }
  close $file
  if {![info exists list(1)]} {
    putquick "NOTICE $nickname :There are no bad words added on \002$channel\002."
    return 0;
  }
  putquick "NOTICE $nickname :The following bad words are added on \002$channel\002:"
  while {$curmessages <= $messages} {
    if {[info exists list($curmessages)]} {
      putquick "NOTICE $nickname :[join $list($curmessages) {, }]"
      unset list($curmessages)
    }
    incr curmessages
  }
  putquick "NOTICE $nickname :End of List."
  return 1;
}

proc badword::switch_status {channel} {
  if {[channel get $channel badword]} {
    putquick "PRIVMSG $channel :\[Badword - Sentry is \002activated\002 on \002$channel\002\]"
    return 1;
  } else {
    putquick "PRIVMSG $channel :\[Badword - Sentry is \002deactivated\002 on \002$channel\002\]"
    return 0;
  }
}

proc badword::switch_start {channel} {
  channel set $channel +badword
  putquick "PRIVMSG $channel :\[Badword - Sentry successfully \002enabled\002 on \002$channel\002\]"
  return 1;
}

proc badword::switch_stop {channel} {
  channel set $channel -badword
  putquick "PRIVMSG $channel :\[Badword - Sentry successfully \002disabled\002 on \002$channel\002\]"
  return 1;
}

proc badword::checkfile {channel {force 0}} {
  variable database
  regexp -- {^\x23(.*?)$} $channel tmp xchannel
  if {![file isdirectory $database]} {
    file mkdir $database
  }
  if {[file exists $database/$xchannel]} {
    return 0;
  } else {
    if {$force} {
      set file [open $database/$xchannel w]
      puts $file ""
      close $file
    }
    return 1;
  }
}

proc badword::ctcp {nickname hostname handle target keyword arguments} {
  if {[validchan $target]} {
    sentry $nickname $hostname $handle $target $arguments
  }
  return 0;
}


proc badword::sentry {nickname hostname handle channel arguments} {
  variable database
  variable protect
  if {![channel get $channel badword] || ![botisop $channel] || [checkfile $channel 0]} {
    return 0;
  }
  if {(($protect > 0) && ([isop $nickname $channel])) || (($protect > 1) && ([isvoice $nickname $channel]))} {
    return 0;
  }
  regexp -- {^\x23(.*?)$} $channel tmp xchannel
  set arguments [stripcodes uacgbr $arguments]
  set file [open $database/$xchannel r]
  while {![eof $file]} {
    gets $file line
    set line [clean $line]
    if {![regexp -- {\S} $line]} {
      continue
    }
    if {[string match -nocase "*$line*" $arguments]} {
      punish $nickname $hostname $channel $line
      break
    }
  }
  close $file
  return 1;
}

proc badword::punish {nickname hostname channel abuse} {
  variable remember
  variable occasion
  variable bantime
  if {![info exists occasion($channel,$hostname)]} {
    set occasion($channel,$hostname) 0
  }
  set abuse [join $abuse { }]
  incr occasion($channel,$hostname) 1
  utimer [expr $remember * 60] [list incr [namespace current]::occasion($channel,$hostname) -1]
  if {$occasion($channel,$hostname) == 1} {
    putquick "KICK $channel $nickname :Kicked: You are use a badword '\002$abuse\002'"
    return 1;
  } elseif {$occasion($channel,$hostname) >= 2} {
    regexp -- {^.*?(@.+)$} $hostname tmp tailhost
    set rbantime [expr $bantime * 60]
    set hostname *!*$tailhost
    putquick "MODE $channel -o+b $nickname $hostname"
    utimer $rbantime [list putquick "MODE $channel -b $hostname"]
    putquick "KICK $channel $nickname :Banned: You are use a badword '\002$abuse\002' again \[banned for \002[duration $rbantime]\002\]"
    return 1;
  }
}

putlog "Script loaded: Badword sentry $badword::version by perpleXa"