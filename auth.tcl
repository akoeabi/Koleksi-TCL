# Auth 1.1

# This script auths your bot to the service bot you use (must be Q [could have a different nick])
namespace eval auth {
  variable version  2.0
  variable author   Abah
  
  # AUTH'ing data.
  variable name     "MaKaSSaR"
  variable pass     "43ahk0378"
  
  # Set this to (1) if you want the bot to use usermodes.
  variable usemodes     1
  
  #set the usermodes you want to use
  variable modes    +iwxR-ds
  
  # Set a channel you want the bot to message that the bot is authed. Requires chanmode -n 
  #(comment the next line to disable 
  #also remove line putquick "PRIVMSG $auth::channel :I'm authed to $auth::service as $auth::name , and have set the modes $auth::modes" )
  variable channel    "#channel"  
  
  # Service bot host (default to Q on QuakeNet)
  variable service  "Q@CServe.QuakeNet.org"
    
  bind EVNT  -|-   init-server   [namespace current]::connect
}

proc auth::connect {event} {
  putquick "PRIVMSG $auth::service :AUTH $auth::name $auth::pass"
  if {$auth::usemodes} {
    putquick "MODE $::botnick $auth::modes "
	putquick "PRIVMSG $auth::channel :I'm authed to $auth::service as $auth::name , and have set the modes $auth::modes"
  }
}

putlog "[file tail [info script]] $auth::version by $auth::author loaded."