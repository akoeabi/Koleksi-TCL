bind pub - !commands pub_comen
bind pub - !info pub_info
bind pub - !help pub_help

proc pub_comen {nick uhost hand chan args} {
putchan $chan "Try 5!help"
return 1
}

proc pub_info {nick uhost hand chan args} {
putchan $chan "Edited oleh dinda sendiri"
return 1
}

proc pub_help {nick uhost hand chan args} {
putchan $chan "4**» Peraturan Room Medan"
putchan $chan "5**» 1. Hormatilah sesama user di room."
putchan $chan "5**» 2. Bersikap sopan dan santun dalam berkomunikasi."
putchan $chan "5**» 3. Tidak di BENAR kan untuk :"
putchan $chan "5**» a. Berchat berisi hal bersifat menyinggunga user lain."
putchan $chan "5**» b. Isi chat mesum, vulgar dan sebangsanya."
putchan $chan "5**» c. Nyamar atau sok mau jadi artis."
return 1
}

putlog "help.tcl by terroris LOADED! enjoy!"
