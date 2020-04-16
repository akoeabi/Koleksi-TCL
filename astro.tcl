bind pub - !zodiak pub_zodiak

set chktime "15"
set ruang ""
set asmara ""
set uang ""
set kerja ""
set kiss ""
set zodiak ""
set comm ""
set zodi ""

#package require http

proc pub_zodiak {nick uhost hand channel arg} {
  global chktime zodi ruang zodiak

     set arg [string toupper $arg]
     set zodi ""
     if {$arg == "" || [string match "#*" $arg]} {
          puthelp "NOTICE $nick :4¤R¤ Gunakan !zodiak <zodiakmu> untuk Mendapatkan info zodiak"
          return 0
     } elseif {$arg == "ARIES"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=aries#as"
          
     } elseif {$arg == "TAURUS"}  { 
          set zodi "http://www.astaga.com/astrologi/index.php?cat=taurus#as"
          
     } elseif {$arg == "GEMINI"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=gemini#as"
          
     } elseif {$arg == "CANCER"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=cancer#as"
          
     } elseif {$arg == "LEO"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=leo#as"
          
     } elseif {$arg == "VIRGO"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=virgo#as"
          
     } elseif {$arg == "LIBRA"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=libra#as"
          
     } elseif {$arg == "SCORPIO"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=scorpio#as"
          
     } elseif {$arg == "SAGITARIUS"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=sagitarius#as"
          
     } elseif {$arg == "CAPRICORN"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=capricorn#as"
          
     } elseif {$arg == "AQUARIUS"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=aquarius#as"
          
     } elseif {$arg == "PISCES"} {
          set zodi "http://www.astaga.com/astrologi/index.php?cat=pisces#as"
          
     } else {
          puthelp "NOTICE $nick :4¤R¤ Zodiak Tidak Valid !!"
          return 0
     } 

  set asmara ""
  set uang ""
  set kerja ""
  set kiss ""
  set zodiak ""
  set comm ""
  foreach d [split [http::data [http::geturl $zodi]] "\n"] {
	  if {[string match "*class=astrologi*" $d]} {
		regsub -all -- {<[^>]*>} $d "" zodiak
	  }
          
          if {[string match "*id=ast><p>*" $d]} {
		regsub -all -- {<[^>]*>} $d "" comm
	  }
          
          if {[string match "*<b>Asmara*" $d]} {
		regsub -all -- {<[^>]*>} $d "" asmara
	  }
 
          if {[string match "*<b>Keuangan*" $d]} {
		regsub -all -- {<[^>]*>} $d "" uang
	  }
          if {[string match "*<b>Kiss*" $d]} {
		regsub -all -- {<[^>]*>} $d "" kiss
	  }
          if {[string match "*<b>Pekerjaan*" $d]} {
		regsub -all -- {<[^>]*>} $d "" kerja
	  }
   }
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $zodiak"
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $comm"
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $asmara"
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $kerja"
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $uang"
  putserv "PRIVMSG $nick :\[Astaga ZodiaK\] $kiss"

}
putlog "astrologi by terroris loaded"
