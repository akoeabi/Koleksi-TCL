set nickpass "Qa5Sfq"
set nickserv "NickServ@Services.DAL.net"
set chanserv "ChanServ@Services.DAL.net"
set memoserv "MemoServ@Services.DAL.net"

set init-server {
putserv "PRIVMSG $nickserv :identify $nickpass"
putserv "MODE $botnick +iwr"
}

bind notc - "*This nick is owned by someone else*" ident_nickserv
bind notc - "*Password accepted for*" op_chanserv
bind notc - "*You have*" rm_memos
bind dcc o rop op_chanserv
bind dcc o identify dcc_identify

proc ident_nickserv { nick uhost hand args } {
 global botnick nickpass nickserv
    putlog "Ada notice dari $nickserv"
    putserv "PRIVMSG $nickserv :identify $nickpass"
    putlog "Identify ke $nickserv dulu nih"
  }

proc dcc_identify { hand idx mascara } {
 global nickserv botnick nickpass 
 putserv "PRIVMSG $nickserv :identify $nickpass"
 }

proc op_chanserv { nick uhost hand args } {
   global botnick chanserv channame
     putlog "Password diterima. Minta @ ke $chanserv ahh"
     foreach channame [channels] {
     putserv "PRIVMSG $chanserv :OP $channame $botnick" }
     putlog "Mbah $chanserv @ gue di $channame dong"
}

proc rm_memos { nick uhost hand args } {
   global botnick memoserv
     putlog "Ada memo notice dari $memoserv"
     putserv "PRIVMSG $memoserv :DEL ALL"
     putlog "Gue gak butuh memo. hapus aja!"
}