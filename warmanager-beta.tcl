
#############################################
##                                         ##
##         War Management  v2.0b           ##
##                        by Galadhrim     ##
##                                         ##
#############################################

#############################################
##                                         ##
##     Based on the War Management v1.7b   ##
##     by kalhimeo                         ##
##                                         ##
#############################################

#############################################
##          1.General Settings             ##
#############################################

## Set the Public chan where commands like !last will be available.
set war_pubchan "#channel"

## Set the private chan where commands like !addmatch will be available.
set war_privchan "#channel"

## Set the key of your private chan if needed
set war_keys($war_privchan) ""

## Set the name of your Clan.
set war_clanname "My Clan"

## Set gametypes. This allows users to add matches of certain games.
## The color code is used for notices and such.
## Having no gametypes will cripple the script and does not make sence.
array set war_gametypes {
 "BF" "0,7"
 "MOH:AA" "0,12"
 "CoD" "1,10"
}

## Set gametype topic fade-in colors. the whole starting string. 'none' IS NEEDED!!!
## If you don't want a fade-in just keep it empty, ie: ""
## This array needs the same entries as war_gametypes
array set war_gametypetopic {
  "BF"     "2,0¦|0,2¦|7,2¦|2,7¦|1,7¦|1,7"
  "MOH:AA" "12,0¦|0,12¦|2,12¦|12,2¦|1,2¦|0,12"
  "CoD"    "14,0¦|10,15¦|15,14¦|15,10¦|1,10¦|1,10"
  "none"   "15,0¦|0,15¦|14,15¦|15,14¦|1,14¦|15,1"
  
  
}

## Set gametype topic fade-out colors. the whole ending string. 'none' IS NEEDED!!!
## If you don't want a fade-in just keep it empty, ie: ""
## This array needs the same entries as war_gametypes
array set war_gametypetopic2 {

  "BF"     "1,7¦|2,7¦|7,2¦|0,2¦|2,0¦|"
  "MOH:AA" "1,2¦|12,2¦|2,12¦|0,12¦|12,0¦|"
  "CoD"    "1,10¦|15,10¦|15,14¦|10,15¦|14,0¦|"
  "none"   "1,14¦|15,14¦|14,15¦|0,15¦|15,0¦|"
}


#############################################
##          2.Advanced Settings            ##
#############################################

## Activate auth system ? ( 1=enable , 0=disabled )
set war_authsys 1

## If war_authsys is enabled ,set the delay before removing the admin authentication ( in minutes ). Set it too high decreases security.
set war_timeoutdelay 45

## Default number of players required for a war.
set war_playernumber 8

## Number of substitue allowed for a war.
set war_subnumber 5

## Default number of wars showed in !pending, !upcoming and !id when number is omited ( default is 3 but you can decrease it if your clan member flood the bot ;) )
set war_shownumber 5

## Determine wich player alias (long/short) will the bot use in table result ( like !search ). ( 1=short alias , 2=long alias , 3=handle )
set war_nicksize 1

## How many match to shox ( maximum ) when a player use !agenda
set war_agenda 10

## Hide the player line up for upcoming match on public chan (if not, choose wich alias will be used) ? ( 0=hidden , 1=short alias , 2=long alias , 3=handle )
set war_hideplayer 2

## Activate the player messaging 15 minutes before the war ( 1=enable , 0=disabled ).
set war_privmsging 0

## Do you want the bot to search in all war informations for the string submited by the user ? ( set to 0 will make the bot only search in clan name )
set war_searchall 1

## Number of character allowed in the topic ( leave this setting for quakenet )
set war_topiclength "250"

## Trigger for all commands, you should change it only if you have a conflict with an other script
set war_trigger "!"

#############################################
##       3.HTML Generator Settings         ##
#############################################

## Enable or disable html stats generator ( 1=enable , 0=disabled )
set war_html 1

## Set the delay between two updates of the html page.
set war_htmldelay 3600

## Set the exact name of the template file you are using to build the html file ( including extention, there are 2 included in this package : sample.template ( show how to use bgcolor feature ) and default.template ( a very basic one ) ).
set war_template "default.template"

## Set the exact name of the html file that will contain warstats ( don't forget the extention, .html or .htm )
set war_webname "warstats.html"

## Enable or disable the upload of the html page ( you may want to disable it and use a local webserver ) ( 1=enable , 0=disabled )
set war_upload 0

## Enable or disable the upload of the WarArchives.bak for a backup every day at 00h00 ( use the same FTP infos as the webserver )
set war_uploadbackup 0

## Set the address of your webserver ( only if "war_upload" or "war_uploadbackup" is set to "1" )
set war_webserver "ftp.myserver.com"

## Set the login of your access on webserver ( only if "war_upload" or "war_uploadbackup" is set to "1" )
set war_weblogin "leetclan"

## Set the password of your access on webserver ( only if "war_upload" or "war_uploadbackup" is set to "1" )
set war_webpassword "secret"

## Set the path where html file will be uploaded on webserver or copy into a local folder if "war_upload" is set to "0" ( use a leading "/" but no trailing "/" )
set war_webfolder ""

## Set the background colour 1 for line 1+2x the different tables in html file ( war history and map stats )
set war_bckg1 "#475D8F"

## Set the background colour 2 for line 1+2x the different tables in html file ( war history and map stats )
set war_bckg2 "#475D8F"

## Set the background colour 1 for line 0+2x the different tables in html file ( war history and map stats )
set war_bckg3 "#46629C"

## Set the background colour 2 for line 0+2x the different tables in html file ( war history and map stats )
set war_bckg4 "#46629C"

## Set the font used for the different tables in html file ( war history and map stats )
set war_font "Tahoma"

## Set the size of the text used for the different tables in html file ( war history and map stats )
set war_txts "2"

## Set the color of the textused for the different tables in html file ( war history and map stats )
set war_txtc "#FFFFFF"


#############################################
##              End of config              ##
##       Do NOT edit variable below        ##
#############################################


bind pub - [string trim $war_trigger]addmatch war_addmatch
bind pub - [string trim $war_trigger]addresult war_addresult
bind pub - [string trim $war_trigger]chinfo war_chinfo
bind pub - [string trim $war_trigger]delete war_delete
bind pub - [string trim $war_trigger]id war_id
bind pub - [string trim $war_trigger]pending war_pending
bind pub - [string trim $war_trigger]upcoming war_upcoming
bind pub - [string trim $war_trigger]add war_add
bind pub - [string trim $war_trigger]remove war_remove
bind pub - [string trim $war_trigger]last war_last
bind pub - [string trim $war_trigger]next war_next
bind pub - [string trim $war_trigger]search war_search
bind pub - [string trim $war_trigger]motd war_motd
bind pub - [string trim $war_trigger]alias war_alias2
bind pub - [string trim $war_trigger]agenda war_agenda
bind dcc m alias war_alias
bind pub - [string trim $war_trigger]help war_help
bind msg - [string trim $war_trigger]admin war_auth
bind join - * war_msgonjoin
bind topc - * war_topicchange
bind raw - 475 war_needpass
bind time - "00 00 * * *" war_backupfiles

foreach i [timers] {
 if {[lindex $i 1] == "war_timers"} {killtimer [lindex $i 2]}
 if {[lindex $i 1] == "war_tchk"} {killtimer [lindex $i 2]}
 if {[lindex $i 1] == "war_buildhtml"} {killtimer [lindex $i 2]}
}

if {![file readable War_Archives]} {
  set fileio [open War_Archives "w"]
  puts $fileio ""
  close $fileio
}

if {![file readable War_Miscs]} {
  set fileio [open War_Miscs "w"]
  set blank [list "" ""]
  puts $fileio [join $blank "\n"] 
  close $fileio
}

utimer 2 war_readfile
utimer 10 war_remoldflag
timer 1 war_timers
timer 2 war_tchk
if {$war_html==1} {
  timer $war_htmldelay war_buildhtml
}

set war_version 2.0
set war_list [list ]
set war_counter ""
set war_nicks [list ]
set war_queue ""
set war_queue2 ""
set war_welcomemsg ""
set war_pubchan [string tolower $war_pubchan]
set war_privchan [string tolower $war_privchan]


proc war_msgonjoin { nickname user handle channel } {
  global war_welcomemsg war_privchan
  set channel [string tolower $channel]
  if {($channel==$war_privchan)&&($war_welcomemsg!="")} {
    putserv "NOTICE $nickname :$war_welcomemsg"
  }
}

proc war_topicchange {nick uhost handle channel topic} {
  global botnick war_privchan
  set channel [string tolower $channel]
  if {($nick!=$botnick)&&($channel==$war_privchan)} {
    war_automanagement
  }
}

#DONE
proc war_addmatch {nick uhost handle channel arg} {
  global war_privchan war_counter war_authsys botnick war_playernumber war_trigger war_gametypes
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle V])&&($war_authsys==1)} {
      putserv "NOTICE $nick :5You are not authed, use /msg $botnick [string trim $war_trigger]admin <password>"
      return 0
    }
    set check [war_charfilter $arg]
    if {$check!=1} {
      putserv "NOTICE $nick :5Invalid character: \"$check\". Please do not use such character in any field."
      return 0
    }
    if {([lsearch $arg "team(*"]==-1)||([lsearch $arg "date(*"]==-1)||([lsearch $arg "map(*"]==-1)||([lsearch $arg "gametype(*"]==-1)} {
      putserv "NOTICE $nick :5Invalid args, you need to enter at least the team(x), date(hh:mm-dd/mm/yy), map(x) and gametype(x) ( + info(x) or number(x) )"
      return 0
    }
    set startindex [lsearch $arg "date(*"]
    set buf [lrange $arg $startindex end]
    set infos [string range $buf 5 [expr [string first ")" $buf]-1]]
    set errormsg [war_checkdate $infos]
    if {$errormsg!=1} {
      putserv "NOTICE $nick :$errormsg"
      return 0
    }
    set infos [clock scan "[string range $infos 12 13][string range $infos 9 10][string range $infos 6 7] [string range $infos 0 1][string range $infos 3 4]00"]
    set infos [linsert $infos 0 $war_counter]
    set startindex [lsearch $arg "team(*"]
    set buf [lrange $arg $startindex end]
    set team [string range $buf 5 [expr [string first ")" $buf]-1]]
    set startindex [lsearch $arg "map(*"]
    set buf [lrange $arg $startindex end]
    set map [string range $buf 4 [expr [string first ")" $buf]-1]]
    set info "n/a"
    if {[lsearch $arg "info(*"]>-1} {
      set startindex [lsearch $arg "info(*"]
      set buf [lrange $arg $startindex end]
      set info [string range $buf 5 [expr [string first ")" $buf]-1]]
    }
    set number $war_playernumber
    if {[lsearch $arg "number(*"]>-1} {
      set startindex [lsearch $arg "number(*"]
      set buf [lrange $arg $startindex end]
      set number [string range $buf 7 [expr [string first ")" $buf]-1]]
    }
    set startindex [lsearch $arg "gametype(*"]
    set buf [lrange $arg $startindex end]
    set gametype [string range $buf 9 [expr [string first ")" $buf]-1]]
    
    set gametypeexists 0
    set gametypelist 0
    foreach tempgametype [array names war_gametypes] {
    	if {$tempgametype==$gametype} {
    	    set gametypeexists 1
    	    set gametypelist "$gametypelist $tempgametype"
    	}
    }
    if {$gametypeexists==0} {
    	putserv "NOTICE $nick :Invalid argument for gametype(). It is case-sensitive! Options are: $gametypelist"
      	return 0
    }
     	
    set infos [linsert $infos end $team "n/a" "n/a" $map "n/a" $info $number 0 $gametype]
    war_insertion $infos
    war_savefiles
    set infos [war_getinfos $war_counter 2]
    incr war_counter
    set id [lindex $infos 0]
    set hour [lindex $infos 1]
    set date [lindex $infos 2]
    set team [lindex $infos 3]
    set maps [lindex $infos 6]
    set info [lindex $infos 8]
    set number [lindex $infos 9]
    set gametype [lindex $infos 11]
    
    putserv "PRIVMSG $channel : $war_gametypes($gametype)New war on $date at $hour against $team . Game: $gametype. Maps: $maps . Players: $number. Infos: $info ( ID $id )"
    
    war_automanagement
  }
}

#DONE
proc war_addresult {nick uhost handle channel arg} {
  global war_clanname war_privchan war_authsys botnick war_trigger war_gametypes
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle V])&&($war_authsys==1)} {
      putserv "NOTICE $nick :5You are not authed, use /msg $botnick [string trim $war_trigger]admin <password>"
      return 0
    }
    if {[llength $arg]!=3} {
      putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]addresult <ID> <your-score> <opponent-score> ). Use !pending <x> to get the list of <x> last war pending for result"
      return 0
    }
    set infos [war_getcodeinfos [lindex $arg 0]]
    if {$infos==0} {
      putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
      return 0
    }
    if {([lindex $infos 3]!="n/a") || ([lindex $infos 4]!="n/a")} {
      putserv "NOTICE $nick :5Error: there is alaready a result for this math ([lindex $infos 3]-[lindex $infos 4])"
      return 0
    }
    set ourscore [lindex $arg 1]
    set oppscore [lindex $arg 2]
    for {set x 0} {$x<[string length $ourscore]} {incr x} {
      set char [string index $ourscore $x]
      if {($char!=0)&&($char!=1)&&($char!=2)&&($char!=3)&&($char!=4)&&($char!=5)&&($char!=6)&&($char!=7)&&($char!=8)&&($char!=9)} {
         putserv "NOTICE $nick :5Error: invalid character '$char' in yourscore ( use only digit number )"
         return 0
      }
    }
    for {set x 0} {$x<[string length $oppscore]} {incr x} {
      set char [string index $oppscore $x]
      if {($char!=0)&&($char!=1)&&($char!=2)&&($char!=3)&&($char!=4)&&($char!=5)&&($char!=6)&&($char!=7)&&($char!=8)&&($char!=9)} {
         putserv "NOTICE $nick :5Error: invalid character '$char' in oppscore ( use only digit number )"
         return 0
      }
    }
    if {$ourscore!=0} {
      while {[string index $ourscore 0]=="0"} {
        set ourscore [string range $ourscore 1 end]
      }
    }
    if {$oppscore!=0} {
      while {[string index $oppscore 0]=="0"} {
        set oppscore [string range $oppscore 1 end]
      }
    }
    set infos [lreplace $infos 3 4 $ourscore $oppscore]
    war_modify $infos
    war_savefiles
    set infos [war_getinfos [lindex $arg 0] 2]
    set id [lindex $infos 0]
    set hour [lindex $infos 1]
    set date [lindex $infos 2]
    set team [lindex $infos 3]
    set ourscore [lindex $infos 4]
    set oppscore [lindex $infos 5]
    set maps [lindex $infos 6]
    set players [lindex $infos 7]
    set info [lindex $infos 8]
    set gametype [lindex $infos 11]
    if {$ourscore>$oppscore} {
      putserv "PRIVMSG $channel : $war_gametypes($gametype)Score added : On $date ($hour), $war_clanname won against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
    } elseif {$ourscore<$oppscore} {
      putserv "PRIVMSG $channel : $war_gametypes($gametype)Score added : On $date ($hour), $war_clanname lost against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
    } elseif {$ourscore==$oppscore} {
      putserv "PRIVMSG $channel : $war_gametypes($gametype)Score added : On $date ($hour), $war_clanname did a draw against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
    }
  }
}

#DONE
proc war_chinfo {nick uhost handle channel arg} {
  global war_clanname war_privchan war_authsys botnick war_trigger war_gametypes
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle V])&&($war_authsys==1)} {
      putserv "NOTICE $nick :5You are not authed, use /msg $botnick [string trim $war_trigger]admin <password>"
      return 0
    }
    set check [war_charfilter $arg]
    if {$check!=1} {
      putserv "NOTICE $nick :5Invalid character: \"$check\". Please do not use such character in any field."
      return 0
    }
    if {[llength $arg]==1} {
      set infos [war_getinfos [lindex $arg 0] 3]
      if {$infos==0} {
        putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
        return 0
      }
      set id [lindex $infos 0]
      set hour [lindex $infos 1]
      set date [lindex $infos 2]
      set team [lindex $infos 3]
      set ourscore [lindex $infos 4]
      set oppscore [lindex $infos 5]
      set maps [lindex $infos 6]
      set players [lindex $infos 7]
      set info [lindex $infos 8]
      set gametype [lindex $infos 11]
      if {$ourscore>$oppscore} {
        putserv "NOTICE $nick : $war_gametypes($gametype)Current War Informations : On $date, $war_clanname won against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      } elseif {$ourscore<$oppscore} {
        putserv "NOTICE $nick : $war_gametypes($gametype)Current War Informations : On $date, $war_clanname lost against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      } elseif {"$ourscore$oppscore"=="n/an/a"} {
        putserv "NOTICE $nick : $war_gametypes($gametype)Current War Informations : On $date ($hour), $war_clanname will fight against $team. Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      } elseif {$ourscore==$oppscore} {
        putserv "NOTICE $nick : $war_gametypes($gametype)Current War Informations : On $date, $war_clanname did a draw against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      }
      return 0
    } else {
      set infos [war_getcodeinfos [lindex $arg 0]]
      if {$infos==0} {
        putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
        return 0
      }
      if {([lsearch $arg "team(*"]==-1)&&([lsearch $arg "date(*"]==-1)&&([lsearch $arg "map(*"]==-1)&&([lsearch $arg "yourscore(*"]==-1)&&([lsearch $arg "oppscore(*"]==-1)&&([lsearch $arg "player(*"]==-1)&&([lsearch $arg "number(*"]==-1)&&([lsearch $arg "info(*"]==-1)&&([lsearch $arg "hour(*"]==-1)&&([lsearch $arg "day(*"]==-1)&&([lsearch $arg "year(*"]==-1)&&([lsearch $arg "gametype(*"]==-1)} {
        putserv "NOTICE $nick :5Invalid args, you need to enter at least one of these info to change: team(x), date(hh:mm-dd/mm/yy), hour(xx:xx), day(xx/xx), year(xxxx), map(x), yourscore(x), oppscore(x), info(x), player(x) or number(x)"
        return 0
      }
      set id [lindex $infos 0]
      set day [clock format [lindex $infos 1] -format "%d/%m"]
      set hour [clock format [lindex $infos 1] -format "%k:%M"]
      set year [clock format [lindex $infos 1] -format "%y"]
      set date [lindex $infos 1]
      if {[lsearch $arg "date(*"]>-1} {
        set startindex [lsearch $arg "date(*"]
        set buf [lrange $arg $startindex end]
        set date [string range $buf 5 [expr [string first ")" $buf]-1]]
        set errormsg [war_checkdate $date]
        if {$errormsg!=1} {
          putserv "NOTICE $nick :$errormsg"
          return 0
        }
        set date [clock scan "[string range $date 12 13][string range $date 9 10][string range $date 6 7] [string range $date 0 1][string range $date 3 4]00"]
      } elseif {[lsearch $arg "hour(*"]>-1} {
        set startindex [lsearch $arg "hour(*"]
        set buf [lrange $arg $startindex end]
        set hour [string range $buf 5 [expr [string first ")" $buf]-1]]
        set date "$hour-$day/$year"
        set date [clock scan "[string range $date 12 13][string range $date 9 10][string range $date 6 7] [string range $date 0 1][string range $date 3 4]00"]
      } elseif {[lsearch $arg "day(*"]>-1} {
        set startindex [lsearch $arg "day(*"]
        set buf [lrange $arg $startindex end]
        set day [string range $buf 4 [expr [string first ")" $buf]-1]]
        set date "$hour-$day/$year"
        set date [clock scan "[string range $date 12 13][string range $date 9 10][string range $date 6 7] [string range $date 0 1][string range $date 3 4]00"]
      } elseif {[lsearch $arg "year(*"]>-1} {
        set startindex [lsearch $arg "year(*"]
        set buf [lrange $arg $startindex end]
        set year [string range $buf 5 [expr [string first ")" $buf]-1]]
        set date "$hour-$day/$year"
        set date [clock scan "[string range $date 12 13][string range $date 9 10][string range $date 6 7] [string range $date 0 1][string range $date 3 4]00"]
      }
      set team [lindex $infos 2]
      if {[lsearch $arg "team(*"]>-1} {
        set startindex [lsearch $arg "team(*"]
        set buf [lrange $arg $startindex end]
        set team [string range $buf 5 [expr [string first ")" $buf]-1]]
      }
      set ourscore [lindex $infos 3]
      if {[lsearch $arg "yourscore(*"]>-1} {
        set startindex [lsearch $arg "yourscore(*"]
        set buf [lrange $arg $startindex end]
        set ourscore [string range $buf 10 [expr [string first ")" $buf]-1]]
        for {set x 0} {$x<[string length $ourscore]} {incr x} {
          set char [string index $ourscore $x]
          if {($char!=0)&&($char!=1)&&($char!=2)&&($char!=3)&&($char!=4)&&($char!=5)&&($char!=6)&&($char!=7)&&($char!=8)&&($char!=9)} {
             putserv "NOTICE $nick :5Error: invalid character '$char' in yourscore ( use only digit number )"
             return 0
          }
        }
        if {$ourscore!=0} {
          while {[string index $ourscore 0]=="0"} {
            set ourscore [string range $ourscore 1 end]
          }
        }
      }
      set oppscore [lindex $infos 4]
      if {[lsearch $arg "oppscore(*"]>-1} {
        set startindex [lsearch $arg "oppscore(*"]
        set buf [lrange $arg $startindex end]
        set oppscore [string range $buf 9 [expr [string first ")" $buf]-1]]
        for {set x 0} {$x<[string length $oppscore]} {incr x} {
          set char [string index $oppscore $x]
          if {($char!=0)&&($char!=1)&&($char!=2)&&($char!=3)&&($char!=4)&&($char!=5)&&($char!=6)&&($char!=7)&&($char!=8)&&($char!=9)} {
             putserv "NOTICE $nick :5Error: invalid character '$char' in oppscore ( use only digit number )"
             return 0
          }
        }
        if {$oppscore!=0} {
          while {[string index $oppscore 0]=="0"} {
            set oppscore [string range $oppscore 1 end]
          }
        }
      }
      set map [lindex $infos 5]
      if {[lsearch $arg "map(*"]>-1} {
        set startindex [lsearch $arg "map(*"]
        set buf [lrange $arg $startindex end]
        set map [string range $buf 4 [expr [string first ")" $buf]-1]]
      }
      set players [lindex $infos 6]
      if {[lsearch $arg "player(*"]>-1} {
        set startindex [lsearch $arg "player(*"]
        set buf [lrange $arg $startindex end]
        set players [string range $buf 7 [expr [string first ")" $buf]-1]]
      }
      set info [lindex $infos 7]
      if {[lsearch $arg "info(*"]>-1} {
        set startindex [lsearch $arg "info(*"]
        set buf [lrange $arg $startindex end]
        set info [string range $buf 5 [expr [string first ")" $buf]-1]]
      }
      set number [lindex $infos 8]
      if {[lsearch $arg "number(*"]>-1} {
        set startindex [lsearch $arg "number(*"]
        set buf [lrange $arg $startindex end]
        set number [string range $buf 7 [expr [string first ")" $buf]-1]]
      } elseif {[lsearch $arg "player(*"]>-1} {
        if {[llength $players]>$number} {
          set number [llength $players]
        }
      }
      set actualplayers [lindex $infos 9]
      
      set gametype [lindex $infos 10]
      if {[lsearch $arg "gametype(*"]>-1} {
        set startindex [lsearch $arg "gametype(*"]
        set buf [lrange $arg $startindex end]
        set gametype [string range $buf 9 [expr [string first ")" $buf]-1]]
      }
      
      
      set infos "$id $date {$team} $ourscore $oppscore {$map} {$players} {$info} $number $actualplayers $gametype"
      war_modify $infos
      war_savefiles
      set infos [war_getinfos [lindex $arg 0] 2]
      set id [lindex $infos 0]
      set hour [lindex $infos 1]
      set date [lindex $infos 2]
      set team [lindex $infos 3]
      set ourscore [lindex $infos 4]
      set oppscore [lindex $infos 5]
      set maps [lindex $infos 6]
      set players [lindex $infos 7]
      set info [lindex $infos 8]
      set gametype [lindex $infos 11]
      if {$ourscore>$oppscore} {
        putserv "NOTICE $nick : $war_gametypes($gametype)War Updated : On $date, $war_clanname won against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      } elseif {$ourscore<$oppscore} {
        putserv "NOTICE $nick : $war_gametypes($gametype)War Updated : On $date, $war_clanname lost against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      } elseif {"$ourscore$oppscore"=="n/an/a"} {
        putserv "NOTICE $nick : $war_gametypes($gametype)War Updated : On $date ($hour), $war_clanname will fight against $team. Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
        war_automanagement
      } elseif {$ourscore==$oppscore} {
        putserv "NOTICE $nick : 5War Updated : On $date, $war_clanname did a draw against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info"
      }
    }
  }
}

#DONE
proc war_delete {nick uhost handle channel arg} {
  global war_list war_clanname war_privchan war_authsys botnick war_trigger
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle V])&&($war_authsys==1)} {
      putserv "NOTICE $nick :5You are not authed, use /msg $botnick [string trim $war_trigger]admin <password>"
      return 0
    }
    if {[llength $arg]>1} {
      putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]delete <ID> )"
      return 0
    }
    set infos [war_getinfos [lindex $arg 0] 0]
    if {$infos==0} {
      putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
      return 0
    }
    for {set x 0} {$x<[llength $war_list]} {incr x} {
      if {[lindex [lindex $war_list $x] 0]==[lindex $arg 0]} {
        set war_list [lreplace $war_list $x $x]
        war_savefiles
        set team [lindex $infos 3]
        putserv "NOTICE $nick : 5War against $team has been deleted."
        war_automanagement
        return 0
      }
    }
  }
}

#DONE
proc war_id {nick uhost handle channel arg} {
  global war_list war_privchan war_shownumber war_trigger
  set channel [string tolower $channel]
  if {[llength $arg]==0} {
    set arg $war_shownumber
  } elseif {([llength $arg]>1)||($arg>10)} {
    putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]id <number> ) and <number have to be 10 or lower."
    return 0
  }
  if {$channel==$war_privchan} {
    putserv "PRIVMSG $nick : 5Last $arg referenced matches :"
    putserv "PRIVMSG $nick :2Opponent:                  2 ID:"
    set war_templist $war_list
    set war_templist [lsort -integer -index 0 $war_templist]
    for {set x 1} {$x<[expr $arg +1]} {incr x} {
      if {[expr [llength $war_templist]-$x]<0} { 
        putserv "PRIVMSG $nick :5You have seen all referenced matches"
        return 0
      }
      set warinfos [lindex $war_templist [expr [llength $war_templist]-$x]]
      set team [lindex $warinfos 2]
      set output "$team"
      for {set y [string length $team]} {$y<27} {incr y} {
        set output "$output "
      }
      set output "$output [lindex $warinfos 0]"
      putserv "PRIVMSG $nick :$output"
    }
  }
}

#DONE
proc war_pending {nick uhost handle channel arg} {
  global war_list war_privchan war_shownumber war_nicksize war_trigger war_gametypes
  set channel [string tolower $channel]
  if {[llength $arg]==0} {
    set arg $war_shownumber
  } elseif {([llength $arg]>1)||($arg>10)} {
    putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]pending <number> ) and <number have to be 10 or lower."
    return 0
  }
  if {$channel==$war_privchan} {
    set war_pending [list ]
    foreach war $war_list {
      if {([lrange $war 3 4]=="n/a n/a")&&([lindex $war 1]<[unixtime])} {
        set war_pending [linsert $war_pending 0 [lindex $war 0]]
      }
    }
    if {[llength $war_pending]>0} {
      putserv "PRIVMSG $nick : 5Pending Result :"
      set warid ""
      for {set x 0} {$x<$arg} {incr x} {
        if {$x>[expr [llength $war_pending]-1]} { 
          break
        }
        set warid [linsert $warid end [lindex $war_pending $x]]
      }
      set infos ""
      for {set x 0} {$x<[llength $warid]} {incr x} {
        set tempinfos [war_getinfos [lindex $warid $x] $war_nicksize]
        set hour [lindex $tempinfos 1]
        set date [lindex $tempinfos 2]
        set players [lindex $tempinfos 7]
        set gametype [lindex $tempinfos 11]
        set tempinfos [lreplace $tempinfos 9 10]
        set tempinfos [lreplace $tempinfos 4 5]
        if {[string first "- Subs:" $players]>-1} {
          set stringindex [string first "- Sub:" $players]
          set players "[string range $players 0 [expr $stringindex-1]][string range $players [expr $stringindex+1] [expr $stringindex+13]][string range $players [expr $stringindex+15] end]"
          set tempinfos [lreplace $tempinfos 5 5 $players]
        }
        set tempinfos [lreplace $tempinfos 1 2 "$date - $hour"]
        set tempinfos [linsert $tempinfos 1 [lindex $tempinfos 2]]
        set tempinfos [lreplace $tempinfos 3 3]
        set tempinfos [lreplace $tempinfos 6 6 $gametype]
        set infos [linsert $infos end $tempinfos]
      }
      set infos [linsert $infos 0 "ID: Opponent: Date: Maps: Players: Infos: Game:"]
      for {set x 0} {$x<7} {incr x} {
        set length 0
        for {set y 0} {$y<[llength $infos]} {incr y} {
          if {[string length [lindex [lindex $infos $y] $x]]>$length} {
            set length [string length [lindex [lindex $infos $y] $x]]
          }
        }
        incr length 3
        for {set y 0} {$y<[llength $infos]} {incr y} {
          for {set z [string length [lindex [lindex $infos $y] $x]]} {$z<$length} {incr z} {
            set newelement "[lindex [lindex $infos $y] $x] "
            set newinfos [lreplace [lindex $infos $y] $x $x $newelement]
            set infos [lreplace $infos $y $y $newinfos]
          }
        }
      }
      set length 0
      for {set y 1} {$y<[llength $infos]} {incr y} {
        if {[string length [lindex [lindex [lindex $infos $y] 2] 0]]>$length} {
          set length [string length [lindex [lindex [lindex $infos $y] 2] 0]]
        }
      }
      incr length
      for {set y 1} {$y<[llength $infos]} {incr y} {
        for {set z [string length [lindex [lindex [lindex $infos $y] 2] 0]]} {$z<$length} {incr z} {
          set newelement "[lindex [lindex [lindex $infos $y] 2] 0] "
          set newdate [lreplace [lindex [lindex $infos $y] 2] 0 0 $newelement]
          set newdate [string range $newdate 0 [expr [string length $newdate]-2]]
          set newinfos [lreplace [lindex $infos $y] 2 2 $newdate]
          set infos [lreplace $infos $y $y $newinfos]
        }
        set newdate "[lindex [lindex $infos $y] 2] "
        set newinfos [lreplace [lindex $infos $y] 2 2 [join $newdate]]
        set infos [lreplace $infos $y $y $newinfos]
      }
      for {set x 0} {$x<7} {incr x} {
        set newelement "2[lindex [lindex $infos 0] $x]"
        set newinfos [lreplace [lindex $infos 0] $x $x $newelement]
        set infos [lreplace $infos 0 0 $newinfos]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        set infos [lreplace $infos $x $x [join [lindex $infos $x]]]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        putserv "PRIVMSG $nick :[lindex $infos $x]"
      }
      if {$arg>[llength $warid]} { 
        putserv "PRIVMSG $nick :5You have seen all matches"
        return 0
      }
    } else {
      putserv "NOTICE $nick :5No match found"
      return 0
    }
  }
}

#DONE
proc war_upcoming {nick uhost handle channel arg} {
  global war_list war_privchan war_shownumber war_nicksize war_trigger war_gametypes
  set channel [string tolower $channel]
  if {[llength $arg]==0} {
    set arg $war_shownumber
  } elseif {([llength $arg]>1)||($arg>10)} {
    putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]upcoming <number> ) and <number have to be 10 or lower."
    return 0
  }
  if {$channel==$war_privchan} {
    set war_upcoming [list ]
    foreach war $war_list {
      if {([lrange $war 3 4]=="n/a n/a")&&([lindex $war 1]>[unixtime])} {
        set war_upcoming [linsert $war_upcoming end [lindex $war 0]]
      }
    }
    if {[llength $war_upcoming]>0} {
      putserv "PRIVMSG $nick : 5Upcoming Matches :"
      set warid ""
      for {set x 0} {$x<$arg} {incr x} {
        if {$x>[expr [llength $war_upcoming]-1]} { 
          break
        }
        set warid [linsert $warid end [lindex $war_upcoming $x]]
      }
      set infos ""
      for {set x 0} {$x<[llength $warid]} {incr x} {
        set tempinfos [war_getinfos [lindex $warid $x] $war_nicksize]
        set hour [lindex $tempinfos 1]
        set date [lindex $tempinfos 2]
        set players [lindex $tempinfos 7]
        set number [lindex $tempinfos 9]
        set actualplayers [lindex $tempinfos 10]
        set gametype [lindex $tempinfos 11]
        set tempinfos [lreplace $tempinfos 9 10]
        set tempinfos [lreplace $tempinfos 4 5]
        if {[string first "- Sub:" $players]>-1} {
          set stringindex [string first "- Sub:" $players]
          set players "[string range $players 0 [expr $stringindex-1]][string range $players [expr $stringindex+1] [expr $stringindex+13]][string range $players [expr $stringindex+15] end]"
          set tempinfos [lreplace $tempinfos 5 5 $players]
        }
        set tempinfos [lreplace $tempinfos 5 5 "[lindex $tempinfos 5] ($actualplayers/$number)"]
        set tempinfos [lreplace $tempinfos 1 2 "$date - $hour"]
        set tempinfos [linsert $tempinfos 1 [lindex $tempinfos 2]]
        set tempinfos [lreplace $tempinfos 3 3]
        set tempinfos [lreplace $tempinfos 6 6 $gametype]
        set infos [linsert $infos end $tempinfos]
      }
      set infos [linsert $infos 0 "ID: Opponent: Date: Maps: Players: Infos: Game:"]
      for {set x 0} {$x<7} {incr x} {
        set length 0
        for {set y 0} {$y<[llength $infos]} {incr y} {
          if {[string length [lindex [lindex $infos $y] $x]]>$length} {
            set length [string length [lindex [lindex $infos $y] $x]]
          }
        }
        incr length 3
        for {set y 0} {$y<[llength $infos]} {incr y} {
          for {set z [string length [lindex [lindex $infos $y] $x]]} {$z<$length} {incr z} {
            set newelement "[lindex [lindex $infos $y] $x] "
            set newinfos [lreplace [lindex $infos $y] $x $x $newelement]
            set infos [lreplace $infos $y $y $newinfos]
          }
        }
      }
      set length 0
      for {set y 1} {$y<[llength $infos]} {incr y} {
        if {[string length [lindex [lindex [lindex $infos $y] 2] 0]]>$length} {
          set length [string length [lindex [lindex [lindex $infos $y] 2] 0]]
        }
      }
      incr length
      for {set y 1} {$y<[llength $infos]} {incr y} {
        for {set z [string length [lindex [lindex [lindex $infos $y] 2] 0]]} {$z<$length} {incr z} {
          set newelement "[lindex [lindex [lindex $infos $y] 2] 0] "
          set newdate [lreplace [lindex [lindex $infos $y] 2] 0 0 $newelement]
          set newdate [string range $newdate 0 [expr [string length $newdate]-2]]
          set newinfos [lreplace [lindex $infos $y] 2 2 $newdate]
          set infos [lreplace $infos $y $y $newinfos]
        }
        set newdate "[lindex [lindex $infos $y] 2] "
        set newinfos [lreplace [lindex $infos $y] 2 2 [join $newdate]]
        set infos [lreplace $infos $y $y $newinfos]
      }
      for {set x 0} {$x<7} {incr x} {
        set newelement "2[lindex [lindex $infos 0] $x]"
        set newinfos [lreplace [lindex $infos 0] $x $x $newelement]
        set infos [lreplace $infos 0 0 $newinfos]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        set infos [lreplace $infos $x $x [join [lindex $infos $x]]]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        putserv "PRIVMSG $nick :[lindex $infos $x]"
      }
      if {$arg>[llength $warid]} { 
        putserv "PRIVMSG $nick :5You have seen all matches"
        return 0
      }
    } else {
      putserv "NOTICE $nick :5No match found"
      return 0
    }
  }
}

#DONE
proc war_add {nick uhost handle channel arg} {
  global war_list war_privchan war_subnumber war_trigger war_gametypes
  set channel [string tolower $channel]
  if {($channel==$war_privchan)&&($handle!="*")} {
    if {[llength $arg]>1} {
      putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]add <ID> )"
      return 0
    }
    set infos [war_getcodeinfos [lindex $arg 0]]
    if {$infos==0} {
      putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
      return 0
    }
    set date [lindex $infos 1]
    set team [lindex $infos 2]
    set ourscores [lindex $infos 3]
    set players [lindex $infos 6]
    set number [lindex $infos 8]
    set gametype [lindex $infos 10]
    if {[llength $players]>[expr [expr $number-1]+$war_subnumber]} {
      putserv "NOTICE $nick :5Sorry $nick but $number players + $war_subnumber substitute already subscribed to this $gametype match."
      return 0
    }
    if {$ourscores!="n/a"} {
      putserv "NOTICE $nick :5Error: you probably entered a wrong id, this $gametype match as already been played"
      return 0
    }
    if {$date<[unixtime]} {
      putserv "NOTICE $nick :5Error: you cannot subscribe to this $gametype match because it's out of date"
      return 0
    }
    if {[lsearch $players $handle]>-1} {
      putserv "NOTICE $nick : 5You are already added as player for the $gametype match against $team."
      return 0
    }
    if {$players=="n/a"} {
      set players $handle
    } else {
      set players [linsert $players end $handle]
    }
    set infos [lreplace $infos 6 6 $players]
    war_modify $infos
    set date [clock format [lindex $infos 1] -format "%A %d %b %Y"]
    set hour [clock format [lindex $infos 1] -format "%k:%M"]
    if {[llength $players]>$number} {
      putserv "NOTICE $nick : $war_gametypes($gametype)You are now added as substitute for the $gametype match against $team on $date at $hour."
    } else {
      putserv "NOTICE $nick : $war_gametypes($gametype)You are now added as player for the $gametype match against $team on $date at $hour."
    }
    war_savefiles
    war_automanagement
  }
}

#DONE
proc war_remove {nick uhost handle channel arg} {
  global war_list war_privchan war_trigger war_gametypes
  set channel [string tolower $channel]
  if {($channel==$war_privchan)&&($handle!="*")} {
    if {[llength $arg]>1} {
      putserv "NOTICE $nick :5Invalid args ( [string trim $war_trigger]remove <ID> )"
      return 0
    }
    set infos [war_getcodeinfos [lindex $arg 0]]
    if {$infos==0} {
      putserv "NOTICE $nick :5Error: there isn't any war with this ID in my war database"
      return 0
    }
    set date [lindex $infos 1]
    set team [lindex $infos 2]
    set ourscores [lindex $infos 3]
    set players [lindex $infos 6]
    set gametype [lindex $infos 10]
    if {$ourscores!="n/a"} {
      putserv "NOTICE $nick :5Error: you probably entered a wrong id, this $gametype match as already been played"
      return 0
    }
    if {$date<[unixtime]} {
      putserv "NOTICE $nick :5Error: you cannot unsubscribe to this $gametype match because it's out of date"
      return 0
    }
    while {[string first "_" $team ]!=-1} {
      set stringindex [string first "_" $team]
      set team "[string range $team 0 [expr $stringindex - 1]] [string range $team [expr $stringindex + 1] end]"
    }
    if {[lsearch $players $handle]==-1} {
      putserv "NOTICE $nick :5Error: you didn't subscribe the $gametype match against $team."
      return 0
    }
    set playerindex [lsearch $players $handle]
    set players [lreplace $players $playerindex $playerindex]
    if {[llength $players]==0} {
      set players "n/a"
    }
    set infos [lreplace $infos 6 6 $players]
    war_modify $infos
    set date [clock format [lindex $infos 1] -format "%d %b %Y"]
    set hour [clock format [lindex $infos 1] -format "%k:%M"]
    putserv "NOTICE $nick : $war_gametypes($gametype)You are now removed from the line up of the $gametype match against $team on $date at $hour."
    war_savefiles
    war_automanagement
  }
}

#DONE
proc war_last {nick uhost handle channel arg} {
  global war_list war_clanname war_pubchan war_privchan war_queue war_nicksize war_gametypes
  set channel [string tolower $channel]
  if {($channel==$war_pubchan)&&([llength $arg]<2)} {
    if {$war_queue != ""} {
      if {[expr [unixtime]-$war_queue]<20} {
        putserv "NOTICE $nick :5Someone used a command less than 20 secs ago, try again later please"
        return 0
      }
    }
    set war_queue [unixtime]
    if {[llength $arg]==0} {
      set war_result "5No match found"
      foreach war $war_list {
        if {([lrange $war 3 4]!="n/a n/a")&&([lindex $war 1]<[unixtime])} {
          set war_result [lindex $war 0]
        } elseif {[lindex $war 1]>[unixtime]} {
          break
        }
      }
      if {$war_result!="5No match found"} {
        set infos [war_getinfos $war_result 2]
        set hour [lindex $infos 1]
        set date [lindex $infos 2]
        set team [lindex $infos 3]
        set ourscore [lindex $infos 4]
        set oppscore [lindex $infos 5]
        set maps [lindex $infos 6]
        set players [lindex $infos 7]
        set info [lindex $infos 8]
        set gametype [lindex $infos 11]
        if {$ourscore>$oppscore} {
          set war_result "$war_gametypes($gametype)Last $gametype war of $war_clanname:2 On $date , WON against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        } elseif {$ourscore<$oppscore} {
          set war_result "$war_gametypes($gametype)Last $gametype war of $war_clanname:2 On $date , LOST against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        } elseif {$ourscore==$oppscore} {
          set war_result "$war_gametypes($gametype)Last $gametype war of $war_clanname:2 On $date , DRAW against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        }
      }
      putserv "NOTICE $nick :$war_result"
      return 0
    } elseif {$arg>5} {
      putserv "NOTICE $nick :5You cannot retrieve informations of more than 5 wars. Please choose a lower number"
      return 0
    }
    putserv "PRIVMSG $nick : 5The last $arg wars from $war_clanname are:"
    set war_result ""
    foreach war $war_list {
      if {([lrange $war 3 4]!="n/a n/a")&&([lindex $war 1]<[unixtime])} {
        set war_result [linsert $war_result 0 [lindex $war 0]]
      } elseif {[lindex $war 1]>[unixtime]} {
        break
      }
    }
    if {[llength $war_result]>0} {
      set warid ""
      for {set x 0} {$x<$arg} {incr x} {
        if {$x>[expr [llength $war_result]-1]} { 
          break
        }
        set warid [linsert $warid end [lindex $war_result $x]]
      }
      set infos [war_putinfos $warid $war_nicksize]
      for {set x 0} {$x<[llength $infos]} {incr x} {
        putserv "PRIVMSG $nick :[lindex $infos $x]"
      }
      if {$arg>[llength $warid]} { 
        putserv "PRIVMSG $nick :5You have seen all matches"
        return 0
      }
    } else {
      putserv "NOTICE $nick :5No match found"
      return 0
    }
  } elseif {$channel==$war_privchan} {
    if {[llength $arg]==0} {
      set war_result "5No match found"
      foreach war $war_list {
        if {([lrange $war 3 4]!="n/a n/a")&&([lindex $war 1]<[unixtime])} {
          set war_result [lindex $war 0]
        } elseif {[lindex $war 1]>[unixtime]} {
          break
        }
      }
      if {$war_result!="5No match found"} {
        set infos [war_getinfos $war_result 2]
        set hour [lindex $infos 1]
        set date [lindex $infos 2]
        set team [lindex $infos 3]
        set ourscore [lindex $infos 4]
        set oppscore [lindex $infos 5]
        set maps [lindex $infos 6]
        set players [lindex $infos 7]
        set info [lindex $infos 8]
        if {$ourscore>$oppscore} {
          set war_result "$war_gametypes($gametype)Last war of $war_clanname:2 On $date , WON against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        } elseif {$ourscore<$oppscore} {
          set war_result "$war_gametypes($gametype)Last war of $war_clanname:2 On $date , LOST against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        } elseif {$ourscore==$oppscore} {
          set war_result "$war_gametypes($gametype)Last war of $war_clanname:2 On $date , DRAW against $team ( Score: $ourscore-$oppscore ). Game: $gametype. Map(s): $maps. Players: $players. Infos: $info" 
        }
      }
      putserv "NOTICE $nick :$war_result"
      return 0
    } elseif {$arg>5} {
      putserv "NOTICE $nick :5You cannot retrieve informations of more than 5 wars. Please choose a lower number"
      return 0
    }
    putserv "PRIVMSG $nick : 5The last $arg wars from $war_clanname are:"
    set war_result ""
    foreach war $war_list {
      if {([lrange $war 3 4]!="n/a n/a")&&([lindex $war 1]<[unixtime])} {
        set war_result [linsert $war_result 0 [lindex $war 0]]
      } elseif {[lindex $war 1]>[unixtime]} {
        break
      }
    }
    if {[llength $war_result]>0} {
      set warid ""
      for {set x 0} {$x<$arg} {incr x} {
        if {$x>[expr [llength $war_result]-1]} { 
          break
        }
        set warid [linsert $warid end [lindex $war_result $x]]
      }
      set infos [war_putinfos $warid $war_nicksize]
      for {set x 0} {$x<[llength $infos]} {incr x} {
        putserv "PRIVMSG $nick :[lindex $infos $x]"
      }
      if {$arg>[llength $warid]} { 
        putserv "PRIVMSG $channel :5You have seen all matches"
        return 0
      }
    } else {
      putserv "NOTICE $nick :5No match found"
      return 0
    }
  }
}

#DONE
proc war_next {nick uhost handle channel arg} {
  global war_list war_clanname war_pubchan war_queue war_hideplayer war_gametypes
  set channel [string tolower $channel]
  if {$channel==$war_pubchan} {
    if {$war_queue != ""} {
      if {[expr [unixtime]-$war_queue]<10} {
        putserv "NOTICE $nick :5Someone used a command less than 10 secs ago, try again later please"
        return 0
      }
    }
    set war_queue [unixtime]
    set war_upcoming ""
    foreach war $war_list {
      if {([lrange $war 3 4]=="n/a n/a")&&([lindex $war 1]>[unixtime])} {
        set war_upcoming $war
        break
      }
    }
    if {$war_upcoming==""} {
      putserv "NOTICE $nick :5No match planned"
      return 0
    }
    set infos [war_getinfos [lindex $war 0] $war_hideplayer]
    set hour [lindex $infos 1]
    set date [lindex $infos 2]
    set team [lindex $infos 3]
    set maps [lindex $infos 6]
    set players [lindex $infos 7]
    set info [lindex $infos 8]
    set gametype [lindex $infos 11]
    putserv "NOTICE $nick : $war_gametypes($gametype)Next match of $war_clanname:2 On $date at $hour against $team on $maps. Game: $gametype. Players: $players. Infos: $info"
  }
}

#DONE
proc war_search {nick uhost handle channel arg} {
  global war_list war_clanname war_pubchan war_privchan war_queue war_nicksize war_hideplayer war_searchall war_gametypes
  set channel [string tolower $channel]
  set check [war_charfilter $arg]
  if {$check!=1} {
    putserv "NOTICE $nick :5Invalid character: \"$check\". Please do not use such character in any field."
    return 0
  }
  if {$channel==$war_pubchan} {
    if {[string length $arg]<3} {
      putserv "NOTICE $nick :5Invalid entry, you have to enter a minimum of 3 charachters to perform a search."
      return 0
    }
    if {[string match $arg "\*\*"]} {
      putserv "PRIVMSG $channel :5Invalid entry, my artificial intelligence do not allow you to flood me using \"**\" bitch !"
      return 0
    }
    if {$war_queue!=""} {
      if {[expr [unixtime]-$war_queue]<30} {
        putserv "NOTICE $nick :5Someone used a command less than 30 secs ago, try again later please."
        return 0
      }
    }
    set war_queue [unixtime]
    set arg [string tolower $arg]
    set searchstring "*$arg*"
    set war_result [list]
    foreach war $war_list {
      set string ""
      if {$war_searchall==1} {
        foreach value $war {
          set value [string tolower $value]
          set string "$string $value"
        }
      } else {
        set string [string tolower [lindex $war 2]]
      }
      if {[string match $searchstring $string]==1} {
        set war_result [linsert $war_result 0 [lindex $war 0]]
      }
    }
    if {[llength $war_result]==0} {
      putserv "NOTICE $nick :5No result found"
      return 0
    }
    putserv "PRIVMSG $nick : 5I have found [llength $war_result] entries matching $searchstring in the $war_clanname war database:"
    set x 0
    set warid ""
    foreach war $war_result {
      if {$x<5} {
        set warid [linsert $warid end [lindex $war_result $x]]
        incr x
      } elseif {$x==5} {
        set infos [war_putinfos $warid $war_hideplayer]
        for {set y 0} {$y<[llength $infos]} {incr y} {
          putserv "PRIVMSG $nick :[lindex $infos $y]"
        }
        putserv "NOTICE $nick :5You can only see the 5 first entries, try to use a more specific keyword."
        return 0
      }
    }
    set infos [war_putinfos $warid $war_hideplayer]
    for {set y 0} {$y<[llength $infos]} {incr y} {
      putserv "PRIVMSG $nick :[lindex $infos $y]"
    }
  } elseif {$channel==$war_privchan} {
    if {[string length $arg]<2} {
      putserv "NOTICE $nick :5Invalid entry, you have to enter a minimum of 2 charachters to perfrom a search."
      return 0
    }
    if {[string match $arg "\*\*"]} {
      putserv "PRIVMSG $channel :5Invalid entry, my artificial intelligence do not allow you to flood me using \"**\" bitch !"
      return 0
    }
    set arg [string tolower $arg]
    set searchstring "*$arg*"
    set war_result [list]
    foreach war $war_list {
      set string ""
      if {$war_searchall==1} {
        foreach value $war {
          set value [string tolower $value]
          set string "$string $value"
        }
      } else {
        set string [string tolower [lindex $war 2]]
      }
      if {[string match $searchstring $string]==1} {
        set war_result [linsert $war_result 0 [lindex $war 0]]
      }
    }
    if {[llength $war_result]==0} {
      putserv "NOTICE $nick :5No result found"
      return 0
    }
    putserv "PRIVMSG $nick : 5I have found [llength $war_result] entries matching $searchstring in the $war_clanname war database:"
    set x 0
    set warid ""
    foreach war $war_result {
      if {$x<10} {
        set warid [linsert $warid end [lindex $war_result $x]]
        incr x
      } elseif {$x==10} {
        set infos [war_putinfos $warid $war_nicksize]
        for {set y 0} {$y<[llength $infos]} {incr y} {
          if {$y==0} {
            putserv "PRIVMSG $nick :[lindex $infos $y]"
          } else {
            putserv "PRIVMSG $nick :[lindex $infos $y] ( ID: [lindex $warid [expr $y-1]] )"
          }
        }
        putserv "NOTICE $nick :5You can only see the 10 first entries, try to use a more specific keyword."
        return 0
      }
    }
    set infos [war_putinfos $warid $war_nicksize]
    for {set y 0} {$y<[llength $infos]} {incr y} {
      if {$y==0} {
        putserv "PRIVMSG $nick :[lindex $infos $y]"
      } else {
        putserv "PRIVMSG $nick :[lindex $infos $y] ( ID: [lindex $warid [expr $y-1]] )"
      }
    }
  }
}

#DONE
proc war_motd {nick uhost handle channel arg} {
  global war_welcomemsg war_privchan war_authsys botnick war_trigger
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle V])&&($war_authsys==1)} {
      putserv "NOTICE $nick :5You are not authed, use /msg $botnick [string trim $war_trigger]admin <password>"
      return 0
    }
    if {$arg==""} {
      putserv "NOTICE $nick :5Current MOTD: $war_welcomemsg"
    } elseif {$arg==0} {
      set war_welcomemsg ""
      putserv "NOTICE $nick :5MOTD has been disabled."
      war_savemiscs
    } else {
      set war_welcomemsg $arg
      putserv "NOTICE $nick :5MOTD is now: $arg"
      war_savemiscs
    }
  }
}

#DONE
proc war_help {nick uhost handle channel arg} {
  global war_privchan war_pubchan war_clanname war_authsys war_queue2 war_shownumber war_version war_trigger
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    if {(![matchattr $handle W])&&($war_authsys==1)} {
      putserv "PRIVMSG $nick :You can use these commands :"
      putserv "PRIVMSG $nick :[string trim $war_trigger]add <id>           =>  Add youself to the war referenced by <id>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]remove <id>        =>  Remove yourself from the war referenced by <id>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]agenda             =>  Shows you all the upcoming match you subscribed"
      putserv "PRIVMSG $nick :[string trim $war_trigger]search <keyword>   =>  Search for any entries in database matching <keyword>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]id <x>             =>  Shows you the last <x> entries in database and their ID (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]pending <x>        =>  Shows you the <x> more recent war waiting for a result (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]upcoming <x>       =>  Shows you the next <x> war in the calendar (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]last <x>           =>  Shows you the last <x> war(s) (set by default to 1 if <x> is omited)"
    } else {
      putserv "PRIVMSG $nick :You can use these commands :"
      putserv "PRIVMSG $nick :[string trim $war_trigger]addmatch team(x) date(hh:mm-dd/mm/yy) map(x) gametype(x) ( + infos(x) or/and number(x) if desired ) =>  Add a match in the calendar, infos(x), gametype(x) and number(x) are not required (Players will be able to [string trim $war_trigger]add to this math)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]addresult <id> <your-score> <opponent-score> =>  Add a result on a pending match."
      putserv "PRIVMSG $nick :[string trim $war_trigger]chinfo <id> <new entries> =>  Change stored informations about <id>. Available entries are the usual trigger: team(),date(),hour(),day(),year(),map(),gametype(x),yourscore(),oppscore(),player(),info(),number(). You can change as many entries as you want at once"
      putserv "PRIVMSG $nick :[string trim $war_trigger]delete <id>        =>  Delete a war from database."
      putserv "PRIVMSG $nick :[string trim $war_trigger]motd <msg>         =>  Set a welcome message on the private chan. Use [string trim $war_trigger]motd 0 to disable."
      putserv "PRIVMSG $nick :[string trim $war_trigger]add <id>           =>  Add youself to the war referenced by <id>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]remove <id>        =>  Remove yourself from the war referenced by <id>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]agenda             =>  Shows you all the upcoming match you subscribed"
      putserv "PRIVMSG $nick :[string trim $war_trigger]search <keyword>   =>  Search for any entries in database matching <keyword>"
      putserv "PRIVMSG $nick :[string trim $war_trigger]id <x>             =>  Shows you the last <x> entries in database and their ID (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]pending <x>        =>  Shows you the <x> more recent war waiting for a result (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]upcoming <x>       =>  Shows you the next <x> war in the calendar (set by default to $war_shownumber if <x> is omited)"
      putserv "PRIVMSG $nick :[string trim $war_trigger]last <x>           =>  Shows you the last <x> war(s) (set by default to 1 if <x> is omited)"
    }
  } elseif {$channel==$war_pubchan} {
    if {$war_queue2!=""} {
      if {[expr [unixtime]-$war_queue2]<20} {
        putserv "NOTICE $nick :5Someone is already requesting help, try again in 30 seconds please"
        return 0
      }
    }
    set war_queue2 [unixtime]
    putserv "PRIVMSG $nick :You can use these commands :"
    putserv "PRIVMSG $nick :[string trim $war_trigger]last <x>            =>  Shows you the <x> last war of $war_clanname ( Max 5 )"
    putserv "PRIVMSG $nick :[string trim $war_trigger]next                =>  Shows you the next war of $war_clanname"
    putserv "PRIVMSG $nick :[string trim $war_trigger]search <keyword>    =>  Shows you the last war of $war_clanname"
    putserv "PRIVMSG $nick :-- War Manager v$war_version by kalhimeo --"
  }
}

#DONE
proc war_alias2 {nick uhost handle channel args} {
  global war_nicks war_trigger
  set args [lindex $args 0]
  if {[llength $args]!=3} {
    putserv "NOTICE $nick :Invalid args ( [string trim $war_trigger]alias short/long <handle> <alias> )"
    return 0
  }
  set check [war_charfilter $args]
  if {$check!=1} {
    putserv "NOTICE $nick :5Invalid character: \"$check\". Please do not use such character in any field."
    return 0
  }
  set switch [lindex $args 0]
  set handle [lindex $args 1]
  set alias [lindex $args 2]
  if {[lsearch [userlist] $handle]==-1} {
    putserv "NOTICE $nick :Unknown handle, use \".match *\" in dcc chat to list all users"
    return 0
  }
  set position -1
  for {set x 0} {$x<[llength $war_nicks]} {incr x} {
    if {[lindex [lindex $war_nicks $x] 0]==$handle} {
      set position $x
      break
    }
  }
  if {$switch=="short"} {
    if {$position==-1} {
      set war_nicks [linsert $war_nicks end "$handle $alias $handle"]
    } else {
      set infos [lindex $war_nicks $position]
      set infos [lreplace $infos 1 1 $alias]
      set war_nicks [lreplace $war_nicks $position $position $infos]
    }
    putserv "NOTICE $nick :Short alias for $handle is now $alias"
  } elseif {$switch=="long"} {
    if {$position==-1} {
      set war_nicks [linsert $war_nicks end "$handle $handle $alias"]
    } else {
      set infos [lindex $war_nicks $position]
      set infos [lreplace $infos 2 2 $alias]
      set war_nicks [lreplace $war_nicks $position $position $infos]
    }
    putserv "NOTICE $nick :Long alias for $handle is now $alias"
  } else {
    putserv "NOTICE $nick :Invalid args ( [string trim $war_trigger]alias short/long <handle> <alias> )"
    return 0
  }
  war_savemiscs
}

#DONE
proc war_agenda {nick uhost handle channel arg} {
  global war_list war_agenda war_privchan war_nicksize war_gametypes
  set channel [string tolower $channel]
  if {$channel==$war_privchan} {
    set war_upcoming [list ]
    foreach war $war_list {
      if {([lrange $war 3 4]=="n/a n/a")&&([lindex $war 1]>[unixtime])&&([lsearch -exact [lindex $war 6] $handle]>-1)} {
        set war_upcoming [linsert $war_upcoming end [lindex $war 0]]
      }
    }
    if {[llength $war_upcoming]>0} {
      putserv "PRIVMSG $nick : 5Your agenda ( max $war_agenda ) :"
      set warid ""
      for {set x 0} {$x<$war_agenda} {incr x} {
        if {$x>[expr [llength $war_upcoming]-1]} { 
          break
        }
        set warid [linsert $warid end [lindex $war_upcoming $x]]
      }
      set infos ""
      for {set x 0} {$x<[llength $warid]} {incr x} {
        set tempinfos [war_getinfos [lindex $warid $x] $war_nicksize]
        set id [lindex $tempinfos 0]
        set hour [lindex $tempinfos 1]
        set date [lindex $tempinfos 2]
        set team [lindex $tempinfos 3]
        set map [lindex $tempinfos 6]
        set info [lindex $tempinfos 8]
        set number [lindex $tempinfos 9]
        set actualplayers [lindex $tempinfos 10]
        set gametype [lindex $tempinfos 11]
        set tempinfos [lreplace $tempinfos 0 end "$date - $hour"]
        set tempinfos [linsert $tempinfos end $team]
        set tempinfos [linsert $tempinfos end $map]
        set tempinfos [linsert $tempinfos end "$actualplayers/$number"]
        set tempinfos [linsert $tempinfos end $info]
        set tempinfos [linsert $tempinfos end $gametype]
        set tempinfos [linsert $tempinfos end $id]
        set infos [linsert $infos end $tempinfos]
      }
      set infos [linsert $infos 0 "Date: Opponent: Maps: Players: Infos: Game: ID:"]
      for {set x 0} {$x<7} {incr x} {
        set length 0
        for {set y 0} {$y<[llength $infos]} {incr y} {
          if {[string length [lindex [lindex $infos $y] $x]]>$length} {
            set length [string length [lindex [lindex $infos $y] $x]]
          }
        }
        incr length 3
        for {set y 0} {$y<[llength $infos]} {incr y} {
          for {set z [string length [lindex [lindex $infos $y] $x]]} {$z<$length} {incr z} {
            set newelement "[lindex [lindex $infos $y] $x] "
            set newinfos [lreplace [lindex $infos $y] $x $x $newelement]
            set infos [lreplace $infos $y $y $newinfos]
          }
        }
      }
      set length 0
      for {set y 1} {$y<[llength $infos]} {incr y} {
        if {[string length [lindex [lindex [lindex $infos $y] 0] 0]]>$length} {
          set length [string length [lindex [lindex [lindex $infos $y] 0] 0]]
        }
      }
      incr length
      for {set y 1} {$y<[llength $infos]} {incr y} {
        for {set z [string length [lindex [lindex [lindex $infos $y] 0] 0]]} {$z<$length} {incr z} {
          set newelement "[lindex [lindex [lindex $infos $y] 0] 0] "
          set newdate [lreplace [lindex [lindex $infos $y] 0] 0 0 $newelement]
          set newdate [string range $newdate 0 [expr [string length $newdate]-2]]
          set newinfos [lreplace [lindex $infos $y] 0 0 $newdate]
          set infos [lreplace $infos $y $y $newinfos]
        }
        set newdate "[lindex [lindex $infos $y] 0] "
        set newinfos [lreplace [lindex $infos $y] 0 0 [join $newdate]]
        set infos [lreplace $infos $y $y $newinfos]
      }
      for {set x 0} {$x<7} {incr x} {
        set newelement "2[lindex [lindex $infos 0] $x]"
        set newinfos [lreplace [lindex $infos 0] $x $x $newelement]
        set infos [lreplace $infos 0 0 $newinfos]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        set infos [lreplace $infos $x $x [join [lindex $infos $x]]]
      }
      for {set x 0} {$x<[llength $infos]} {incr x} {
        putserv "PRIVMSG $nick :[lindex $infos $x]"
      }
      if {$war_agenda>[llength $warid]} { 
        putserv "PRIVMSG $nick :5You have seen all match"
        return 0
      }
    } else {
      putserv "NOTICE $nick :5No match found"
      return 0
    }
  }

}

#DONE
proc war_getinfos {id plrswc} {
  global war_list war_nicksize
  set infos 0
  foreach war $war_list {
    if {[lindex $war 0]==$id} {
      set infos $war
      break
    }
  }
  if {$infos==0} {
    return 0
  }
  set id [lindex $infos 0]
  set date [clock format [lindex $infos 1] -format "%a %d-%m-%y"]
  set hour [clock format [lindex $infos 1] -format "%k:%M"]
  set team [lindex $infos 2]
  set ourscore [lindex $infos 3]
  set oppscore [lindex $infos 4]
  set maps [lindex $infos 5]
  if {$maps!="n/a"} {
    while {[string first "/" $maps ] != -1 } {
      set stringindex [string first "/" $maps]
      set maps "[string range $maps 0 [expr $stringindex - 1]],[string range $maps [expr $stringindex + 1] end]"
    }
  } 
  set number [lindex $infos 8]
  set players ""
  set actualplayers 0
  if {([lindex $infos 1]<[unixtime])&&($plrswc==0)} {
    set plrswc $war_nicksize
  }
  if {$plrswc==0} {
    set players "Hidden until played"
  } elseif {$plrswc==1} {
    set templayers [war_shortnick [lindex $infos 6]]
    set players ""
    if {$templayers!="n/a"} {
      set actualplayers [llength $templayers]
      for {set x 0} {$x<[llength $templayers]} {incr x} {
        if {$x==0} {
          set players [lindex $templayers 0]
        } elseif {$x==$number} {
          set players "$players - Subs: [lindex $templayers $number]"
        } else {
          set players "$players,[lindex $templayers $x]"
        }
      }
    } else {
      set actualplayers 0
      set players $templayers
    }
  } elseif {$plrswc==2} {
    set templayers [war_longnick [lindex $infos 6]]
    set players ""
    if {$templayers!="n/a"} {
      set actualplayers [llength $templayers]
      for {set x 0} {$x<[llength $templayers]} {incr x} {
        if {$x==0} {
          set players [lindex $templayers 0]
        } elseif {$x==$number} {
          set players "$players - Subs: [lindex $templayers $number]"
        } else {
          set players "$players,[lindex $templayers $x]"
        }
      }
    } else {
      set actualplayers 0
      set players $templayers
    }
  } else {
    set templayers [lindex $infos 6]
    set players ""
    if {$templayers!="n/a"} {
      set actualplayers [llength $templayers]
      for {set x 0} {$x<[llength $templayers]} {incr x} {
        if {$x==0} {
          set players [lindex $templayers 0]
        } elseif {$x==$number} {
          set players "$players - Subs: [lindex $templayers $number]"
        } else {
          set players "$players,[lindex $templayers $x]"
        }
      }
    } else {
      set actualplayers 0
      set players $templayers
    }
  }
  set info [lindex $infos 7]
  set gametype [lindex $infos 10]
  set infos "$id $hour {$date} {$team} $ourscore $oppscore {$maps} {$players} {$info} $number $actualplayers $gametype"
  return $infos
}

#DONE
proc war_getcodeinfos {id} {
  global war_list
  set infos 0
  foreach war $war_list {
    if {[lindex $war 0]==$id} {
      set infos $war
      break
    }
  }
  if {$infos==0} {
    return 0
  }
  return $infos
}

#DONE
proc war_putinfos {warid plrswc} {
  set infos ""
  for {set x 0} {$x<[llength $warid]} {incr x} {
    set tempinfos [war_getinfos [lindex $warid $x] $plrswc]
    set tempinfos [lreplace $tempinfos 9 10]
    set tempinfos [lreplace $tempinfos 0 1]
    set noday [lrange [lindex $tempinfos 0] 1 end]
    set tempinfos [lreplace $tempinfos 0 0 $noday]
    set ourscore [lindex $tempinfos 2]
    set oppscore [lindex $tempinfos 3]
    set players [lindex $tempinfos 5]
    set gametype [lindex $tempinfos 11]
    if {[string first " - Sub:" $players]>-1} {
      set stringindex [string first " - Sub:" $players]
      set players [string range $players 0 [expr $stringindex-1]]
      set tempinfos [lreplace $tempinfos 5 5 $players]
    }
    if {$ourscore>$oppscore} {
      set tempinfos [linsert $tempinfos 1 "1,3 1,3 1,3 1,3 WON 1,3 1,3 1,3 1,3    "]
    } elseif {$ourscore<$oppscore} {
      set tempinfos [linsert $tempinfos 1 "1,4 1,4 1,4 1,4 LOST 1,4 1,4 1,4    "]
    } elseif {($ourscore=="n/a")&&($oppscore=="n/a")} {
      set tempinfos [linsert $tempinfos 1 "0,1 NOT PLAYED    "]
    } elseif {$ourscore==$oppscore} {
      set tempinfos [linsert $tempinfos 1 "1,14 1,14 1,14 1,14 DRAW 1,14 1,14 1,14    "]
    }
    set tempinfos [lreplace $tempinfos 3 4 "$ourscore - $oppscore"]
    set tempinfos [lreplace $tempinfos 7 7 $gametype]
    set infos [linsert $infos end $tempinfos]
  }
  set result [list "Result:         "]
  set infos [linsert $infos 0 "Date: $result Opponent: Score: Maps: Players: Infos: Game: "]
  for {set x 0} {$x<8} {incr x} {
    if {$x!=1} {
      set length 0
      for {set y 0} {$y<[llength $infos]} {incr y} {
        if {[string length [lindex [lindex $infos $y] $x]]>$length} {
          set length [string length [lindex [lindex $infos $y] $x]]
        }
      }
      incr length 2
      for {set y 0} {$y<[llength $infos]} {incr y} {
        for {set z [string length [lindex [lindex $infos $y] $x]]} {$z<$length} {incr z} {
          set newelement "[lindex [lindex $infos $y] $x] "
          set newinfos [lreplace [lindex $infos $y] $x $x $newelement]
          set infos [lreplace $infos $y $y $newinfos]
        }
      }
    }
  }
  for {set x 0} {$x<8} {incr x} {
    set newelement "2[lindex [lindex $infos 0] $x]"
    set newinfos [lreplace [lindex $infos 0] $x $x $newelement]
    set infos [lreplace $infos 0 0 $newinfos]
  }
  for {set x 0} {$x<[llength $infos]} {incr x} {
    set infos [lreplace $infos $x $x [join [lindex $infos $x]]]
  }
  return $infos
}

#DONE
proc war_insertion {war} {
  global war_list
  set war_list [linsert $war_list end $war]
  set war_list [lsort -integer -index 1 $war_list]
}

#DONE
proc war_modify {newinfos} {
  global war_list
  set id [lindex $newinfos 0]
  for {set x 0} {$x<[llength $war_list]} {incr x} {
    if {[lindex [lindex $war_list $x] 0]==$id} {
      set war_list [lreplace $war_list $x $x $newinfos]
      set war_list [lsort -integer -index 1 $war_list]
      return 0
    }
  }
}

#DONE
proc war_timers {} {
  war_automanagement
  timer 10 war_timers
}

#DONE
proc war_automanagement {} {
  global war_list war_privchan war_topiclength war_gametypetopic war_gametypes war_gametypetopic2
  set topic [topic $war_privchan]
  set endtopic ""
  set limitdate 0
  set limitdate [expr [unixtime]+86400]
  set war_upcoming [list ]
  foreach war $war_list {
    if {([lrange $war 3 4]=="n/a n/a")&&([lindex $war 1]>[unixtime])} {
      set war_upcoming [linsert $war_upcoming end $war]
      if {[lindex $war 1]>$limitdate} {
        break
      }
    }
  }
  if {[llength $war_upcoming]==0} {
    if {[string first ".:||:. " $topic]==-1} {
        if {[string last war_gametypes(none) $topic]==-1} {
            set endtopic war_gametypetopic2(none)
        }
      putserv "TOPIC $war_privchan : $war_gametypetopic(none) Web: www.uk-r.co.uk .:|:. War Status: No war planned .:||:. $topic"
      return 0
    }
    if {![string match "Web: www.uk-r.co.uk .:|:. War Status: No war planned *" $topic]} {
        if {[string last war_gametypes(none) $topic]==-1} {
            set endtopic war_gametypetopic2(none)
        }
      set topic [string range $topic [expr [string first ".:||:. " $topic]+7] end]
      putserv "TOPIC $war_privchan : $war_gametypetopic(none) Web: www.uk-r.co.uk .:|:. War Status: No war planned .:||:. $topic"
      return 0
    }
    return 0
  }
  set infos [war_getinfos [lindex [lindex $war_upcoming 0] 0] 1]
  set hour [lindex $infos 1]
  if {"[clock format [lindex [lindex $war_upcoming 0] 1] -format %y][clock format [lindex [lindex $war_upcoming 0] 1] -format %m%d]"=="[clock format [unixtime] -format %y][clock format [unixtime] -format %m%d]"} {
    set date "Today at"
  } else {
    set date [lindex $infos 2]
  }
  set id [lindex $infos 0]
  set team [lindex $infos 3]
  set maps [lindex $infos 6]
  set players [lindex $infos 7]
  set number [lindex $infos 9]
  set actual [lindex $infos 10]
  set gametype [lindex $infos 11]
  set topicmsg "$war_gametypetopic($gametype) Web: www.uk-r.co.uk .:|:. \{$id\} $gametype vs $team .:|:. $date $hour :: Players: $number :: $maps .:|:. Names: $players"
  set war_missing [list ]
  foreach war $war_upcoming {
    if {[lindex $war 1]>$limitdate} {
      break
    }
    set number [lindex $war 8]
    set actual [llength [lindex $war 6]]
    if {[lindex $war 6]=="n/a"} {
      set war_missing [linsert $war_missing end "[lindex $war 0] $number"]
    } elseif {$actual<$number} {
      set war_missing [linsert $war_missing end "[lindex $war 0] [expr $number-$actual]"]
    }
  }
  set endtopic $war_gametypetopic2($gametype)
  set topicmsg "$topicmsg$endtopic"
  if {[string length $topicmsg]>$war_topiclength} {
    set topicmsg [string range $topicmsg 0 [expr $war_topiclength-12]]
  }
  set topicmsg "$topicmsg .:||:. "
  if {[string first ".:||:. " $topic]==-1} {
    putserv "TOPIC $war_privchan :$topicmsg $topic"
    return 0
  }
  if {![string match "*$topicmsg*" $topic]} {
    set topic [string range $topic [expr [string first ".:||:. " $topic]+7] end]
    putserv "TOPIC $war_privchan :$topicmsg$topic"
  }
}

##NOTHING CHANGED AFTER THIS LINE

proc war_buildhtml {} {
  global war_list war_clanname war_htmldelay war_webserver war_weblogin war_webpassword war_webfolder war_webname war_template war_upload war_bckg1 war_bckg2 war_bckg3 war_bckg4 war_txtc war_txts war_font war_gametypes
  timer $war_htmldelay war_buildhtml
  set war_result [list ]
  foreach war $war_list {
    if {[lindex $war 1]<[unixtime]} {
      set war_result [linsert $war_result 0 $war]
    } elseif {[lindex $war 1]>[unixtime]} {
      break
    }
  }
  if {[llength $war_result]==0} {
    return 0
  }
  set wincounter 0
  set losecounter 0
  set drawcounter 0
  set winpoint 0
  set losepoint 0
  set totalwar [llength $war_result]
  set maplist "[list ] [list ] [list ]"
  foreach war $war_result {
    set tempmaps [lindex $war 5]
    set maps [list ]
    if {$tempmaps!="n/a"} {
      if {[string first "/" $tempmaps]!=-1} {
        set stringindex [string first "/" $tempmaps]
        set maps [linsert $maps end [string range $tempmaps 0 [expr $stringindex - 1]]]
        set maps [linsert $maps end [string range $tempmaps [expr $stringindex + 1] end]]
      } else {
        set maps [linsert $maps end $tempmaps]
      }
    }
    set mapslist [lindex $maplist 0]
    set resultlist [lindex $maplist 1]
    set wonlist [lindex $maplist 2]
    if {[lindex $war 3]>[lindex $war 4]} {
      incr wincounter
      incr winpoint [lindex $war 3]
      incr losepoint [lindex $war 4]
      foreach map $maps {
        if {[lsearch $mapslist $map]==-1} {
          set mapslist [linsert $mapslist end $map]
          set resultlist [linsert $resultlist end 1]
          set wonlist [linsert $wonlist end 1]
        } else {
          set mapindex [lsearch $mapslist $map]
          set currentresult [lindex $resultlist $mapindex]
          set currentwon [lindex $wonlist $mapindex]
          set resultlist [lreplace $resultlist $mapindex $mapindex [expr $currentresult+1]]
          set wonlist [lreplace $wonlist $mapindex $mapindex [expr $currentwon+1]]
        }
      }
    } elseif {[lindex $war 3]<[lindex $war 4]} {
      incr losecounter
      incr winpoint [lindex $war 3]
      incr losepoint [lindex $war 4]
      foreach map $maps {
        if {[lsearch $mapslist $map]==-1} {
          set mapslist [linsert $mapslist end $map]
          set resultlist [linsert $resultlist end 1]
          set wonlist [linsert $wonlist end 0]
        } else {
          set mapindex [lsearch $mapslist $map]
          set currentresult [lindex $resultlist $mapindex]
          set resultlist [lreplace $resultlist $mapindex $mapindex [expr $currentresult+1]]
        }
      }
    } elseif {([lindex $war 3]!="n/a")&&([lindex $war 4]!="n/a")&&([lindex $war 3]==[lindex $war 4])} {
      incr drawcounter
      incr winpoint [lindex $war 3]
      incr losepoint [lindex $war 4]
      foreach map $maps {
        if {[lsearch $mapslist $map]==-1} {
          set mapslist [linsert $mapslist end $map]
          set resultlist [linsert $resultlist end 1]
          set wonlist [linsert $wonlist end 0]
        } else {
          set mapindex [lsearch $mapslist $map]
          set currentresult [lindex $resultlist $mapindex]
          set resultlist [lreplace $resultlist $mapindex $mapindex [expr $currentresult+1]]
        }
      }
    }
    set maplist "[list $mapslist] [list $resultlist] [list $wonlist]"
  }
  set winpc [expr [expr 100*$wincounter]/$totalwar]
  set losepc [expr [expr 100*$losecounter]/$totalwar]
  set drawpc [expr [expr 100*$drawcounter]/$totalwar]
  set winavg [expr $winpoint/$totalwar]
  set loseavg [expr $losepoint/$totalwar]
  set maplist2 ""
  for {set x 0} {$x<[llength [lindex $maplist 0]]} {incr x} {
    set mapname [lindex [lindex $maplist 0] $x]
    set mapresult [lindex [lindex $maplist 1] $x]
    set mapwon [lindex [lindex $maplist 2] $x]
    set mapwon [expr [expr 100*$mapwon]/$mapresult]
    set maplist2 [linsert $maplist2 end "$mapname $mapresult $mapwon"]
    set maplist2 [lsort -integer -decreasing -index 1 $maplist2]
  }
  set colorswitch 0
  foreach war $war_result {
    set infos [war_getinfos [lindex $war 0] 2]
    set id [lindex $infos 0]
    set date [lrange [lindex $infos 2] 1 end]
    set team [lindex $infos 3]
    set ourscore [lindex $infos 4]
    set oppscore [lindex $infos 5]
    set maps [lindex $infos 6]
    set info [lindex $infos 8]
    set players [war_longnick [lindex $war 6]]
    set players [lsort -dictionary $players]
    set players [join $players ", "]
    if {$colorswitch==0} {
      append wintable "\n<tr>"
      append wintable "\n<td bgcolor=\"$war_bckg1\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$date</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg2\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$team</font></td>"
      if {$ourscore>$oppscore} {
        append wintable "\n<td bgcolor=\"#009900\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">WON</font></td>"
      } elseif {$ourscore<$oppscore} {
        append wintable "\n<td bgcolor=\"#CF1010\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">LOST</font></td>"
      } elseif {($ourscore=="n/a")&&($oppscore=="n/a")} {
        append wintable "\n<td bgcolor=\"#FFFFFF\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"#000000\">PENDING </font> </td>"
      } elseif {$ourscore==$oppscore} {
        append wintable "\n<td bgcolor=\"#FFFFFF\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"#000000\">DRAW</font></td>"
      }
      append wintable "\n<td bgcolor=\"$war_bckg2\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$ourscore - $oppscore</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg1\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$maps</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg2\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$players</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg1\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$info</font></td>"
      append wintable "\n</tr>"
      set colorswitch 1
    } else {
      append wintable "\n<tr>"
      append wintable "\n<td bgcolor=\"$war_bckg3\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$date</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg4\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$team</font></td>"
      if {$ourscore>$oppscore} {
        append wintable "\n<td bgcolor=\"#009900\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">WON</font></td>"
      } elseif {$ourscore<$oppscore} {
        append wintable "\n<td bgcolor=\"#CF1010\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">LOST</font></td>"
      } elseif {($ourscore=="n/a")&&($oppscore=="n/a")} {
        append wintable "\n<td bgcolor=\"#FFFFFF\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"#000000\">PENDING </font> </td>"
      } elseif {$ourscore==$oppscore} {
        append wintable "\n<td bgcolor=\"#FFFFFF\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"#000000\">DRAW</font></td>"
      }
      append wintable "\n<td bgcolor=\"$war_bckg4\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$ourscore - $oppscore</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg3\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$maps</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg4\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$players</font></td>"
      append wintable "\n<td bgcolor=\"$war_bckg3\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">$info</font></td>"
      append wintable "\n</tr>"
      set colorswitch 0
    }
  }
  set colorswitch 0
  foreach map $maplist2 {
    if {$colorswitch==0} {
      append maptable "\n<tr>"
      append maptable "\n<td bgcolor=\"$war_bckg1\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 0]</font></td>"
      append maptable "\n<td bgcolor=\"$war_bckg2\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 1]</font></td>"
      append maptable "\n<td bgcolor=\"$war_bckg1\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 2] %</font></td>"
      append maptable "\n</tr>"
      set colorswitch 1
    } else {
      append maptable "\n<tr>"
      append maptable "\n<td bgcolor=\"$war_bckg3\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 0]</font></td>"
      append maptable "\n<td bgcolor=\"$war_bckg4\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 1]</font></td>"
      append maptable "\n<td bgcolor=\"$war_bckg3\" align=\"center\"><font face=\"$war_font\" size=\"$war_txts\" color=\"$war_txtc\">[lindex $map 2] %</font></td>"
      append maptable "\n</tr>"
      set colorswitch 0
    }
  }
  set misc "Generated by <a href=\"http://sourceforge.net/projects/war-manager/\" target=_blank>warmanager.tcl</a> (by kalhimeo)"
  set fp [open $war_template r]
  set out [read $fp]
  close $fp
  while {[lsearch $out "%clanname"]>-1} {
    set pos [lsearch $out "%clanname"]
    set out [lreplace $out $pos $pos $war_clanname]
  }
  while {[lsearch $out "%winnumber"]>-1} {
    set pos [lsearch $out "%winnumber"]
    set out [lreplace $out $pos $pos $wincounter]
  }
  while {[lsearch $out "%losenumber"]>-1} {
    set pos [lsearch $out "%losenumber"]
    set out [lreplace $out $pos $pos $losecounter]
  }
  while {[lsearch $out "%drawnumber"]>-1} {
    set pos [lsearch $out "%drawnumber"]
    set out [lreplace $out $pos $pos $drawcounter]
  }
  while {[lsearch $out "%winpc"]>-1} {
    set pos [lsearch $out "%winpc"]
    set out [lreplace $out $pos $pos $winpc]
  }
  while {[lsearch $out "%losepc"]>-1} {
    set pos [lsearch $out "%losepc"]
    set out [lreplace $out $pos $pos $losepc]
  }
  while {[lsearch $out "%drawpc"]>-1} {
    set pos [lsearch $out "%drawpc"]
    set out [lreplace $out $pos $pos $drawpc]
  }
  while {[lsearch $out "%winavg"]>-1} {
    set pos [lsearch $out "%winavg"]
    set out [lreplace $out $pos $pos $winavg]
  }
  while {[lsearch $out "%loseavg"]>-1} {
    set pos [lsearch $out "%loseavg"]
    set out [lreplace $out $pos $pos $loseavg]
  }
  while {[lsearch $out "%wartable"]>-1} {
    set pos [lsearch $out "%wartable"]
    set out [lreplace $out $pos $pos $wintable]
  }
  while {[lsearch $out "%maptable"]>-1} {
    set pos [lsearch $out "%maptable"]
    set out [lreplace $out $pos $pos $maptable]
  }
  while {[lsearch $out "%misc"]>-1} {
    set pos [lsearch $out "%misc"]
    set out [lreplace $out $pos $pos $misc]
  }
  set out [concat $out]
  set out [join $out]
  set fileo [open $war_webname w]
  puts $fileo $out
  close $fileo
  if {$war_upload==1} {
    sendftp $war_webname $war_webserver $war_weblogin $war_webpassword $war_webfolder/$war_webname
  } else {
    set fileo [open $war_webfolder/$war_webname w]
    puts $fileo $out
    close $fileo
  }
}

proc war_readfile {} {
  global war_list war_counter war_nicks war_welcomemsg
  set fileio [open War_Archives "r"]
  set war_list [gets $fileio]
  close $fileio
  set war_counter [lindex [lindex [lsort -integer -index 0 $war_list] end] 0]
  if {$war_counter==""} {
    set war_counter -1
  }
  incr war_counter
  set fd [open War_Miscs r] 
  set data [split [read $fd] "\n"] 
  close $fd 
  set war_welcomemsg [lindex $data 0]
  set war_nicks [lindex $data 1]
}

proc war_savefiles {} {
  global war_list
  set fileio [open War_Archives "w"]
  puts $fileio $war_list
  flush $fileio
  close $fileio
}

proc war_savemiscs {} {
  global war_nicks war_welcomemsg
  set data [list $war_welcomemsg $war_nicks]
  set fd [open War_Miscs w] 
  puts $fd [join $data "\n"] 
  close $fd
}

proc war_backupfiles {min b c d e} {
  global war_list war_uploadbackup war_webserver war_weblogin war_webpassword war_webfolder 
  set fileio [open War_Archives.bak "w"]
  puts $fileio $war_list
  flush $fileio
  close $fileio
  if {$war_uploadbackup==1} {
    sendftp War_Archives.bak $war_webserver $war_weblogin $war_webpassword $war_webfolder/War_Archives.bak
  }
}

proc war_needpass {args} {
  global war_keys
  set chan [lindex $args 2]
  set chan [lindex $chan 1]
  if {[info exists war_keys($chan)]} {
    putserv "JOIN $chan $war_keys($chan)"
  }
}

proc war_remoldflag {} {
  global war_privchan war_authnick
  foreach war_handlecheck [userlist V] {
    set war_nickcheck [hand2nick $war_handlecheck $war_privchan]
    if { ( $war_nickcheck == "" ) || ( ![info exists war_authnick($war_nickcheck)] ) } {
      chattr $war_handlecheck -V
      if { [info exists war_authnick($war_nickcheck)] } {
        unset war_authnick($war_nickcheck)
      }
    }
  }
}

proc war_isauth { nick chan } {
  global war_authnick
  if ![info exists war_authnick($nick)] { return "" }
    if [matchattr $war_authnick($nick) W|W $chan] {
      if [matchattr $war_authnick($nick) V] {
        return $war_authnick($nick)
      }
    }
  return ""
}

proc war_auth {nick uhost hand rest} {
  global war_authnick war_privchan botnick war_authsys war_trigger
  if {$war_authsys==0} {
    putserv "NOTICE $nick :5Auth system has been disabled by the bot holder, every member can access all features"
    return 0
  }
  set handle hand
  set pw [lindex $rest 0]
  set givenick [lindex $rest 1]
  if [string length $givenick] {
    set hand $givenick
  } else {
    if ![string compare $hand "*"] {
      putserv "NOTICE $nick :5You aren't recognized by the bot. Maybe you changed your ident@host. Please contact the bot holder."
      return 0
    }
  }
  if [lsearch -exact [userlist W|W] $hand]==-1 {
    putserv "NOTICE $nick :5You are recognized, but you don't have the Admin access. Please contact the bot holder. I know you as: $hand"
    return 0
  }
  set ok 0
  if [onchan $nick $war_privchan] {
     set ok 1
  }
  if !$ok {
    putserv "NOTICE $nick :5You have to be on $war_privchan to authenticate yourself."
    return 0
  }
  if [info exists war_authnick($nick)] {
    putserv "NOTICE $nick :5You are already authenticated as a Admin with the nick $war_authnick($nick)."
    return 0
  }
  if ![string length $pw] {
    putserv "NOTICE $nick :5Syntax : /msg $botnick [string trim $war_trigger]admin <password>"
    return 0
  }
  if [passwdok $hand ""] {
    putserv "NOTICE $nick :5You don't have any password set. Type /msg $botnick pass <password>"
    return 0
  }
  if [passwdok $hand $pw] {
    chattr $hand +V
    set war_authnick($nick) $hand
    putserv "NOTICE $nick :5You are now authenticated as an Admin."
    putcmdlog "($nick!$uhost) !$hand! admin ..."
  } else {
    putserv "NOTICE $nick :5Authentication failed ... logged !"
    putcmdlog "($nick!$uhost) !$hand! FAILED admin"
  }
}

proc war_tchk { } {
  global war_timeoutdelay war_authnick war_privchan
  timer 2 war_tchk
  set inactnicks ""
  set actnicks ""
  set chan $war_privchan
  foreach nick [chanlist $chan] {
    if [string length [war_isauth $nick $chan]] {
      set inactindex [lsearch -exact $inactnicks $nick]
      set actindex [lsearch -exact $actnicks $nick]
      if [getchanidle $nick $chan]>$war_timeoutdelay {
        if ($inactindex==-1)&&($actindex==-1) {
          lappend inactnicks $nick
        }
      } else {
        if ($actindex!=-1) {
          lappend actnicks $nick
        }
        set inactnicks [lreplace $inactnicks $inactindex $inactindex]
      }
    }
  }
  foreach nick $inactnicks {
    chattr $war_authnick($nick) -V
    unset war_authnick($nick)
    putserv "NOTICE $nick :5Your Admin authentication has been removed automatcly because of your idleness."
  }
}

proc war_alias {hand idx args} {
  global war_nicks
  set args [join $args]
  if {[llength $args]!=3} {
    putlog "Error: Invalid args ( .alias short/long <handle> <alias> )"
    return 0
  }
  set check [war_charfilter $args]
  if {$check!=1} {
    putlog "Invalid character: \"$check\". Please do not use such character in any field."
    return 0
  }
  set switch [lindex $args 0]
  set handle [lindex $args 1]
  set alias [lindex $args 2]
  if {[lsearch [userlist] $handle]==-1} {
    putlog "Error: Unknown handle, use \".tcl userlist\" to list all users"
    return 0
  }
  set position -1
  for {set x 0} {$x<[llength $war_nicks]} {incr x} {
    if {[lindex [lindex $war_nicks $x] 0]==$handle} {
      set position $x
      break
    }
  }
  if {$switch=="short"} {
    if {$position==-1} {
      set war_nicks [linsert $war_nicks end "$handle $alias $handle"]
    } else {
      set infos [lindex $war_nicks $position]
      set infos [lreplace $infos 1 1 $alias]
      set war_nicks [lreplace $war_nicks $position $position $infos]
    }
    putlog "Short alias for $handle is now $alias"
  } elseif {$switch=="long"} {
    if {$position==-1} {
      set war_nicks [linsert $war_nicks end "$handle $handle $alias"]
    } else {
      set infos [lindex $war_nicks $position]
      set infos [lreplace $infos 2 2 $alias]
      set war_nicks [lreplace $war_nicks $position $position $infos]
    }
    putlog "Long alias for $handle is now $alias"
  } else {
    putlog "Error: Invalid args ( .alias short/long <handle> <alias> )"
    return 0
  }
  war_savemiscs
}

proc war_shortnick {players} {
  global war_nicks
  for {set x 0} {$x<[llength $players]} {incr x} {
    foreach nick $war_nicks {
      if {[lindex $nick 0]==[lindex $players $x]} {
        set players [lreplace $players $x $x [lindex $nick 1]]
        break
      }
    }
  }
  return $players
}

proc war_longnick {players} {
  global war_nicks
  for {set x 0} {$x<[llength $players]} {incr x} {
    foreach nick $war_nicks {
      if {[lindex $nick 0]==[lindex $players $x]} {
        set players [lreplace $players $x $x [lindex $nick 2]]
        break
      }
    }
  }
  return $players
}

proc war_checkdate {date} {
  if {[string length $date]!=14} {
    return "5Error: invalid date ( don't forget to use leading '0' when less than 1 number , ex: march=03 )"
  }
  for {set x 0} {$x<14} {incr x} {
    if {($x!=2)&&($x!=5)&&($x!=8)&&($x!=11)} {
      set char [string index $date $x]
      if {($char!=0)&&($char!=1)&&($char!=2)&&($char!=3)&&($char!=4)&&($char!=5)&&($char!=6)&&($char!=7)&&($char!=8)&&($char!=9)} {
         return "5Error: invalid character: $char ( correct format: hh:mm-dd/mm/yy )"
      }
    }
  }
  set hour [string range $date 0 1]
  while {[string index $hour 0]==0} {
    set hour [string range $hour 1 end]
  }
  if {$hour>23} {
    return "5Error: invalid hour ( Valid settings are between 00 and 23 )"
  }
  set minute [string range $date 3 4]
  while {[string index $minute 0]==0} {
    set minute [string range $minute 1 end]
  }
  if {$minute>59} {
    return "5Error: invalid minute ( Valid settings are between 00 and 59 )"
  }
  set day [string range $date 6 7]
  while {[string index $day 0]==0} {
    set day [string range $day 1 end]
  }
  if {($day>31)||($day==0)} {
    return "5Error: invalid day ( Valid settings are between 01 and 31 )"
  }
  set month [string range $date 9 10]
  while {[string index $month 0]==0} {
    set month [string range $month 1 end]
  }
  if {($month>12)||($month==0)} {
    return "5Error: invalid month ( Valid settings are between 01 and 12 )"
  }
  return 1
}

proc war_charfilter {x {y ""} } {
  for {set i 0} {$i < [string length $x]} {incr i} {
    switch -- [string index $x $i] {
    "\[" {return "\["}
    "\]" {return "\]"}
    "\}" {return "\}"}
    "\{" {return "\{"}
    "\\" {return "\\"}
    }
  }
  return 1
}

putlog "War Manager v$war_version by Galadhrim has successfully loaded"
