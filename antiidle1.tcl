# anti idle v1.3 by JCFreak^ ; printf(bpullen@cwis.net)
# this script serves the purpose of keeping your bots
# from pinging out. it msgs an unexisting object, being
# unoticable, therefore UNANNOYING! :) get my drift?
# if you have any comments or suggestions, bugs, etc,
# email me. Thanks for using my script, and if you like
# it, please msg me on efnet, or email me! Thanks again.

# Version
set idle.v "aidle.tcl v1.3 by JCFreak^"

# This is how long to delay before each msg
set idle.1 10

# Set this to who you want the messages to go to
set idle.w billgates:)

# This is the idle msg, you shouldnt need anything rather large
set idle.m "."

# DO NOT change anything past here
if {![info exists idle.l]} {
  global idle.w idle.m idle.1
  set idle.l 0
  timer ${idle.1} {idle.a}
  putlog "${idle.v} loaded"
}

proc idle.a {} {
  global idle.w idle.m idle.1
  putserv "PRIVMSG ${idle.w} ${idle.m}"
  putserv "PRIVMSG [lindex ${idle.w} 0] :\001PING [unixtime]\001"
  timer ${idle.1} {idle.a}
}
