################################################################
# Advertise TCL                                                #
# Author:                                                      #
#    slennox <slenny@ozemail.com.au>                           # 
#                                                              #
# Edited and add some enhancement by:                          #
#    aWaN               (admin@awan.tk)                        #
#                                                              #
# I hate ripper, so please included the copyright stuff        #
# when you modified it. at least give credit to real author    #
#                                                              #
################################################################

# Channel to send advertise messages to / Set channel untuk advertise
set ai_chan "#pati"

# Maximum time interval between messages (in minutes) / Set jarak pesan tiap X menit
set ai_time 15

# Messages to send / Set pesan 
set ai_msgs {
  "4Warnet: Yoeditha.Net, Jln Supriyadi No.74 PATI - Jawa Tengah. Akses 384 Kbps Speedy Telkom, Buka 24 Jam. Advertising By WaLLz ,email contact: admin@indocarding.net (13/2/2008)"
  "14Warnet: Dot Cyber, Komplek Gedung Mr.Iskandar Alun-alun Simpang Lima, PATI - Jawa Tengah. Akses 512 kbps IndosatM2, Buka 24 Jam. Advertising By WaLLz ,email contact: admin@indocarding.net (13/2/2008)"
  "4Game Center : Dot Game.Net, Salza Simpang Lima No.2 PATI - Jawa Tengah. Game Online & Game Offline Multiplayer , Buka 24 Jam. Advertising By WaLLz ,email contact: admin@indocarding.net (13/2/2008)"
  "4Internet Service Provider : indonet - The Internet Solution Partner , Kebebasan ber Internet dengan Paket Super Murah dengan INDOPAHE Unlimited Wireless Conection 24 Hours Hanya Rp. 350.000/Bulan. Advertising By WaLLz ,email contact: admin@indocarding.net (13/2/2008)"
  "4Internet Service Provider : indonet - The Internet Solution Partner , Koneksi Internet Untuk Corporate, Akses Super Cepat dengan Budget Super Murah!! Anda Bebas Pilih Sendiri Paket yang Sesuai dengan Kebutuhan Corporate Anda, Akses up to 384 Kbps. 128 Kbps Rp. 800.000/Bulan , 256 Kbps Rp. 1.600.000/Bulan , 384 Kbps Rp. 2.200.000/Bulan. Info & Advertising By WaLLz, email contact: admin@indocarding.net (13/2/2008)"
  "4Seminar : Data Utama Dinamika - Cyber Technology, Semarang 27 Maret 2008 di Hotel Grand Candi, Seminar Best Practice to Secure Your Network, Trend malware 2008 dan antisipasinya, Membangun Sendiri Firewall Menggunakan mikrotik dan linux, Demo virtual private network (VPN) untuk mengamankan data. Pembicara : Harijanto Pribadi, Onno W Purbo, Alfons Tanujaya. info lainnya di http://seminar.datautama.net.id .Info & Advertising By WaLLz"
  "4Ingin Pasang Iklan di Channel mIRC #Pati On DaLNet, Silahkan Hubungi WaLLz atau email: admin@indocarding.net"
  "Ingin Akses AOP Channel #PATI On DaLNet Segera Hubungi SOP Channel. Catatan : Bagi SOP Atau AOP Channel #Pati Harap Selalu Online Atau Akses di Hapus"
  "Untuk informasi Lebih Lanjut Silahkan Buka Website http://pati.informe.com dan http://pati-dalnet.co.nr atau contact email : admin@indocarding.net "
}


# Don't edit anything below unless you know what you're doing

proc ai_start {} {
  global ai_time
  if {[string match *ai_sendmsg* [timers]]} {return 0}
  timer [expr [rand $ai_time] + 1] ai_sendmsg
}

proc ai_sendmsg {} {
  global botnick ai_chan ai_msgs ai_time
  if {[validchan $ai_chan] && [onchan $botnick $ai_chan]} {
    puthelp "PRIVMSG $ai_chan :[lindex $ai_msgs [rand [llength $ai_msgs]]]"
  }
  timer [expr [rand $ai_time] + 1] ai_sendmsg
}

set ai_chan [string tolower $ai_chan]

ai_start

##############
# End of TCL #
##############

putlog "- Advertise Lo@Ded ©-"
