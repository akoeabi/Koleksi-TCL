##########################################################
### Bad Word TCL modified for 1.3.x bots by TheGhost aka TG
### you can contact me at TheGhost@EFNET jsimm@satexas.com
### THIS SCRIPT WONT WORK ON 1.1.5 BOTS
###
### Made it a little more secure and slimed it down a tad
### took out the other checks about ops and masters it only
### checks for the +f flag now so if you have a user with +f
### it wont kick them, seemed silly to have all that stuff 
### about masters and owners in it. 
### Also dekiddyized it, for adult usage.
###
### Orginal author I forgot kuz i cut the garbage off the top
###
### Not Really   : Rajeh Alharithi - ZimoZimo@EFnet                  
###
### Make sure you check the set flagx lines to be sure they 
### dont conflict with any other scripts.
############################################################

# Set this to the default password to assign to the added user
# record.
set bword "badword1"

##Ban time for second warning
set ban-time 10

##Comment for ban
set Ban "For abusive language"

set flag1 Y
set flag2 E
set flag3 G

###The bad words add and remove as you please

 bind pubm - "*fuck*" badword
 bind pubm - "*bastard*" badword
 bind pubm - "*cock *" badword
 bind pub - "cunt" badword
 bind pub - "nigger" badword
 bind pubm - "*fag*" badword
 bind pubm - "*shit*" badword
 bind pubm - "*asshole*" badword
 bind pubm - "*asshole*" badword
 bind pubm - "*bitch*" badword
 bind pubm - "*pussy*" badword
 bind pub - "whore" badword
 bind pub - "slut" badword
 bind pub - "dickhead" badword
 bind pub - "nigga" badword
 bind pub - "nigger" badword
 bind pub - "piss" badword
 bind pub - "maricon" badword
 bind pub - "maricone" badword
 bind pub - "suck" badword
 bind pub - "shithead" badword
 bind pub - "prick" badword
 bind pub - "sucks" badword
 bind pub - "dicks" badword
 bind pub - "pricks" badword

proc badword {nick uhost hand chan rest} {
putlog "$nick $uhost $hand $chan $rest"
  global botnick ban-time Ban bword
    if {([ matchattr $hand f ])} {
      	putserv "PRIVMSG $chan :\001ACTION OVER Hears \002$nick\002 And SmiLes L:-)\001"
        return 1
	} elseif {([matchattr $hand G])} {
          chattr $nick +dk
	  setuser $nick COMMENT "Perm banned for 4 bad word offenses"
          putserv "PRIVMSG $chan :$nick You Are Not Welcomed Here Anymore..."
	  putserv "KICK $chan $nick :$Ban \[Perm\]"	
        return 1
	} elseif {([matchattr $hand E])} {
	  chattr $nick +G-E
	  putserv "PRIVMSG $chan :$nick You Have Had Your Chances, Now You Are Out of Here. Strike! two  Your --------=>>> Out."
          set banlamer [maskhost [getchanhost $nick $chan]]
          newban $banlamer Badword $Ban 120 none
          setuser $nick COMMENT "3 Bad Word Offenses"
          return 1
	} elseif {([matchattr $hand Y])} {
	  chattr $nick +E-Y
	  putserv "PRIVMSG $chan :Has taken action on $nick for the 2nd Offense"
	  set banlamer [maskhost [getchanhost $nick $chan]]
          newban $banlamer Badword $Ban 10 none
          setuser $nick COMMENT "2 Bad Word Offenses"
          return 1
	} 
          adduser $nick [maskhost [getchanhost $nick $chan]]
          putserv "PRIVMSG $chan :\001ACTION Detected A Banned Word by $nick\001"
          putserv "PRIVMSG $nick :\001ACTION Hey, $nick, Profanity IS BAD,I Will Not allow Such A Thing In This Channel!!!\001"
          putserv "PRIVMSG $chan :\001ACTION Bad Language Is Not Fun, $nick Should never have said that...\001"
          putserv "KICK $chan $nick :Get The out of here with that kind of talk"
          putserv "NOTICE $nick :Please DON'T use that language in $chan"
          putserv "NOTICE $nick :\001ACTION Is Frowning At $nick This is your \[1st Warning\]\001"
          putserv "NOTICE $nick :If You Continue, You Will Be Banned The Second Time For 1 hour"
          chattr $nick +Y
          setuser $nick PASS $bword 
          setuser $nick COMMENT "1st Offense Badword"
          return 0
	 }
putlog "\[Word|KiCk\] v3.0 By \002TheGhost\002 is Loaded"


