######################################################################
# Simple Zodiak By JoJo - #Botmaster Allnetwork
# hillzx@gmail.com
# Version 1.0
# 19 Maret 2010
######################################################################

package require http 2.0

bind pub - !zodiak pub:zodiak 

proc pub:zodiak {nick host hand chan arg} { 


  set arg1 [lindex $arg 0]
  set arg2 [lindex $arg 1] 
  
  if {$arg1=="" || $arg2==""} { 
    putserv "PRIVMSG $nick :Format yg benar !zodiak <aries,taurus,gemini, cancer,leo,virgo, libra,scorpio,sagitarius, capricorn,aquarius,pisces> <umum>" 
	putserv "PRIVMSG $nick :Zodiak di update setiap minggu lhoo.. Bot Zodiak satu2nya di Allnetwork karya JoJo pastinya.."
	puthelp "PRIVMSG $nick :Catatan: Zodiak ini hanyalah permainan dan iseng belaka. Jangan dipercaya sebagai ramalan."
	return 0 
  } 
  switch [string tolower $arg1] { 
    "aries" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_aries.html"]			
		}
		
    } "taurus" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_taurus.html"]			
		}
		
    } "gemini" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_gemini.html"]			
		}
		
    } "cancer" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_cancer.html"]			
		}
		
    } "leo" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_leo.html"]			
		}
		
    } "virgo" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_virgo.html"]			
		}
		
    } "libra" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_libra.html"]			
		}
		
    } "scorpio" { 
	
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_scorpio.html"]			
		}
       
    } "sagitarius" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_sagitarius.html"]			
		}
		
    } "capricorn" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_capricorn.html"]			
		}
		
    } "aquarius" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_aquarius.html"]			
		}
		
    } "pisces" { 
		if { $arg2=="umum" } {
			set result [getzodiakumum "http://m.kapanlagi.com/woman/zodiac/umum_pisces.html"]			
		}
		
    } default { 
    putserv "PRIVMSG $nick :Format yg benar !zodiak <aries,taurus,gemini, cancer,leo,virgo, libra,scorpio,sagitarius, capricorn,aquarius,pisces> <umum>" 
	putserv "PRIVMSG $nick :Zodiak di update setiap minggu lhoo.. Zodiak Bot satu2nya di Allnetwork karya JoJo pastinya.."
	puthelp "PRIVMSG $nick :Catatan: Zodiak ini hanyalah permainan dan iseng belaka. Jangan dipercaya sebagai ramalan."
    } 
  } 
  
putserv "PRIVMSG $nick :4[string toupper $arg1]:14 $result"
  
} 

proc getzodiakumum {url} {

	set zodiak "Maaf fitur zodiak mengalami gangguan pada saat ini, silakan ulangi beberapa saat lagi."
	set http [http::config -useragent mozilla] 
	set http [http::geturl $url -timeout [expr 1000 * 10]] 
	set html [http::data $http] 
  
	regexp {<b>Umum:</b><br /><br />(.*)<br />} $html zodiak 
	regsub -all "<b>Umum:</b>" $zodiak "" zodiak 
	regsub -all "<br />" $zodiak "" zodiak
	
	return "$zodiak" 

}

putlog "Zodiak by JoJo"