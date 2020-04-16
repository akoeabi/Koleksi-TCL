#######################################################
# Bot Lotre Game 2010 By Yuma - #kartosuro Allnetwork #
# hillzx@gmail.com                                    #
# Version 2.4                                         #
# 16 Juni 2010                                        #
#######################################################
bind pub - !ceknick ceknick
bind notc - * notices

bind pub - !lotre startquiz
bind pub - !buyar stopquiz
bind pub - !top terkaya
bind pub - !version lalalaversion

bind pub - ma pla
bind pub - mi pli
bind pub - mu plu
bind pub - me ple
bind pub - mo plo
bind pub - !duit duit

bind pub o|o !hapus hapus
bind pub o|o !hapuswinner erasewinner
bind pub o|o !tambahwinner tambahwinner
bind pub o|o !denda denda
bind pub o|o !bonus bonus
bind pub o|o !ambilhadiah ambilhadiah
bind pub o|o !cekwinner getwinners
bind pub o|o !hapusbuffer hapusbuffer

bind pub - !transfer transfer
bind pub - !transferhelp transferhelp
bind pub - hahahihihehehoho lalala

set allowmoneycheck "true"
set allowaddpoint "false"
set isjackpot "false"
set txtlotre "scripts/lotre.txt"
set txtwinner "scripts/winner.txt"
set chanlotre "#batu"
set juara1 ""
set juara2 ""
set netral ""
set rugi1 ""
set rugi2 ""
set isplaying "false"
set hadiah 0
set hadiah2 0
set varjuara1 "xx"
set varapes1 "xx"
set varjuara2 "xx"
set varapes2 "xx"
set allparticipant ""
set counter 0
set randomindex 0
set newline ""
set tempuser ""

set init-server {
}

proc stopquiz { nick uhost hand chan text } {
global isplaying allowmoneycheck chanlotre

if { [isop $nick $chan] } {
set allowaddpoint "false"
set isplaying "false"
set allowmoneycheck "true"
putserv "PRIVMSG $chanlotre :1,7Buyar... buyar!!! ada SATPOL PP!! $nick rese' nehhh...."
}
}


proc ceknick { nick uhost hand chan text } {
global chanlotre txtlotre tempuser

if { [isop $nick $chan] } {

set targetnick [lindex $text 0]

if {  $targetnick == "" } {
putserv "PRIVMSG $chanlotre :Format salah! Seharusnya !CEKNICK <NICK>"
return
}

putserv "PRIVMSG nickserv :info $targetnick"
}
return


set lines [getdatafromtxt $txtlotre]
set tempuser ""

foreach line $lines {

set names [split $line ":"]

set targetnickreg [lindex $names 1]
	if { $targetnickreg != "" } {

	puthelp "PRIVMSG nickserv :info $targetnickreg"

	}
}

}


proc notices {nick uhost hand text {dest ""}} {
global chanlotre tempuser

if { [string match "Information on *" $text ] } {
set nicklocal [lindex $text 2]
putserv "PRIVMSG $chanlotre :Nick $nicklocal sudah di register"
} elseif { [string match "* is not registered*" $text ] } {
set nicklocal [lindex $text 0]

putserv "PRIVMSG $chanlotre :Nick $nicklocal belum di register, 4nick dan duit hangus.."
}

}

proc denda { nick uhost hand chan text } {
global chanlotre
set tempdenda [getdenda]

set target [lindex $text 0]
set reason [lrange $text 1 end]

if { $target == "" || $reason == "" } {
putserv "PRIVMSG $chanlotre :0,1Format salah.. Seharusnya !DENDA <Nick> <Alasan>"
} else {
set test [updatemoneyminus $target $tempdenda]
putserv "PRIVMSG $chanlotre :Nick $target telah melakukan pelanggaran di meja-judi dengan alasan $reason , dan di denda sebesar Rp. $tempdenda . Mohon untuk tidak di ulangi lagi yah.. Nanti tak jewer.. :D"
}

}

proc bonus { nick uhost hand chan text } {
global chanlotre
set tempbonus [getdenda]

set target [lindex $text 0]
set reason [lrange $text 1 end]

if { $target == "" || $reason == "" } {
putserv "PRIVMSG $chanlotre :0,1Format salah.. Seharusnya !BONUS <Nick> <Alasan>"
} else {
set test [updatemoney $target $tempbonus]
putserv "PRIVMSG $chanlotre :Nick $target telah melakukan tindakan berbudi di meja-judi dengan alasan $reason , dan diberi bonus sebesar Rp. $tempbonus.  Lanjutkan aksimu..!!"
}

}

proc beginquiz {  } {
global chanlotre juara1 rugi1 juara2 rugi2 isplaying hadiah hadiah2 varjuara1 varapes1 varjuara2 varapes2 allowmoneycheck
global allparticipant randomindex allowaddpoint

if { $isplaying == "false" } {return}
set allowaddpoint "true"
set allparticipant ""
set allowmoneycheck "false"

set juara1 [getrand]
set randomindex [getrandomindex]
set au [getrank $juara1]
set hadiah [getbidmax]
set hadiah2 [expr $hadiah / 2]
set varjuara1 [tukarjuara $juara1]
set varjuara2 [tukarjuara $juara2]
set varapes1 [tukarjuara $rugi1]
set varapes2 [tukarjuara $rugi2]

putserv "PRIVMSG $chanlotre :Welcome to Meja Judi - Komisi Rp. $hadiah. Mo ikutan?? Ketik ma - mi - mu - me - mo "
utimer 35 quizend

set tempjackpot [getjackpot]

if { [expr $tempjackpot == 1] } {
utimer 10 rilisjackpot
utimer 18 jackpotend
} elseif { [expr $tempjackpot == 2] } {
utimer 28 getterkaya
} elseif { [expr $tempjackpot == 3] } {
utimer 10 getwinner
} elseif { [expr $tempjackpot == 4] } {
utimer 10 getrules
} elseif { [expr $tempjackpot == 5] } {
utimer 10 getinfo
}

}

proc getrules { } {
global chanlotre
putserv "PRIVMSG $chanlotre :0,1visit ircblog.kotabatu.net, www.kotabatu.info "
}

proc getinfo { } {
global chanlotre
putserv "PRIVMSG $chanlotre :0,1Poin meja-judi direset setiap tanggal 1 dan 15 tiap bulan"
}

proc getwinner { } {
global chanlotre
set winner [getwinnerfromfile]
putserv "PRIVMSG $chanlotre :0,1Pemenang meja-judi bulan lalu: 8,3 $winner 0,1 visit ircblog.kotabatu.net, www.kotabatu.info 0,1Terima kasih telah join di meja-judi"
}

proc getwinners { nick uhost hand chan text } {
getwinner
}

proc startquiz {nick uhost hand chan text} {
global isplaying allowaddpoint
if { $isplaying == "false" } {
set isplaying "true"
beginquiz
}
}

proc quizend { } {
global chanlotre hadiah hadiah2 varjuara1 varapes1 varjuara2 varapes2 allowmoneycheck isjackpot
global allparticipant counter isplaying allowaddpoint
set allowaddpoint "false"
set isjackpot "false"
putserv "PRIVMSG $chanlotre :0,1Hasil lotere di meja-judi: 13,1$varjuara1 dapat Rp. $hadiah, $varjuara2 dapat Rp. $hadiah2, 8,1$varapes2: rugi Rp. $hadiah2, $varapes1: rugi Rp. $hadiah 0,1Selamet yee.... Undian berikutnya dalam 20 detik.."
set allowmoneycheck "true"

if { $allparticipant == "" } {
set counter [expr $counter + 1]
} else {
set counter 0
}

set allparticipant ""

if { [expr $counter == 3 ] } {
putserv "PRIVMSG $chanlotre :0,1Tak ada yg menjawab Quiz 3x berturut-turut, quiz diberhentikan otomatis"
set counter 0
set allowaddpoint "false"
set isplaying "false"
set allowmoneycheck "true"
} else {
utimer 20 beginquiz
}

}

proc jackpotend { } {
global isjackpot
set isjackpot "false"
}

proc rilisjackpot { } {
global chanlotre isjackpot
set isjackpot "true"
putserv "PRIVMSG $chanlotre :1,7Zero Jackpot Lunasi hutang duit anda sekarang juga dengan mengetik hahahihihehehoho, cepetan!! Cuma berlaku beberapa detik saja!!"
}

proc lalala { nick uhost hand chan text } {
global isjackpot

if { $isjackpot == "true" } {
set isjackpot "false"
putserv "PRIVMSG $chan :$nick sukses mendapatkan jackpot! 0,1Zero Jackpot - Utang dilunasi oleh Bank Titil!"
set duitnya [getmoney $nick]

if { [expr $duitnya < 0] } {
hapususer $nick
}
}

}


proc duit { nick uhost hand chan text} {
global allowmoneycheck

if { $allowmoneycheck == "false" } {
putserv "PRIVMSG $nick :$nick anda bisa cek duit ketika lotre telah diumumkan"
} else {

set target [lindex $text 0]
if { $target == "" } {
putserv "PRIVMSG $chan :$nick punya duit di Bank Titil! sebesar Rp. [getmoney $nick] "
} else {
putserv "PRIVMSG $chan :$target punya duit di Bank Titil! sebesar Rp. [getmoney $target] "
}

}
}

proc ifnickexistinarray { nick nicks } {

foreach item $nicks {

if { [string tolower $item] == [string tolower $nick] } {
return "true"
} 

}

return "false"

}


proc pla {nick uhost hand chan text} {
global allparticipant allowaddpoint varjuara1 varapes1 varjuara2 varapes2 hadiah hadiah2 chanlotre

if { $allowaddpoint == "false"} {return}
if { [ifnickexistinarray $nick $allparticipant] == "true" } {
putserv "PRIVMSG $nick :Anda sudah ikut berpartisipasi dalam Lotere meja-judi. Harap tunggu beberapa saat lagi."
} else {
set allparticipant "$nick $allparticipant"

if { $varjuara1 == "ma" } {
set test [updatemoney $nick $hadiah]
}

if { $varjuara2 == "ma" } {
set test [updatemoney $nick $hadiah2]
}

if { $varapes1 == "ma" } {
set test [updatemoneyminus $nick $hadiah]
}

if { $varapes2 == "ma" } {
set test [updatemoneyminus $nick $hadiah2]
}

}
}

proc pli {nick uhost hand chan text} {
global allparticipant allowaddpoint varjuara1 varapes1 varjuara2 varapes2 hadiah hadiah2 chanlotre
if { $allowaddpoint == "false"} {return}
if { [ifnickexistinarray $nick $allparticipant] == "true" } {
putserv "PRIVMSG $nick :Anda sudah ikut berpartisipasi dalam Lotere meja-judi. Harap tunggu beberapa saat lagi."
} else {
set allparticipant "$nick $allparticipant"
if { $varjuara1 == "mi" } {
set test [updatemoney $nick $hadiah]
}

if { $varjuara2 == "mi" } {
set test [updatemoney $nick $hadiah2]
}

if { $varapes1 == "mi" } {
set test [updatemoneyminus $nick $hadiah]
}

if { $varapes2 == "mi" } {
set test [updatemoneyminus $nick $hadiah2]
}
}
}

proc plu {nick uhost hand chan text} {
global allparticipant allowaddpoint varjuara1 varapes1 varjuara2 varapes2 hadiah hadiah2 chanlotre
if { $allowaddpoint == "false"} {return}
if { [ifnickexistinarray $nick $allparticipant] == "true" } {
putserv "PRIVMSG $nick :Anda sudah ikut berpartisipasi dalam Lotere meja-judi. Harap tunggu beberapa saat lagi."
} else {
set allparticipant "$nick $allparticipant"

if { $varjuara1 == "mu" } {
set test [updatemoney $nick $hadiah]
}

if { $varjuara2 == "mu" } {
set test [updatemoney $nick $hadiah2]
}

if { $varapes1 == "mu" } {
set test [updatemoneyminus $nick $hadiah]
}

if { $varapes2 == "mu" } {
set test [updatemoneyminus $nick $hadiah2]
}
}
}

proc ple {nick uhost hand chan text} {
global allparticipant allowaddpoint varjuara1 varapes1 varjuara2 varapes2 hadiah hadiah2 chanlotre
if { $allowaddpoint == "false"} {return}
if { [ifnickexistinarray $nick $allparticipant] == "true" } {
putserv "PRIVMSG $nick :Anda sudah ikut berpartisipasi dalam Lotere meja-judi. Harap tunggu beberapa saat lagi."
} else {
set allparticipant "$nick $allparticipant"
if { $varjuara1 == "me" } {
set test [updatemoney $nick $hadiah]
}

if { $varjuara2 == "me" } {
set test [updatemoney $nick $hadiah2]
}

if { $varapes1 == "me" } {
set test [updatemoneyminus $nick $hadiah]
}

if { $varapes2 == "me" } {
set test [updatemoneyminus $nick $hadiah2]
}
}
}

proc plo {nick uhost hand chan text} {
global allparticipant allowaddpoint varjuara1 varapes1 varjuara2 varapes2 hadiah hadiah2 chanlotre
if { $allowaddpoint == "false"} {return}
if { [ifnickexistinarray $nick $allparticipant] == "true" } {
putserv "PRIVMSG $nick :Anda sudah ikut berpartisipasi dalam Lotere meja-judi. Harap tunggu beberapa saat lagi."
} else {
set allparticipant "$nick $allparticipant"
if { $varjuara1 == "mo" } {
set test [updatemoney $nick $hadiah]
}

if { $varjuara2 == "mo" } {
set test [updatemoney $nick $hadiah2]
}

if { $varapes1 == "mo" } {
set test [updatemoneyminus $nick $hadiah]
}

if { $varapes2 == "mo" } {
set test [updatemoneyminus $nick $hadiah2]
}
}
}

set listjackpot {
{0}
{2}
{0}
{4}
{0}
{1}
{0}
{1}
{0}
{0}
{2}
{0}
{0}
{3}
{0}
{0}
{3}
{5}
}

set bidmax {
{200}
{500}
{400}
{500}
{800}
{400}
{10000}
{600}
{500}
{200}
{400}
{400}
{200}
{600}
}

set listdenda {
{500}
{1000}
{2000}
}




# Rumus Macam Macam

proc pick:from { list } {
set temp [lindex $list [rand [llength $list]]]
return $temp
}

proc tukarjuara { nama } {

if { [string match $nama "0"] } {
return "ma"
} elseif  { [string match $nama "1"] } {
return "mi"
} elseif { [string match $nama "2"] } {
return "mu"
} elseif { [string match $nama "3"] } {
return "me"
} elseif { [string match $nama "4"] } {
return "mo"
} 
}

proc nokutip { value } {
    set kutip [toChar [expr 34]]
    return [string trim $value $kutip]
}



proc updatemoney { targetnick money } {
global txtlotre newline
set isnickexist "false"
#putserv "PRIVMSG #chanlotre :nick yg mengakses $targetnick , utk edit duit $money"
set lines [getdatafromtxt $txtlotre]
set con [open $txtlotre "w"]
	
	foreach line $lines {

	set inline [split $line ":"]
	set nickinline [lindex $inline 1]
	set moneyinline [lindex $inline 0]
	set nicklower [string tolower $nickinline]
		
	if { [string tolower $targetnick] == $nicklower } {
		set newvalue [expr $moneyinline + [expr $money]]
		set newline "$newvalue:$nickinline"
		set isnickexist "true"
	} else {
		if { $line != "" } {puts $con $line}
	}
	
	}
		if { $isnickexist == "false" } {
		set newline "$money:$targetnick" 
		puts -nonewline $con $newline
		} else {
		puts -nonewline $con $newline
		}
		
		close $con
	
}

proc updatemoneyminus { targetnick money } {
global txtlotre chanlotre newline
set isnickexist "false"
#putserv "PRIVMSG #chanlotre :nick yg mengakses $targetnick , utk edit duit minus $money"

set lines [getdatafromtxt $txtlotre]
set con [open $txtlotre "w"]
	
	foreach line $lines {

	set inline [split $line ":"]
	set nickinline [lindex $inline 1]
	set moneyinline [lindex $inline 0]
	set nicklower [string tolower $nickinline]
		
	if { [string tolower $targetnick] == $nicklower } {
		set newvalue [expr $moneyinline - [expr $money]]
		set newline "$newvalue:$nickinline"
		set isnickexist "true"
	} else {
		if { $line != "" } {puts $con $line}
	}
	
	}
		if { $isnickexist == "false" } {
		set newline "-$money:$targetnick" 
		puts -nonewline $con $newline
		} else {
		puts -nonewline $con $newline
		}
		
		close $con
	
}

proc hapus { nick uhost hand chan text } {

set target [lindex $text 0]

if { $target != "" } {
hapususer $target
putserv "PRIVMSG $chan :Nick $target sudah terhapus dari database meja-judi"
} else {
putserv "PRIVMSG $chan :Format salah Boss!"
}

}

proc hapususer { targetnick } {
global txtlotre chanlotre

set lines [getdatafromtxt $txtlotre]
set con [open $txtlotre "w"]
	
	foreach line $lines {

	set inline [split $line ":"]
	set nickinline [lindex $inline 1]
	set moneyinline [lindex $inline 0]
	set nicklower [string tolower $nickinline]
		
	if { [string tolower $targetnick] != $nicklower } {
		if {$line != "" } {	puts $con $line }
	}
	
	}

		close $con
	
}


proc getmoney { targetnick } {
global txtlotre

set lines [getdatafromtxt $txtlotre]
	
	foreach line $lines {

	set inline [split $line ":"]
	set nickinline [lindex $inline 1]
	set moneyinline [lindex $inline 0]
	set nicklower [string tolower $nickinline]
		
	if { [string tolower $targetnick] == $nicklower } {
		return $moneyinline
	}
	
	}
	
	return 0
	
}

proc terkaya { nick uhost hand chan text } {
global allowmoneycheck

if { $allowmoneycheck == "false" } {
putserv "PRIVMSG $nick :$nick anda bisa cek Terkaya ketika lotre telah diumumkan"
} else {
getterkaya
}
}

proc getterkaya { } {
global chanlotre txtlotre
set lines [getdatafromtxt $txtlotre]
set newlines [lsort -dictionary -decreasing $lines ]

set dewajudi [lindex $newlines 0]
set rajajudi [lindex $newlines 1]
set pangeranjudi [lindex $newlines 2]

putquick "PRIVMSG $chanlotre :Poin Tertinggi Dewa Judi: $dewajudi Raja Judi: $rajajudi Pangeran Judi: $pangeranjudi"

}

proc transfer { nick uhost hand chan text } {
global allowmoneycheck chanlotre

if { $allowmoneycheck == "false" } {
putserv "PRIVMSG $nick :$nick anda diperbolahkan transfer ketika lotre telah diumumkan"
} else {


set target [lindex $text 0]
set nominal [lindex $text 1]

if { [expr $nominal > 0] } {

	if { [expr $nominal < 5000] } {
	putserv "PRIVMSG $chanlotre :Maaf transfer gagal! Poin yg ingin dikirim harus lebih dari 5000LP"
	return
	}

if { $target == "" || $nominal == "" } {
putserv "PRIVMSG $chan :Format salah, seharusnya !TRANSFER <Nick Tujuan> <Jumlah Poin> . Biaya transfer 25% dari nominal, minimal sisa uang setelah transfer Rp. 30.000LP"
} else {

 
 set ppn [expr 0.25 * $nominal]
 set ppntext "$ppn"
 set ppns [split $ppntext "."]
 set ppn [lindex $ppns 0]
 #putserv "PRIVMSG $chanlotre :Jumlah PPN anda adalah $ppn"
 #return
 set orimoney [getmoney $nick]
 set biaya [expr $nominal + $ppn]
 set sisakirakira [expr $orimoney - $biaya]
 
 if { [expr $sisakirakira < 30000] } { putserv "PRIVMSG $chan :Maaf, Poin anda tidak cukup untuk melakukan transfer! Biaya transfer 25% dari nominal , minimal sisa uang setelah transfer Rp. 30.000LP";return}
 
set test [updatemoneyminus $nick $biaya]
set test2 [updatemoney $target $nominal]
putserv "PRIVMSG $chan :$nick telah mentransfer duit kepada $target sebesar $nominal dengan PPN $ppn LP"
 
}

} else {
putserv "PRIVMSG $chanlotre :Nilai nominal tidak dapat diterima. Transfer gagal!"
}


}
}

proc ambilhadiah { nick uhost hand chan text } {
set target [lindex $text 0]
set nominal [lindex $text 1]

if { $target == "" || $nominal == "" } {
putserv "PRIVMSG $chan :Format salah, seharusnya !ambilhadiah <nick> <nominal>"
} else {
set test [updatemoneyminus $target $nominal]
putserv "PRIVMSG $chan :Poin sukses .. Selamat ya $target hehehe.. ^_^"
savewinner $target
}

}



proc tambahwinner { nick uhost hand chan text } {

set targetnick [lindex $text 0]

savewinner $targetnick
}

proc getwinnerfromfile { } {
global txtwinner
set names [getdatafromtxt $txtwinner]

set result ""

foreach name $names {
if { $result == "" } {
set result "$name"
} else {
set result "$name $result"
}

}

return $result
}

proc savewinner { message } { 
global txtwinner

		set con [open $txtwinner r]
		set data [read $con]
		close $con
		
		set con [open $txtwinner "w"]
		puts $con "$message"
		puts -nonewline $con $data
		close $con

}


proc erasewinner { nick uhost hand chan text } {
global txtwinner newline

if { [lindex $text 0] == "" } {
putserv "PRIVMSG $chan :Format salah! Gunakan !Hapuswinner <Nick>"
return
}
set targetnick [lindex $text 0]

set lines [getdatafromtxt $txtwinner]
set con [open $txtwinner "w"]

	foreach line $lines {

	set nicklower [string tolower $line]
	set targetlower [string tolower $targetnick]
	set temp ""
	
	if { $targetlower != $nicklower } {
		if { $line != "" } {puts $con $line}
	}
	
	}
		
		close $con

}



proc lalalaversion { nick uhost hand chan text } {

putserv "PRIVMSG $chan :2versi copas aja"
}

proc transferhelp { nick uhost hand chan text } {

putserv "PRIVMSG $chan :6Cara transfer, ketik !TRANSFER <NICK> <NOMINAL>. Minimal LP setelah transfer harus Rp. 30.000. Biaya transfer cuma 25% dari jumlah yg dikirim."
}


# GETS ====================================================
proc getdatafromtxt { filepath } {

	set con [open $filepath r]
	set data [read $con]
	close $con
	set data [split $data "\n"]
	return $data

}

proc getrand { } {
set temp [rand 5]
return $temp
}

proc getrandomindex { } {
set temp [rand 3]
return $temp
}

proc getbidmax { } {
global bidmax
return [pick:from $bidmax] 
}

proc getjackpot { } {
global listjackpot
return [pick:from $listjackpot] 
}

proc getdenda { } {
global listdenda
return [pick:from $listdenda] 
}

proc getrank { digitdefault } {
global juara2 netral rugi1 rugi2 randomindex

	if {[expr $digitdefault==0] } {
	
		if { $randomindex == 0 } {
			set juara2 [expr $digitdefault + 1]
			set netral [expr $digitdefault + 2]
			set rugi1 [expr $digitdefault + 3]
			set rugi2 [expr $digitdefault + 4]		
		} elseif { $randomindex == 1 } {
			set rugi1 [expr $digitdefault + 1]
			set rugi2 [expr $digitdefault + 2]
			set juara2 [expr $digitdefault + 3]
			set netral [expr $digitdefault + 4]
		} elseif { $randomindex == 2 } {
			set netral [expr $digitdefault + 1]
			set juara2 [expr $digitdefault + 2]
			set rugi2 [expr $digitdefault + 3]
			set rugi1 [expr $digitdefault + 4]
		}
		
	} elseif {[expr $digitdefault==1] } {
		if { $randomindex == 0 } {
			set juara2 [expr $digitdefault + 1]
			set netral [expr $digitdefault + 2]
			set rugi1 [expr $digitdefault + 3]
			set rugi2 [expr $digitdefault -1 ]
		} elseif { $randomindex == 1 } {
			set rugi1 [expr $digitdefault + 1]
			set rugi2 [expr $digitdefault + 2]
			set juara2 [expr $digitdefault + 3]
			set netral [expr $digitdefault -1 ]
		} elseif { $randomindex == 2 } {
			set netral [expr $digitdefault + 1]
			set juara2 [expr $digitdefault + 2]
			set rugi2 [expr $digitdefault + 3]
			set rugi1 [expr $digitdefault -1 ]
		}
	
	} elseif {[expr $digitdefault==2] } {
	
		if { $randomindex == 0 } {
			set juara2 [expr $digitdefault -2 ]
			set netral [expr $digitdefault + 2]
			set rugi1 [expr $digitdefault - 1 ]
			set rugi2 [expr $digitdefault +1 ]
		} elseif { $randomindex == 1 } {
			set rugi1 [expr $digitdefault -2 ]
			set rugi2 [expr $digitdefault + 2]
			set juara2 [expr $digitdefault - 1 ]
			set netral [expr $digitdefault +1 ]
		} elseif { $randomindex == 2 } {
			set netral [expr $digitdefault -2 ]
			set juara2 [expr $digitdefault + 2]
			set rugi2 [expr $digitdefault - 1 ]
			set rugi1 [expr $digitdefault +1 ]
		}
	

	} elseif {[expr $digitdefault==3] } {
	
		if { $randomindex == 0 } {
			set juara2 [expr $digitdefault + 1]
			set rugi1 [expr $digitdefault - 1]
			set rugi2 [expr $digitdefault - 2]
			set netral [expr $digitdefault - 3]
		} elseif { $randomindex == 1 } {
			set netral [expr $digitdefault + 1]
			set rugi2 [expr $digitdefault - 1]
			set rugi1 [expr $digitdefault - 2]
			set juara2 [expr $digitdefault - 3]
		} elseif { $randomindex == 2 } {
			set rugi2 [expr $digitdefault + 1]
			set juara2 [expr $digitdefault - 1]
			set netral [expr $digitdefault - 2]
			set rugi1 [expr $digitdefault - 3]
		}

	} elseif {[expr $digitdefault==4] } {
	
		if { $randomindex == 0 } {
			set rugi1 [expr $digitdefault - 4]
			set rugi2 [expr $digitdefault - 2]
			set netral [expr $digitdefault - 3]
			set juara2 [expr $digitdefault - 1]
		} elseif { $randomindex == 1 } {
			set rugi2 [expr $digitdefault - 4]
			set rugi1 [expr $digitdefault - 2]
			set juara2 [expr $digitdefault - 3]
			set netral [expr $digitdefault - 1]
		} elseif { $randomindex == 2 } {
			set netral [expr $digitdefault - 4]
			set juara2 [expr $digitdefault - 2]
			set rugi1 [expr $digitdefault - 3]
			set rugi2 [expr $digitdefault - 1]
		}

	}

}

putlog "Lotre by Yuma"
