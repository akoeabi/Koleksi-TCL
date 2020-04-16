##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set cakesowner "abah" 

# location
set cakescountry "Indonesia"
set cakesstate "Makassar"

# Update
set cakesupdate "09.08.2010"

# Version
set cakesversion "20.10"

# End configuration

set cakes {
"Dear pelanggan yang terhormat,"
"Terima kasih telah menghubungi Ukhuwahnet Cakes"
"Perintah info : !produk, !fanscakes"
"Silakan hubungi kami kembali kapan saja"
}

bind pub - !cakes pub:cakes
proc pub:cakes {nick uhost hand chan text} {
global cakes
foreach line $cakes { puthelp "PRIVMSG $chan :$line" }
}

set produk {
"Dear pelanggan yang terhormat,"
"Terima kasih telah menghubungi Ukhuwahnet Cakes"
"Maaf dalam proses updated paket"
"Silakan hubungi kami kembali kapan saja"
}

bind pub - !produk pub:produk
proc pub:produk {nick uhost hand chan text} {
global produk
foreach line $produk { puthelp "PRIVMSG $chan :$line" }
}

set fanscakes {
"Dear pelanggan yang terhormat,"
"Terima kasih telah menghubungi Ukhuwahnet Cakes"
"Fans Pages Ukhuwahnet Cakes adalah http://www.facebook.com/pages/Cakes/392992164097201"
"Silakan hubungi kami kembali kapan saja"
}

bind pub - !fanscakes pub:fanscakes
proc pub:fanscakes {nick uhost hand chan text} {
global fanscakes
foreach line $fanscakes { puthelp "PRIVMSG $chan :$line" }
}

putlog "TCL Name : TCL Cakes edited by $cakesowner $cakescountry $cakesstate $cakesversion $cakesupdate"
putlog "Mailto : abah@ukhuwah.net"
putlog "Running : Server $network"
putlog "Loaded Status : Success ...!!!"