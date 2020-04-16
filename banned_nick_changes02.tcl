## banned_nick_changes02.tcl
##
##  This tcl script monitors nick changes on a channel, verifying the ban list
##  of the bot, and knocking them out if they are banned. An important function
##  is that it checks both exactly nick bans (i.e.: nick!*@*) and mask bans
##  (i.e.: *nick*!*@*, *nick!*@*, nick*!*@* etc).
##
##  For this, it creates a new temporary ban for the new nick, based on the
##  ban list of the bot, and keeping the original ban. For example, if there
##  is a ban for *block*!*@* in the ban list, when someone changes the nick to
##  anything containing block, it will be kicked and banned in the format
##  *newnick*!*@*. if the new nick is too big, so it take the 20 first characters, 
##  and creates a new ban in the same format.
##  
##  NOTE: It's recommended that you activate +enforcebans in the bot conf file.
##        So this will probably work properly.
##
##  Although we've tested this script, we are not responsible for anything 
##  that happens to your bot. So, good luck !!! :)
##
##  Please report bugs and suggestions to one of the addresses below: 
##      
##     GiZZmo <vivas@usa.net>
##     Buster_ <ejr@infonet.com.br>
##
##  Se voce nao entende ingles e quer um script traduzido ou uma ajuda com os
##  scripts que voce possui, mande um e-mail para nos.
##
##     Wed  08-25-1999
## 

bind nick - * banned_nicks 

proc banned_nicks {nick uhost hand chan newnick} {
   set novonick  "[string range $newnick 0 19]!*@*" 
   if {[matchban $novonick $chan]} {
      set novonick  "*[string range $newnick 0 19]*!*@*"
      putlog "$newnick is banned!! Kicking from $chan"
      pushmode $chan +b $novonick
      putserv "kick $chan $newnick :You are Banned!!"
    }  
}

putlog "Loading Banned Nick Changes Script, v0.2 -- By GiZZmo <vivas@usa.net> and Buster_ <ejr@infonet.com.br>"

## SDG (Sergipe Development Group)
