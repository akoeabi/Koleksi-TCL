;#set here the private channel
set %mainchan #private
;#set here the channels, which you dont want to check the flags for
set %exceptchan #chan1 #chan2
;#set here the channel, which the bot will be using while suspending, leaving etc.
set %adchan #channel

on *:text:req *:?:{
  if ($2 == status) {
    msg $nick :req status $chan(0)"
  }
  elseif ($2 == checkflags) {
    if (*.users.quakenet.org iswm $address($me,2)) {
      var %x 1, %y $chan(0)
      while (%x <= %y) {
        if (!$istok(%exceptchan, $chan(%x),32)) {
          msg Q chanlev $chan(%x) $me
        }
      }
    }
  }
  elseif ($2 == +chan) {
    if ($3) && ($left($3,1) == $chr(35)) {
      if ($me !ison $3) {
        join $3
        msg %mainchan Added channel $3 $+ . Requested by: $nick
      }
    }
  }
  elseif ($2 == -chan) {
    if ($3) && ($left($3,1) == $chr(35)) {
      if ($me ison $3) {
        part $3
        msg %mainchan Removed channel $3 $+ . Requested by: $nick
      }
    }
  }
  elseif ($2 == suspend) {
    if ($3) && ($left($3,1) == $chr(35)) {
      if ($me ison $3) {
        msg $3 Channel has been suspended by an admin of %adchan
        part $3
        timer 1 2 msg %mainchan Channel $3 suspended.
      }
    }
  }
}
on *:notice:*:*:{
  if ($nick == Q) {
    if ($gettok($1-,1-2,32) == Flags for) {
      if (o isin $right($1-,1)) { return }
      else {
        msg %mainchan Warning: Channel $right($1-,2) with flags: $right($1-,1)
      }
    }
    elseif ($gettok($1-, 1-6, 32) == You do not have sufficient access) {
      msg %mainchan Warning: Channel $gettok($1-,8,32) with NO flags
    }
  }
}
}