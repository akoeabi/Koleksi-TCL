###########################################################################
#
# WhoSetTheTopic v1.0b (20.03.99) by Joooch       <Joooch@gmx.de>
#
# adapted from TopicBy v2.01     by Neil J. Kemp <eggdrop@guyver.net>
#
#  --new     : Multichannel
#  --learned : TCL
#  --missed  : some needed sleep
#
#  all: version bumping: x.y   x is for major enhancements and changes
#                              y is for small fixes etc. y isn`t limited
#       e.g.: v 1.20 would be newer then v 1.5 and v 4.05 is equal to v 4.5
#
#  This gives you the nick/handle of the person who changed the topic.
#
#  Done to get some grip on TCL.
#  Dedicated to a special girl.
#
#  GNU public software licence applies
#
#  (c) 1998 Neil J. Kemp - topicby2.01.tcl
#  (c) 1999 Joooch       - whosetthetopic1.0tcl
#
###########################################################################

#BTW: Amiga is still alive and kicks ass

########################################################
### You shouldn't change anything of the stuff below ###
########################################################

bind pub - topic pub_topic

proc pub_topic {nick uhost hand channel what} {

  global topic_by
   set chn [string tolower $channel]
   if {![file exists wstt.$chn]} {
   set fd [open wstt.$chn w]
   puts $fd [format "MisterClearIt"]
   close $fd
   } {
   set fd [open wstt.$chn r]
   set topic_by [gets $fd] }
  putserv "PRIVMSG $channel :The topic was set by $topic_by."

return 1

}

bind topc - * name_topic

proc name_topic { nick uhost hand chan topic } {
  global topic_by
  if {[matchattr $nick +b $chan] == 0} {
    set nick2 [nick2hand $nick $chan]
    if {$nick2 != "*"} {
      set nick $nick2
    }
    set topic_by $nick
    if {$topic == ""} {
       set chn [string tolower $chan]
       set fd [open wstt.$chn w]
       puts $fd [format "MisterClearIt"]
       close $fd }
    if {$topic != ""} {
       set chn [string tolower $chan]
       set fd [open wstt.$chn w]
       puts $fd [format $topic_by]
       close $fd }
    if {$nick != ""} {
      if {$topic == ""} {
        putlog "$chan topic was cleared by $topic_by"
      }
      if {$topic != ""} {
        putlog "$chan topic was set to $topic by $topic_by"
      }
    }
  }
}

putlog "WhoSetTheTopic v1.0b by Joooch has been successfully loaded."
