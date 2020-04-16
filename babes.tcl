################################################################
## Babelist v1.20
##
## Author: Papillon ( http://www.surferstarten.net/Papi )
## questions? bugs? improvement?  ---> papillon@surferstarten.net
##
## Copyright © 2002 Papillon aka Hallvard Rykkje
##
## Command: Public:  !whois - checks which babes are online :D
##          Public:  !need - help =)
##          Public:  !babes - gives a more detailed online/offline sattus than the !whois command
##          Privmsg: !babe <nick> - adds a babe to the list
##          Privmsg: !baberem <nick> - removes a babe from the list
##
## Lets u see from a list of babes who is online :)
## Works even if the babe is not in any of the bots channels.
##
## To install just put " source scripts/babelist.tcl " at the bottom
## in your bot's config file.
##
###############################################################
## IMPORTANT!!!!!!!!!!!!!!
## CHANGE THE FOLLOWING LINE TO THE PATH TO WHERE THE BABELFILE IS LOCATED!!
set babefile "/path/to/your/bot/text/babefile.txt"

##set this to 1 if u want the bot to display the result to user,
##instead of the chan
set where_babes "0"

bind pub - !whois do_ison_every_5
bind pub - !babes do_extended_search_on_babes
bind pub - !need need_help_with_babe
bind msg - !babe add_a_babe
bind msg - !baberem remove_babe

bind raw - 303 set_on_or_off
bind raw - 311 find_hosts_and_stuff
bind raw - 401 set_on_or_off3


set done_babe_check ""
set alist ""
set blist ""


################### Tha code =) ####################

if {![file exists babefile]} { set fs [open $babefile a+]; close $fs}

proc do_ison_every_5 {nick host hand chan text} {
  global babefile the_owner the_chan done_babe_check
  if {$done_babe_check == "1"} { putquick "NOTICE $nick :Have to wait a few secs b4 u can do the command again!"; return 0 }
  set done_babe_check "1"
  utimer 30 { set done_babe_check "" }
  set the_owner "$nick"
  set the_chan "$chan"
  set fs [open $babefile r]
  if {$fs == ""} { puthelp "NOTICE $nick :There is no babes in the babe-list. Use\0033 !babe <nick>\003 in pm to me to add babes!"; return 0 }
  set cf ""
  while {![eof $fs]} {
    set f [gets $fs]
    append cf $f
  }
  foreach babes [split $cf] {
    if {$babes != $nick} {
      puthelp "ISON $babes"
    }
  }
 }

proc set_on_or_off {from key arg} {
  global where_babes the_owner the_chan
  if {$where_babes != 0} { set to "$the_owner"
  } else { set to "$the_chan" }
  set reply [lrange $arg 1 end]
  if {$reply != "\:"} {
    regsub -all ":" $reply "" reply
    putquick "PRIVMSG $to :\0034 $reply is online!"
  }
 }

proc add_a_babe {nick host hand text} {
  global babefile the_owner babefound
  if {$text == ""} { puthelp "NOTICE $nick :Must name a babe ;).. use\003 !babe <nick>\003 in pm to me!"; return 0 }
  set babe "$text"
  set fs [open $babefile a]
  can_we_find_the_babe $babe
  if {$babefound != "1"} {
    puts $fs "$babe"
    puthelp "NOTICE $nick :$babe has been added to the babelist"
  } else {
    puthelp "NOTICE $nick :That babe is already in the list ;)"
  }
  close $fs
 }

proc remove_babe {nick host hand text} {
  global babefile the_owner babefound
  if {$text == ""} { puthelp "NOTICE $nick :Must name a babe ;).. use\003 !baberem <nick>\003 in pm to me!"; return 0 }
  set babe "$text"
  if {$babe == $nick} { puthelp "NOTICE $nick :MOAHAHAHAHAHAHAHAHahaaaaaaa ..... u can't delete yourself from the list :p"; return 0 }
  can_we_find_the_babe $babe
  if {$babefound == "1"} {
    set z ""
    set a [open $babefile r]
    while {![eof $a]} {
      set b [gets $a]
      if {[string tolower [lindex $b 0]] != [string tolower $babe]} { lappend z $b }
    }
    close $a
    set n [open $babefile w]
    foreach k $z {
      if {$k != ""} { puts $n $k }
    }
    close $n
    puthelp "NOTICE $nick :$babe was deleted from the babelist.... what happened?? :p"
  } else {
    puthelp "NOTICE $nick :No babe by that nick found in the babelist :("
  }
 }

proc need_help_with_babe {nick host hand chan text} {
  global botnick
  puthelp "NOTICE $nick :/msg $botnick !babe <nick> - adds a babe"
  puthelp "NOTICE $nick :/msg $botnick !baberem <nick> - removes babe"
  puthelp "NOTICE $nick :!whois - checks which babes are online."
  puthelp "NOTICE $nick :!babes - more detailed info than the !whois command."
  puthelp "NOTICE $nick :!need - help :)"
 }

proc can_we_find_the_babe {babe} {
  global babefound babefile
  set babefound 0
  set fs [open $babefile r]
  set line [read $fs]
  split $line
  set temp [lsearch -exact $line $babe]
  if {$temp != "-1"} { set babefound 1 }
  close $fs
}



proc do_extended_search_on_babes {nick host hand chan text} {
  global babefile the_owner the_chan done_babe_check where_babes botnick
  if {$done_babe_check == "1"} { putquick "NOTICE $nick :Have to wait a few secs b4 u can do the command again!"; return 0 }
  set done_babe_check "1"
  utimer 30 { set done_babe_check "" }
  set the_owner "$nick"
  set the_chan "$chan"
  set fs [open $babefile r]
  set cf [read $fs]
  if {$cf == ""} { puthelp "NOTICE $nick :There is no babes in the babe-list. Use\0033 !babe <nick>\003 in pm to me to add babes!"; return 0 }
  if {$where_babes != "0"} { set to "$the_owner"
  } else { set to "$the_chan" }
  putquick "PRIVMSG $to :Please wait 25 secs while I search 4 babes.... ;)"
  split $cf
  foreach babes $cf {
    if {$nick != $babes && $babes != $botnick} {
      putserv "WHOIS $babes"
    }
  }
  utimer 25 { lets_see_what_we_got }
 }


proc find_hosts_and_stuff {from key arg} {
  global alist botnick
  set nick [lindex [split $arg] 1]
  if {$nick != $botnick} {
    set username [lindex [split $arg] 2]
    set hostname [lindex [split $arg] 3]
    set host "$username@$hostname"
    set stat "\0033ONLINE\003 "
    if {$alist == ""} {
      set alist [list "$nick $stat   $host"]
    } else {
      lappend alist "$nick $stat   $host"
    }
  }
}

proc lets_see_what_we_got {} {
  global the_owner alist where_babes the_chan blist
  if {$where_babes != "0"} { set to "$the_owner"
  } else { set to "$the_chan" }
  puthelp "PRIVMSG $to :-=NICK=- -= STATUS =- -=HOST=-"
  set none "1"
  set check "0"
  set 2check "0"
  while {$none != ""} {
    set found [lindex $alist $check]
    set 2found [lindex $blist $2check]
    if {$found != ""} {
      puthelp "PRIVMSG $to :$found"
      incr check
    } else {
      if {$2found != ""} {
        puthelp "PRIVMSG $to :$2found"
        incr 2check
      } else {
        set none [lindex $blist $2check]
      }
    }
  }
  set blist ""
  set alist ""
 }


proc set_on_or_off3 {from key arg} {
  global blist
  set nick [lindex [split $arg] 1]
  if {$blist == ""} {
    set blist [list "$nick \0034Offline\003   n/a"]
  } else {
    lappend blist "$nick \0034Offline\003   n/a"
  }
}


putlog "Babelist.tcl v1.20 by Papillon Loaded"