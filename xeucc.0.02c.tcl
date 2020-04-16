# XE.COM Universal Currency Convertor Script - Copyright C.Leonhardt 2006 rosc2112 at yahoo com 
# http://members.dandy.net/~fbn/xeucc.tcl.txt
set xeuver "0.02c"
#
# This script converts currency units from XE.com. This script is loosely based on the currency script "exchange"
# created by Incith, which I had done some mods to. That version used yahoo's Finance page for conversions. "Zexel"
# on the egghelp forums requested a script for XE.com's currency convertor, and upon comparing with yahoo, I found
# that XE.com has more than 50 additional currencies (albeit many are obsolete), and uses closer-to-real-time-market 
# stats. 
#
# These currency types are not available from XE.com, but are on yahoo's currency convertor site: 
# XAL (aluminum ounce), ECS (ecuador sucre) and XCP (copper ounce) - XE.com responded to my suggestion to add those
# saying that the Sucre is no longer legal tender (Ecuador now uses U.S.Dollars), and also XE.com does not support
# non-precious metals, and so does not have aluminum and copper exchange rates in their convertor. So there you go.
#
# Usage: .xe <amount> <from-currency> <to-currency>  - Example: .xe 1 XAU USD 
#                                                      Convert 1 ounce gold to U.S. Dollars
#
#        .xe search <keyword>                        - Search for a country-name or a currency symbol 
#                                                      by full or partial name
#
# Changes: 
#          Nov 06 2006 - Forgot to chop off the word 'search' when passing text to 'proc xecur_search'
#                      - Fixed method of checking for valid 'tocur' and 'fromcur' symbols.
#                      - Added 'comma' to the regexp test for valid characters in 'amount' 
#                      - More regexp tweaks to validate symbol input before passing along to geturl.
#                      - Had to limit 'amount' input to under 14 digits, otherwise XE.com makes mistakes.
#          Feb 25 2007 - Fixed regexp for new xe.com html format.
#          Apr 28 2007 - Regexp fix.
#          Sep 08 2007 - Fixed anal-retentive warning crap (BTW this is NOT "automated" - people have to actually
#                        run this script the same exact way as a friggen web-browser, so knock it off with the 
#                        anal-retentive bullshit, xe.com.)
###################################################################################################################
# Configs #
###########

# Channels where we allow public use:
set xeuchans "#mychan #chan2 #etc"

# Out of the above channels, these will only respond by PRIVMSG:
set xeuquietchans "#chan2 #etc"

# timeout for geturl (in 1/1000ths of a second)
set xeutimeout "30000"
#______________
# end configs #
###################################################################################################################
bind pub - .xe xepub
bind msg - .xe xemsg

package require http 2.3


proc xemsg {nick uhost hand text} {
	if {![onchan $nick]} {return}
	xepub $nick $uhost $hand privmsg $text
	return
}


proc xepub {nick uhost hand chan text} {
	global xeuchans xeuquietchans xeutimeout
	set xeuchans [string tolower $xeuchans]
	set chan [string tolower $chan]
	if {([lsearch -exact $xeuchans $chan] == -1) && ($chan != "privmsg")} {return}
	if {([lsearch -exact $xeuquietchans $chan] != -1) || ($chan == "privmsg")} {set chan $nick}
	set text [split [string trim $text]]
	set xetime "";set fromamount "";set fromname "";set toamount "";set toname "";set amount "";set fromcur "";set tocur ""
	set amount [lindex $text 0];set amount [string trim $amount]
	set fromcur [lindex $text 1];set fromcur [string toupper [string trim $fromcur]]
	set tocur [lindex $text 2];set tocur [string toupper [string trim $tocur]]
	if {$amount == "search"} {
		xecur_search $nick 1 [lrange $text 1 end]
		return
	}
	if {($amount == "") || ($amount == "help") || ($fromcur == "") || ($tocur == "") || ([regexp {[^A-Z]} $fromcur]) || ([string length $fromcur] != 3) || ([regexp {[^A-Z]} $tocur]) || ([string length $tocur] != 3)} {
		puthelp "PRIVMSG $nick :Usage: \002.xe <amount> <from-currency-symbol> <to-currency-symbol>\002"
		puthelp "PRIVMSG $nick :Example: \002.xe 1 XAU USD\002  - convert 1 ounce gold to U.S. Dollars"
		puthelp "PRIVMSG $nick :To search for countries or currency symbols (full or partial names), \002.xe search <keyword>\002"
		return
	}
	if {($amount <= 0) || ([regexp {[^0-9\.,]} $amount])} {
		puthelp "PRIVMSG $nick :The currency amount must be a decimal number greater than zero :P"
		return
	}
	if {[string length $amount] > 14} {
		puthelp "PRIVMSG $nick :The currency amount cannot be greater than 14 digits long."
		return
	}
	if {[xecur_search $nick 0 $fromcur] == 0} {
		puthelp "PRIVMSG $nick :Invalid \"from\" currency symbol '\002$fromcur\002' - try \002.xe search <keyword>\002 to find valid currency symbols."
		return
	}
	if {[xecur_search $nick 0 $tocur] == 0} {
		puthelp "PRIVMSG $nick :Invalid \"to\" currency symbol '\002$tocur\002' - try \002.xe search <keyword>\002 to find valid currency symbols."	
		return
	}
	if {$fromcur == $tocur} {
		puthelp "PRIVMSG $nick :The currency symbols for \"from-currency\" and \"to-currency\" must be different from each other."
		puthelp "PRIVMSG $nick :Try \002.xe help\002 for more info."
		return
	}
	set xeurl "http://www.xe.com/ucc/convert.cgi"
	set xequery [::http::formatQuery Amount "$amount" From "$fromcur" To "$tocur"]
	catch {set page [::http::geturl $xeurl -query $xequery -timeout $xeutimeout]} error
	if {[string match -nocase "*couldn't open socket*" $error]} {
		puthelp "PRIVMSG $nick :Error: couldn't connect to XE.com..Try again later"
		::http::cleanup $page
		return
	}
	if { [::http::status $page] == "timeout" } {
		puthelp "PRIVMSG $nick :Error: Connection timed out to XE.com."
		::http::cleanup $page
		return
	}
	set html [::http::data $page]
	::http::cleanup $page

	if {[regexp {>Live rates at (.*?)</span>} $html match xetime] \
	&& [regexp {<td width="45%" align="right" id="XEenlarge"><h2 class="XE">(.*?)</h2></td>} $html match fromamount] \
	&& [regexp {<td width="45%" align="left" id="XEenlarge"><h2 class="XE">(.*?)</h2></td>} $html match toamount]} {
		regsub -all {<!.*?>} $fromamount {} fromamount
		regsub -all {<!.*?>} $toamount {} toamount
		puthelp "PRIVMSG $chan :XE.COM: \002$fromamount\002 equals \002$toamount\002 as of $xetime"
	} else {
		puthelp "PRIVMSG $chan :Could not obtain results from XE.com, sorry!"
	}
}

proc xecur_search {nick xetype country} {
set xecurlist {
AFN:Afghanistan,#Afghani
ALL:Albania,#Lek
DZD:Algeria,#Dinar
USD:America#(United#States),#Dollar
USD:American#Samoa,#United#States#Dollar
EUR:Andorra,#Euro
AOA:Angola,#Kwanza
XCD:Anguilla,#East#Caribbean#Dollar
XCD:Antigua#and#Barbuda,#East#Caribbean#Dollar
ARS:Argentina,#Peso
AMD:Armenia,#Dram
AWG:Aruba,#Guilder
AUD:Ashmore#and#Cartier#Islands,#Australia#Dollar
AUD:Australia,#Dollar
EUR:Austria,#Euro
ATS:Austria,#Schilling#(obsolete)
AZM:Azerbaijan,#Manat
AZN:Azerbaijan,#New#Manat
EUR:Azores,#Euro
BSD:Bahamas,#Dollar
BHD:Bahrain,#Dinar
BBD:Bajan#(Barbados),#Dollar
EUR:Balearic#Islands,#Euro
BDT:Bangladesh,#Taka
BBD:Barbados,#Dollar
BYR:Belarus,#Ruble
EUR:Belgium,#Euro
BEF:Belgium,#Franc#(obsolete)
BZD:Belize,#Dollar
XOF:Benin,#CFA#Franc#BCEAO
BMD:Bermuda,#Dollar
INR:Bhutan,#India#Rupee
BTN:Bhutan,#Ngultrum
BOB:Bolivia,#Boliviano
ANG:Bonaire,#Netherlands#Antilles#Guilder
BAM:Bosnia#and#Herzegovina,#Convertible#Marka
BWP:Botswana,#Pula
BRL:Brazil,#Real
GBP:Britain#(United#Kingdom),#Pound
GBP:British#Indian#Ocean#Territory,#United#Kingdom#Pound
USD:British#Indian#Ocean#Territory,#United#States#Dollar
USD:British#Virgin#Islands,#United#States#Dollar
BND:Brunei,#Dollar
SGD:Brunei,#Singapore#Dollar
BGN:Bulgaria,#Lev
XOF:Burkina#Faso,#CFA#Franc#BCEAO
MMK:Burma#(Myanmar),#Kyat
BIF:Burundi,#Franc
KHR:Cambodia,#Riel
XAF:Cameroon,#CFA#Franc#BEAC
CAD:Canada,#Dollar
EUR:Canary#Islands,#Euro
CVE:Cape#Verde,#Escudo
KYD:Cayman#Islands,#Dollar
XAF:Central#African#Republic,#CFA#Franc#BEAC
XAF:CFA#Communauté#Financière#Africaine#BEAC#Franc
XOF:CFA#Communauté#Financière#Africaine#BCEAO#Franc
XAF:Chad,#CFA#Franc#BEAC
CLP:Chile,#Peso
CNY:China,#Yuan#Renminbi
AUD:Christmas#Island,#Australia#Dollar
AUD:Cocos#(Keeling#Islands,#Australia#Dollar
COP:Colombia,#Peso
XAF:Communauté#Financière#Africaine#BEAC#Franc
XOF:Communauté#Financière#Africaine#BCEAO#Franc
KMF:Comoros,#Franc
XPF:Comptoirs#Français#du#Pacifique#Franc
XAF:Congo/Brazzaville,#CFA#Franc#BEAC
CDF:Congo/Kinshasa,#Franc
NZD:Cook#Islands,#New#Zealand#Dollar
AUD:Coral#Sea#Islands,#Australia#Dollar
CRC:Costa#Rica,#Colon
XOF:Côte#d'Ivoire,#CFA#Franc#BCEAO
HRK:Croatia,#Kuna
CUC:Cuba,#Convertible#Peso
CUP:Cuba,#Peso
ANG:Curaço,#Netherlands#Antilles#Guilder
CYP:Cyprus,#Pound
CZK:Czech#Republic,#Koruna
DKK:Denmark,#Krone
DJF:Djibouti,#Franc
XCD:Dominica,#East#Caribbean#Dollar
DOP:Dominican#Republic,#Peso
EUR:Dutch#(Netherlands),#Euro
NLG:Dutch#(Netherlands),#Guilder#(obsolete)
XCD:East#Caribbean#Dollar
USD:East#Timor,#United#States#Dollar
USD:Ecuador,#United#States#Dollar
EGP:Egypt,#Pound
SVC:El#Salvador,#Colon
USD:El#Salvador,#United#States#Dollar
GBP:England#(United#Kingdom),#Pound
XAF:Equatorial#Guinea,#CFA#Franc#BEAC
ERN:Eritrea,#Nakfa
EEK:Estonia,#Kroon
ETB:Ethiopia,#Birr
EUR:Euro
EUR:Europa#Island,#Euro
FKP:Falkland#Islands,#Pound
DKK:Faroe#Islands,#Denmark#Krone
FJD:Fiji,#Dollar
EUR:Finland,#Euro
FIM:Finland,#Markka#(obsolete)
EUR:France,#Euro
FRF:France,#Franc#(obsolete)
EUR:French#Guiana,#Euro
XPF:French#Polynesia,#Comptoirs#Français#du#Pacifique#Franc
EUR:French#Polynesia,#Euro
EUR:French#Southern#and#Antarctic#Lands,#Euro
XAF:Gabon,#CFA#Franc#BEAC
GMD:Gambia,#Dalasi
ILS:Gaza#Strip,#Israel#New#Shekel
GEL:Georgia,#Lari
DEM:Germany,#Deutsche#Mark#(obsolete)
EUR:Germany,#Euro
GHC:Ghana,#Cedi
GIP:Gibraltar,#Pound
XAU:Gold#Ounce
GBP:Great#Britain#(United#Kingdom),#Pound
EUR:Greece,#Euro
GRD:Greece,#Drachma#(obsolete)
DKK:Greenland,#Denmark#Krone
XCD:Grenada,#East#Caribbean#Dollar
EUR:Guadeloupe,#Euro
USD:Guam,#United#States#Dollar
GTQ:Guatemala,#Quetzal
GGP:Guernsey,#Pound
GNF:Guinea,#Franc
XOF:Guinea-Bissau,#CFA#Franc#BCEAO
GYD:Guyana,#Dollar
HTG:Haiti,#Gourde
EUR:Holland#(Netherlands),#Euro
NLG:Holland#(Netherlands),#Guilder#(obsolete)
EUR:Holy#See#(Vatican#City),#Euro
VAL:Holy#See#(Vatican#City),#Lira#(obsolete)
HNL:Honduras,#Lempira
HKD:Hong#Kong,#Dollar
HUF:Hungary,#Forint
ISK:Iceland,#Krona
INR:India,#Rupee
IDR:Indonesia,#Rupiah
XDR:International#Monetary#Fund#Special#Drawing#Right
IRR:Iran,#Rial
IQD:Iraq,#Dinar
EUR:Ireland,#Euro
IEP:Ireland,#Pound#(obsolete)
FKP:Islas#Malvinas#(Falkland#Islands),#Pound
IMP:Isle#of#Man,#Pound
ILS:Israel,#New#Shekel
EUR:Italy,#Euro
ITL:Italy,#Lira#(obsolete)
XOF:Ivory#Coast#(Côte#d'Ivoire),#CFA#Franc#BCEAO
JMD:Jamaica,#Dollar
JPY:Japan,#Yen
JEP:Jersey,#Pound
USD:Johnson,#United#States#Dollar
JOD:Jordan,#Dinar
EUR:Juan#de#Nova,#Euro
KZT:Kazakhstan,#Tenge
KES:Kenya,#Shilling
AUD:Kiribati,#Australia#Dollar
KWD:Kuwait,#Dinar
KGS:Kyrgyzstan,#Som
LAK:Laos,#Kip
LVL:Latvia,#Lat
LBP:Lebanon,#Pound
LSL:Lesotho,#Loti
LRD:Liberia,#Dollar
LYD:Libya,#Dinar
CHF:Liechtenstein,#Switzerland#Franc
LTL:Lithuania,#Litas
EUR:Luxembourg,#Euro
LUF:Luxembourg,#Franc#(obsolete)
MOP:Macau,#Pataca
MKD:Macedonia,#Denar
MGA:Madagascar,#Ariary
MGF:Madagascar,#Franc#(obsolete)
EUR:Madeira#Islands,#Euro
MWK:Malawi,#Kwacha
MYR:Malaysia,#Ringgit
MVR:Maldives,#Rufiyaa
XOF:Mali,#CFA#Franc#BCEAO
MTL:Malta,#Lira
FKP:Malvinas#(Falkland#Islands),#Pound
USD:Marshall#Islands,#United#States#Dollar
EUR:Martinique,#Euro
MRO:Mauritania,#Ouguiya
MUR:Mauritius,#Rupee
EUR:Mayotte,#Euro
MXN:Mexico,#Peso
USD:Micronesia,#United#States#Dollar
USD:Midway#Islands,#United#States#Dollar
MDL:Moldova,#Leu
EUR:Monaco,#Euro
MNT:Mongolia,#Tughrik
EUR:Montenegro,#Euro
XCD:Montserrat,#East#Caribbean#Dollar
MAD:Morocco,#Dirham
MZN:Mozambique,#Metical
MZM:Mozambique,#Metical#(being#phased#out)
MMK:Myanmar#(Burma),#Kyat
NAD:Namibia,#Dollar
AUD:Nauru,#Australia#Dollar
HTG:Navassa,#Haiti#Gourde
USD:Navassa,#United#States#Dollar
CNY:Nepal,#China#Yuan#Renminbi
NPR:Nepal,#Rupee
ANG:Netherlands#Antilles,#Guilder
EUR:Netherlands,#Euro
NLG:Netherlands,#Guilder#(obsolete)
XPF:New#Caledonia,#Comptoirs#Français#du#Pacifique#Franc
NZD:New#Zealand,#Dollar
NIO:Nicaragua,#Cordoba
XOF:Niger,#CFA#Franc#BCEAO
NGN:Nigeria,#Naira
NZD:Niue,#New#Zealand#Dollar
AUD:Norfolk#Island,#Australia#Dollar
KPW:North#Korea,#Won
USD:Northern#Mariana#Islands,#United#States#Dollar
NOK:Norway,#Krone
OMR:Oman,#Rial
PKR:Pakistan,#Rupee
USD:Palau,#United#States#Dollar
XPD:Palladium#Ounce
PAB:Panama,#Balboa
USD:Panama,#United#States#Dollar
PGK:Papua#New#Guinea,#Kina
CNY:Paracel#Islands,#China#Yuan#Renminbi
VND:Paracel#Islands,#Vietnam#Dong
PYG:Paraguay,#Guarani
PEN:Peru,#Nuevo#Sol
PHP:Philippines,#Peso
NZD:Pitcairn,#New#Zealand#Dollar
XPT:Platinum#Ounce
PLN:Poland,#Zloty
EUR:Portugal,#Euro
PTE:Portugal,#Escudo#(obsolete)
USD:Puerto#Rico,#United#States#Dollar
QAR:Qatar,#Riyal
EUR:Réunion,#Euro
RON:Romania,#New#Leu
ROL:Romania,#Leu#(being#phased#out)
RUB:Russia,#Ruble
RWF:Rwanda,#Franc
ANG:Saba,#Netherlands#Antilles#Guilder
SHP:Saint#Helena,#Pound
XCD:Saint#Kitts#and#Nevis,#East#Caribbean#Dollar
XCD:Saint#Lucia,#East#Caribbean#Dollar
EUR:Saint#Pierre#and#Miquelon,#Euro
XCD:Saint#Vincent#and#The#Grenadines,#East#Caribbean#Dollar
EUR:Saint-Martin,#Euro
WST:Samoa,#Tala
EUR:San#Marino,#Euro
STD:São#Tome#and#Principe,#Dobra
SAR:Saudi#Arabia,#Riyal
GBP:Scotland#(United#Kingdom),#Pound
SPL:Seborga,#Luigino
XOF:Senegal,#CFA#Franc#BCEAO
CSD:Serbia,#Dinar
SCR:Seychelles,#Rupee
SLL:Sierra#Leone,#Leone
XAG:Silver#Ounce
SGD:Singapore,#Dollar
ANG:Sint#Eustatius,#Netherlands#Antilles#Guilder
ANG:Sint#Maarten,#Netherlands#Antilles#Guilder
SKK:Slovakia,#Koruna
SIT:Slovenia,#Tolar
SBD:Solomon#Islands,#Dollar
SOS:Somalia,#Shilling
ZAR:South#Africa,#Rand
GBP:South#Georgia,#United#Kingdom#Pound
KRW:South#Korea,#Won
GBP:South#Sandwich#Islands,#United#Kingdom#Pound
EUR:Spain,#Euro
ESP:Spain,#Peseta#(obsolete)
LKR:Sri#Lanka,#Rupee
SDD:Sudan,#Dinar
SRD:Suriname,#Dollar
SRG:Suriname,#Guilder#(obsolete)
NOK:Svalbard#and#Jan#Mayen,#Norway#Krone
SZL:Swaziland,#Lilangeni
ZAR:Swaziland,#South#Africa#Rand
SEK:Sweden,#Krona
CHF:Switzerland,#Franc
SYP:Syria,#Pound
TWD:Taiwan,#New#Dollar
TJS:Tajikistan,#Somoni
RUB:Tajikistan,#Russia#Ruble
TZS:Tanzania,#Shilling
THB:Thailand,#Baht
XOF:Togo,#CFA#Franc#BCEAO
NZD:Tokelau,#New#Zealand#Dollar
TOP:Tonga,#Pa'anga
MDL:Transnistria,#Moldova#Leu
TTD:Trinidad#and#Tobago,#Dollar
TND:Tunisia,#Dinar
TRY:Turkey,#New#Lira
TRL:Turkey,#Lira#(obsolete)
TMM:Turkmenistan,#Manat
USD:Turks#and#Caicos#Islands,#United#States#Dollar
AUD:Tuvalu,#Australia#Dollar
TVD:Tuvalu,#Dollar
UGX:Uganda,#Shilling
UAH:Ukraine,#Hryvna
AED:United#Arab#Emirates,#Dirham
GBP:United#Kingdom,#Pound
USD:United#States,#Dollar
UYU:Uruguay,#Peso
UZS:Uzbekistan,#Som
VUV:Vanuatu,#Vatu
EUR:Vatican#City,#Euro
VAL:Vatican#City,#Lira#(obsolete)
VEB:Venezuela,#Bolivar
VND:Vietnam,#Dong)
USD:Virgin#Islands,#United#States#Dollar
USD:Wake#Island,#United#States#Dollar
XPF:Wallis#and#Futuna#Islands,#Comptoirs#Français#du#Pacifique#Franc
ILS:West#Bank,#Israel#New#Shekel
JOD:West#Bank,#Jordan#Dinar
MAD:Western#Sahara,#Morocco#Dirham
WST:Western#Samoa#(Samoa),#Tala
YER:Yemen,#Rial
ZMK:Zambia,#Kwacha
ZWN:Zimbabwe,#Dollar
}
	set xesmatch 0
	set xesearchstr [string tolower [string trim [join $country]]]
	if {($xesearchstr == "") || ($xesearchstr == "help")} {
		puthelp "PRIVMSG $nick :This is a plain-text search, enter any part of the country or currency name to search for."
		puthelp "PRIVMSG $nick :example: \002.xe search united\002 will return all countries with the word 'united' in them."
                return
        }
	if {[string length $xesearchstr] < 2} {
		puthelp "PRIVMSG $nick :Give me at least a 2-letter abbreviation, or more to search on :^)"
		return
	}
	regsub -all { } $xesearchstr {#} xesearchstr
	foreach xecountry_all $xecurlist {
		if {$xetype} {
			set xecs [string tolower $xecountry_all]
		} else {
			set xecs [string tolower [lindex [split $xecountry_all :] 0]]
		}
		if {[string first $xesearchstr $xecs] != -1} {
			if {$xesmatch == 0} {
				if {$xetype} {
					regsub -all {#} $xesearchstr { } xesearchstr
					puthelp "PRIVMSG $nick :Possible matches for \002$xesearchstr\002 are:"
				}
			}
			incr xesmatch
			regsub -all {#} $xecountry_all { } xecountry_all
			set curcode [lindex [split $xecountry_all :] 0]
			set curcname [lindex [split $xecountry_all :] 1]
			if {$xetype} {
				puthelp "PRIVMSG $nick :Currency Symbol: \002$curcode\002 Country: \002$curcname"
			}
		}
	}
	if {$xesmatch == 0} {
		if {$xetype} {
			puthelp "PRIVMSG $nick :Sorry, no matches for \002$xesearchstr\002"
			puthelp "PRIVMSG $nick :Try looking at http://www.xe.com/ucc/full.shtml for currently supported currencies."
		}
		return 0
	} else {
		if {$xetype} {
			puthelp "PRIVMSG $nick :\[end of XE.com matches for \002$xesearchstr\002 \]"
		} else {
			return $curcode
		}
	}
}
putlog "XE Universal Currency Convertor $xeuver by rosc loaded."
