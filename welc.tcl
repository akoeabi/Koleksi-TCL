##############################################################
#		author by Master_Gaa`ra
###############################################################
# greets and/or voices users when they join
# currently works just for all channels

set autogreet 1
set autovoice 0

bind join - * welcome

proc welcome {nick uhost hand chan} {
  global botnick autogreet autovoice
  if {$nick == $botnick} {
    return 0
  }
  if {$autogreet == 1} {
    puthelp "NOTICE $nick :Hallo $nick, Welcome back and terima kasih kamu dah join di$chan Visit Fs orang cakep bobygitarius@yahoo.com !!"
  }
  if {($autovoice == 1) && ([botisop $chan] == 1)} {
    pushmode $chan +v $nick
  }
}

putlog "welcome.tcl \[4,1P0t12(4Z12)\] by Gaa`ra <Gaa`raonline.com>"
