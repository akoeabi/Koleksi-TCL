## VoiceMe script
## Version 1.0 (My first public script) Wish me luck :P
## So the script voices users when they request it to a bot /msg <Botnick> voiceme
## And it devoice users when they type /msg <BotNick> devoiceme 
## And after a period of time (that can be set in settings current is 30 minutes) 
## it devoices all users that not talked on channel for 30 minutes
## Have fun using my script 
## Made by Silviu <Silviu@Deva.Rdsnet.Ro>

##     Example

## /msg Bot voiceme #channel
## [00:00:00] * Bot sets mode: +v MyNick
## Then i get a notice from the Bot
## [00:00:00] -Bot- Have fun and so on, If you do not need voice anymore use /msg Bot devoiceme
## /msg Bot devoiceme #channel
## [00:00:00] * Bot sets mode: -v MyNick
## Then i get a notice from the Bot
## [00:00:00] -Bot- If u want later to get +v use /msg Bot voiceme

##     Commands
## /msg <Botnick> voiceme
## /msg <Botnick> devoiceme

##     Settings

## The channel where you want the script to be active
set vchan #bocom
## The time you want to let the users with voice status in minutes
set vtime 30
## The time for the bot to check the channel in minutes
set vchecktime 1

## Now the script :))
## If u change something it will be on your own risk !!!

if {![string match "*idle:devoice*" [timers]]} { timer $vchecktime idle:devoice }

proc idle:devoice {} {
	global vchan vtime vchecktime
	foreach user [chanlist $vchan] {
        	if {[getchanidle $user $vchan] > $vtime} {
			if { [isvoice $user $vchan] } { pushmode $vchan -v $user }
		}
	}
        timer $vchecktime idle:devoice
}

bind msg - voiceme msg:voiceme
proc msg:voiceme { nick host hand text } {
	global vchan
        global botnick
	if {![onchan $nick $vchan]} {
		puthelp "NOTICE $nick :gak ada tuh nick $nick di $vchan"
		return 0
	}
	if {[isvoice $nick $vchan]} {
		puthelp "NOTICE $nick :$nick udah dpt +v tuh di $vchan. untuk -v /msg $botnick devoiceme ato pv $botnick ketik devoiceme"
		return 1
	}
	pushmode $vchan +v $nick
	puthelp "NOTICE $nick :makasih udah gabung di $vchan, untuk -v /msg $botnick devoiceme ato pv $botnick ketik devoiceme"
	return 1
}

bind msg - devoiceme msg:devoiceme
proc msg:devoiceme { nick host hand text } {
        global vchan
        global botnick
        if {![onchan $nick $vchan]} {
                puthelp "NOTICE $nick :gak ada tuh nick $nick di $vchan"
                return 0
        }
	if {![isvoice $nick $vchan]} {
		puthelp "NOTICE $nick :$nick belom dpt +v tuh di $vchan. untuk +v /msg $botnick voiceme ato pv $botnick ketik voiceme"
		return 0
	}
	pushmode $vchan -v $nick
        puthelp "NOTICE $nick :$nick untuk dpt +v /msg $botnick voiceme ato pv $botnick ketik voiceme"
}
putlog "VoiceMe script v. 1.0 by Silviu loaded succesfully for any bugs , comments mail <Silviu@Deva.Rdsnet.Ro>"
