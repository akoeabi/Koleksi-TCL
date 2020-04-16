#######################################################################
#######################################################################
#                       Worldtime by Murf                             #
#                            v1.0                                     #
#                                                                     #
#  Gets the time from around the world from www.worldtimeserver.com   #
#  Not much else to say, simple but handy.                            #
#######################################################################
#  Only tested on TCL v8.3 and Egg v1.62, although I kept the code    #
#  generic enough for TCL v8.0 and probably v1.3 of egg.              #
#######################################################################
#                                                                     #
#  Commands                                                           #
#                                                                     #
#          .tz <city|country>                                         #
#        or                                                           #
#          /msg kinks .tz <city|country>                              #
#                                                                     #
#        City and country list is somewhat limited to major cities    #
#        and countries.                                               #
#                                                                     #
#   Version                                                           #
#                                                                     #
#      v1.0 written in 2000 sometime                                  #
#         -- first version and been running forever without problems  #
#            or changes to the script.                                #
#                                                                     #
#               Contact murf@mindless.com with questions or comments  #
#######################################################################
#######################################################################

###Nothing to setup or configure#####

##########binds######################
bind pub - .tz pub_world_time
bind msg - .tz msg_world_time

##########Procs######################
proc pub_world_time {nick uhost handle chan location} {
  set loclist [get_tzloc $location $nick]
  if {$loclist == 0} {
     return
  }
  set url [lindex [split $loclist] 0]
  set temploc [lindex [split $loclist] 1]
  if {$temploc == "toilet"} {
     putserv "PRIVMSG $chan : If ya gotta crap goto the toilet. No one wants\
your stank around here!"
     return
  }
  if {$temploc == "kick"} {
     putkick $chan $nick "It's time to stop being so lame"
     return
  }
  set tztime [get_tztime $url]
  regsub -all {_} $temploc { } outloc
  putserv "PRIVMSG $chan : The time in $outloc is $tztime"
  
}

proc msg_world_time {nick uhost handle location} {
  set loclist [get_tzloc $location $nick]
  if {$loclist == 0} {
     return
  }
  set url [lindex [split $loclist] 0]
  set temploc [lindex [split $loclist] 1]
  if {$temploc == "toilet"} {
     putserv "NOTICE $nick : If ya gotta crap goto the toilet. No one wants\
your stank around here!"
     return
  }
  if {$temploc == "kick"} {
     putserv "NOTICE $nick : It's time to stop being so lame!"
     return
  }
  set tztime [get_tztime $url]
  regsub -all {_} $temploc { } outloc
  putserv "NOTICE $nick : The time in $outloc is $tztime"
  
}

proc get_tztime {url} {
  set tzsock [socket -async www.worldtimeserver.com 80]
  puts $tzsock "GET $url HTTP/1.1"
  puts $tzsock "Host: www.worldtimeserver.com"
  puts $tzsock "User-Agent: Mozilla/4.- (compatible; MSIE 5.0; Windows 98)"
  puts $tzsock ""
  flush $tzsock
  set i 0
  set tzout [gets $tzsock]
  while {[string first \"7\" $tzout] == -1} {
     set tzout [gets $tzsock]	
     incr i
     if {$i >= 150} {
        break
     } 
  }
  close $tzsock
  set sindx [expr {[string first \"> $tzout] + 2}]
  set eindx [expr {[string first <\/ $tzout] - 1}]
  set tztime [string trimleft [string range $tzout $sindx $eindx] 0]
  return $tztime
}

proc get_tzloc {location nick} {
set city_list {
UTC:UTC/GMT
CI&city=Abidjan:Abidjan,Cote_D'Ivoire
AE&city=Abu_Dhabi:Abu_Dhabi,United_Arab_Emirates
NG&city=Abuja:Abuja,Nigeria
GH&city=Accra:Accra,Ghana
ET&city=Addis_Ababa:Addis_Ababa,Ethiopia
AU-SA&city=Adelaide:Adelaide,Australia
US-NY&city=Albany:Albany,United_States
US-NM&city=Albuquerque:Albuquerque,United_States
DZ&city=Algiers:Algiers,Algeria
KZ&city=Almaty:Almaty,Kazakstan
JO&city=Amman:Amman,Jordan
NL&city=Amsterdam:Amsterdam,Netherlands
US-AK&city=Anchorage:Anchorage,United_States
AD&city=Andorra_La_Vella:Andorra_La_Vella,Andorra
TR&city=Ankara:Ankara,Turkey
US-MD&city=Annapolis:Annapolis,United_States
MG&city=Antananarivo:Antananarivo,Madagascar
WS&city=Apia:Apia,Samoa
TM&city=Ashgabat:Ashgabat,Turkmenistan
ER&city=Asmara:Asmara,Eritrea
RU&city=Astrakhan:Astrakhan,Russian_Federation
PY&city=Asuncion:Asuncion,Paraguay
GR&city=Athens:Athens,Greece
US-GA&city=Atlanta:Atlanta,United_States
NZ&city=Auckland:Auckland,New_Zealand
US-ME&city=Augusta:Augusta,United_States
US-TX&city=Austin:Austin,United_States
IQ&city=Baghdad:Baghdad,Iraq
AZ&city=Baku:Baku,Azerbaijan
US-MD&city=Baltimore:Baltimore,United_States
ML&city=Bamako:Bamako,Mali
BN&city=Bandar_Seri_Begawan:Bandar_Seri_Begawan,Brunei_Daru_salam
TH&city=Bangkok:Bangkok,Thailand
CF&city=Bangui:Bangui,Central_African_Republic
GM&city=Banjul:Banjul,Gambia
ES&city=Barcelona:Barcelona,Spain
KN&city=Basseterre:Basseterre,Saint_Kitts_and_Nevis
CN&city=Beijing:Beijing,China
LB&city=Beirut:Beirut,Lebanon
YU&city=Belgrade:Belgrade,Yugoslavia
BZ&city=Belize_City:Belize_City,Belize
DE&city=Berlin:Berlin,Germany
CH&city=Bern:Bern,Switzerland
US-MT&city=Billings:Billings,United_States
US-AL&city=Birmingham:Birmingham,United_States
KG&city=Bishkek:Bishkek,Kyrgyzstan
US-ND&city=Bismarck:Bismarck,United_States
GW&city=Bissau:Bissau,Guinea-Bissau
CO&city=Bogota:Bogota,Colombia
US-ID&city=Boise:Boise,United_States
DE&city=Bonn:Bonn,Germany
US-MA&city=Boston:Boston,United_States
BR-DF&city=Brasilia:Brasilia,Brazil
SK&city=Bratislava:Bratislava,Slovakia
RU7&city=Bratsk:Bratsk,Russian_Federation
CG&city=Brazzaville:Brazzaville,Congo
US-CT&city=Bridgeport:Bridgeport,United_States
BB&city=Bridgetown:Bridgetown,Barbados
AU-QLD&city=Brisbane:Brisbane,Australia
BE&city=Brussels:Brussels,Belgium
RO&city=Bucharest:Bucharest,Romania
HU&city=Budapest:Budapest,Hungary
AR&city=Buenos_Aires:Buenos_Aires,Argentina
US-NY&city=Buffalo:Buffalo,United_States
BI&city=Bujumbura:Bujumbura,Burundi
EG&city=Cairo:Cairo,Egypt
IN&city=Calcutta:Calcutta,India
CA-AB&city=Calgary:Calgary,Canada
AU-ACT&city=Canberra:Canberra,Australia
ZA&city=Cape_Town:Cape_Town,South_Africa
VE&city=Caracas:Caracas,Venezuela
LC&city=Castries:Castries,Saint_Lucia
US-WV&city=Charleston:Charleston,United_States
US-NC&city=Charlotte:Charlotte,United_States
US-WY&city=Cheyenne:Cheyenne,United_States
US-IL&city=Chicago:Chicago,United_States
MD&city=Chisinau:Chisinau,Moldova,Republic_of
RU8&city=Chita:Chita,Russian_Federation
US-OH&city=Cincinnati:Cincinnati,United_States
US-OH&city=Cleveland:Cleveland,United_States
LK&city=Colombo:Colombo,Sri_Lanka
US-SC&city=Columbia:Columbia,United_States
US-OH&city=Columbus:Columbus,United_States
GN&city=Conakry:Conakry,Guinea
DK&city=Copenhagen:Copenhagen,Denmark
BJ&city=Cotonou:Cotonou,Benin
SN&city=Dakar:Dakar,Senegal
US-TX&city=Dallas:Dallas,United_States
SY&city=Damascus:Damascus,Syrian_Arab_Republic
TZ&city=Dar_es_Salaam:Dar_es_Salaam,Tanzania,United_Republic_of
AU-NT&city=Darwin:Darwin,Australia
CA-YT&city=Dawson:Dawson,Canada
US-CO&city=Denver:Denver,United_States
US-IA&city=Des_Moines:Des_Moines,United_States
US-MI&city=Detroit:Detroit,United_States
BD&city=Dhaka:Dhaka,Bangladesh
DJ&city=Djibouti:Djibouti,Djibouti
QA&city=Doha:Doha,Qatar
US-DE&city=Dover:Dover,United_States
AE&city=Dubai:Dubai,United_Arab_Emirates
IE&city=Dublin:Dublin,Ireland
TJ&city=Dushanbe:Dushanbe,Tajikistan
GB&city=Edinburgh:Edinburgh,United_Kingdom
CA-AB&city=Edmonton:Edmonton,Canada
RU4&city=Ekaterinburg:Ekaterinburg,Russian_Federation
US-TX1&city=El_Paso:El_Paso,United_States
US-IN1&city=Evansville:Evansville,United_States
US-ND&city=Fargo:Fargo,United_States
US-IN&city=Fort_Wayne:Fort_Wayne,United_States
SL&city=Freetown:Freetown,Sierra_Leone
TV&city=Funafuti:Funafuti,Tuvalu
BW&city=Gaborone:Gaborone,Botswana
US-IN1&city=Gary:Gary,United_States
CH&city=Geneva:Geneva,Switzerland
GY&city=Georgetown:Georgetown,Guyana
RU&city=Groznyy:Groznyy,Russian_Federation
GT&city=Guatemala_City:Guatemala_City,Guatemala
NL&city=Hague:Hague,The,Netherlands
CA-NS&city=Halifax:Halifax,Canada
BM&city=Hamilton:Hamilton,Bermuda
VN&city=Hanoi:Hanoi,Viet_Nam
ZW&city=Harare:Harare,Zimbabwe
US-CT&city=Hartford:Hartford,United_States
CU&city=Havana:Havana,Cuba
FI&city=Helsinki:Helsinki,Finland
VN&city=Ho_Chi_Minh_City:Ho_Chi_Minh_City,Viet_Nam
AU-TAS&city=Hobart:Hobart,Australia
HK&city=Hong_Kong:Hong_Kong,Hong_Kong
SB&city=Honiara:Honiara,Solomon_Islands
US-HI&city=Honolulu:Honolulu,United_States
US-TX&city=Houston:Houston,United_States
US-IN&city=Indianapolis:Indianapolis,United_States
PK&city=Islamabad:Islamabad,Pakistan
TR&city=Istanbul:Istanbul,Turkey
RU3&city=Izhevsk:Izhevsk,Russian_Federation
US-MS&city=Jackson:Jackson,United_States
US-FL&city=Jacksonville:Jacksonville,United_States
ID&city=Jakarta:Jakarta,Indonesia
IL&city=Jerusalem:Jerusalem,Israel
ZA&city=Johannesburg:Johannesburg,South_Africa
US-AK&city=Juneau:Juneau,United_States
AF&city=Kabul:Kabul,Afghanistan
RU1&city=Kaliningrad:Kaliningrad,Russian_Federation
UG&city=Kampala:Kampala,Uganda
US-MO&city=Kansas_City:Kansas_City,United_States
RU9&city=Khabarovsk:Khabarovsk,Russian_Federation
SD&city=Khartoum:Khartoum,Sudan
UA&city=Kiev:Kiev,Ukraine
RW&city=Kigali:Kigali,Rwanda
JM&city=Kingston:Kingston,Jamaica
VC&city=Kingstown:Kingstown,Saint_Vincent_and_The_Grenadines
CD&city=Kinshasa:Kinshasa,Congo,Democratic_Republic_of
US-TN1&city=Knoxville:Knoxville,United_States
FM&city=Kolonia:Kolonia,Micronesia,Federated_States_Of
PW&city=Koror:Koror,Palau
PL&city=Krakow:Krakow,Poland
MY&city=Kuala_Lumpur:Kuala_Lumpur,Malaysia
KW&city=Kuwait_City:Kuwait_City,Kuwait
RU6&city=Kyzyl:Kyzyl,Russian_Federation
BO&city=La_Paz:La_Paz,Bolivia
US-MI&city=Lansing:Lansing,United_States
US-NV&city=Las_Vegas:Las_Vegas,United_States
US-KY&city=Lexington:Lexington,United_States
GA&city=Libreville:Libreville,Gabon
MW&city=Lilongwe:Lilongwe,Malawi
PE&city=Lima:Lima,Peru
US-NE&city=Lincoln:Lincoln,United_States
PT&city=Lisbon:Lisbon,Portugal
US-AR&city=Little_Rock:Little_Rock,United_States
SI&city=Ljubljana:Ljubljana,Slovenia
TG&city=Lome:Lome,Togo
GB&city=London:London,United_Kingdom
US-CA&city=Los_Angeles:Los_Angeles,United_States
US-KY&city=Louisville:Louisville,United_States
AO&city=Luanda:Luanda,Angola
ZM&city=Lusaka:Lusaka,Zambia
LU&city=Luxembourg:Luxembourg,Luxembourg
US-WI&city=Madison:Madison,United_States
ES&city=Madrid:Madrid,Spain
RU10&city=Magadan:Magadan,Russian_Federation
MH&city=Majuro:Majuro,Marshall_Islands
GQ&city=Malabo:Malabo,Equatorial_Guinea
MV&city=Male:Male,Maldives
NI&city=Managua:Managua,Nicaragua
BH&city=Manama:Manama,Bahrain
PH&city=Manila:Manila,Philippines
MZ&city=Maputo:Maputo,Mozambique
LS&city=Maseru:Maseru,Lesotho
SZ&city=Mbabane:Mbabane,Swaziland
SA&city=Mecca:Mecca,Saudi_Arabia
AU-VIC&city=Melbourne:Melbourne,Australia
US-TN&city=Memphis:Memphis,United_States
MX&city=Mexico_City:Mexico_City,Mexico
US-FL&city=Miami:Miami,United_States
US-WI&city=Milwaukee:Milwaukee,United_States
US-MN&city=Minneapolis:Minneapolis,United_States
BY&city=Minsk:Minsk,Belarus
SO&city=Mogadishu:Mogadishu,Somalia
LR&city=Monrovia:Monrovia,Liberia
MX&city=Monterrey:Monterrey,Mexico
UY&city=Montevideo:Montevideo,Uruguay
US-AL&city=Montgomery:Montgomery,United_States
CA-QC&city=Montreal:Montreal,Canada
KM&city=Moroni:Moroni,Comoros
RU&city=Moscow:Moscow,Russian_Federation
OM&city=Muscat:Muscat,Oman
KE&city=Nairobi:Nairobi,Kenya
RU&city=Naryan_Mar:Naryan_Mar,Russian_Federation
US-TN&city=Nashville:Nashville,United_States
BS&city=Nassau:Nassau,Bahamas
TD&city=N'Djamena:N'Djamena,Chad
IN&city=New_Delhi:New_Delhi,India
US-LA&city=New_Orleans:New_Orleans,United_States
US-NY&city=New_York:New_York,United_States
US-NJ&city=Newark:Newark,United_States
NE&city=Niamey:Niamey,Niger
CY&city=Nicosia:Nicosia,Cyprus
RU4&city=Nizhnevartovsk:Nizhnevartovsk,Russian_Federation
RU6&city=Norilsk:Norilsk,Russian_Federation
MR&city=Nouakchott:Nouakchott,Mauritania
RU5&city=Novosibirsk:Novosibirsk,Russian_Federation
US-OK&city=Oklahoma_City:Oklahoma_City,United_States
US-NE&city=Omaha:Omaha,United_States
RU5&city=Omsk:Omsk,Russian_Federation
US-FL&city=Orlando:Orlando,United_States
NO&city=Oslo:Oslo,Norway
CA-ON&city=Ottawa:Ottawa,Canada
BF&city=Ouagadougou:Ouagadougou,Burkina_Faso
PA&city=Panama_City:Panama_City,Panama
SR&city=Paramaribo:Paramaribo,Suriname
FR&city=Paris:Paris,France
US-FL1&city=Pensacola:Pensacola,United_States
RU4&city=Perm:Perm,Russian_Federation
AU-WA&city=Perth:Perth,Australia
RU11&city=Petropavlovsk-Kamchatsky:Petropavlovsk-Kamchatsky,Russian_Federation
US-PA&city=Philadelphia:Philadelphia,United_States
KH&city=Phnom_Penh:Phnom_Penh,Cambodia
US-AZ&city=Phoenix:Phoenix,United_States
US-SD&city=Pierre:Pierre,United_States
US-PA&city=Pittsburgh:Pittsburgh,United_States
MU&city=Port_Louis:Port_Louis,Mauritius
PG&city=Port_Moresby:Port_Moresby,Papua_New_Guinea
HT&city=Port-au-Prince:Port-au-Prince,Haiti
US-OR&city=Portland:Portland,United_States
US-ME&city=Portland:Portland,United_States
TT&city=Port-of-Spain:Port-of-Spain,Trinidad_and_Tobago
VU&city=Port-Vila:Port-Vila,Vanuatu
CZ&city=Prague:Prague,Czech_Republic
CV&city=Praia:Praia,Cape_Verde
ZA&city=Pretoria:Pretoria,South_Africa
US-RI&city=Providence:Providence,United_States
KP&city=Pyongyang:Pyongyang,Korea,Democratic_People's_Republic_of
EC&city=Quito:Quito,Ecuador
MA&city=Rabat:Rabat,Morocco
US-NC&city=Raleigh:Raleigh,United_States
MM&city=Rangoon:Rangoon,Myanmar
US-SD1&city=Rapid_City:Rapid_City,United_States
CA-SK&city=Regina:Regina,Canada
US-NV&city=Reno:Reno,United_States
IS&city=Reykjavik:Reykjavik,Iceland
US-VA&city=Richmond:Richmond,United_States
LV&city=Riga:Riga,Latvia
BR-RJ&city=Rio_de_Janeiro:Rio_de_Janeiro,Brazil
SA&city=Riyadh:Riyadh,Saudi_Arabia
IT&city=Rome:Rome,Italy
DM&city=Roseau:Roseau,Dominica
US-CA&city=Sacramento:Sacramento,United_States
GD&city=Saint_George's:Saint_George's,Grenada
US-OR&city=Salem:Salem,United_States
US-UT&city=Salt_Lake_City:Salt_Lake_City,United_States
AT&city=Salzburg:Salzburg,Austria
RU3&city=Samara:Samara,Russian_Federation
US-TX&city=San_Antonio:San_Antonio,United_States
US-CA&city=San_Diego:San_Diego,United_States
US-CA&city=San_Francisco:San_Francisco,United_States
CR&city=San_Jose:San_Jose,Costa_Rica
PR&city=San_Juan:San_Juan,Puerto_Rico
SV&city=San_Salvador:San_Salvador,El_Salvador
YE&city=Sanaa:Sanaa,Yemen
CL&city=Santiago:Santiago,Chile
DO&city=Santo_Domingo:Santo_Domingo,Dominican_Republic
BR-SP&city=Sao_Paulo:Sao_Paulo,Brazil
BA&city=Sarajevo:Sarajevo,Bosnia_and_Herzegovina
CA-SK&city=Saskatoon:Saskatoon,Canada
US-WA&city=Seattle:Seattle,United_States
KR&city=Seoul:Seoul,Korea,Republic_of
SG&city=Singapore_City:Singapore_City,Singapore
US-SD&city=Sioux_Falls:Sioux_Falls,United_States
MK&city=Skopje:Skopje,Macedonia,The_Former_Yugoslav_Republic_Of
BG&city=Sofia:Sofia,Bulgaria
US-IL&city=Springfield:Springfield,United_States
AG&city=St._John's:St._John's,Antigua_and_Barbuda
US-MO&city=St._Louis:St._Louis,United_States
US-MN&city=St._Paul:St._Paul,United_States
RU&city=St._Petersburg:St._Petersburg,Russian_Federation
SE&city=Stockholm:Stockholm,Sweden
FJ&city=Suva:Suva,Fiji
AU-NSW&city=Sydney:Sydney,Australia
TW&city=Taipei:Taipei,Taiwan
US-FL&city=Tallahassee:Tallahassee,United_States
EE&city=Tallinn:Tallinn,Estonia
UZ&city=Tashkent:Tashkent,Uzbekistan
GE&city=Tbilisi:Tbilisi,Georgia
HN&city=Tegucigalpa:Tegucigalpa,Honduras
IR&city=Tehran:Tehran,Iran,Islamic_Republic_of
IL&city=Tel_Aviv:Tel_Aviv,Israel
US-IN&city=Terre_Haute:Terre_Haute,United_States
BT&city=Thimphu:Thimphu,Bhutan
AL&city=Tirane:Tirane,Albania
JP&city=Tokyo:Tokyo,Japan
US-KS&city=Topeka:Topeka,United_States
CA-ON&city=Toronto:Toronto,Canada
US-NJ&city=Trenton:Trenton,United_States
LY&city=Tripoli:Tripoli,Libyan_Arab_Jamahiriya
TN&city=Tunis:Tunis,Tunisia
MN&city=Ulan_Bator:Ulan_Bator,Mongolia
RU7&city=Ulan-Ude:Ulan-Ude,Russian_Federation
LI&city=Vaduz:Vaduz,Liechtenstein
MT&city=Valletta:Valletta,Malta
CA-BC&city=Vancouver:Vancouver,Canada
CA-BC&city=Victoria:Victoria,Canada
SC&city=Victoria:Victoria,Seychelles
AT&city=Vienna:Vienna,Austria
LA&city=Vientiane:Vientiane,Lao_People's_Democratic_Republic
LT&city=Vilnius:Vilnius,Lithuania
US-VA&city=Virginia_Beach:Virginia_Beach,United_States
RU9&city=Vladivostok:Vladivostok,Russian_Federation
PL&city=Warsaw:Warsaw,Poland
US-DC&city=Washington:Washington,United_States
NZ&city=Wellington:Wellington,New_Zealand
US-KS&city=Wichita:Wichita,United_States
US-DE&city=Wilmington:Wilmington,United_States
NA&city=Windhoek:Windhoek,Namibia
CA-MB&city=Winnipeg:Winnipeg,Canada
RU8&city=Yakutsk:Yakutsk,Russian_Federation
CM&city=Yaounde:Yaounde,Cameroon
AM&city=Yerevan:Yerevan,Armenia
RU9&city=Yuzhno-Sakhalinsk:Yuzhno-Sakhalinsk,Russian_Federation
HR&city=Zagreb:Zagreb,Croatia
CH&city=Zurich:Zurich,Switzerland
}
  set itmatched 0

  if {$location == ""} {
     putserv "NOTICE $nick : USAGE: .tz <city|country|city,country>"
     putserv "NOTICE $nick : Cities are listed alphabetically, so if you enter\
a country, you will get the first city in the list for that country"
     return 0
  }
  set inloc [string trim [string tolower $location]]
  regsub  -all { } $inloc {_} tloc
  foreach i $city_list {
     set tempurl [lindex [split $i :] 0]
     set temploc [lindex [split $i :] 1]
     if {[string first $tloc [string tolower $temploc]] != -1} {
        set itmatched 1
        break
     }
  }
  if {[string first mcmurdo $tloc] !=-1} {
     set tempurl NZ&city=Wellington
     set temploc Mcmurdo_Station,Antarctica
     set itmatched 1
  } 
  if {[string first south_pole $tloc] !=-1} {
     set tempurl NZ&city=Wellington
     set temploc South_Pole,Antarctica
     set itmatched 1
  } 
  if {[lsearch -exact {shit poo crap} $tloc] != -1} {
     set tempurl UTC
     set temploc toilet
     set itmatched 1
  }
  if {[lsearch -exact {fuck nigger cunt} $tloc] != -1} {
     set tempurl UTC
     set temploc kick
     set itmatched 1
  }
  if {$itmatched == 0} {
     putserv "NOTICE $nick :Sorry no match on $inloc, try a different city"
     return 0
  }
  if {[string equal [lindex [split $temploc ,] 1] United_States] == 1} {
     set temploc [lindex [split $temploc ,] 0]
  }
  set url "http:\/\/www.worldtimeserver.com\/time.asp?locationid=$tempurl"
  return "$url $temploc"
}

putlog "WorldTime by Murf loaded"
