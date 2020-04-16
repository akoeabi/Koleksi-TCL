# Thanks a lot to :
# Script: News 2 HTML 
# Author: Wingman <Wingman@WINGDesign.de>
#         http://www.WINGDesign.de/
#
# I have based a lot to that tcl,so i cant miss it!
# Contact to sergios_k@hotmail.com


# Set your directory that you have this file to read the radio.tcl
# [filename] where is the html file?
set adds(html) "../../../var/www/html/text1.text"

# [string] where should i insert the news?
# You have to put this line into your html file 
set adds(match) ""

# [command] what command should be used for adding news?
set adds(cmd) "addsong"

# [global_flag|/&chan_flag] what flags are authorized to have dj to add the song and title?
set adds(cmd_flags) "o|o"

set adds(ver) "1.0"

bind msg $adds(cmd_flags) $adds(cmd) msg:adds

proc adds:addnews { handle news } {
  global adds
  if {![file exists $adds(html)]} { return 0 }
  set file [open $adds(html) r]
  while {![eof $file]} {
    lappend foo [gets $file]
  }
  close $file
  set file [open $adds(html) w]
  foreach line $foo {
      # ---
      # [strftime "%d %b %Y"] -> Mon 01 99
      # [strftime "%H:%M"]    -> 01:01
      # $news                 -> news
      # $handle               -> nickname
      # ---
      # EDIT HERE
puts $file "text1=on [strftime "%d %b %Y"] at [strftime "%H:%M"] online dj $handle NOW PLAYING: $news"
    }
  close $file
  if {![info exists found]} { return 2 }
  return 1
}
      
proc msg:adds { nick uhost handle arg } {
  global adds
  if {[llength $arg] < 1} {
    putserv "PRIVMSG $nick :Usage: $adds(cmd) <title-song>"
    return 0
  }
  putserv "PRIVMSG $nick :Updated title-song: \"$arg\"."
  set code [adds:addnews $handle "$arg"]
  switch -exact $code {
    "0" { putlog "Addsong $adds(ver) ERROR: Can't find $adds(html)." ; return 0 }
    "1" { return 1 }
    "2" { putlog "Addsong $adds(ver) ERROR: Can't find \"$adds(match)\" in $adds(html)." ; return 0 }
  }
}

putlog "Addsong.tcl By Sergios loaded."
