set nickname "mala"
set password "M4l4Xz"

bind pub m .identify  do_identify
bind pub m .recover do_recover

proc do_identify {nick host handle chan text} { 
global nickname password
putquick "PRIVMSG NickServ :identify $nickname $password" 
putserv "NOTICE $nick :$nick identified"
}

proc do_recover {nick host handle chan text} {
global nickname password
putquick "PRIVMSG NickServ :recover $nickname $password"
putserv "NOTICE $nick :$nick released"
}

set init-server {  
putquick "PRIVMSG NickServ :identify $nickname $password" 
putserv "MODE $nick +iwrsxtRpG"
}