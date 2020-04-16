# version 0.1
## Autovoice.tcl script by d1g1t  > sandeep[at]d1g1t[dot]net <
# Small and lame

# Enable 1, Disable 0
set enable 1

# Channels where the bot should autovoice (Seperate with Spaces)
set avoicechans "#iwantvoice #Statusbeggars"

# Want the bot to flame that status thanking idiot?
# Yes - 1 , No - 0
set flamer 0

# If yes, Insult in Channel or via Notice?
# Channel - 1 , Notice - 0
set inchan 1

# Chans where to Insult
set insultchans "#iwantvoice #Statusbeggars"

# Phrases that trigger the insult
# accepts wildcards like * and ?
set trigger {
"*thank*for*+*"
"*thank*for*voice*"
"*thank*for*@*"
"*thank*for*%*"
"*thank*for*&*"
}

# Insults
set insults {
"Do you thank for +b too?"
"I\'d thank you if you got rid of that lame script."
">>** thanks for thanking -_- **<<"
"Did you watch the news? Some moron got arrested for a lame thanking script."
"Status is worth more than a mere thanks.... that\'ll be $5 please. Ty"
"I\'ll thank the Gods when you /quit"
"THANKS for displaying your amazing talent of being lame"
"Go back to kindergarden :\("
}

# No need to Edit below this
bind join - * autovoice
proc autovoice {nick uhost hand chan} {
   global avoicechans enable
   foreach enchan [string tolower $avoicechans] {
   if {[string match -nocase $enchan $chan] && $enable == 1} {
   putserv "mode $chan +v $nick"
   }}
}
# just edit the +v to +h or +o for auto-hopping/opping w/e

bind pubm - * insultthem
proc insultthem {nick uhost hand chan text} {
  global insults flamer trigger inchan insultchans
  foreach enchan [string tolower $insultchans] {
  if {[string match -nocase $enchan $chan] && $flamer == 1} {
    foreach tempinsult [string tolower $trigger] {
    if {[string match -nocase $tempinsult $text]} {
      set putinsult [lindex $insults [rand [llength $insults]]]
      if {$inchan == 1} { putmsg $chan "$putinsult"
      } else {
       putserv "notice $nick :$putinsult"
      }
    }}
  }}
}
