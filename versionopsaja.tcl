set ver(acc) "o|o"

bind pub $ver(acc) "!version" versinick
bind pub $ver(acc) "!versi" versinick
bind pub $ver(acc) ".version" versinick
bind pub $ver(acc) ".versi" versinick

proc versinick {nick uhost hand chan rest} {
global versinick versichan
bind ctcr - VERSION versireply
bind notc - VERSION* versireplynotc
set rest [lindex $rest 0]
set versinick 0
set versichan $chan
putquick "PRIVMSG $rest :\001VERSION\001"
return 0
}
proc versireply {nick uhost hand dest key args} {
global versichan versinick
unbind ctcr - VERSION versireply
unbind notc - VERSION* versireplynotc
set versiresult [lindex $args 0]
putquick "PRIVMSG $versichan :\[4Version Nickname\] $nick 12adalah $versiresult"
}