putlog "## ..:: Initializing carding Addon TCL ::... ##"
# Set Channel
set carding_chan "*"
set master 1
# Set respon, baris pertama direspon oleh baris selanjutnya
set carding {
{
"!command" {
  "0,1$nick 4:11Invalid Command, use 4!15Commands " 
}
}
 {
  "!commands*" {
"0,1$nick 4:11Commands is » 0,14!15Country 4!15State 4!15Proxy 4!15ip 4!15zodiak 4!15jodoh 4!15dwhois 4!15nmap "
   }
 }
 
{
  "!country" {
    "0,1$nick 4:11Using 4!Country US 11or u want "      }
 }
{
  "!country US*" {
   "4$nick, 7(6US7) 15is United States"
      }
 }
  {
   "!country AE*" {
   "4$nick, 7(6AE7) 15is United Arab Emirates" 
   }
 }

{ 
"!country AF*" { 
"4$nick, 7(6AF7) 15is Afghanistan"  
}
 }  
{
 "!country AG*" { 
"4$nick, 7(6AG7) 15is Antigua and Barbuda"  
}
 }
{
 "!country AI*" { 
"4$nick, 7(6AI7) 15is Anguilla"  
}
 }
{
 "!country AL*" { 
"4$nick, 7(6AL7) 15is Albania"  
}
 }
{
 "!country AS*" { 
"4$nick, 7(6AS7) 15is American Samoa"  
}
 }
{
 "!country AN*" { 
"4$nick, 7(6AN7) 15is Netherlands Antilles" 
 }
 }
{
 "!country AO*" { 
"4$nick, 7(6AO7) 15is Angola" 
 }
 }
{
 "!country AA*" { 
"4$nick, 7(6AA7) 15is Anguilla" 
 }
 }
{
 "!country AC*" { 
"4$nick, 7(6AC7) 15is Antarctica" 
 }
 }
{
 "!country AB*" { 
"4$nick, 7(6AB7) 15is Antigua and Barbuda"  
} 
}
{
 "!country AR*" { 
"4$nick, 7(6AR7) 15is Argentina" 
 } 
}
{
 "!country AM*" { 
"4$nick, 7(6AM7) 15is Armenia" 
 }
 }
{
 "!country AW*" { 
"4$nick, 7(6AW7) 15is Aruba" 
 }
 }
{
 "!country AU*" { 
"4$nick, 7(6AU7) 15is Australia"  
} 
}
{
 "!country AT*" { 
"4$nick, 7(6AT7) 15is Austria" 
 } 
}
{
 "!country AZ*" { 
"4$nick, 7(6AZ7) 15is Azerbaijan"  
}
 }
{
 "!country AQ*" { 
"4$nick, 7(6AQ7) 15is Antarctica" 
 } 
}
{
 "!country BS*" { 
"4$nick, 7(6BS7) 15is Bahamas" 
 }
 }
{
 "!country BH*" { 
"4$nick, 7(6BH7) 15is Bahrain" 
 } 
}
{
 "!country BD*" { 
"4$nick, 7(6BD7) 15is Bangladesh" 
 } 
}
{
 "!country BB*" {
"4$nick, 7(6BB7) 15is Barbados" 
 }
 }
{
 "!country BY*" { 
"4$nick, 7(6BY7) 15is Belarus" 
 }
 }
{
 "!country BE*" { 
"4$nick, 7(6BE7) 15is Belgium" 
 }
 }
{
 "!country BZ*" { 
"4$nick, 7(6BZ7) 15is Belize" 
 } 
}
{
 "!country BJ*" { 
"4$nick, 7(6BJ7) 15is Benin" 
 } 
}
{
 "!country BM*" { 
"4$nick, 7(6BM7) 15is Bermuda" 
 }
 }
{
 "!country BN*" { 
"4$nick, 7(6BN7) 15is Brunei Darussalam"
  }
 }
{
 "!country BT*" { 
"4$nick, 7(6BT7) 15is Bhutan" 
 }
 }
{
 "!country BO*" { 
"4$nick, 7(6BO7) 15is Bolivia" 
 } 
}
{
 "!country BA*" { 
"4$nick, 7(6BA7) 15is Bosnia and Herzegovina" 
 }
 }
{
 "!country BW*" { 
"4$nick, 7(6BW7) 15is Botswana" 
 } 
}
{
 "!country BV*" { 
"4$nick, 7(6BV7) 15is Bouvet Island" 
 }
 }
{
 "!country BR*" { 
"4$nick, 7(6BR7) 15is Brazil" 
 }
 }
{
 "!country VI*" { 
"4$nick, 7(6VI7) 15is Virgin Islands" 
 }
 }
{
 "!country BU*" { 
"4$nick, 7(6BU7) 15is Brunei" 
 }
 }
{
 "!country BG*" { 
"4$nick, 7(6BG7) 15is Bulgaria" 
 }
 }
{
 "!country BF*" { 
"4$nick, 7(6BF7) 15is Burkina Faso" 
 }
 }
{
 "!country BI*" { 
"4$nick, 7(6BI7) 15is Burundi" 
 }
 }
{
 "!country KH*" { 
"4$nick, 7(6KH7) 15is Cambodia" 
 } 
}
{
 "!country CM*" { 
"4$nick, 7(6CM7) 15is Cameroon" 
 } 
}
{
 "!country CA*" { 
"4$nick, 7(6CA7) 15is Canada" 
 } 
}
{
 "!country CV*" { 
"4$nick, 7(6CV7) 15is Cape Verde" 
 }
 }
{
 "!country CI*" { 
4$nick, 7(6CI7) 15is Cote D'Ivoire (Ivory Coast)" 
 }
 }
{
 "!country CF*" { 
"4$nick, 7(6CF7) 15is Central African Republic" 
 } 
}
{
 "!country TD*" { 
"4$nick, 7(6TD7) 15is Chad" 
 }
 }
{
 "!country CL*" { 
"4$nick, 7(6CL7) 15is Chile" 
 } 
}
{
 "!country CN*" { 
"4$nick, 7(6CN7) 15is China" 
 }
 }
{
 "!country CS*" { 
"4$nick, 7(6CS7) 15is Czechoslovakia" 
 }
 }
{
 "!country CX*" { 
"4$nick, 7(6CX7) 15is Christmas Island" 
 }
 }
{
 "!country CC*" { 
"4$nick, 7(6CC7) 15is Cocos Islands"
  }
 }
{
 "!country CO*" { 
"4$nick, 7(6CO7) 15is Colombia" 
 } 
}
{
 "!country KM*" { 
"4$nick, 7(6KM7) 15is Comoros" 
 } 
}
{
 "!country CG*" { 
"4$nick, 7(6CG7) 15is Congo" 
 } 
}
{
 "!country CK*" { 
"4$nick, 7(6CK7) 15is Cook Islands"
  } 
}
{
 "!country CR*" { 
"4$nick, 7(6CR7) 15is Costa Rica"
  }
 }
{
 "!country CQ*" { 
"4$nick, 7(6CQ7) 15is Croatia"
  }
 }
{
 "!country CU*" { 
"4$nick, 7(6CU7) 15is Cuba" 
 } 
}
{
 "!country CY*" { 
"4$nick, 7(6CY7) 15is Cyprus" 
 }
 }
{
 "!country CZ*" { 
"4$nick, 7(6CZ7) 15is Czech Republic" 
 }
 }
{
 "!country DK*" { 
"4$nick, 7(6DK7) 15is Denmark" 
 }
 }
{
 "!country DJ*" { 
"4$nick, 7(6DJ7) 15is Djibouti"
  } 
}
{
 "!country DM*" { 
"4$nick, 7(6DM7) 15is Dominica" 
 }
 }
{
 "!country DO*" { 
"4$nick, 7(6DO7) 15is Dominican Republic"
  } 
}
{
 "!country DZ*" { 
"4$nick, 7(6DZ7) 15is Algeria" 
 }
 }
{
 "!country TP*" { 
"4$nick, 7(6TP7) 15is East Timor" 
 } 
}
{
 "!country EC*" { 
"4$nick, 7(6EC7) 15is Ecuador" 
 }
 }
{
 "!country EG*" { 
"4$nick, 7(6EG7) 15is Egypt"
  }
 }
{
 "!country SV*" { 
"4$nick, 7(6SV7) 15is El Salvador" 
 }
 }
{
 "!country GQ*" { 
"4$nick, 7(6GQ7) 15is Equatorial Guinea" 
 } 
}
{
 "!country ER*" { 
"4$nick, 7(6ER7) 15is Eritrea"
  }
 }
{
 "!country EE*" { 
"4$nick, 7(6EE7) 15is Estonia" 
 } 
}
{
 "!country ET*" { 
"4$nick, 7(6ET7) 15is Ethiopia"  
}
 }
{
 "!country FA*" { 
"4$nick, 7(6FA7) 15is Falkland Islands"
  }
 }
{
 "!country FO*" { 
"4$nick, 7(6FO7) 15is Faroe Islands" 
 } 
}
{
 "!country FJ*" { 
"4$nick, 7(6FJ7) 15is Fiji" 
 }
 }
{
 "!country FK*" { 
"4$nick, 7(6FK7) 15is Falkland Islands (Malvinas)" 
 }
 }
{
 "!country FI*" { 
"4$nick, 7(6FI7) 15is Finland" 
 }
 }
{
 "!country FR*" { 
"4$nick, 7(6FR7) 15is France"
  }
 }
{
 "!country GF*" { 
"4$nick, 7(6GF7) 15is French Guiana" 
 } 
}
{
 "!country PF*" { 
"4$nick, 7(6PF7) 15is French Polynesia" 
 } 
}
{
 "!country TF*" { 
"4$nick, 7(6TF7) 15is French Southern Territories"
  } 
}
{
 "!country FX*" { 
"4$nick, 7(6FX7) 15is France, Metropolitan" 
 }
 }
{
 "!country GA*" { 
"4$nick, 7(6GA7) 15is Gabon"
  } 
}
{
 "!country GM*" { 
"4$nick, 7(6GM7) 15is Gambia" 
 }
 }
{
 "!country GE*" { 
"4$nick, 7(6GE7) 15is Georgia" 
 }
 }
{
 "!country DE*" { 
"4$nick, 7(6DE7) 15is Germany" 
 }
 }
{
 "!country GH*" { 
"4$nick, 7(6GH7) 15is Ghana" 
 } 
}
{
 "!country GI*" { 
"4$nick, 7(6GI7) 15is Gibraltar" 
 }
 }
{
 "!country GR*" { 
"4$nick, 7(6GR7) 15is Greece" 
 }
 }
{
 "!country GL*" { 
"4$nick, 7(6GL7) 15is Greenland" 
 }
 }
{
 "!country GD*" { 
"4$nick, 7(6GD7) 15is Grenada" 
 } 
}
{
 "!country GW*" { 
"4$nick, 7(6GW7) 15is Guinea-Bissau" 
 } 
}
{
 "!country GP*" { 
"4$nick, 7(6GP7) 15is Guadeloupe" 
 } 
}
{
 "!country GU*" { 
"4$nick, 7(6GU7) 15is Guam" 
 } 
}
{
 "!country GT*" { 
"4$nick, 7(6GT7) 15is Guatemala" 
 } 
}
{
 "!country GN*" { 
"4$nick, 7(6GN7) 15is Guinea" 
 } 
}
{
 "!country GS*" { 
"4$nick, 7(6GS7) 15is South Georgia and South Sandwich Islands"
  } 
}
{
 "!country GY*" { 
"4$nick, 7(6GY7) 15is Guyana"
  }
 }
{
 "!country HT*" { 
"4$nick, 7(6HT7) 15is Haiti" 
 } 
}
{
 "!country HM*" { 
"4$nick, 7(6HM7) 15is Heard and McDonald Islands" 
 }
 }
{
 "!country HN*" { 
"4$nick, 7(6HN7) 15is Honduras"
  }
 }
{
 "!country HK*" { 
"4$nick, 7(6HK7) 15is Hong Kong" 
 }
 }
{
 "!country HU*" { 
"4$nick, 7(6HU7) 15is Hungary" 
 }
 }
{
 "!country HR*" { 
"4 $nick, 7(6HR7) 15is Croatia (Hrvatska)"
  }
 }
{
 "!country IN*" { 
"4$nick, 7(6IN7) 15is India" 
 } 
}
{
 "!country ID*" { 
"4$nick, 7(6ID7) 15is Indonesia" 
 } 
}
{
 "!country IO*" { 
"4$nick, 7(6IO7) 15is British Indian Ocean Territory"
  } 
}
{
 "!country IR*" { 
"4$nick, 7(6IR7) 15is Iran"
  }
 }
{
 "!country IQ*" { 
"4$nick, 7(6IQ7) 15is Iraq" 
 }
 }
{
 "!country IE*" { 
"4$nick, 7(6IE7) 15is Ireland" 
 } 
}
{
 "!country IS*" { 
"4$nick, 7(6IS7) 15is Iceland" 
 }
 }
{
 "!country IL*" { 
"4$nick, 7(6IL7) 15is Israel" 
 } 
}
{
 "!country IT*" { 
"4$nick, 7(6IT7) 15is Italy" 
 }
 }
{
 "!country IV*" { 
"4$nick, 7(6IV7) 15is Ivory Coast" 
 } 
}
{
 "!country JM*" { 
"4$nick, 7(6JM7) 15is Jamaica" 
 } 
}
{
 "!country JP*" { 
"4$nick, 7(6JP7) 15is Japan"
  }
 }
{
 "!country JO*" { 
"4$nick, 7(6JO7) 15is Jordan" 
 } 
}
{
 "!country KZ*" { 
"4$nick, 7(6KZ7) 15is Kazakhstan" 
 } 
}
{
 "!country KE*" { 
"4$nick, 7(6KE7) 15is Kenya" 
 } 
}
{
 "!country KI*" { 
"4$nick, 7(6KI7) 15is Kiribati" 
 } 
}
{
 "!country KN*" { 
"4$nick, 7(6KN7) 15is Saint Kitts and Nevis"
  }
 }
{
 "!country KP*" { 
"4$nick, 7(6KP7) 15is Korea (North)" 
 }
 }
{
 "!country KR*" { 
"4$nick, 7(6KR7) 15is Korea (South)" 
 } 
}
{
 "!country KY*" { 
"4$nick, 7(6KY7) 15is Cayman Islands" 
 } 
}
{
 "!country KW*" { 
"4$nick, 7(6KW7) 15is Kuwait" 
 }
 }
{
 "!country KG*" { 
"4$nick, 7(6KG7) 15is Kyrgyzstan" 
 } 
}
{
 "!country LA*" { 
"4$nick, 7(6LA7) 15is Laos" 
 } 
}
{
 "!country LV*" { 
"4$nick, 7(6LV7) 15is Latvia" 
 }
 }
{
 "!country LB*" { 
"4$nick, 7(6LB7) 15is Lebanon" 
 }
 }
{
 "!country LS*" { 
"4$nick, 7(6LS7) 15is Lesotho" 
 } 
}
{
 "!country LR*" { 
"4$nick, 7(6LR7) 15is Liberia" 
 } 
}
{
 "!country LY*" { 
"4$nick, 7(6LY7) 15is Libya" 
 } }
{
 "!country LI*" { 
"4$nick, 7(6LI7) 15is Liechtenstein"  
}
 }
{
 "!country LT*" { 
"4$nick, 7(6LT7) 15is Lithuania" 
 }
 }
{
 "!country LU*" { 
"4$nick, 7(6LU7) 15is Luxembourg" 
 }
 }
{
 "!country MO*" { 
"4$nick, 7(6MO7) 15is Macau"
  }
 }
{
 "!country MK*" { 
"4$nick, 7(6MK7) 15is Macedonia" 
 }
 }
{
 "!country MG*" { 
"4$nick, 7(6MG7) 15is Madagascar" 
 } 
}
{
 "!country MW*" { 
"4$nick, 7(6MW7) 15is Malawi" 
 } 
}
{
 "!country MY*" { 
"4$nick, 7(6MY7) 15is Malaysia" 
 } 
}
{
 "!country MV*" { 
"4$nick, 7(6MV7) 15is Maldives" 
 }
 }
{
 "!country ML*" { 
"4$nick, 7(6ML7) 15is Mali" 
 }
 }
{
 "!country MT*" { 
"4$nick, 7(6MT7) 15is Malta" 
 } 
}
{
 "!country MH*" { 
"4$nick, 7(6MH7) 15is Marshall Islands" 
 } 
}
{
 "!country MQ*" { 
"4$nick, 7(6MQ7) 15is Martinique" 
 }
 }
{
 "!country MR*" { 
"4$nick, 7(6MR7) 15is Mauritania"
  } 
}
{
 "!country MU*" { 
"4$nick, 7(6MU7) 15is Mauritius" 
 } 
}
{
 "!country YT*" { 
"4$nick, 7(6YT7) 15is Mayotte" 
 }
 }
{
 "!country MX*" { 
"4$nick, 7(6MX7) 15is Mexico" 
 }
 }
{
 "!country FM*" { 
"4$nick, 7(6FM7) 15is Micronesia" 
 }
 }
{
 "!country MD*" { 
"4$nick, 7(6MD7) 15is Moldova" 
 } 
}
{
 "!country MC*" { 
"4$nick, 7(6MC7) 15is Monaco" 
 } 
}
{
 "!country MN*" { 
"4$nick, 7(6MN7) 15is Mongolia"
  }
 }
{
 "!country MS*" { 
"4$nick, 7(6MS7) 15is Montserrat" 
 }
 }
{
 "!country MA*" { 
"4$nick, 7(6MA7) 15is Morocco" 
 } 
}
{
 "!country MZ*" { 
"4$nick, 7(6MZ7) 15is Mozambique"
  } 
}
{
 "!country MM*" { 
"4$nick, 7(6MM7) 15is Myanmar"  
} 
}
{
 "!country NA*" { 
"4$nick, 7(6NA7) 15is Namibia"  
} 
}
{
 "!country NR*" { 
"4$nick, 7(6NR7) 15is Nauru" 
 }
 }
{
 "!country NP*" { 
"4$nick, 7(6NP7) 15is Nepal"  
}
 }
{
 "!country NT*" { 
"4$nick, 7(6NT7) 15is Neutral Zone" 
 }
 }
{
 "!country NL*" { 
"4$nick, 7(6NL7) 15is Netherlands Antilles" 
 }
 }
{
 "!country NC*" { 
"4$nick, 7(6NC7) 15is New Caledonia" 
 } 
}
{
 "!country NZ*" { 
"4$nick, 7(6NZ7) 15is New Zealand"
  } 
}
{
 "!country NY*" { 
"4$nick, 7(6NY7) 15is Nicaragua" 
 }
 }
{
 "!country NC*" { 
"4$nick, 7(6NC7) 15is Niger" 
 }
 }
{
 "!country NG*" { 
"4$nick, 7(6NG7) 15is Nigeria" 
 }
 }
{
 "!country NU*" { 
"4$nick, 7(6NU7) 15is Niue" 
 }
 }
{
 "!country NF*" { 
"4$nick, 7(6NF7) 15is Norfolk Island" 
 }
 }
{
 "!country MP*" { 
"4$nick, 7(6MP7) 15is Northern Mariana Islands" 
 } 
}
{
 "!country NO*" { 
"4$nick, 7(6NO7) 15is Norway" 
 } 
}
{
 "!country OM*" { 
"4$nick, 7(6OM7) 15is Oman"
  } 
}
{
 "!country PK*" { 
"4$nick, 7(6PK7) 15is Pakistan" 
 }
 }
{
 "!country PW*" { 
"4$nick, 7(6PW7) 15is Palau"  
} 
}
{
 "!country PA*" { 
"4$nick, 7(6PA7) 15is Panama" 
 }
 }
{
 "!country PG*" { 
"4$nick, 7(6PG7) 15is Papua new Guinea"
  }
 }
{
 "!country PY*" { 
"4$nick, 7(6PY7) 15is Paraguay" 
 }
 }
{
 "!country PE*" { 
"4$nick, 7(6PE7) 15is Peru" 
 } 
}
{
 "!country PH*" { 
"4$nick, 7(6PH7) 15is Philippines" 
 } 
}
{
 "!country PN*" { 
"4$nick, 7(6PN7) 15is Pitcairn" 
 } 
}
{
 "!country PL*" { 
"4$nick, 7(6PL7) 15is Poland"
  } 
}
{
 "!country PT*" { 
"4$nick, 7(6PT7) 15is Portugal" 
 } 
}
{
 "!country PR*" { 
"4$nick, 7(6PR7) 15is Puerto Rico" 
 }
 }
{
 "!country QA*" { 
"4$nick, 7(6QA7) 15is Qatar" 
 } 
}
{
 "!country RE*" { 
"4$nick, 7(6RE7) 15is Reunion" 
 }
 }
{
 "!country RO*" { 
"4$nick, 7(6RO7) 15is Romania" 
 } 
}
{
 "!country RU*" { 
"4 nick, 7(6RU7) 15is Russian Federation" 
 }
 }
{
 "!country RW*" { 
"4$nick, 7(6RW7) 15is Rwanda" 
 }
 }
{
 "!country SB*" { 
"4$nick, 7(6SB7) 15is Solomon Islands" 
 } 
}
{
 "!country SG*" { 
"4$nick, 7(6SG7) 15is S. Georgia and S. Sandwich Isls" 
 }
 }
{
 "!country SK*" { 
"4$nick, 7(6SK7) 15is Slovak Republic" 
 }
 }
{
 "!country LC*" { 
"4$nick, 7(6LC7) 15is Saint Lucia" 
 } 
}
{

 "!country VC*" { 
"4$nick, 7(6VC7) 15is Saint Vincent and The Grenadines" 
 }
 }
{
 "!country WS*" { 
"4$nick, 7(6WS7) 15is Samoa" 
 }
 }
{
 "!country SM*" { 
"4$nick, 7(6SM7) 15is San Marino" 
 } 
}
{
 "!country ST*" { 
"4$nick, 7(6ST7) 15is Sao Tome and Principe" 
 }
 }
{
 "!country SA*" { 
"4$nick, 7(6SA7) 15is Saudi Arabia"
  } 
}
{
 "!country SN*" { 
"4$nick, 7(6SN7) 15is Senegal" 
 }
 }
{
 "!country SC*" { 
"4$nick, 7(6SC7) 15is Seychelles" 
 }
 }
{
 "!country SL*" { 
"4$nick, 7(6SL7) 15is Sierra Leone" 
 }
 }
{
 "!country SG*" { 
"4$nick, 7(6SG7) 15is Singapore" 
 }
 }
{
 "!country SJ*" { 
"4$nick, 7(6SJ7) 15is Slovakia" 
 }
 }
{
 "!country SI*" { 
"4$nick, 7(6SI7) 15is Slovenia" 
 }
 }
{
 "!country SO*" { 
"4$nick, 7(6SO7) 15is Somalia" 
 }
 }
{
 "!country ZA*" { 
"4$nick, 7(6ZA7) 15is South Africa"
  }
 }
{
 "!country SU*" { 
"4$nick, 7(6SU7) 15is USSR" 
 } 
}
{
 "!country ES*" { 
"4$nick, 7(6ES7) 15is Spain" 
 }
 }
{
 "!country LK*" { 
"4$nick, 7(6LK7) 15is Sri Lanka" 
 } 
}
{
 "!country SH*" { 
"4$nick, 7(6SH7) 15is St. Helena"  
} 
}
{
 "!country PM*" { 
"4 $nick, 7(6PM7) 15is St. Pierre and Miquelon" 
 }
 }
{
 "!country SD*" { 
"4$nick, 7(6SD7) 15is Sudan"
  } 
}
{
 "!country SR*" { 
"4$nick, 7(6SR7) 15is Suriname" 
 }
 }
{
 "!country SJ*" { 
"4$nick, 7(6SJ7) 15is Svalbard and Jan Mayen Islands" 
 } 
}
{
 "!country SZ*" { 
"4$nick, 7(6SZ7) 15is Swaziland" 
 }
 }
{
 "!country SE*" { 
"4$nick, 7(6SE7) 15is Sweden" 
 }
 }
{
 "!country SH*" { 
"4$nick, 7(6SH7) 15is Switzerland" 
 } 
}
{
 "!country SY*" { 
"4$nick, 7(6SY7) 15is Syria" 
 } 
}
{
 "!country TW*" { 
"4$nick, 7(6TW7) 15is Taiwan" 
 } 
}
{
 "!country TJ*" { 
"4$nick, 7(6TJ7) 15is Tajikistan" 
 }
 }
{
 "!country TZ*" { 
"4$nick, 7(6TZ7) 15is Tanzania" 
 } 
}
{
 "!country TH*" { 
"4$nick, 7(6TH7) 15is Thailand"
  } 
}
{
 "!country TG*" { 
"4$nick, 7(6TG7) 15is Togo" 
 } 
}
{
 "!country TK*" { 
"4$nick, 7(6TK7) 15is Tokelau" 
 } 
}
{
 "!country TO*" { 
"4 $nick, 7(6TO7) 15is Tonga"  
} 
}
{
 "!country TT*" { 
"4$nick, 7(6TT7) 15is Trinidad and Tobago" 
 } 
}
{
 "!country TN*" { 
"4$nick, 7(6TN7) 15is Tunisia" 
 } 
}
{
 "!country TR*" { 
"4$nick, 7(6TR7) 15is Turkey" 
 } 
}
{
 "!country TM*" { 
"4$nick, 7(6TM7) 15is Turkmenistan" 
 } 
}
{
 "!country TC*" { 
"4$nick, 7(6TC7) 15is Turks and Caicos Islands" 
 } 
}
{
 "!country TV*" { 
"4$nick, 7(6TV7) 15is Tuvalu" 
 }
 }
{
 "!country UM*" { 
"4$nick, 7(6UM7) 15is U.S. Minor Outlying Islands" 
 } 
}
{
 "!country UG*" { 
"4$nick, 7(6UG7) 15is Uganda" 
 }
 }
{
 "!country UA*" { 
"4$nick, 7(6UA7) 15is Ukraine"  
}
 }
{
 "!country GB*" { 
"4$nick, 7(6GB7) 15is United Arab Emirates"  
} 
}
{
 "!country UY*" { 
"4$nick, 7(6UY7) 15is Great Britain"
  }
 }
{
 "!country UZ*" { 
"4$nick, 7(6UZ7) 15is Uruguay" 
 } 
}
{
 "!country UK*" { 
"4$nick, 7(6UK7) 15is Uzbekistan"
}
 }
{
 "!country VA*" { 
"4$nick, 7(6VA7) 15is Vatican City State"
  }
 }
{
 "!country VN*" { 
"4$nick, 7(6VN7) 15is Viet Nam" 
 } 
}
{
 "!country VC*" { 
"4$nick, 7(6VC7) 15is Vatican City"
  } 
}
{
 "!country VE*" { 
"4$nick, 7(6VE7) 15is Venezuela"
  } 
}
{
 "!country VM*" { 
"4$nick, 7(6VM7) 15is Vietnam" 
 }
 }
{
 "!country VG*" { 
"4$nick, 7(6VG7) 15is Virgin Islands" 
 }
 }
{
 "!country VU*" { 
"4$nick, 7(6VU7) 15is Vanuatu" 
 }
 }
{
 "!country WF*" { 
"4$nick, 7(6WF7) 15is Wallis and Futuna Islands" 
 } 
}
{
 "!country EH*" { 
"4$nick, 7(6EH7) 15is Western Sahara" 
 }
 }
{
 "!country YE*" { 
"4$nick, 7(6YE7) 15is Yemen" 
 } 
}
{
 "!country YU*" { 
"4$nick, 7(6YU7) 15is Yugoslavia" 
 } 
}
{
 "!country ZR*" { 
"4$nick, 7(6ZR7) 15is Zaire" 
 }
 }
{
 "!country ZM*" { 
"4$nick, 7(6ZM7) 15is Zambia" 
 }
 }
{
 "!country ZW*" { 
"4$nick, 7(6ZW7) 15is Zimbabwe" 
 } 
}
{
"!state AL" { 
"4$nick, 7(6AL7) 15is Alabama" 
}
 }
{
"!state AK" { 
"4$nick, 7(6AK7) 15is Alaska" 
} 
}
{
"!state AS" { 
"4$nick, 7(6AS7) 15is AMERICAN SAMOA" 
} 
}
{
"!state AZ" { 
"4$nick, 7(6AZ7) 15is ARIZONA"
 } 
}
{
"!state AR" { 
"4$nick, 7(6AR7) 15is ARKANSAS" 
}
 }
{
"!state CA" { 
"4$nick, 7(6CA7) 15is CALIFORNIA" 
}
 }
{
"!state CO" { 
"4$nick, 7(6CO7) 15is COLORADO" 
} 
}
{
"!state CT" { 
"4$nick, 7(6CT7) 15is CONNECTICUT" 
} 
}
{
"!state DE" { 
"4$nick, 7(6DE7) 15is DELAWARE" 
} 
}
{
"!state DC" { 
"4$nick, 7(6DC7) 15is DISTRICT OF COLUMBIA" 
}
 }
{
"!state FM" { 
"4$nick, 7(6FM7) 15is FEDERATED STATES OF MICRONESIA" 
}
 }
{
"!state FL" { 
"4$nick, 7(6FL7) 15is Florida" 
} 
}
{
"!state GA" { 
"4$nick, 7(6GA7) 15is GEORGIA" 
}
 }
{
"!state GU" { 
"4$nick, 7(6GU7) 15is GUAM"
 } 
}
{
"!state HI" { 
"4$nick, 7(6HI7) 15is HAWAII"
 }
 }
{
"!state ID" { 
"4$nick, 7(6ID7) 15is Idaho" 
}
 }
{
"!state IL" { 
"4$nick, 7(6IL7) 15is Illinois" 
} 
}
{
"!state IN" { 
"4$nick, 7(6IN7) 15is INDIANA" 
} 
}
{
"!state IA" { 
"4$nick, 7(6IA7) 15is IOWA" 
} 
}
{
"!state KS" { 
"4$nick, 7(6KS7) 15is KANSAS" 
} 
}
{
"!state KY" { 
"4$nick, 7(6KY7) 15is KENTUCKY" 
} 
}
{
"!state LA" { 
"4$nick, 7(6LA7) 15is LOUISIANA" 
} 
}
{
"!state ME" { 
"4$nick, 7(6ME7) 15is MAINE" 
} 
}
{
"!state MH" { 
"4$nick, 7(6MH7) 15is MARSHALL ISLANDS" 
}
 }
{
"!state MD" { 
"4$nick, 7(6MD7) 15is MARYLAND" 
} 
}
{
"!state MA" { 
"4$nick, 7(6MA7) 15is Massachusett" 
} 
}
{
"!state MI" { 
"4$nick, 7(6MI7) 15is MICHIGAN" 
} 
}
{
"!state MN" { 
"4$nick, 7(6MN7) 15is Minnesota"
 }
 }
{
"!state MS" { 
"4$nick, 7(6MS7) 15is MISSISSIPPI" 
} 
}
{
"!state MO" { 
"4$nick, 7(6MO7) 15is MISSOURI" 
}
 }
{
"!state MT" { 
"4$nick, 7(6MT7) 15is MONTANA" 
}
 }
{
"!state NE" { 
"4$nick, 7(6NE7) 15is NEBRASKA" 
} 
}
{
"!state NV" { 
"4$nick, 7(6MV7) 15is NEVADA" 
}
 }
{
"!state NH" { 
"4$nick, 7(6NH7) 15is NEW HAMPSHIRE" 
} 
}
{
"!state NJ" { 
"4$nick, 7(6NJ7) 15is NEW JERSEY"
 } 
}
{
"!state NM" { 
"4$nick, 7(6US7) 15is NEW MEXICO" 
} 
}
{
"!state NY" { 
"4$nick, 7(6NY7) 15is NEW YORK" 
}
 }
{
"!state NC" { 
"4$nick, 7(6NC7) 15is North Carolina"
 } 
}
{
"!state ND" { 
"4$nick, 7(6ND7) 15is North Dakota" 
}
 }
{
"!state MP" { 
"4$nick, 7(6MP7) 15is NORTHERN MARIANA ISLANDS" 
} 
}
{
"!state OH" { 
"4$nick, 7(6OH7) 15is Ohio" 
} 
}
{
"!state OK" { 
"4$nick, 7(6OK7) 15is OKLAHOMA" 
} 
}
{
"!state OR" { 
"4$nick, 7(6OR7) 15is OREGON" 
}
 }
{
"!state PW" { 
"4$nick, 7(6PW7) 15is PALAU" 
} 
}
{
"!state PA" { 
"4$nick, 7(6PA7) 15is Pennsylvania"
 }
 }
{
"!state PR" { 
"4$nick, 7(6PR7) 15is PUERTO RICO" 
}
 }
{
"!state RI" { 
"4$nick, 7(6RI7) 15is RHODE ISLAND" 
} 
}
{
"!state SC" { 
"4$nick, 7(6SC7) 15is SOUTH CAROLINA" 
}
 }
{
"!state SD" { 
"4$nick, 7(6SD7) 15is SOUTH DAKOTA" 
}
 }
{
"!state TN" { 
"4$nick, 7(6TN7) 15is TENNESSEE" 
} 
}
{
"!state TX" { 
"4$nick, 7(6TX7) 15is TEXAS" 
}
 }
{
"!state UT" { 
"4$nick, 7(6UT7) 15is UTAH" 
} 
}
{
"!state VT" { 
"4$nick, 7(6VT7) 15is VERMONT"
 }
 }
{
"!state VI" { 
"4 $nick, 7(6VI7) 15is VIRGIN ISLANDS"
 }
 }
{
"!state VA" { 
"4$nick, 7(6VA7) 15is VIRGINIA"
 } 
}
{
"!state WA" { 
"4$nick, 7(6WA7) 15is WASHINGTON"
 } 
}
{
"!state WV" { 
"4$nick, 7(6WV7) 15is WEST VIRGINIA" 
} 
}
{
"!state WI" { 
"4$nick, 7(6WI7) 15is WISCONSIN" 
} 
}
{
"!state WY" { 
"4$nick, 7(6WY7) 15is WYOMING" 
} 
}
{
"!state" {
"0,1$nick 4:11Using 4!State FL 11or u want "
 }
}
{
 "!proxy" { 
"4$nick15: www.samair.ru/proxy" 
"4$nick15: www8.big.or.jp/~000/CyberSyndrome/" 
"4$nick15: www.multiproxy.org" 
"4$nick15: http://www.atomintersoft.com/products/alive-proxy/proxy-list/" 
"4$nick15: http://www.proxymania.com/page1.html"
"4$nick15: http://www.freepublicproxies.com/page1.html" 
"4$nick15: http://www.aliveproxy.com/"
"4$nick15: http://www.proxy4free.com/index.html"
"4$nick15: http://www.stayinvisible.com/index.pl"
"4$nick15: http://www.proxybench.com/proxy/"
"4$nick15: http://www.anzwers.org/free/bymor/proxylist.htm"
"4$nick15: http://www8.big.or.jp/~000/CyberSyndrome/pla.html" 
"4$nick15: http://www.blackcode.com/proxy/"
"4$nick15: http://proxylist.net/" 
"4$nick15: http://basicsecuritybyspaz.freeyellow.com/check.htm"
"4$nick15: http://proxyjudge.org/"
"4$nick15: http://www.bismark.it/proxylist/"
"4$nick15: http://www.freeproxy.ru/"
"4$nick15: http://mikhed.narod.ru/download/lists/goodproxy.txt" 
"4$nick15: http://tools.rosinstrument.com/proxy/" 
"4$nick15: http://proxyworld.ws/" 
 }
 }
}

bind pubm - * pub_carding

if {$master==1} {
}

proc pub_carding {nick uhost hand chan arg} {
 global carding carding_chan botnick
 if {(([lsearch -exact [string tolower $carding_chan] [string tolower $chan]] != -1) || ($carding_chan == "*")) && (![matchattr $hand b]) && ($nick != $botnick)} {
  foreach i $carding {
   if {[string match [string tolower [lindex $i 0]] [string tolower $arg]]} {
    putserv "PRIVMSG $chan :[subst [lindex [lindex $i 1] [rand [llength [lindex $i 1]]]]]"
   }
  }
 }
}


putlog "*** Carding Addon TCL by MedanCrew Loaded!"