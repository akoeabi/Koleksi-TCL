########################################################
# Utility Away Simulation TCL was edit by Doni@DALnet. #
#                                                      #
# This script is used by BeastClan eggdrops.           #
########################################################

# feel free to edit these random away messages or add some
set awaymsgs {
  "(praying shit) [BX-MsgLog On]"
  "(sudden death) [BX-MsgLog Off]"
  "(be right back) [BX-MsgLog On]"
  "(making love) [BX-MsgLog Off]"
  "(fucking in heaven) [BX-MsgLog On]"
  "(going to hell) [BX-MsgLog Off]"
  "(kicking ass) [BX-MsgLog On]"
  "(farting out loud) [BX-MsgLog Off]"
  "(playing Counter Strike) [BX-MsgLog On]"
  "(away from keyboard) [BX-MsgLog Off]"
  "(listening to KoRn.mp3) [BX-MsgLog On]"
  "(screaming 'till dead) [BX-MsgLog Off]"
  "(ripping someone) [BX-MsgLog On]"
  "(kindaping kiddo) [BX-MsgLog Off]"
  "(rapping some chicks) [BX-MsgLog On]" 
  "(making money) [BX-MsgLog Off]"
  "(parking tons of 'em) [BX-MsgLog On]"
  "(blaming god) [BX-MsgLog Off]"
  "(yelling ma bitch) [BX-MsgLog On]"
  "(spitting satan) [BX-MsgLog Off]"
  "(reading cnn.com) [BX-MsgLog On]"
  "(watching vcds) [BX-MsgLog Off]"
  "(not here, bbl) [BX-MsgLog On]"
  "(searching something to eat) [BX-MsgLog Off]"
  "(back to real life) [BX-MsgLog On]"
  "(back to campus) [BX-MsgLog Off]"
  "(learning some stuff) [BX-MsgLog On]"
  "(taking shower) [BX-MsgLog Off]"
  "(calling someone on the phone) [BX-MsgLog On]"
  "(brb) [BX-MsgLog Off]"
  "(bbl) [BX-MsgLog On]"
  "(bbs) [BX-MsgLog Off]"
  "(afk) [BX-MsgLog On]"
  "(peeing off this bladder) [BX-MsgLog Off]"
  "(peeping on girl's bathroom) [BX-MsgLog On]"
  "(watching Mtv) [BX-MsgLog Off]"
  "(going out to cinema) [BX-MsgLog On]"
  "(reclaiming myself) [BX-MsgLog Off]"
  "(seeking help) [BX-MsgLog On]"
  "(looking for some ciggarettes) [BX-MsgLog Off]"
  "(smoking pots) [BX-MsgLog On]"
  "(walking out) [BX-MsgLog Off]"
  "(humbling down the line) [BX-MsgLog On]"
  "(letting me know what love is) [BX-MsgLog Off]"
  "(staring into your eyes) [BX-MsgLog On]"
  "(watching the sun goes down) [BX-MsgLog Off]"
  "(dancing in the moonlight) [BX-MsgLog On]"
  "(piercing the beast) [BX-MsgLog Off]"
  "(stabbing angels) [BX-MsgLog On]"
  "(knocking the bad off) [BX-MsgLog Off]"
  "(shooting the dogs) [BX-MsgLog On]"
  "(typing some shit away messages) [BX-MsgLog Off]"
  "(stop bugging me, jackass!) [BX-MsgLog On]"
  "(you! yeah you! fuck off!) [BX-MsgLog Off]"
  "(not here, leave me your msg or memo me) [BX-MsgLog On]"
  "(stop fucking whoising on me!) [BX-MsgLog Off]"
}

set backmsgs {
  ""
}


# set this variable to increase or decrease the max ammount of 
# time (in mins) allowed till the next away is called for. default
# is set to 2 hours. "set rtime 180" for 3 hours and so on.

set rtime 60

# Probibly no need for you to edit anything below here


proc hide_away {args} {
  global botnick awaymsgs backmsgs cycle rtime
  putlog "\[Bc\]: Changing away status."
  set cycle [rand 10]
  set dtime [rand $rtime ]
  if {$dtime < 5 } {
    set dtime 10
  }
  if {$cycle < 8} {
    putserv "away :[lindex $awaymsgs [rand [llength $awaymsgs]]]" 
    timer $dtime "hide_away"
    return 0
  }
  if {$cycle >= 8 } {
    set chans [channels]
    putserv "away"
    set backmsg "[lindex $backmsgs [rand [llength $backmsgs]]]" 
    foreach chan $chans {
      putserv "privmsg $chan :$backmsg"
    }
    timer $dtime "hide_away"
    return 0
  }
}

# Here's a couple procs I wrote to check timers as nessessary. I fixed the 
# bug that I had before so you probibly wont need these, but I left them in 
# anyhow. You can .timer to check your active timers and .killtimer timer13 
# (where timer13 is the timer you want to kill) 

bind dcc m timer chk_timer
proc chk_timer {hand args} {
  putlog [timers]
}
bind dcc m killtimer kill_timer
proc kill_timer {idx args} {
  set dead [lindex $args 1]
  killtimer $dead
  putlog "Killed timer $dead"
}
  
set timers [timers]
if { ![string match *hide_away* $timers] } {
  timer 10 "hide_away"
}

putlog "*** \[Bc\]: Utility, Away Simulation Loaded."



    
  
