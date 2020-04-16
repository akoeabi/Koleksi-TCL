# Default Settings
set azkalixChannel 	"#lemper"
set azkalixPointsName 	"point"
set azkalixPointsPerAnswer 10
set azkalixQuestionTime 	110
set azkalixMarker 		"*"
set azkalixScoreFile 	"azkalix.scores"
set azkalixAskedFile	"azkalix.asked"
set azkalixQuestionFile	"scripts/azkalix.db"
set azkalixCFGFile		"scripts/azkalix.cfg"

# Channel Triggers
bind pub - !top10 azkalixTop10
bind pub - !toplast azkalixLastMonthTop3
bind pub - !score azkalixPlayerScore
bind pub - !repeat azkalix_Repeat
bind pub - !cmds azkalixCmds
bind pub - !asked azkalix_ShowAsked
bind pub - !start azkalix_Start
bind pub - !stop azkalix_Stop

# DCC Commands
bind dcc - azkalixrehash dcc_azkalixrehash
bind dcc - azkalixanswer dcc_azkalixanswer
bind dcc - azkalixreset dcc_azkalixresetasked
bind dcc - azkalixasked dcc_azkalixshowasked
bind dcc - azkalixforce dcc_azkalixforce

# Cron Bind For Monthly Score Reset
bind time - "00 00 01 * *" azkalix_NewMonth

# Global Variables
set azkalixRunning 0
set azkalixAllAnswered ""
set azkalixRoundOver ""
set azkalixQNumber 0
set azkalixQuestion 0
set azkalixQuestions(0) 0
set azkalixAsked 0
set azkalixMonthFileName ""
set azkalixQCount 0
set azkalixAnswerCount 0
set azkalixDisplayNum 0
set azkalixNumAnswered 0
set azkalixForced 0
set azkalixForcedQuestion 0
set azkalixAutoStart 0

# Scores And Ads
set azkalixAdNumber 0
set azkalixAd(0) "$botnick"
set azkalixAd(1) "$botnick"
set azkalixAd(2) "$botnick"
set azkalixLastMonthScores(0) "Nobody 0"
set azkalixLastMonthScores(1) "Nobody 0"
set azkalixLastMonthScores(2) "Nobody 0"

# Timers
set azkalixAdTimer ""
set azkalixQuestionTimer ""

# Version
set KDebug 0
set azkalixVersion "0.91.0"

#
# Start azkalix
#
proc azkalix_Start {nick uhost hand chan args} {
 global azkalixChannel azkalixRunning azkalixQCount azkalixQNumber azkalixQuestionFile azkalixAdNumber azkalixVersion KDebug

 if {($chan != $azkalixChannel)||($azkalixRunning != 0)} {return}

 set azkalixQCount 0
 set azkalixAdNumber 0

 azkalix_ReadCFG

 if {![file exist $azkalixQuestionFile]} {
   putcmdlog "\[azkalix\] Question File: $azkalixQuestionFile Unreadable Or Does Not Exist"
   return 0
 }

 set azkalixQCount [azkalix_ReadQuestionFile]

 if {$azkalixQCount < 2} {
   putcmdlog "\[azkalix\] Not Enough Questions in Question File $azkalixQuestionFile"
   return 0
 }

 set azkalixAskedFileLen [azkalix_ReadAskedFile]

 if {$azkalixAskedFileLen >= $azkalixQCount} {
   azkalixmsg "[azkalix] [kcr] All Questions Asked: Resetting \003"
   azkalix_ResetAsked
   return 0
 }

 set azkalixRunning 1

 azkalixmsg "[azkalix] [kcm] Family100 Network Game by #lemper@DAL.net \[$azkalixQCount Questions\] \003"

 bind pubm - "*" azkalixCheckGuess

 azkalixAskQuestion

 return 1
}

#
# Stop azkalix
#
proc azkalix_Stop {nick uhost hand chan args} {
 global azkalixChannel azkalixRunning azkalixQuestionTimer azkalixAdTimer

 if {($chan != $azkalixChannel)||($azkalixRunning != 1)} {return}

 set azkalixRunning 0

 catch {killutimer $azkalixQuestionTimer}
 catch {killutimer $azkalixAdTimer}

 catch {unbind pubm - "*" azkalixCheckGuess}

 azkalixmsg "[azkalix] \00306wekss.. diberhentiin dech ama \00304\[\00312$nick!$uhost\00304\]"
 return 1
}

#
# Pick Question
#
proc azkalixPickQuestion {} {
 global azkalixAsked azkalixQCount KDebug
 set azkalixUnasked [expr ($azkalixQCount - [llength $azkalixAsked])]
 if {$azkalixUnasked < 1} {
   azkalixmsg "[azkalix] [kcr] All Questions Asked: Resetting \003"
   azkalix_ResetAsked
 }
 set pickdone 0
 while {$pickdone == 0} {
  set kidx 0
  set foundinasked 0
  set pick [rand $azkalixQCount]
  while {[lindex $azkalixAsked $kidx] != ""} {
    if {[lindex $azkalixAsked $kidx] == $pick} {
     set foundinasked 1
     # azkalixlog "azkalix" "Found Pick:$pick in Asked"
     break
    }
    incr kidx
  }
  if {$foundinasked == 0} {incr pickdone}
 }
 # azkalixlog "azkalix" "Picked Question:$pick"
 azkalix_AddAsked $pick
 return $pick
}

#
# Parse Question
#
proc azkalixParseQuestion {QNum} {
 global azkalixMarker azkalixQuestions azkalixQuestion azkalixAnswers azkalixAnswerCount azkalixForcedQuestion KDebug

  set KAnswersLeft ""

  if {$QNum < 0} {
   set azkalixFileQuestion $azkalixForcedQuestion
  } {
   set azkalixFileQuestion $azkalixQuestions($QNum)
  }

  if {$KDebug > 1} {azkalixlog "azkalix" "Picked:$QNum Question:$azkalixFileQuestion"}

  if [info exists azkalixAnswers] {unset azkalixAnswers}

  # Position of first "*"

  set azkalixMarkerIDX [string first $azkalixMarker $azkalixFileQuestion]

  if {$azkalixMarkerIDX < 1} {
   azkalixlog "azkalix" "Malformed Question #$QNum"
  }

  set azkalixQuestionEndIDX [expr $azkalixMarkerIDX - 1]

  set azkalixQuestion [string range $azkalixFileQuestion 0 $azkalixQuestionEndIDX]

  # Move to first character in answers
  incr azkalixMarkerIDX
  set KAnswersLeft [string range $azkalixFileQuestion $azkalixMarkerIDX end]

  set KDoneParsing 0
  set azkalixAnswerCount 0

  # Parse all answers

  while {$KDoneParsing != 1 } {
   set KAnswerEnd [string first $azkalixMarker $KAnswersLeft]

   if {$KAnswerEnd < 1} {
    set KDoneParsing 1
    set KAnswerEnd [string length $KAnswersLeft]
   }

   set KAnswer [string range $KAnswersLeft 0 [expr $KAnswerEnd -1]]

   set azkalixAnswers($azkalixAnswerCount) "# $KAnswer"

   set azkalixMarkerIDX [expr $KAnswerEnd +1]

   set KAnswersLeft [string range $KAnswersLeft $azkalixMarkerIDX end]
   incr azkalixAnswerCount
  }
}

#
# Ask Question
#
proc azkalixAskQuestion {} {
 global azkalixRunning azkalixQNumber azkalixAllAnswered azkalixRoundOver azkalixQuestion
 global azkalixPointsPerAnswer azkalixPointsName azkalixNumAnswered azkalixAnswerCount
 global azkalixQuestionTimer azkalixQuestionTime azkalixDisplayNum azkalixForced azkalixLastGuesser

 if {$azkalixRunning != 1} {return}

 # Get The Current Scores
 read_azkalixScore

 # Pick Next Question

 if {$azkalixForced == 1} {
  azkalixParseQuestion -1
  set azkalixQNumber 0
  set azkalixForced 0
  set azkalixForcedQuestion 0
 } {
  set azkalixQNumber [azkalixPickQuestion]
  azkalixParseQuestion $azkalixQNumber
 }

 set azkalixAllAnswered ""
 set azkalixLastGuesser ""
 set azkalixDisplayNum 0
 set azkalixNumAnswered 0
 set azkalixRoundOver ""

 # Choose Points Value For This Round
 set azkalixPointsPerAnswer [rand 10]
 if {$azkalixPointsPerAnswer < 1} {set azkalixPointsPerAnswer 10}
 set azkalixPointsPerAnswer [expr $azkalixPointsPerAnswer * 10]

 set azkalixPointTotal [expr $azkalixPointsPerAnswer *$azkalixAnswerCount]

 azkalixmsg "[kcg] Soal : [kcb] $azkalixQuestion \003 \00306\[\00310$azkalixAnswerCount \00306Answers\]\003"
 azkalixmsg "\00313$azkalixPointsPerAnswer \00312$azkalixPointsName \00306Untuk setiap jawaban yg benar. \00310Total: \00313$azkalixPointTotal \00312$azkalixPointsName\003"

 set KRemain [expr int([expr $azkalixQuestionTime /2])]
 set azkalixQuestionTimer [utimer $KRemain "azkalixDisplayRemainingTime $KRemain"]
}

#
# Get Player Guess
#

proc azkalixCheckGuess {nick uhost hand chan args} {
 global azkalixChannel azkalixRunning azkalixScore azkalixAnswerCount azkalixAnswers azkalixRoundOver
 global azkalixPointsName azkalixPointsPerAnswer azkalixNumAnswered azkalixAllAnswered azkalixLastGuesser KDebug

 if {($chan != $azkalixChannel)||($azkalixRunning != 1)||($azkalixRoundOver == 1)} {return}

 regsub -all \[{',.!}] $args "" args

 if {[string length args] == 0} {return}

 set azkalixGuessOld $args
 set azkalixGuess [string tolower $azkalixGuessOld]

 if {$KDebug > 1} {azkalixlog "azkalix" "Guess: $nick $azkalixGuess"}

 foreach z [array names azkalixAnswers] {
  set azkalixTry [lrange $azkalixAnswers($z) 1 end] 
  set azkalixTryOld $azkalixTry

  regsub -all \[{',.!}] $azkalixTry "" azkalixTry

  set azkalixTry [string tolower $azkalixTry]
  if {$KDebug > 1} {azkalixlog "azkalix" "Try: $azkalixTry"}

  if {$azkalixTry == $azkalixGuess} {
   if {[lindex $azkalixAnswers($z) 0] == "#"} {
    set azkalixAnswers($z) "$nick $azkalixGuessOld"
    azkalixmsg "[knikclr $nick]\00306 menang \00313$azkalixPointsPerAnswer \00312$azkalixPointsName \00306untuk \00310$azkalixTryOld"
    incr azkalixNumAnswered
    if {$azkalixNumAnswered == $azkalixAnswerCount} {
     set azkalixAllAnswered 1
     set azkalixRoundOver 1
     set azkalixLastGuesser $nick
     azkalixmsg "[azkalix] [kcr] Pinter.... terjawab semuanya \003"
     azkalix_ShowResults
     azkalix_Recycle
    }
    return
   }
  }
 }
}

#
# Display Remaining Time And Answer Stats
#
proc azkalixDisplayRemainingTime {remaining} {
 global azkalixRunning azkalixAllAnswered azkalixNumAnswered azkalixAnswerCount azkalixQuestionTimer azkalixQuestionTime azkalixDisplayNum

 if {($azkalixRunning != 1)||($azkalixAllAnswered == 1)} {return}

 azkalixmsg "\00312$remaining \00306detik lagi..."

 incr azkalixDisplayNum

 set KRemain [expr int([expr $azkalixQuestionTime /4])]

 if {$azkalixDisplayNum < 2} {
  set azkalixQuestionTimer [utimer $KRemain "azkalixDisplayRemainingTime $KRemain"]
 } {
  set azkalixQuestionTimer [utimer $KRemain azkalixTimesUp]
 }
}

#
# Show Results Of Round
#
proc azkalixTimesUp {} {
 global azkalixAnswers azkalixAllAnswered azkalixRoundOver azkalixNumAnswered azkalixAnswerCount azkalixQuestionTimer azkalixAdTimer

 if {$azkalixAllAnswered == 1} { return 1}

 set azkalixRoundOver 1

 set azkalixmissed "[kcg] Waktu habis Critzz :P~...! \003 "

 append KMissed "\00304yang tidak terjawab: \00312"

 set KAnswersRemaining [expr ($azkalixAnswerCount - $azkalixNumAnswered)]

 set kcount 0
 foreach z [array names azkalixAnswers] {
  if {[lindex $azkalixAnswers($z) 0] == "#"} {
   append KMissed "\00312[lrange $azkalixAnswers($z) 1 end]"
   incr kcount
   if {$kcount < $KAnswersRemaining} {append KMissed " \00311| "}
  }
 }

 azkalixmsg "$KMissed\003"

 azkalix_ShowResults

 if {$azkalixNumAnswered > 0} {
  azkalixmsg "[kcs] Soal yang terjawab:  $azkalixNumAnswered dari $azkalixAnswerCount! \003"
 } {
  azkalixmsg "[azkalix] \00304Alah-Alah! \00310Gak ada yg tau jawabannya !!, masa Neo jawab sendiri sich... parahxxxx dakh nich \003"
 }

 set azkalixAdTimer [utimer 10 azkalix_ShowAd]

 set azkalixQuestionTimer [utimer 20 azkalixAskQuestion]
}

#
# All Answers Gotten, Next Question
#
proc azkalix_Recycle {} {
 global azkalixAnswers azkalixNumAnswered azkalixQuestionTimer azkalixAdTimer
 catch {killutimer $azkalixQuestionTimer}
 if [info exists azkalixAnswers] {unset azkalixAnswers}
 set azkalixAdTimer [utimer 10 azkalix_ShowAd]
 set azkalixQuestion 0
 set azkalixNumAnswered 0
 set azkalixQuestionTimer [utimer 20 azkalixAskQuestion]
}

#
# Total Answers and Points
#
proc azkalix_ShowResults {} {
 global azkalixAnswers azkalixPointsPerAnswer azkalixPointsName azkalixScore azkalixAllAnswered azkalixLastGuesser

 set NickCounter 0
 set azkalixCounter 0

 if {$azkalixAllAnswered == 1} {
  set azkalixBonus [expr $azkalixPointsPerAnswer *10]
  azkalixmsg "[knikclr $azkalixLastGuesser]\00306 mendapatkan \00313$azkalixBonus \00312Bonus $azkalixPointsName \00306karena bisa menjawab jawaban tertinggi!"
  set KNickTotals($azkalixLastGuesser) $azkalixBonus
  set KNickList($NickCounter) $azkalixLastGuesser
  incr NickCounter
 }

 foreach z [array names azkalixAnswers] {
  if {[lindex $azkalixAnswers($z) 0] != "#"} {
   set cnick [lindex $azkalixAnswers($z) 0]
   if {[info exists KNickTotals($cnick)]} {
    incr KNickTotals($cnick) $azkalixPointsPerAnswer
   } {
    set KNickTotals($cnick) $azkalixPointsPerAnswer
    set KNickList($NickCounter) $cnick
    incr NickCounter
   }
   incr azkalixCounter
  }
 }

 if {$azkalixCounter > 0} {
  set ncount 0
  set nicktotal "[kcm] $azkalixPointsName This Round "
  while {$ncount < $NickCounter} {
   set cnick $KNickList($ncount)
   if {[info exists azkalixScore($cnick)]} {
     incr azkalixScore($cnick) $KNickTotals($cnick)
   } {
     set azkalixScore($cnick) $KNickTotals($cnick)
   }
   append nicktotal "[kcc] $cnick [kcm] $KNickTotals($cnick) "
   incr ncount
  }
  azkalixmsg $nicktotal
  write_azkalixScore
 }
}

#
# Read Scores
#
proc read_azkalixScore { } {
 global azkalixScore azkalixScoreFile
 if [info exists azkalixScore] { unset azkalixScore }
 if {[file exists $azkalixScoreFile]} {
  set f [open $azkalixScoreFile r]
  while {[gets $f s] != -1} {
   set azkalixScore([lindex $s 0]) [lindex $s 1]
  }
  close $f
  } {
   set f [open $azkalixScoreFile w]
   puts $f "Nobody 0"
   close $f
  }
}

#
# Write Scores
#
proc write_azkalixScore {} {
 global azkalixScore azkalixScoreFile
 set f [open $azkalixScoreFile w]
 foreach s [lsort -decreasing -command sort_azkalixScore [array names azkalixScore]] {
  puts $f "$s $azkalixScore($s)"
 }
 close $f
}

#
# Score Sorting
#
proc sort_azkalixScore {s1 s2} {
 global azkalixScore
 if {$azkalixScore($s1) >  $azkalixScore($s2)} {return 1}
 if {$azkalixScore($s1) <  $azkalixScore($s2)} {return -1}
 if {$azkalixScore($s1) == $azkalixScore($s2)} {return 0}
}

#
# Add Question Number To Asked File
#
proc azkalix_AddAsked {KQnum} {
 global azkalixAsked azkalixAskedFile
 set f [open $azkalixAskedFile a]
 puts $f $KQnum
 close $f
 lappend azkalixAsked $KQnum
}

#
# Parse Asked Questions
#
proc azkalix_ReadAskedFile {} {
 global azkalixAsked azkalixAskedFile
 set KAsked 0
 set azkalixAsked 0
 if {![file exists $azkalixAskedFile]} {
  set f [open $azkalixAskedFile w]
 } {
  set f [open $azkalixAskedFile r]
  while {[gets $f KQnum] != -1} {
   lappend azkalixAsked "$KQnum"
   incr KAsked
  }
 }
 close $f
 return $KAsked
}

#
# Reset Asked File
#
proc azkalix_ResetAsked {} {
 global azkalixAskedFile azkalixAsked
 set f [open $azkalixAskedFile w]
 puts $f "0"
 close $f
 set azkalixAsked 0
}

#
# Read Question File
#
proc azkalix_ReadQuestionFile {} {
 global azkalixQuestionFile azkalixQuestions
 set KQuestions 0
 set f [open $azkalixQuestionFile r]
 while {[gets $f q] != -1} {
  set azkalixQuestions($KQuestions) $q
  incr KQuestions
 }
 close $f
 return $KQuestions
}

#
# Show Asked
#
proc azkalix_ShowAsked {nick uhost hand chan args} {
 global azkalixQCount azkalixAsked azkalixQuestions
 set azkalixStatsAsked [llength $azkalixAsked]
 set azkalixStatsUnasked [expr ($azkalixQCount - $azkalixStatsAsked)]
 azkalixmsg "[azkalix] [kcm] Total: [kcc] $azkalixQCount [kcm] Asked: [kcc] $azkalixStatsAsked [kcm] Remaining: [kcc] $azkalixStatsUnasked \003"
}

#
# Repeat Question
#
proc azkalix_Repeat {nick uhost hand chan args} {
 global azkalixChannel azkalixQuestion azkalixRunning azkalixQNumber azkalixAllAnswered
 global azkalixPointsName
 if {($chan != $azkalixChannel)||($azkalixRunning != 1)} {return}
 if {$azkalixAllAnswered == 1} {return }
 azkalixmsg "\00300,03 K[format "%04d" $azkalixQNumber] \00308,02 $azkalixQuestion \003"
}

#
# Display User's Score
#
proc azkalixPlayerScore {nick uhost hand chan args} {
 global azkalixChannel azkalixScoreFile azkalixPointsName

 if {$chan != $azkalixChannel} {return}

 regsub -all \[`,.!{}] $args "" args

 if {[string length $args] == 0} {set args $nick}

 set scorer [string tolower $args]

 set kflag 0

 set f [open $azkalixScoreFile r]
 while {[gets $f sc] != -1} {
  set cnick [string tolower [lindex $sc 0]]
  if {$cnick == $scorer} {
   azkalixmsg "[kcm] [lindex $sc 0] [kcc] [lindex $sc 1] $azkalixPointsName \003"
   set kflag 1
  }
 }
 if {$kflag == 0} {azkalixmsg "[kcm] $scorer [kcc] No Score \003"}
 close $f
}

#
# Display Top 10 Scores To A Player
#
proc azkalixTop10 {nick uhost hand chan args} {
 global azkalixChannel azkalixScoreFile azkalixPointsName
 if {$chan != $azkalixChannel} {return}
 set KWinners "[kcm] Top10 Game $azkalixPointsName "
 set f [open $azkalixScoreFile r]
 for { set s 0 } { $s < 10 } { incr s } {
  gets $f azkalixTotals
  if {[lindex $azkalixTotals 1] > 0} {
   append KWinners "[kcm] #[expr $s +1] [kcc] [lindex $azkalixTotals 0] [lindex $azkalixTotals 1] "
  } {
   append KWinners "[kcm] #[expr $s +1] [kcc] Nobody 0 "
  }
 }
 azkalixmsg "$KWinners"
 close $f
}

#
# Last Month's Top 3
#
proc azkalixLastMonthTop3 {nick uhost hand chan args} {
 global azkalixChannel azkalixLastMonthScores
 if {$chan != $azkalixChannel} {return}
 if [info exists azkalixLastMonthScores] {
  set KWinners "[kcm] Last Month's Game Top 3 "
  for { set s 0} { $s < 3 } { incr s} {
   append KWinners "[kcm] #[expr $s +1] [kcc] $azkalixLastMonthScores($s) "
  }
  azkalixmsg "$KWinners"
 }
}

#
# Read Config File
#
proc azkalix_ReadCFG {} {
 global azkalixCFGFile azkalixChannel azkalixAutoStart azkalixScoreFile azkalixAskedFile azkalixQuestionFile azkalixLastMonthScores azkalixPointsName azkalixAd
 if {[file exist $azkalixCFGFile]} {
  set f [open $azkalixCFGFile r]
  while {[gets $f s] != -1} {
   set kkey [string tolower [lindex [split $s "="] 0]]
   set kval [lindex [split $s "="] 1]
   switch $kkey {
    points { set azkalixPointsName $kval }
    channel { set azkalixChannel $kval }
    autostart { set azkalixAutoStart $kval }
    scorefile { set azkalixScoreFile $kval }
    askedfile { set azkalixAskedFile $kval }
    azkalixfile { set azkalixQuestionFile $kval }
    ad1 { set azkalixAd(0) $kval }
    ad2 { set azkalixAd(1) $kval }
    ad3 { set azkalixAd(2) $kval }
    lastmonth1 { set azkalixLastMonthScores(0) $kval }
    lastmonth2 { set azkalixLastMonthScores(1) $kval }
    lastmonth3 { set azkalixLastMonthScores(2) $kval }
   }
  }
  close $f
  if {($azkalixAutoStart < 0)||($azkalixAutoStart > 1)} {set azkalixAutoStart 1}
  return
 }
 azkalixlog "azkalix" "Config file $azkalixCFGFile not found... using defaults"
}

#
# Write Config File
#
proc azkalix_WriteCFG {} {
 global azkalixCFGFile azkalixChannel azkalixAutoStart azkalixScoreFile azkalixAskedFile azkalixQuestionFile azkalixLastMonthScores azkalixPointsName azkalixAd
 set f [open $azkalixCFGFile w]
 puts $f "# This file is automatically overwritten"
 puts $f "Points=$azkalixPointsName"
 puts $f "Channel=$azkalixChannel"
 puts $f "AutoStart=$azkalixAutoStart"
 puts $f "ScoreFile=$azkalixScoreFile"
 puts $f "AskedFile=$azkalixAskedFile"
 puts $f "azkalixFile=$azkalixQuestionFile"
 puts $f "LastMonth1=$azkalixLastMonthScores(0)"
 puts $f "LastMonth2=$azkalixLastMonthScores(1)"
 puts $f "LastMonth3=$azkalixLastMonthScores(2)"
 puts $f "Ad1=$azkalixAd(0)"
 puts $f "Ad2=$azkalixAd(1)"
 puts $f "Ad3=$azkalixAd(2)"
 close $f
}

#
# Clear Month's Top 10
#
proc azkalix_NewMonth {min hour day month year} {
 global azkalixScoreFile azkalixScore azkalixLastMonthScores

 set cmonth [expr $month +1]
 set lmonth [azkalixLastMonthName $cmonth]

 azkalixmsg "[azkalix] [kcr] Clearing Monthly Scores \003"

 set azkalixMonthFileName "$azkalixScoreFile.$lmonth"

 set f [open $azkalixMonthFileName w]
 set s 0
 foreach n [lsort -decreasing -command sort_azkalixScore [array names azkalixScore]] {
  puts $f "$n $azkalixScore($n)"
  if {$s < 3} {
   if {$azkalixScore($n) > 0} {
    set azkalixLastMonthScores($s) "$n $azkalixScore($n)"
   } {
    set azkalixLastMonthScores($s) "Nobody 0"
   }
  }
  incr s
 }
 close $f

 azkalix_WriteCFG

 if [info exists azkalixScore] {unset azkalixScore}

 set f [open $azkalixScoreFile w]
 puts $f "Nobody 0"
 close $f

 putcmdlog "\[azkalix\] Cleared Monthly Top10 Scores: $azkalixMonthFileName"
}

#
# Command Help
#
proc azkalixCmds {nick uhost hand chan args} {
 global azkalixChannel
 if {$chan != $azkalixChannel} {return}
 azkalixntc $nick "azkalix Commands: !top10 !score \[nick\] !repeat !asked !play !stop"
}

#
# Color Routines
#
proc kcb {} {
 return "\0038,2"
}
proc kcg {} {
 return "\0030,3"
}
proc kcr {} {
 return "\0030,4"
}
proc kcm {} {
 return "\0030,6"
}
proc kcc {} {
 return "\0030,10"
}
proc kcs {} {
 return "\0030,12"
}
proc azkalix {} {
 return ""
}

# Channel Message
proc azkalixmsg {what} {
 global azkalixChannel
 putquick "PRIVMSG $azkalixChannel :$what"
}

# Notice Message
proc azkalixntc {who what} {
 putquick "NOTICE $who :$what"
}
# Command Log
proc azkalixlog {who what} {
 putcmdlog "\[$who\] $what"
}

# Name Of Last Month
proc azkalixLastMonthName {month} {
 switch $month {
  1 {return "Dec"}
  2 {return "Jan"}
  3 {return "Feb"}
  4 {return "Mar"}
  5 {return "Apr"}
  6 {return "May"}
  7 {return "Jun"}
  8 {return "Jul"}
  9 {return "Aug"}
  10 {return "Sep"}
  11 {return "Oct"}
  12 {return "Nov"}
  default {return "???"}
 }
}

# Assign Nickname Color
proc knikclr {nick} {
  set nicklen [strlen $nick]
  set nicktot 0
  set c 0
  while {$c < $nicklen} {
   binary scan [string range $nick $c $c] c nv
   incr nicktot [expr $nv -32]
   incr c
  }
  set nickclr [expr $nicktot %13]
  switch $nickclr {
   0 {set nickclr 10}
   1 {set nickclr 11}
   2 {set nickclr 12}
   5 {set nickclr 13}
  }
  set nik [format "%02d" $nickclr]
  return "\003$nik$nick"
}

#
# Show Ad
#
proc azkalix_ShowAd {} {
 global azkalixAdNumber azkalixAd botnick azkalixChannel
 switch $azkalixAdNumber {
  0 { azkalixmsg "[kcs] $azkalixAd(0) \003" }
  1 { azkalixTop10 $botnick none none $azkalixChannel none }
  2 { azkalixmsg "[kcs] $azkalixAd(1) \003" }
  3 { azkalixLastMonthTop3 $botnick none none $azkalixChannel none }
  4 { azkalixmsg "[kcs] $azkalixAd(2) \003" }
 }
 incr azkalixAdNumber
 if {$azkalixAdNumber > 4} {set azkalixAdNumber 0}
}

#
# Rehash azkalix Config
#
proc dcc_azkalixrehash {hand idx arg} {
 global azkalixQCount

 putcmdlog "#$hand# Rehashing azkalix config"

 azkalix_ReadCFG

 set azkalixQCount [azkalix_ReadQuestionFile]

 if {$azkalixQCount < 2} {
   azkalixlog "azkalix" "Not Enough Questions in Question File $azkalixQuestionFile"
   return 0
 }

 set azkalixAskedFileLen [azkalix_ReadAskedFile]

 if {$azkalixAskedFileLen >= $azkalixQCount} {
   azkalixlog "azkalix" "Asked file out of sync with question database: resetting"
   azkalix_ResetAsked
   return 0
 }
 azkalixlog "azkalix" "Questions:$azkalixQCount Asked:$azkalixAskedFileLen Remaining:[expr ($azkalixQCount - $azkalixAskedFileLen)]"
}

#
# Show Current Answers
#
proc dcc_azkalixanswer {hand idx arg} {
 global azkalixAnswers
 set ans ""
 foreach z [array names azkalixAnswers] {
  if {[lindex $azkalixAnswers($z) 0] == "#"} {
   append ans "[lrange $azkalixAnswers($z) 1 end] | "
  }
 }
 azkalixlog "azkalix" $ans
}

#
# Reset Asked File
#
proc dcc_azkalixresetasked {hand idx arg} {
 azkalix_ResetAsked
 azkalixlog "azkalix" "#$hand# Reset Asked File"
}

#
# Show Asked
#
proc dcc_azkalixshowasked {hand idx arg} {
 global azkalixQCount azkalixAsked azkalixQuestions
 set azkalixStatsAsked [llength $azkalixAsked]
 set azkalixStatsUnasked [expr ($azkalixQCount - $azkalixStatsAsked)]
 azkalixlog "azkalix" "Total:$azkalixQCount  Asked:$azkalixStatsAsked  Remaining:$azkalixStatsUnasked"
}

#
# Force A Question
#
proc dcc_azkalixforce {hand idx arg} {
 global azkalixRunning azkalixMarker azkalixForced azkalixForcedQuestion
 if {$azkalixRunning != 1} {return}
 regsub -all \[`,.!{}] $arg "" arg
 if {$arg == ""} {return}
 set azkalixMarkerIDX [string first $azkalixMarker $arg]
 if {$azkalixMarkerIDX < 2} {
  azkalixlog "azkalix" "Malformed question: Format: Question*Answer1*Answer2..."
  return
 }
 set azkalixForcedQuestion $arg
 set azkalixForced 1
 azkalixlog "azkalix" "Forcing A Question Next Round"
}

azkalix_ReadCFG

putcmdlog "Loaded azkalix $azkalixVersion by threenet"
