### Simple Country Code lookup / reverse lookup by ThEdGE (thedge@xs4all.nl).
### Commands: !cc <country code> !cc <country> !cc -info


### Public Commmand
set cmd "!cc"

### Country Codes
set codes {
	"BIZ=Business"
	"COM=US Commercial"
	"EDU=US Educational"
	"GOV=US Government"
	"INT=International"
	"MIL=US Military"
	"NET=Network"
	"ORG=Non-Profit Organization"
	"ARPA=Old style Arpanet"
	"NATO=Nato field"
	"AD=Andorra"
	"AE=United Arab Emirates"
	"AF=Afghanistan"
	"AG=Antigua and Barbuda"
	"AI=Anguilla"
	"AL=Albania"
	"AM=Armenia"
	"AN=Netherlands Antilles"
	"AO=Angola"
	"AQ=Antarctica"
	"AR=Argentina"
	"AS=American Samoa"
	"AT=Austria"
	"AU=Australia"
	"AW=Aruba"
	"AZ=Azerbaijan"
	"BA=Bosnia and Herzegovina"
	"BB=Barbados"
	"BD=Bangladesh"
	"BE=Belgium"
	"BF=Burkina Faso"
	"BG=Bulgaria"
	"BH=Bahrain"
	"BI=Burundi"
	"BJ=Benin"
	"BM=Bermuda"
	"BN=Brunei Darussalam"
	"BO=Bolivia"
	"BR=Brazil"
	"BS=Bahamas"
	"BT=Bhutan"
	"BV=Bouvet Island"
	"BW=Botswana"
	"BY=Belarus"
	"BZ=Belize"
	"CA=Canada"
	"CC=Cocos Islands"
	"CF=Central African Republic"
	"CG=Congo"
	"CH=Switzerland"
	"CI=Cote D'Ivoire"
	"CK=Cook Islands"
	"CL=Chile"
	"CM=Cameroon"
	"CN=China"
	"CO=Colombia"
	"CR=Costa Rica"
	"CS=Former Czechoslovakia"
	"CU=Cuba"
	"CV=Cape Verde"
	"CX=Christmas Island"
	"CY=Cyprus"
	"CZ=Czech Republic"
	"DE=Germany"
	"DJ=Djibouti"
	"DK=Denmark"
	"DM=Dominica"
	"DO=Dominican Republic"
	"DZ=Algeria"
	"EC=Ecuador"
	"EE=Estonia"
	"EG=Egypt"
	"EH=Western Sahara"
	"ER=Eritrea"
	"ES=Spain"
	"ET=Ethiopia"
	"FI=Finland"
	"FJ=Fiji"
	"FK=Falkland Islands"
	"FM=Micronesia"
	"FO=Faroe Islands"
	"FR=France"
	"FX=France, Metropolitan"
	"GA=Gabon"
	"GB=Great Britain"
	"GD=Grenada"
	"GE=Georgia"
	"GF=French Guiana"
	"GH=Ghana"
	"GI=Gibraltar"
	"GL=Greenland"
	"GM=Gambia"
	"GN=Guinea"
	"GP=Guadeloupe"
	"GQ=Equatorial Guinea"
	"GR=Greece"
	"GS=S. Georgia and S. Sandwich Isls."
	"GT=Guatemala"
	"GU=Guam"
	"GW=Guinea-Bissau"
	"GY=Guyana"
	"HK=Hong Kong"
	"HM=Heard and McDonald Islands"
	"HN=Honduras"
	"HR=Croatia"
	"HT=Haiti"
	"HU=Hungary"
	"ID=Indonesia"
	"IE=Ireland"
	"IL=Israel"
	"IN=India"
	"IO=British Indian Ocean Territory"
	"IQ=Iraq"
	"IR=Iran"
	"IS=Iceland"
	"IT=Italy"
	"JM=Jamaica"
	"JO=Jordan"
	"JP=Japan"
	"KE=Kenya"
	"KG=Kyrgyzstan"
	"KH=Cambodia"
	"KI=Kiribati"
	"KM=Comoros"
	"KN=Saint Kitts and Nevis"
	"KP=North Korea"
	"KR=South Korea"
	"KW=Kuwait"
	"KY=Cayman Islands"
	"KZ=Kazakhstan"
	"LA=Laos"
	"LB=Lebanon"
	"LC=Saint Lucia"
	"LI=Liechtenstein"
	"LK=Sri Lanka"
	"LR=Liberia"
	"LS=Lesotho"
	"LT=Lithuania"
	"LU=Luxembourg"
	"LV=Latvia"
	"LY=Libya"
	"MA=Morocco"
	"MC=Monaco"
	"MD=Moldova"
	"MG=Madagascar"
	"MH=Marshall Islands"
	"MK=Macedonia"
	"ML=Mali"
	"MM=Myanmar"
	"MN=Mongolia"
	"MO=Macau"
	"MP=Northern Mariana Islands"
	"MQ=Martinique"
	"MR=Mauritania"
	"MS=Montserrat"
	"MT=Malta"
	"MU=Mauritius"
	"MV=Maldives"
	"MW=Malawi"
	"MX=Mexico"
	"MY=Malaysia"
	"MZ=Mozambique"
	"NA=Namibia"
	"NC=New Caledonia"
	"NE=Niger"
	"NF=Norfolk Island"
	"NG=Nigeria"
	"NI=Nicaragua"
	"NL=Netherlands"
	"NO=Norway"
	"NP=Nepal"
	"NR=Nauru"
	"NT=Neutral Zone"
	"NU=Niue"
	"NZ=New Zealand"
	"OM=Oman"
	"PA=Panama"
	"PE=Peru"
	"PF=French Polynesia"
	"PG=Papua New Guinea"
	"PH=Philippines"
	"PK=Pakistan"
	"PL=Poland"
	"PM=St. Pierre and Miquelon"
	"PN=Pitcairn"
	"PR=Puerto Rico"
	"PS=Palestinian State"
	"PT=Portugal"
	"PW=Palau"
	"PY=Paraguay"
	"QA=Qatar"
	"RE=Reunion"
	"RO=Romania"
	"RU=Russian Federation"
	"RW=Rwanda"
	"SA=Saudi Arabia"
	"Sb=Solomon Islands"
	"SC=Seychelles"
	"SD=Sudan"
	"SE=Sweden"
	"SG=Singapore"
	"SH=St. Helena"
	"SI=Slovenia"
	"SJ=Svalbard and Jan Mayen Islands"
	"SK=Slovak Republic"
	"SL=Sierra Leone"
	"SM=San Marino"
	"SN=Senegal"
	"SO=Somalia"
	"SR=Suriname"
	"ST=Sao Tome and Principe"
	"SU=Former USSR"
	"SV=El Salvador"
	"SY=Syria"
	"SZ=Swaziland"
	"TC=Turks and Caicos Islands"
	"TD=Chad"
	"TF=French Southern Territories"
	"TG=Togo"
	"TH=Thailand"
	"TJ=Tajikistan"
	"TK=Tokelau"
	"TM=Turkmenistan"
	"TN=Tunisia"
	"TO=Tonga"
	"TP=East Timor"
	"TR=Turkey"
	"TT=Trinidad and Tobago"
	"TV=Tuvalu"
	"TW=Taiwan"
	"TZ=Tanzania"
	"UA=Ukraine"
	"UG=Uganda"
	"UK=United Kingdom"
	"UM=US Minor Outlying Islands"
	"US=United States"
	"UY=Uruguay"
	"UZ=Uzbekistan"
	"VA=Vatican City State"
	"VC=Saint Vincent and the Grenadines"
	"VE=Venezuela"
	"VG=Virgin Islands (British)"
	"VI=Virgin Islands (U.S.)"
	"VN=Viet Nam"
	"VU=Vanuatu"
	"WF=Wallis and Futuna Islands"
	"WS=Samoa"
	"YE=Yemen"
	"YT=Mayotte"
	"YU=Yugoslavia"
	"ZA=South Africa"
	"ZM=Zambia"
	"ZR=Zaire"
	"ZW=Zimbabwe"
}


######################################
## All code below ->

bind PUB - $cmd docc

set used 0

proc docc { nick uhost handle chan arg } {
 global codes used
 incr used
 set input $arg
 set len [string length $input]
 set results 0

 if {$input=="-info"} {
  set total 0
  set totalb 0
  foreach code $codes {
   incr total
   set totalb [expr $totalb + [string bytelength $code]]
  }
  putserv "PRIVMSG $chan : I currently know \002$total\002 Country Codes (\002$totalb\002 bytes) and ive been used \002$used\002 times since i last started."
  return
 }

 if {$input=="-author"} {
  set lastedited [clock format [file mtime "scripts/cc.tcl"] -format "%T %D"]
  putserv "PRIVMSG $chan : This script has been written by \002ThEdGE\002 and is last edited on: \002$lastedited\002."
  return
 }

 if {[expr $len > 40]} {
  putserv "PRIVMSG $chan : Your input length ($len) is too long."
  return
 }

 if {[expr $len > 4]} {
  putserv "NOTICE $nick : Searching for the Country Code of \002*$input*\002:"
  foreach code $codes {
   set splits [split $code "="]
   set code [lindex $splits 0]
   set value [lindex $splits 1]

   if {[regexp [string tolower $input] [string tolower $value]]} { 
    incr results
    putserv "NOTICE $nick : Found: \002$code\002 -> \002$value\002"
   }
  }

  if {[expr $results>1] || $results=="0"} {
   putserv "NOTICE $nick : Done Searching found \002$results\002 results."
  } else {
   putserv "NOTICE $nick : Done Searching found \002$results\002 result."
  }
  return
 }

 if {[string index $input 0]=="."} {
  set input [string range $input 1 end]
 }
 foreach code $codes {
  set splits [split $code "="]
  set code [lindex $splits 0]
  set value [lindex $splits 1]
  if {[string tolower $input]==[string tolower $code]} {
   set results 1
   putserv "PRIVMSG $chan : The Country Code \002$input\002 belongs to \002$value\002."
  }
 }
  if {$results==0} {
   putserv "PRIVMSG $chan : Found nothing on Country Code : \002$input\002."
  }
}