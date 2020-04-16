namespace eval auth {

set name     "acount"
set pass     "pasword"
set usex     1
set service  "AuthServ@Services.GameSurge.net"

  bind EVNT  -|-   init-server   [namespace current]::connect
  
}

proc auth::connect {event} {
  putquick "PRIVMSG $auth::service :AUTH $auth::name $auth::pass"
  if {$auth::usex} {
    putquick "MODE $::botnick +x"
  }
}