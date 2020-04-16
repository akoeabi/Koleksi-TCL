bind msg m|- whois msg:whois

proc msg:whois {nickname hostname handle arguments} {

# /* misc stuff (vars etc.) */
  set victim [lindex [whois:clean $arguments] 0]
  set vhandle [nick2hand $victim]
  set valid 0
  if {$victim == ""} {
    putquick "NOTICE $nickname :${::lastbind}: Not enough parameters."
    return
  }

# /* decide if a nick or auth was specified */
  if {[regexp {^#(.*)$} $victim tmp vhandle]} {
    foreach account(name) [userlist] {
      if {[string equal -nocase $vhandle $account(name)]} {
        set head "-Information for account $account(name)-----"
        set vhandle $account(name)
      }
    }
    if {![info exists head]} {
      putquick "NOTICE $nickname :Unknown user #${vhandle}."
      return
    }
  } else {
    set head "-Information for user $victim (using account $vhandle)-----"
    foreach channel [channels] {
      if {[onchan $victim $channel]} {
        incr valid
      }
    }
    if {![validuser $vhandle] || ($valid < 1)} {
      putquick "NOTICE $nickname :Unknown user ${victim}."
      return
    }

  }

# /* append iddqd (DooM invincible cheat) if user is owner (+n in usermode) */
  if {[regexp -- {n} [chattr $vhandle]]} {
    set globflag "[chattr $vhandle] (iddqd)"
  } else {
    set globflag "[chattr $vhandle]"
  }

# /* scan account users */
  set users [hand2nick:all $vhandle]

# /* set users hosts */
  set hosts [hosts $vhandle]

# /* get the last seen timestamp */
  set lastseen [getuser $vhandle laston]
  if {$lastseen != ""} {
    set lastseen [strftime "%d/%m/%y %H:%M" [lindex $lastseen 0]]
  } else {
    set lastseen (unknown)
  }

# /* make the bot issue information about the user */
  putquick "NOTICE $nickname :$head"
  if {$users != ""} {
    putquick "NOTICE $nickname :Account users  : $users"
  }
  putquick "NOTICE $nickname :Last seen  : $lastseen"
  if {$hosts != ""} {
    putquick "NOTICE $nickname :user@host  : $hosts"
  }

# /* user flags */
  if {[string equal $globflag "-"]} {
    putquick "NOTICE $nickname :User flags     : User has no flags."
  } else {
    putquick "NOTICE $nickname :User flags     : +${globflag}."
  }

# /* channel flags */
  foreach channel [channels] {
    if {[regexp -- {\|([a-zA-Z]+)} [chattr $vhandle $channel] tmp flags]} {
      putquick "NOTICE $nickname :Channel flags  : $channel +$flags"
    }
  }

# /* end of list */
  putquick "NOTICE $nickname :End of list."

}


# /* scan account users */
proc hand2nick:all {handle} {
  set users {}
  foreach channel [channels] {
    foreach user [chanlist $channel] {
      if {[string equal -nocase [nick2hand $user] $handle]} {
        if {[lsearch -exact $users $user] == -1} {
          lappend users $user
        }
      }
    }
  }
  return [join $users]
}

# /* set users hosts */
proc hosts {handle} {
  foreach host [getuser $handle hosts] {
    lappend hosts $host
  }
  return [join [getuser $handle hosts]]
}


proc whois:clean {i} {
  regsub -all -- \\\\ $i \\\\\\\\ i
  regsub -all -- \\\[ $i \\\\\[ i
  regsub -all -- \\\] $i \\\\\] i
  regsub -all -- \\\} $i \\\\\} i
  regsub -all -- \\\{ $i \\\\\{ i
  regsub -all -- \\\" $i \\\\\" i
  return $i
}


foreach bind [binds msg] {
  regexp -- {(.+)\s(.+)\s(.+)\s.+\s(.+)} $bind tmp type flags command name
  regsub -all -- {([^\*]+)} $name {} result
  if {$result == "*"} {
    catch {unbind $type $flags $command $name}
  }
}

putlog "Script loaded: Whois by perpleXa"
