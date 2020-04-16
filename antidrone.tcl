# -+--+--+--+--+--+ 
 # copyright: 
 # -+--+--+--+--+--+ 
 # 
 # This program is free software; you can redistribute it and/or 
 # modify it under the terms of the GNU General Public License 
 # as published by the Free Software Foundation; either version 2 
 # of the License, or (at your option) any later version. 
 # 
 # This program is distributed in the hope that it will be useful, 
 # but WITHOUT ANY WARRANTY; without even the implied warranty of 
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 # GNU General Public License for more details. 
 # 
 # You should have received a copy of the GNU General Public License 
 # along with this program; if not, write to the Free Software 
 # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA. 
 # 
 # -+--+--+--+--+--+ 
 # end copyright: 
 # -+--+--+--+--+--+ 

 ################################################################################################################################### 
 #                  antidrone.tcl 
 ################################################################################################################################### 

 # antidrone.tcl by sKy\ 
 # Version 1.1 
 # 
 # This script is desinged to kickban those bots with $nickname and 2 digits at the end of the nickname. 
 # Those bots are really anoying. Them try to send you dcc files, weblinks to infected websites or advertisements. 
 # The script will be active in all channels the bot is op. It won`t just kick all users which match nicknameDigitDigit. 
 # Them need to be added to the dronenicklist. (This is because there are a couple of users with regular nicknames in that style.) 
 # 
 # Commands (important: nick = the nickname of the drone _without_ digits): 
 # on dcc chat: 
 # .+drone nick || .-drone nick || .+list 
 # or in channel: 
 # +drone nick || -drone nick || +list 
 # 
 # To add someone to the extempt list add him userflag mnofv or I 
 # .+user handle 
 # .+host handle hostmask 
 # .chattr handle +I 
 # 
 # Installation: 
 # - make a file in your eggdrop main dir (eggdrop/dronenicklist.txt) 
 # - write in that file some nicknames with dronenicks; or let it empty and add them later via pubik or dcc command 
 # - make a file in your scripts dir (eggdrop/scripts/antidrone.tcl) 
 # - put this code inside 
 # - open your eggdrop.conf and add 'source scripts/antidrone.tcl' 
 # - rehash your bot; script should work 

 ################################################################################################################################### 
 #                  config    
 ################################################################################################################################### 

 # here you can set the kickmsg 
 set antidrone(reason) "Dronenick." 

 # set here which flag is needed to add new drones, remove them or to show the actual list of trojannicknames 
 set antidrone(neededflag) "mno|mno" 

 ################################################################################################################################### 
 ################################################################################################################################### 
 ################################################################################################################################### 
 # Do not edit anything below this line. 
 ################################################################################################################################### 
 ################################################################################################################################### 
 ################################################################################################################################### 

 ################################################################################################################################### 
 #                  drone join 
 ################################################################################################################################### 

 bind join - * antidrone_join 

 proc antidrone_join { nickname hostname handle channel } { 
    if { ! [info exists ::antidrone(trojan_nicklist)] } { antidrone_read } 
    if { ! [onchan $nickname $channel] } { return 1 } 
    if { ! [botisop $channel] } { return 2 } 
    if { [isbotnick $nickname] } { return 3 } 
    set nickname [string tolower $nickname] 
    if { [matchattr handle mnofvI|mnofvI $channel] } { return 4 } 
    if { [string match -nocase "*.quakenet.org" $hostname] } { return 5 } 
    if { [string match -nocase "*.undernet.org" $hostname] } { return 5 } 
    if { [string match -nocase "*.user.gamesurge" $hostname] } { return 5 } 
    set fullhost "$nickname!$hostname" 
    if { ! [validchan $channel] } { return 5 } 
    if { [info command nofloodbot] != "" } { 
       if { [nofloodbot $fullhost] != 0 } { return 6 } 
    } 
    if { [info command validauth] != "" } { 
       if { [validauth $nickname] } { return 7 } 
    } 
    set check [regsub -all {[0-9]} $nickname "" shortnick] 
    if { $check <= 1 || $check >= 3 } { 
       # the nickname consits only 1 digit or more then 3 (so it can`t be that type for drone) 
       return 8 
    } 
    set string_length [string length $nickname] 
    set prelast [expr {$string_length - 2}] 
    set prelast [lindex [split $nickname ""] $prelast] 
    set last [expr {$string_length - 1}] 
    set last [lindex [split $nickname ""] $last] 
    set valid 0 
    if { [isnumber $last] && [isnumber $prelast] } { 
       set valid 1 
    } 
    if { $valid != 1 } { 
       # if the last 2 letters of the nickname aren`t digtits then it can`t be that type of drone) 
       return 9 
    } 
    if { ! [isdronenick $nickname] } { return 13 } 
    if { [info command punish] == "punish" } { 
       punish $nickname [get:ban:mask antidrone!$hostname] $handle $channel "antidronescript" 0 $::antidrone(reason) "kickban" 
       return 10 
    } else { 
           set hostname [string map {~ ""} $hostname] 
       pushmode $channel +b "*!*$hostname" 
       flushmode $channel 
       putkick $channel $nickname $::antidrone(reason) 
       return 11 
    } 
    putlog "antidrone_join: $nickname | $fullhost | $channel | /whois $nickname | suggest: .+drone $shortnick" 
    return 12 
 } 

 ################################################################################################################################### 
 #                  isdronenick $nickname 
 ################################################################################################################################### 

 proc isdronenick { nickname } { 
    if { ! [info exists ::antidrone(trojan_nicklist)] } { antidrone_read } 
    set nickname [string tolower $nickname] 
    foreach trojannick $::antidrone(trojan_nicklist) { 
       set pattern [string2pattern $trojannick] 
       set pattern "$pattern??" 
       if { [string match $pattern $nickname] } { 
          return 1 
       } 
    } 
    return 0 
 } 

 ################################################################################################################################### 
 #                  add nickname 
 ################################################################################################################################### 

 bind dcc $antidrone(neededflag) +drone antidrone_add_dcc 

 proc antidrone_add_dcc { handle idx text } { 
    set nickname [hand2nick $handle] 
    set hostname [getchanhost $nickname] 
    set channel "dcc" 
    antidrone_add_pub $nickname $hostname $handle $channel $text 
 } 

 bind pub $antidrone(neededflag) +drone antidrone_add_pub 

 proc antidrone_add_pub { nickname hostname handle channel text } { 
    antidrone_read 
    if { [llength [split $text]] > 1 || [llength [split $text]] == 0 } { 
       antidrone_out $channel $nickname "Wrong syntax. Should be $::lastbind +drone <nick_of_drone_without_digits>" 
       return 
    } 
    set nick [join [lrange [split $text] 0 0]] 
    set nick [string tolower $nick] 
    set allready_added 0 
    foreach nick_added $::antidrone(trojan_nicklist) { 
       if { [string equal -nocase $nick $nick_added] } { 
          set allready_added 1 
          break 
       } 
    } 
    if { $allready_added == 1 } { 
       antidrone_out $channel $nickname "$nick was allready added." 
       antidrone_refresh 
       return 
    } 
    if { [regsub -all {[0-9]} $nick "" shortnick] > 0 } { 
       antidrone_out $channel $nickname "$nick has not been added to the dronenicklist. The nick should not consits digits." 
       return 
    } 
    lappend ::antidrone(trojan_nicklist) $nick 
    # call proc to save the new list 
    antidrone_save 
    antidrone_out $channel $nickname "OK, done! $nick has been added to the dronenicklist." 
    antidrone_refresh 
 } 

 ################################################################################################################################### 
 #                  antidrone_refresh 
 ################################################################################################################################### 

 proc antidrone_refresh { } { 
    foreach channel [channels] { 
       if { ! [validchan $channel] } { continue } 
       if { ! [botisop $channel] } { continue } 
       foreach nickname [chanlist $channel] { 
          set hostname [getchanhost $nickname] 
          set handle [nick2hand $nickname] 
          antidrone_join $nickname $hostname $handle $channel 
       } 
    } 
 } 

 ################################################################################################################################### 
 #                  antidrone_out    
 ################################################################################################################################### 

 proc antidrone_out { channel nickname text } { 
    if { $channel == "dcc" } { 
       putlog "$nickname : $text" 
    } else { 
       puthelp "PRIVMSG $channel :$text" 
    } 
 } 

 ################################################################################################################################### 
 #                  antidrone_del    
 ################################################################################################################################### 

 bind dcc $antidrone(neededflag) -drone antidrone_del_dcc 

 proc antidrone_del_dcc { handle idx text } { 
    set nickname [hand2nick $handle] 
    set hostname [getchanhost $nickname] 
    set channel "dcc" 
    antidrone_del_pub $nickname $hostname $handle $channel $text 
 } 

 bind pub $antidrone(neededflag) -drone antidrone_del_pub 

 proc antidrone_del_pub { nickname hostname handle channel text } { 
    antidrone_read 
    if { [llength [split $text]] > 1 || [llength [split $text]] == 0 } { 
       antidrone_out $channel $nickname "Wrong syntax. Should be $::lastbind -drone <nick_of_drone_without_digits>" 
       return 
    } 
    set nick [join [lrange [split $text] 0 0]] 
    set nick [string tolower $nick] 
    set ::antidrone(trojan_nicklist) [lremove $::antidrone(trojan_nicklist) $nick] 
    antidrone_out $channel $nickname "OK, done! $nick has been deleted from the dronenicklist." 
    # call proc to save the new list 
    antidrone_save 
 } 

 ################################################################################################################################### 
 #                  antidrone_list 
 ################################################################################################################################### 

 bind dcc $antidrone(neededflag) +list antidrone_list_dcc 

 proc antidrone_list_dcc { handle idx text } { 
    set nickname [hand2nick $handle] 
    set hostname [getchanhost $nickname] 
    set channel "dcc" 
    antidrone_list_pub $nickname $hostname $handle $channel $text 
 } 

 bind pub $antidrone(neededflag) +list antidrone_list_pub 

 proc antidrone_list_pub { nickname hostname handle channel text } { 
    antidrone_read 
    set out [join $::antidrone(trojan_nicklist)] 
    antidrone_out $channel $nickname "Dronenicklist: $out" 
 } 

 ################################################################################################################################### 
 #                  antidrone_save 
 ################################################################################################################################### 

 proc antidrone_save { } { 
    # if no file exists create a new one 
    if { ! [file exists dronenicklist.txt] } { 
       set file [open dronenicklist.txt a] 
       close $file 
    } 
    # delete old save file 
    file delete dronenicklist_save.txt 
    # rename the old nicklist file to a new one (to prevent lost of all data incase of a botcrash...) 
    file rename dronenicklist.txt dronenicklist_save.txt 
    # create the original file new 
    set file [open dronenicklist.txt a] 
    set ::antidrone(trojan_nicklist) [string tolower $::antidrone(trojan_nicklist)] 
    set ::antidrone(trojan_nicklist) [lsort -unique $::antidrone(trojan_nicklist)] 
    set ::antidrone(trojan_nicklist) [lsort $::antidrone(trojan_nicklist)] 
    foreach nick $::antidrone(trojan_nicklist) { 
       puts $file $nick 
    } 
    close $file 
    antidrone_read 
 } 

 ################################################################################################################################### 
 #                  antidrone_read 
 ################################################################################################################################### 

 proc antidrone_read { } { 
    set ::antidrone(trojan_nicklist) [list] 
    # if no file exists create a new one 
    if { ! [file exists dronenicklist.txt] } { 
       set file [open dronenicklist.txt a] 
       close $file 
    } 
    set file [open dronenicklist.txt r] 
    set data [read $file] 
    foreach nick $data { 
       lappend ::antidrone(trojan_nicklist) $nick 
    } 
    set ::antidrone(trojan_nicklist) [string tolower $::antidrone(trojan_nicklist)] 
    set ::antidrone(trojan_nicklist) [lsort -unique $::antidrone(trojan_nicklist)] 
    set ::antidrone(trojan_nicklist) [lsort $::antidrone(trojan_nicklist)] 
    return $::antidrone(trojan_nicklist) 
 } 
     
 ################################################################################################################################### 
 #                  procs from mytools.tcl 
 ################################################################################################################################### 
 # string2pattern; lremove 

 proc lremove { list what } { 
    while { [set pos [lsearch -exact $list $what]] != -1 } { 
       set list [lreplace $list $pos $pos] 
    } 
    return $list 
 } 

 proc string2pattern { text } { 
    regsub -all -- {(\\|\[|\]|\{|\}|\.|\+|\?|\(|\)|\||\*)} $text {\\\1} text 
    return $text 
 } 

 ################################################################################################################################### 
 #                  putlog/copyright 
 ################################################################################################################################### 

 putlog "*** antidrone.tcl by sKy\\ loaded. ***" 
 # This script is under GNU General Public License! For more infos see the script header!