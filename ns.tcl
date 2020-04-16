#NickServ Services By Shadowless
putlog "\002NickServ Services\002 By Shadowless Loaded"
################################################################################################################
#setting# init-server in eggdrop.conf also needs to remove.
################################################################################################################
set nickname "BOTNICK"
set password "BOTPASS"
set nickserv "NickServ"
set NShost "nickserv@services.dal.net"

################################################################################################################
#identify
################################################################################################################
bind notc - "*nick is owned by someone else*" do_identify

proc do_identify { nick uhost hand args rest } { 
global botnick password nickname nickserv
if { $botnick == "$nickname" } {
putquick "PRIVMSG nickserv@services.dal.net :identify $nickname $password" 
putlog "Identifying for nick \002\[$nickname\]\002"
putserv "NICK $nickname"
} 
}
#init-server procedure
bind evnt -|- init-server serverevent
proc serverevent { init-server } {
global botnick password nickname nickserv
putquick "PRIVMSG nickserv@services.dal.net :identify $nickname $password" 
}
set init-server {  
putquick "PRIVMSG nickserv@services.dal.net :identify $nickname $password" 
putserv "MODE $botnick +i-ws" 
}
################################################################################################################
#ghost
################################################################################################################
bind raw - 303 do_ghost303
bind raw - 433 do_ghost433
bind notc - "name is already in use*" do_ghost433

proc do_ghost303 {* 303 arg} {
global botnick nickname password NShost
foreach nqh [lrange $arg 1 end] {
set nqh [lindex [split $nqh ":"] 1]
if {[strlwr $nqh] == [strlwr $nickname] && [strlwr $nqh] != [strlwr $botnick]} {
putserv "PRIVMSG [lindex [split $NShost "!"] 0] :ghost $nickname $password"
putlog "Nick \002\[$nickname\]\002 is in use... Ghosting..."
putserv "NICK $nickname"
} 
}
}

proc do_ghost433 {pro key arg} {
global nickname password
set nck [lindex $arg 1]
if {[string match [string tolower $nickname] [string tolower $nck]]} {
putquick "PRIVMSG nickserv@services.dal.net :ghost $nickname $password"
putlog "Nick \002\[$nickname\]\002 is in use... Ghosting..."
putserv "NICK $nickname"
}
return 0
}

################################################################################################################
#release
################################################################################################################

bind raw - 403 do_release_raw
bind raw - 432 do_release_raw
bind notc - "currently being held by a Services Enforcer*" do_release_notice

proc do_release_raw {from keyword arg} { 
global botnick password nickname altnick 
if {([string match "*The nick * is currently being held by a Services Enforcer*" $arg])} { 
putquick "NICK $altnick"
putserv "PRIVMSG NickServ@services.dal.net :release $nickname $password" 
putlog "The nick \002\[$nickname\]\002 is currently being held by a Services Enforcer..."
putserv "NICK $nickname"
} 
} 

proc do_release_notice { nick uhost handle text dest } { 
global botnick nickserv release nickname password 
if { $nick == $nickserv } {
putquick "NICK $altnick"
putserv "PRIVMSG NickServ@services.dal.net :release $nickname $password" 
putlog "The nick \002\[$nickname\]\002 is currently being held by a Services Enforcer..."
putserv "NICK $nickname"
}
}

################################################################################################################
#end
################################################################################################################