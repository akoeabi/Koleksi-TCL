bind pub - !hitung hitung

set pi 3.1415926535897932
set e 2.71828182845905
set g 9.81

proc hitung {nick host handle channel arg} {
  global pi e g
  if {$arg != "" && ![string match "\[" $arg] && ![string match "\]" $arg]} { 
    putserv "PRIVMSG $channel :[expr $arg]"
  } else {
    putserv "PRIVMSG $channel :15Cara\: !hitung 1+1 --- konstanta: \$pi \$e \$g --- fungsi: abs(), acos(), asin(), atan(), atan2(), ceil(), cos(), cosh(), exp(), floor(), fmod(), hypot(), log(), log10(), pow(), akar(), round(), sin(), sinh(), sqrt(), tan(), tanh() --- \[ dan \] tidak boleh dipakai dalam expresi."
  }
}

