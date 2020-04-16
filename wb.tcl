#########################################
# 			    						#
# ReLease Date   : 30 Januari 2010  	#                 
# 							   			#
# DediCateD      : Ukhuwahnet@DALnet	#
#                                   	#  
#########################################

##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set grtowner "abah" 

# location
set grtcountry "Indonesia"
set grtstate "Makassar"

# Version
set grtversion "20.10"

# End configuration

# main strings
set grtupdate "09.08.2010"
bind join - * sayinfo 

# Strings
set info_owner {
    "Welcome My Owner"
    "Assalamu`alaikum Warahmatullah My Owner"    	
}
set info_localowner {
    "Welcome My Owner"
    "Assalamu`alaikum Warahmatullah My Owner"
}
set info_master {
    "Welcome My Master"
    "Assalamu`alaikum Warahmatullah My Master"    	
}
set info_friend {
    "Welcome My Friend"
    "Assalamu`alaikum Warahmatullah My Friend"
}
set info_oper {
    "Welcome IRCops"
}

# main()

proc sayinfo { nick host handle chan } {
   global botnick
   if { $nick != $botnick } {
       if {[matchattr $handle n]} {
           putserv "PRIVMSG $chan :$nick --> [rand_owner $nick] "
       } elseif {[matchattr $handle |n $chan]} {
           putserv "PRIVMSG $chan :$nick --> [rand_localowner $nick] "
       } elseif {[matchattr $handle m]} {
           putserv "PRIVMSG $chan :$nick --> [rand_master $nick] "
       } elseif {[matchattr $handle |m $chan]} {
           putserv "PRIVMSG $chan :$nick --> [rand_master $nick] "
       } elseif {[matchattr $handle f]} {
           putserv "PRIVMSG $chan :$nick --> [rand_friend $nick] "
       } elseif {[matchattr $handle |f $chan]} {
           putserv "PRIVMSG $chan :$nick --> [rand_friend $nick] "
       } elseif {[matchattr $handle o]} {
           putserv "PRIVMSG $chan :$nick --> [rand_oper $nick] "
       } elseif {[matchattr $handle |o $chan]} {
           putserv "PRIVMSG $chan :$nick --> [rand_oper $nick] "       
       }
   }
}

# random(s)

proc rand_owner {nick} {
     global info_owner
     set result [lindex $info_owner [rand [llength $info_owner]]]
     return "$result"
}
proc rand_localowner {nick} {
     global info_localowner
     set result [lindex $info_localowner [rand [llength $info_localowner]]]
     return "$result"
}
proc rand_master {nick} {
     global info_master
     set result [lindex $info_master [rand [llength $info_master]]]
     return "$result"
}
proc rand_friend {nick} {
     global info_friend
     set result [lindex $info_friend [rand [llength $info_friend]]]
     return "$result"
}
proc rand_oper {nick} {
     global info_oper
     set result [lindex $info_oper [rand [llength $info_oper]]]
     return "$result"
}

# putlog

putlog "Greet.tcl oleh $grtowner $grtcountry $grtstate version $grtversion update $grtupdate is LOADED!"