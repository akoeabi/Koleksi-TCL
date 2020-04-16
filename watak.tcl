putlog "## ..:: Initializing bulan Addon TCL ::... ##"

# Set Channel

set bulan_chan "#lemper #lemper"

set master 1

# Set respon, baris pertama direspon oleh baris selanjutnya

set bulan {

{

"!perintah" {

  "0,1$nick 4:11Perintah Kamu Tidak sesuai Dengan Data, Gunakan Perintah 4!15bulan 4!15hari " 

}

}

 {

  "!bulan*" {

"0,1$nick 4:11Perintah Yang harus Kamu Gunakan Sebagai Berikut-> 0,14!15Bulan Januari 0 Atau Nama Bulan Lainnya 4!15Hari 415Jum`at 4Atau 15Hari Lainnya"
"

   }

 }

 

{

  "!bulan" {

    "0,1$nick 4:11Penggunaan Perintah 4!bulan Januari 11atau Nama Bulan Yang Kamu Inginkan "      }

 }

{

  "!bulan Januari*" {

   "4$nick, 7(6Bulan Januari7) 3Mempunyai Watak: |Tenang dan berwibawa|Suka berterus terang dan tidak suka basa-basi|Pandai menyimpan rahasia dan bisa dipercaya|Disukai banyak orang karena selalu kelihatan ceria|Mandiri dan tidak suka meminta bantuan pada orang lain|Pandai mengatur keuangan|Agak pendiam dan lebih senang memperhatikan dirinya sendiri|Teliti dan tidak sembarangan melakukan pekerjaan.|"

      }

 }

  {

   "!bulan Februari*" {

   "4$nick, 7(6Bulan Februari7) 13*Mempunyai hati yang tulus*Perasaannya peka dan mudah tersinggung*Senang dipuji dan selalu*Menuruti apa yang diinginkannya*Suka humor dan hormat pada siapa saja*Keras hati dan mempunyai pendirian tetap*Agak pemalas dan suka mengingkari janji*" 

   }

 }



{ 

"!bulan Maret*" { 

"4$nick, 7(6Bulan Maret7) 13Mempunyai Watak: /Baik hati dan suka menolong sesama/Suka kehidupan yang serba wah/Seleranya tinggi/Tidak tegaan dan selalu memberi pada orang yang kesusahan/Agak pemalu, namun jujur dan tidak pernah bohong./Mudah terpengaruh dan tidak kuat menghadapi godaan./Suka melalaikan kesehatan dirinya sendiri./"  

}

 }  

{

 "!bulan April*" { 

"4$nick, 7(6Bulan ApriL7) 13Mempunyai Watak: /\Tidak mau mengalah dan selalu ingin menang sendiri/\Pembosan/\Senang dipuji/\Agak boros walau pandai mencari uang/\Mempunyai otak yang cerdas namun tidak suka diperintah/\Tak pernah memilih dalam berteman"  

}

 }

{

 "!bulan Mei*" { 

"4$nick, 7(6Bulan MeI7) 13Mempunyai Watak: /\Pandai menguasai perasaan/\Pandai mengambil hati orang lain/\Punya selera tinggi dan senang kehidupan yang serbah wah./\Senang menunda pekerjaan./\Agak boros walau rejekinya bagus/\ Tidak suka basa-basi dan tidak senang dipuji/\"  

}

 }

{

 "!bulan Juni*" { 

"4$nick, 7(6Bulan JuNi7) 13Mempunyau WaTaK: \/Romantis dan suka menolong\/Tidak mempunyai pendirian tetap\/Suka berpikir yang muluk-muluk\/Mudah tersinggung bila perasaanya tersentuh\/Agak pemalas dan baru mau bekerja bila di iming-iming hasil besar\/Selalu ceria walau hatinya sedang kesal.\/"  

}

 }

{

 "!bulan JuLi*" { 

"4$nick, 7(6Bulan JuLi7) 13Mempunyai WaTaK: ##Senang berkhayal#Kalau sudah marah, kata-katanya tajam#Tidak mempunyai pendirian tetap#Senang dipuji#Suka menolong pada sesama#Pandai bicara dan berotak cerdas#Agak pemalas##"  

}

 }

{

 "!bulan AgusTuS*" { 

"4$nick, 7(6Bulan AgUsTuS7) 13Mempunyai WaTaK @@Mempunyai perasaan yang peka/halus@Cepat tersinggung@Suka menghayal dan berpikiran yang muluk-muluk@Tidak mudah terpengaruh@Agak pemalas@Kalau bekerja lebih menuruti kehendak hatinya sendiri.@@" 

 }

 }

{

 "!bulan SeptemBeR*" { 

"4$nick, 7(6Bulan SeptemBeR7) 13$$Mudah tersinggung dan cepat naik darah$Baik hati dan jujur$Bisa menyimpan rahasia$Suka berfoya-foya$Pandai menyimpan uang namun tidak pelit$Suka menolong sesama dan pandai mendidik anak$$" 

 }

 }

{

 "!bulan oktober*" { 

"4$nick, 7(6Bulan OkToBeR7) 13Mempunyai WaTaK: -Berjiwa besar dan mau mengalah!Pandai bicara -Cerdas dan baik hati -Memiliki tekad yang kuat -Tidak sabaran dan agak boros -Pikirannya tidak tetap dan selalu berubah-ubah" 

 }

 }

{

 "!bulan NoVemBeR*" { 

"4$nick, 7(6Bulan NoVemBer7) 13MempUnyai WaTaK: -Tabah dan kuat dalam menghadapi segala cobaan -Pandai mengerjakan setiap pekerjaan -Pandai mengambil hati orang lain -Agak pemalas dan suka menunda pekerjaan -Banyak berpikir -Agak pendendam dan tidak mudah memberi maaf pada orang yang bersalah -Keras hati" 

 }

 }

{

 "!bulan DesemBeR*" { 

"4$nick, 7(6Bulan DeSemBer7) 13Mempunyai WaTaK: -Mudah menaruh rasa percaya pada orang lain -Kalau mengerjakan sesuatu suka tergesa-gesa -Tidak sabaran -Tidak mau mengalah dan selalu ingin menang sendiri -Mudah terpengaruh -Jujur dan baik hati -Pemborosan dan suka memaksakan kehendak"  

} 

}

{

"!hari Minggu" { 

"4$nick, 7(6Memiliki SiFaT7) 12Pandai bergaul, disukai orang banyak, berjiwa besar, suka merendahkan diri, pandai berbicara dan dapat mengatasi masalah yang dihadapiya dengan baik." 

}

 }

{

"!hari Senin" { 

"4$nick, 7(6Memiliki SiFaT7) 12Tidak pelit, ikhlas hati dalam memberi, tidak bisa menyimpan uang, senang membela kebenaran, mudah tersinggung dan tidak pandai bicara" 

} 

}

{

"!hari Selasa" { 

"4$nick, 7(6Memiliki SiFaT7) 12Mudah terpengaruh, tidak mempunyai pendirian tetap, gampang naik darah, tidak sabaran dan selalu mau menang sendiri." 

} 

}

{

"!hari Rabu" { 

"4$nick, 7(6Memiliki SiFaT7) 12Pendiam namun kalau sudah bicara tidak terduga, tidak suka mencampuri urusan orang lain, baik hati, suka menolong dan banyak rejeki."

 } 

}

{

"!hari Kamis" { 

"4$nick, 7(6Memiliki SiFaT7) 12Pendiriannya tidak tetap, suka dipuji, mudah emosi, mudah terbujuk oleh rayuan halus dan tidak sabaran." 

}

 }

{

"!hari Jum`at" { 

"4$nick, 7(6Memiliki SiFaT7) 12Disukai orang banyak, kuat mental, suka menolong, suka memberi nasehat yang baik dan suka mempelajari ilmu pengetahuan" 

}

 }

{

"!hari Sabtu" { 

"4$nick, 7(6Memiliki SiFaT7) 12Giat bekerja, rajin pandai mencarari rejeki, ditakuti orang banyak, pandai menempatkan diri dan bisa menyelesaikan apa yang menjadi tanggung jawabnya dengan baik." 

} 

}

{

"!mutiara" { 

"4$nick4: Agama tanpa ilmu adalah buta. Ilmu tanpa agama adalah lumpuh (Albert Einstein)" 

"4$nick4: Hidup biar beradab, bukan hidup untuk biadap (Al-Ghazali Bayruni)"

"4$nick4: Orang yang berjaya dalam hidup adalah orang yang nampak tujuannya dengan jelas dan menjurus kepadanya tanpa menyimpang (Cecil B. DeMille)"

"4$nick4: Semulia-mulia manusia ialah siapa yang mempunyai adab, merendahkan diri ketika berkedudukan tinggi,memaafkan ketika berdaya membalas dan bersikap adil ketika kuat (Khalifah Abdul Malik bin Marwan)"

"4$nick4: Life Is Choice, So Don`t Wasted Away (John F Kennedy)"

"4$nick4: Cakap sahabat yang jujur lebih besar harganya daripada harta benda yg diwarisi dari nenek moyang (Saidina Ali)"

"4$nick4: Selemah-lemah manusia ialah orang yg tak boleh mencari sahabat dan orang yang lebih lemah dari itu ialah orang yg mensia-siakan sahabat yg telah dicari (Saidina Ali)" 

"4$nick4: Keberanian yang sebenar ibarat layang-layang. Sentakan angin yang menentangnya bukan melemparkannya ke bawah, sebaliknya menaikkannya (John Petitsenn)" 

"4$nick4: Kurang semangat mengakibatkan lebih banyak kegagalan berbanding kurangnya kebijaksanaan atau kemahiran (Flower A. Newhouse)" 

"4$nick4: Manusia tidak merancang untuk gagal, mereka gagal untuk merancang (William J. Siegel)"

"4$nick4: Sesiapa yang tidak berfikir panjang, kesusahan telah bersedia di mukanya (Khong Hu Cu)" 

"4$nick4: Jagalah dirimu baik-baik, usahakanlah kemuliaannya, kerana engkau dipandang manusia bukan kerana rupa tetapi kesempurnaan budi dan adab (Nabi Muhammad SAW)"

"4$nick4: Anda mungkin ditipu jika terlalu mempercayai tetapi hidup anda akan terseksa jika tidak cukup mempercayai (Frank Crane)"

"4$nick4: ika anda bekerja semata-mata untuk wang, anda tidak akan menjadi kaya kerananya. Tetapi jika anda menyintai pekerjaan yang anda lakukan itu, kejayaan akan menjadi milik anda (Ray Kroc - Pendiri McDonalds)"

 }

 }

}



bind pubm - * pub_bulan



if {$master==1} {

}



proc pub_bulan {nick uhost hand chan arg} {

 global bulan bulan_chan botnick

 if {(([lsearch -exact [string tolower $bulan_chan] [string tolower $chan]] != -1) || ($bulan_chan == "*")) && (![matchattr $hand b]) && ($nick != $botnick)} {

  foreach i $bulan {

   if {[string match [string tolower [lindex $i 0]] [string tolower $arg]]} {

    putserv "PRIVMSG $chan :[subst [lindex [lindex $i 1] [rand [llength [lindex $i 1]]]]]"

   }

  }

 }

}





putlog "*** bulan Addon TCL by threenet Loaded!"