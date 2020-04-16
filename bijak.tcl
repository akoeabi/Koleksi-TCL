#########################################
# 			    						#
# ReLease Date   : 30 Januari 2010  	#                 
# 							   			#
# DediCateD      : Ukhuwahnet@DALnet	#
#                                   	#  
#########################################

##############################################
### Start configuring variables from here! ###
############################################## 

# Configuration settings:

# Owner
set bijak(owner) "abah" 

# location
set bijak(country) "Indonesia"
set bijak(state) "Makassar"

# Update
set bijak(update) "09.08.2010"

# Version
set bijak(version) "20.10"

# End configuration

# Perintah

bind pub o|o `bijakhelp bijakhelp
bind pub o|o `bijakstart bijakstart
bind pub o|o `bijakstop bijakstop
bind pub o|o `bijakchan bijakchan
bind pub o|o `bijaktimer bijaktimer
bind pub -|- `bijak randbijak
bind pub o|o `listtimer xlisttimer
bind pub o|o `killtimer xkilltimer
bind pub o|o `procrun xprocrun

set bijak_chans "*"
set bijak_time 3
set isplaying 1

proc bijakhelp {nick uhost hand chan text} {
  putserv "NOTICE $nick :`bijakstart, `bijakstop, `bijakchan \"#channel1 #channel2\", `bijaktimer <menit>"
}
proc bijakstart {nick uhost hand chan text} {
  global isplaying bijak_time
  if {$isplaying} {
    putserv "NOTICE $nick :already running"
  } else {
    set isplaying 1
    putserv "NOTICE $nick :is started"
  }
  if {$bijak_time < 1} {set bijak_time 3}
  timer $bijak_time bijak_speaks
}
proc bijakstop {nick uhost hand chan text} {
  global isplaying
  if {$isplaying} {
    set isplaying 0
    putserv "NOTICE $nick :is stoped"
  } else {
    putserv "NOTICE $nick :already stoped"
  }
    foreach t [timers] {
       if [string match *bijak_speaks* [lindex $t 1]] {
         killtimer [lindex $t end]
       }
    }    
}
proc bijakchan {nick uhost hand chan text} {
  global bijak_chans
  if {$text == ""} {
    putserv "NOTICE $nick :usage : `bijakchans \"#channel1 #channel2\" , current channel is $bijak_chans"
  } else {
    set bijak_chans $text
    putserv "NOTICE $nick :bijakchan set to : $bijak_chans"
  }
}
proc bijaktimer {nick uhost hand chan text} {
  global bijak_time
  if {$text == ""} {
    putserv "NOTICE $nick :usage : `bijaktimer <menit> , current timer is $bijak_time"
  } else {
    if {$text < 1} {set text 10}
    set bijak_time $text
    putserv "NOTICE $nick :bijaktimer set to : $bijak_time"
  }
}
proc xkilltimer {nick uhost hand chan text} {
  if { $text == "" } {
    putserv "NOTICE $nick :$nick, usage : `killtimer <timerid>"
  } else {
    killtimer $text
    putserv "NOTICE $nick :timer $text is killed."
  }
}
proc xlisttimer {nick uhost hand chan text} {
  putserv "NOTICE $nick :[timers]"
}
proc xprocrun {nick uhost hand chan text} {
  [$text]
  putserv "[$text]"
}

set bijak_msg {
{"Janganlah mencari Tuhan karena anda membutuhkan jawaban. Carilah Tuhan karena anda tahu bahwa Dia lah jawaban yang anda butuhkan."}
{"Sebenarnya Anda lebih berani dari yang anda duga, lebih kuat dari yang anda tahu, dan lebih pintar yang anda kira, namun itu semua tersembunyi dibalik diding tipis bernama keragu-raguan."}
{"Senyum mampu menyelesaikan banyak masalah, dan diam mampu membuat kita terhindar dari banyak masalah."}
{"Diam Bukanlah kelemahan, jika di iringi dengan perbuatan dan hasil nyata."}
{"Satu-satunya cara untuk melakukan pekerjaan besar adalah dengan mencintai apa yang Anda lakukan, walaupun sebenarnya anda membencinya."}
{"Harapan tinggallah harapan jika tidak disertai tindakan, impian tinggallah impian jka tidak selaras dengan kemampuan."}
{"Kelakukan kita terhadap kehidupan, menentukan sikap kehidupan terhadap kita."}
{"Matahari yang sebesar itu pun perlu bulan untuk bisa menerangi setiap sudut bumi."}
{"Hanya karena kamu mendengar apa yg dilakukan seseorang, tak berarti kamu bisa menghakiminya. Kamu tak tahu apa yg telah dilaluinya."}
{"Tidak seorang pun punya kemampuan untuk melakukan sesuatu hal sempurna, tapi setiap orang diberi banyak kesempatan untuk melakukan hal yang benar."}
{"Tinggalkanlah kesenangan yang menghalangi pencapaian kecemerlangan hidup yang diidamkan. Dan berhati-hatilah, karena beberapa kesenangan adalah cara gembira menuju kegagalan."}
{"Seseorang tak akan pernah bisa mencintai Anda dengan tulus dan apa adanya, jika Anda selalu menyembunyikan kekurangan Anda darinya."}
{"Hidup ini seperti piano.Berwarna putih dan hitam. Namun,ketika Tuhan yang memainkannya,Semuanya menjadi indah."}
{"Saat anda mendapatkan yang biasa ketika mendambakan yang terbaik, bersyukurlah, karena anda tidak mendapatkan yang terburuk."}
{"Dalam hidup, anda tak akan selalu mendapatkan apa yang paling anda inginkan, terkadang anda hanya mendapat pelajaran yang sebenarnya lebih anda butuhkan."}
{"Jika kamu meninggalkan seseorang, berikanlah alasan. Tak ada yg lebih menyakitkan daripada ditinggalkan tapi tak ada penjelasan."}
{"Jangan terlalu lama menangisi apa yg telah terjadi. Hal yg kamu tangisi saat ini mungkin hal yang akan kamu syukuri suatu saat nanti."}
{"Ketika anda tulus mencinta, tak akan pernah ada kata menyerah. Meski pikiran ingin berputus asa, namun hati tetap ingin mencoba."}
{"Melepaskan orang yang di cintai jauh lebih sulit dibanding menerima cinta yang baru bagi hatimu."}
{"Jika anda telah berusaha untuk mengubah sesuatu namun tetap tak berhasil, cobalah untuk mengubah pandangan anda."}
{"Setiap orang mempunyai kelebihan dan kekurangan. Fokuslah pada kelebihan kalian, jangan fokus pada kekurangan kalian."}
{"Waktu akan terasa lambat bagi mereka yang menunggu, terlalu panjang bagi yang gelisah, dan terlalu pendek bagi yang bahagia. Namun Waktu adalah keabadian bagi yang mereka mampu bersyukur."}
{"Keindahan sejati tak bisa dilihat oleh mata, hanya hati yang mampu merasakan keindahan sebenarnya."}
{"Tuhan telah memberikan kita Ikan, tinggal kita yang harus memgail untuk mendapatkannya."}
{"Pemenang bukannya tak pernah gagal, tetapi tidak pernah menyerah."}
{"Kemenangan adalah bagian terkecil dari sebuah pertandingan."}
{"Kekuatan bukanlah tentang memukul sekuat tenaga, tetapi tentang ketepatan sasaran."}
{"Anda harus jadi ulat terlebih dahulu jika ingin menjadi kupu-kupu."}
{"Mengucapkan Maaf hanya mampu dilakukan oleh orang-orang pemberani."}
{"Berbuat baik pada orang lain lebih sulit daripada berperang melawan penjajah."}
{"Saat kau berpikir tentang orang yang cantik dan tampan, pikirkanlah bahwa kau adalah bagian dari mereka."}
{"Berjalan lah seperti kau tak membutuhkan uang, mencintailah seperti kau tak pernah terluka, berdansalah seperti tak ada orang yang memperhatikan."}
{"Jika anda melalui hidup anda tanpa masalah, ketahuilah, anda melewatkan masa terindah hidup anda."}
{"Jika anda merasa tidak memiliki hal yang berharga, ketahuilah, anda memiliki hal yang tak ternilaikan, yaitu senyuman."}
{"Jangan terlemahkan oleh angin permasalahan. Layang-layang mampu terbang tinggi karena berani melawan angin. Hanya layang-layang yang putus benang yang hanyut oleh angin."}
{"Bicaralah dari hati dan dengan hati, karena hati bisa mendengar lebih tajam daripada telinga."}
{"Orang Bijak adalah orang yang menyimpan kebijakannya untuk dirinya sendiri."}
{"Setiap kejadian-kejadian kecil hidup kita adalah bagian dari harmoni total alam semesta, semuanya sudah ada yang mengatur dengan sempurna. Jalanilah hidup apa adanya."}
{"Jika anda merasa pendapat anda tidak didengar, ketahuilah, sebenarnya anda tengah belajar untuk menghargai."}
{"Bijaksana adalah kumpulan dari perjalanan hidup kita. Kebijaksanaan tidak bisa dicari, tidak bisa diberikan, dan tidak bisa dibagikan. Kebijaksaan adalah diri kita sendiri."}
{"Kebaikan adalah lebih penting daripada kebijaksanaan, dan menyadari hal ini adalah awal dari kebijaksanaan."}
{"Kebijaksanaan adalah pemahaman nilai-nilai abadi dan nilai-nilai hidup."}
{"Manusia seperti puluhan kolam, masing-masing memantulkan cahaya dari bulan yang sama."}
{"Masa-masa terbaik dalam hidup adalah saat kita mampu menyelesaikan masalah sendiri, Masa-masa suram kehidupan adalah saat kita menyalahkan orang lain atas masalah yang kita hadapi."}
{"Jangan takut akan bayangan, karena bayangan berarti ada suatu cahaya yang bersinar di dekatnya."}
{"Kebahagiaan adalah pengalaman spiritual dimana setiap menit hidup dilalui dengan cinta, dan rasa syukur."}
{"Sebenarnya sangatlah mudah menjadi Bahagia. Kebahagiaan akan datang saat kita memaafkan diri kita sendiri, memaafkan orang lain, dan hidup dengan penuh rasa syukur. Tidak pernah ada orang egois dan tidak tahu berterima kasih mampu merasakan bahagia, apalagi membuat orang lain bahagia. Hidup ini memberi, bukan meminta."}
{"Inti dari kebahagiaan adalah kumpulan kebahagiaan dari hal-hal kecil."}
{"Kesedihan adalah ibarat terdampar di gurun pasir. Hal terbaik adalah berusaha keluar dari gurun pasir tersebut."}
{"Keyakinan adalah percaya dengan apa yang tidak kita lihat, dan upah dari keyakinan adalah melihat apa yang kita yakini."}
{"Hidup adalah memilih, namun untuk memilih dengan baik, Anda harus tahu siapa Anda dan apa yang Anda perjuangkan, ke mana Anda ingin pergi dan mengapa Anda ingin sampai di sana."}
{"Melihat kebelakang akan membawa kejelasan di depan. Belajar dari kesulitan dulu akan membawa berkah sekarang dan nanti."}
{"Kegagalan adalah peluang untuk hal yang lebih baik. Kegagalan adalah batu loncatan untuk pengalaman yang berharga. Suatu hari nanti Anda akan bersyukur untuk beberapa kegagalan yang anda alami. Percayalah, ketika satu pintu tertutup untuk anda, sebenarnya pintu yang lain selalu terbuka."}
{"Tak perlu terlalu lama menangisi yang telah pergi, karena mungkin nanti kamu akan bersyukur telah meninggalkan yang kamu tangisi saat ini."}
{"Jika yg kamu cari belum kamu dapati, periksa kembali apa yg kamu cari. Karena apa yg kamu lihat tergantung dari apa yg kamu cari."}
{"Jangan pernah berhenti berharap. Karena kebahagiaan adalah milik mereka yg berharap, meskipun mereka pernah kecewa sebelumnya."}
{"Bermimpi adalah langkah awal mencapai keberhasilan. Tapi mimpi itu tetap semu, jika tindakan tidak nyata."}
{"Dlm cinta, temukan dia yg tak takut mengakui bahwa dia merindukanmu. Dia yg tahu kamu tak sempurna, tapi memperlakukanmu sempurna."}
{"Cinta adalah ketika kamu temukan seseorang yg bahkan tak sesuai dengan impikan, tp kamu tetap berkata, akhirnya aku menemukanmu"}
{"Jangan menunggu tuk katakan cinta, karena ketika dia tiada, tak peduli seberapa keras suaramu, dia tak akan mendengarmu."}
{"Ketika kamu tulus mencinta, tak peduli jika kamu membencinya, dia tetap selalu ada dalam pikiranmu sepanjang waktu."}
{"Faktanya, Lelaki selalu mampu menarik perhatianmu, tp jika kamu tak bisa jadi diri sendiri ketika bersamanya, dia bukan yg istimewa."}
{"Faktanya, Lelaki tak sungguh mencintaimu jika dia menghubungimu hanya ketika dia membutuhkan sesuatu."}
{"Terkadang, bukan karena dusta, kamu membenci seseorang, tapi karena sedih menerima kenyataan bahwa dia tak bisa lagi kamu percaya."}
{"Raih impianmu, bahkan jika dia terlalu jauh dr jangkauanmu. Kamu tak prnh tahu seberapa jauh kamu melangkah hingga kamu mencobanya."}
{"Hargailah mereka yg telah berkata jujur kepadamu, karena bagi beberapa orang, mereka lebih suka mengatakan apa yg ingin kamu dengar"}
{"Jangan biarkan dirimu terpaku dengan hubungan masa lalu, yg berakhir telah berakhir. Lebih baik temukan seseorang yg baru. MOVE ON !!!"}
{"Bebaskan dirimu dari belenggu masa lalu. Hiduplah hari ini tuk menciptakan masa depan yg lebih baik. Miliki hati, jadikan berarti."}
{"Salah satu hal terpenting dalam hidup adalah belajar bagaimana cara memberikan cinta yg tulus kepada orang lain."}
{"Terkadang kamu harus berpura-pura bahwa kamu tak peduli, karena kamu tak berarti apa-apa pada seseorang yg berarti segalanya."}
{"Semangat 45 menuju kampus baru tuk mencari gebetan, bisa langsung menjadi lesu ketika tahu mantan juga kuliah di situ."}
{"Hal menyedihkan ttng cinta yg berawal dari persahabatan adalah ketika cinta berakhir, dia akan menghancurkan persahabatan yg ada."}
{"Ketulusan cinta dan kasih sayang tidak dapat dilihat atau didengar, tetapi hanya bisa dirasakan dengan hati."}
{"Menjaga kata-katamu tidak semudah mengucapkannya. Membuktikannya? Itu cerita lain."}
{"Cinta bukanlah sebuah permainan. Cinta adalah perpaduan dua hati yg saling berjanji, meski pernah tersakiti, cinta tak akan pergi."}
{"MENCINTAI bukan bagaimana kamu MELIHAT tp bagaimana MERASAKAN. Bukan bagaimana kamu MENDENGAR tp bagaimana MENGERTI."}
{"Jangan menunggu waktu yg tepat tuk melakukan sesuatu. Hidup terlalu singkat tuk bertanya-tanya apa yg akan terjadi. JUST DO IT !!!"}
{"Dalam hidup ini, beberapa orang akan membencimu hanya karena kamu tak menunjukkan bahwa kamu menyukai mereka. So what? Ini hidupmu !!!"}
{"Cinta sejati adalah ketika dia yg kamu cinta tak lg mempedulikanmu, tp kamu masih menunggunya dgn setia."}
{"Jangan hiraukan dia yg membencimu. Terkadang dia membencimu hanya karena kamu tak memberi perhatian seperti yg dia inginkan."}
{"Menyakitkan tuk ucapkan selamat tinggal pd dia yg tak ingin kamu lepaskan, tp lebih sakit tuk bertahan jika dia memang ingin pergi."}
{"Sesuatu yg sangat sulit dimengerti bagaimana seseorang bisa menceritakanmu begitu banyak dusta, tapi tak pernah merasa bersalah."}
{"Hanya cinta yg bisa berikanmu bahagia, meski kadang buatmu terluka. Tp cinta begitu istimewa ketika kamu berikan pada dia yg setia."}
{"Doaku hari ini: Tuhan, beri aku kebahagiaan yg cukup tuk membuat ku tersenyum. Kebahagiaan yg mampu membuat aku bersyukur."}
{"Tuhan tidak pernah membiarkan hambanya terlarut dalam kesedihan, pasti ada rencana indah untuk membayar semua air mata."}
{"Setiap wanita harus tahu: Pria yg tulus mencintaimu, tak akan pernah biarkanmu pergi. Tak peduli apapun rintangannya."}
{"Pribadi yang baik bukan hanya pribadi yang berlaku baik, tetapi juga yang menghindari keadaan untuk diperlakukan dengan tidak baik."}
{"Terkadang kebahagian harus diraih dengan pengorbanan. Tetapi setiap pengorbanan belum tentu mendapatkan kebahagiaan."}
{"Belajarlah menjadi teman terbaik bagi diri sendiri, jangan sampai kamu menjadi musuh terburuk dirimu sendiri."}
{"Ketika orang lain melakukan kesalahan padamu, ingatkan dia, maafkan kemudian mohonkan ampunan Tuhan untuknya."}
{"Jika tak mampu membuatnya tertawa, cukuplah jangan membuatnya terluka. Mungkin itu sederhananya cinta."}
{"Dengan pernah mencintai orang yg salah adalah salah satu cara, kamu mendapati orang yg benar-benar mencintai kamu."}
{"Jangan tergantung pada orang lain. Ingat !!! Kamu adalah penentu kebesaran hidupmu sendiri, bukan mereka, bukan orang lain"}
{"Jgn biarkan org yg membencimu menyakitimu. Biarkan org yg mencintaimu memulihkanmu."}
{"Teman yang baik tak akan membiarkanmu melakukan hal bodoh ... sendirian !!!."}
{"Kadang kamu menjauh dari seseorang bukan karena kamu menghindarinya, tapi tuk melihat siapa saja yg cukup peduli tuk mendekatimu."}
{"Jangan pernah memandang rendah dirimu sendiri. Bagi Dunia kamu mungkin hanya seseorang, tapi bagi seseorang kamu mungkin dunianya."}
{"Dlm hidup, kamu harus ingat: kamu lebih berani dr yg kamu duga, lebih kuat dr yg kamu tahu, dan lebih pintar dr yg kamu pikirkan."}
{"Sesuatu yg menyedihkan ketika seseorang yg tak pernah kamu lupakan menyadari hadirmu hanya disaat dia membutuhkan sesuatu darimu."}
{"Org tdk berbohong krn mereka mencintaimu. Org berbohong krn mereka mencintai diri mereka sendiri."}
{"Dalam hidup, kamu tak hanya harus temukan dia yg mampu menyenangkan hatimu, tapi jg dia yg tak biarkan hatimu terluka."}
{"Jika cinta yg terucap berasal dari hati yg tulus, maka kamu akan memenangkan hati seseorang yg juga tulus mencintaimu."}
{"Sahabat sejati adalah mereka yg mengerti masa lalumu, percaya dengan masa depanmu, dan mereka yg menerima kamu apa adanya kamu."}
{"Lebih baik kamu mengubah hidupmu, sebelum hidupmu mengubahmu."}
{"Org yg membencimu sesungguhnya hny membenci dirinya sendiri. Ia membencimu krn menyadari bhw kau lbh baik darinya."}
{"Ketika kamu bertemu seseorang yg mampu menjadikanmu pribadi yg baik, tetaplah bersamanya. Karena sahabat sangat sulit tuk ditemukan."}
{"Persahabatan bukan ttng siapa yg datang lebih dulu, bukan siapa yg lebih lama kamu kenal, tapi mereka yg datang & tak pernah pergi !!!."}
{"Apapun yg terjadi sepanjang hari ini, yakinlah bahwa semua atas kehendak dan rencana Tuhan. Selamat malam, selamat beristirahat."}
{"Doaku hari ini: Tuhan, izinkan aku mendapatkan hasil terbaik atas semua usahaku, untuk kebaikan kehidupan aku dan keluargaku."}
{"Orang yg bersyukur akan tersenyum ceria pagi ini, orang yg tidak bersyukur akan mengeluh pagi ini. Kalau kamu yg mana ?."}
{"Kesalahan dan kegagalan dapat terjadi pada siapapun. Jangan habiskan waktumu hanya untuk menyesalinya, tapi belajarlah darinya."}
{"Percaya diri sendiri, meski mungkin saat ini kamu sedang bersedih. Karena penyemangat terbesar dalam hidupmu adalah dirimu sendiri."}
{"Kenyataan tak selalu sesuai dengan harapan, untuk itu bersiaplah dengan apapun kenyataan yang akan dan mungkin terjadi di hidupmu."}
{"Kebahagiaan bukan hanya pemberian Tuhan, melainkan kebahagiaan diperoleh dari perjuangan yang direstui oleh Tuhan."}
{"Ketika kamu mengatakan YA pada orang lain, pastikan kamu tak berkata TIDAK pada dirimu sendiri."}
{"Hidup akan lebih mudah jika kamu memutuskan tuk menikmati apa yg kamu miliki drpd menyesali apa yg telah terjadi."}
{"Menyedihkan ketika dia yg pernah jadi bagian penting dlm hidupmu, kini jadi seseorang yg tak kamu kenali lagi."}
{"Setiap masalah yang datang menyapa bukan untuk menjatuhkan, tetapi untuk menguji seberapa mampu kamu bertahan."}
{"Mereka yg berbahagia bukanlah mereka yg hidup tanpa masalah, tapi mereka yg terampil mengelola setiap masalah menjadi penuh hikmah."}
{"Wanita menangis bukan karena mereka lemah, namun karena telah lelah berpura-pura tersenyum meski hatinya terluka."}
{"Sahabat tak hanya bersama saat suka pun duka, tetapi sahabat harus mampu mengatasi setiap masalah bersama."}
{"Ladies, Faktanya, Lelaki sangat pintar dalam bermain kata. So, lebih baik kamu memperhatikan tindakannya."}
{"Dlm hidup, kamu mungkin mencintai orang yg salah, tapi kesalahan yg ada membantumu menemukan orang yg tepat."}
{"Perselisihan terjadi bukan krn adanya perbedaan, tapi krn ada pihak yg tak mendengarkan dgn baik, dan tak menghargai dgn sempurna."}
{"Wanita itu UNIK, mereka ingin kamu tahu bagaimana perasaannya, tapi mereka tak ingin mengatakannya padamu."}
{"Dlm hidup, kamu tak akan selalu dapatkan apa yg paling kamu inginkan, kadang kamu hanya mendapat pelajaran yg paling kamu butuhkan."}
{"Jika kamu meninggalkan seseorang, berikanlah alasan. Tak ada yg lebih menyakitkan daripada ditinggalkan tapi tak pantas penjelasan."}
{"Jangan pernah biarkan dirimu sendiri menilai rendah dirimu, bahkan ketika orang lain sedang menghakimi. Believe in Yourself !!!."}
{"Jangan terlalu lama menangisi apa yg telah terjadi. Hal yg kamu tangisi saat ini mungkin hal yg akan kamu syukuri suatu saat nanti."}
{"Masalah selalu ada, tapi seberapa besarnya masalah itu tergantung dari caramu melihatnya."}
{"Faktanya, Aku suka mendengarkan musik, karena ada saatnya mereka adalah kata yg ingin aku ucapkan ketika hati tak ingin berbicara."}
{"Faktanya, Aku ingin kamu tahu, kamu tak pernah gagal dalam membuat senyum indah di wajahku."}
{"Jgn mencari Tuhan krn kau membutuhkan jawaban. Carilah Tuhan krn kau tahu bhw Ia adl jawaban yg kau butuhkan."}
{"Kadang kamu harus korbankan cinta tuk selamatkan persahabatan, tp kdng kamu harus korbankan keduanya tuk selamatkan dirimu sendiri."}
{"Terkadang Tuhan membiarkan hal buruk terjadi dalam hidupmu agar kamu menyadari bahwa hanya DIA yg mampu menolongmu melewati hari."}
{"Jangan pernah menyerah. Dalam hidup ini tak ada yg benar-benar berakhir, karena apa yg berakhir adalah awal sesuatu yg baru."}
{"Jangan meyakinkan dirimu bahwa seseorang mencintaimu hanya karena dia bersikap baik padamu. Kadang dia tengah bosan ketika itu."}
{"Virgo menempatkan kejujuran di posisi teratas dan mereka akan berjuang utk visi dan misi hidup mereka."}
{"Doaku hari ini: Tuhan, ijinkan aku menjadi pribadi yang ikhlas serta selalu mensyukuri segala nikmat yang Engkau beri."}
{"Apapun yg kamu inginkan bisa kamu dapatkan, jika kamu dengan ikhlas bersedia membantu orang lain mendapat apa yg mereka inginkan."}
{"Tuhan hanya memberikan yg terbaik, meski kadang tak sesuai keinginan. Tapi percayalah, Tuhan punya rencana yg jauh lebih indah."}
{"Terlalu memikirkan masa lalu pun mencemaskan masa depan, dapat mengakibatkan kamu lupa bersyukur untuk hari ini."}
{"Jangan sesali apapun yg sudah terjadi, karena itu sudah berlalu. Ambil hikmahnya dan jangan ulangi kesalahan yg sama."}
{"Banyak orang tidak bisa menghargai orang lain hanya karena mereka tidak bisa menghargai dirinya sendiri."}
{"Beranilah untuk bermimpi, dan beranikan dirimu untuk mewujudkan semua impianmu. Karena impian tidak akan tercapai tanpa keberanian."}
{"Cinta itu bukan suatu hal yang bisa dijabarkan oleh kata-kata, tapi hanya bisa dijabarkan oleh hati."}
{"Seseorang akan mengerti apa arti DICINTAI setelah ia merasakan betapa perihnya DISAKITI."}
{"Dekatkan dirimu dengan Tuhan. Semakin dekat hidupmu dengan Tuhan, semakin terasa ringan beban hidupmu."}
{"Cinta tak pernah memandang harta ataupun jabatan, jika kita mendasarinya dengan ketulusan dan keiklasan."}
{"Bukan dengan KATA-KATA tapi dengan UPAYA yang dapat membuktikan sebuah kepercayaan."}
{"Seseorang takkan pernah memahami arti keberhasilan yang sempurna tanpa mengalami kegagalan sebelumnya."}
{"Dalam hidup, jangan pernah mendustai dirimu sendiri dengan berpikir sesuatu adalah milikmu, padahal kamu tahu itu bukan milikmu."}
{"Terkadang kita diberikan rasa kesepian yg mendalam, agar kita lebih menghargai indahnya kebersamaan."}
{"DIAM bukan berarti LEMAH. Kadang kita tahu apa yg harus dikatakan, tapi kita tak ingin melukai perasaan seseorang."}
{"Kamu harus menyadari bahwa ada orang tertentu yg tak bisa masuk ke dalam hidupmu, tak peduli seberapa besar kamu menginginkannya."}
{"Jangan pernah menyalahkan orang lain atas kesedihanmu, karena kebahagiaanmu adalah urusanmu. Kebahagiaanmu harus dari dalam dirimu."}
{"Faktanya, Aku kadang ingin berteriak apa yg kurasa tentangmu, tapi itu hanya menyakitiku. Karena semua orang akan mendengarnya, kecuali kamu."}
{"Faktanya, Aku bukannya tak peduli padamu, aku hanya berhenti menunjukkannya seperti yg kamu mau."}
{"Kadang kamu memilih tuk melepaskan dia yg kamu cinta, bukan karena kamu berhenti peduli, tp kamu berhenti memaksa dia tuk peduli."}
{"Tak seorang pun punya kemampuan tuk melakukan hal sempurna, tapi setiap orang diberi banyak kesempatan tuk melakukan hal yg benar."}
{"Hanya karena kamu mendengar apa yg dilakukan seseorang, tak berarti kamu bisa menghakiminya. Kamu tak tahu apa yg telah dilaluinya."}
{"Harapan tinggallah harapan jika tdk disertai tindakan,impian tinggallah impian jka tdk selaras dgn kemampuan."}
{"Ketika kamu tulus mencinta, tak akan pernah ada kata menyerah. Meski pikiran ingin berputus asa, namun hati tetap ingin mencoba."}
{"Melepaskan orang yg kamu cintai jauh lebih sulit dibanding menerima cinta yg baru yg asing bagi hatimu."}
{"Jika kamu telah mencoba untuk mengubah sesuatu tapi tetap tak berhasil, cobalah mengubah pandanganmu."}
{"Jgn mencintai seseorang yg tdk bs kau percaya. Percayailah seseorang yg kau cinta."}
{"Berhenti bertanya bagaimana cara mendapatkan apa yg kamu inginkan, karena jawaban yg kamu temukan hanyalah BERUSAHA."}
{"Dalam hidup, akan ada seseorang yg tak peduli betapa dia menyakitimu dan kamu membencinya, dia masih saja dicintai oleh hatimu."}
{"Banyak yang datang dan pergi dalam hidupmu. Dan itu berarti untuk setiap GOODBYE, seseorang yang lain akan datang dengan sebuah HELLO."}
{"Dari kegagalan kita dapat membaca apa yang salah dari diri kita. Berusaha dan berdoa hanya itulah kuncinya."}
{"Pria ingin menjadi cinta pertama seorang wanita. Wanita ingin menjadi cinta terakhir seorang pria. Betul, atau tidak ?."}
{"Jangan takut mencoba hal yang baru, gapailah impianmu. Tapi ingatlah, tak peduli kemana kamu pergi, KELUARGA tempat kamu kembali."}
{"Belajarlah mengucap syukur dari hal-hal baik di hidupmu. Belajarlah menjadi kuat dari hal-hal buruk di hidupmu."}
{"Tak ada yang sempurna, berhentilah mencarinya. Jika seseorang mengerti dan mencintai kamu apa adanya, kamu dan dia pantas bersama."}
{"Saat seorang wanita bersikap seakan ia tdk peduli lg padamu, saat itulah ia paling membutuhkan dirimu."}
{"Cinta yang kamu terima, sebanding dengan cinta yang kamu berikan. Cintai lebih jika ingin dicintai lebih."}
{"Menunggu pun meninggalkan itu menyakitkan. Tapi lebih menyakitkan ketika kamu tak mampu memilih antara menunggu atau meninggalkan."}
{"Aku sudah maafin kamu, tapi bukan berarti aku ingin kembali."}
{"Persahabatan bukan hanya tentang bagaimana kamu berkata kamu peduli, tapi juga tentang bagaimana kamu menunjukkan kamu peduli."}
{"Mengertilah terhadap keadaan setiap orang sebelum kamu ingin dimengerti oleh orang lain."}
{"Lakukan segala sesuatu dengan Ikhlas dan teliti, sebelum kau menyesal karena segalanya tak dapat diubah lagi."}
{"Gunakan syukur ketika kamu dicintai, dan gunakan sabar ketika kamu dibenci. Jangan ada sesal, jangan ada sebal."}
{"Keberanian diperlukan untuk berdiri dan berbicara. Keberanian juga diperlukan untuk duduk dan mendengarkan."}
{"Senyum adalah cara untuk menyelesaikan banyak masalah, dan diam adalah cara untuk menghindari banyak masalah."}
{"Teman sejati adl mereka yg selalu ada di sisimu bkn hanya pd saat kau berjaya, namun jg pd saat kau tak berdaya."}
{"Miliki mimpi apapun, dan jangan ragu tuk berusaha mewujudkannya. Masa depan adalah milik mereka yang percaya pada keindahan impian."}
{"Gunakan syukurmu, dan buang keluhmu dalam menghadapi setiap cobaan, karena cobaan yang kamu alami adalah sebagai proses pemuliaan."}
{"Doaku hari ini: Tuhan, jangan biarkan rasa cintaku kepadaMu tergantikan oleh perasaan cintaku kepada mahluk ciptaanMu."}
{"Ketika seseorang yg sangat berarti pergi, jangan terus bersedih. Kamu akan kehilangan dirimu dan lupa bahwa kamu jg sangat berarti."}
{"Ketika kamu tulus mencinta, kamu akan lakukan apapun tuk melihatnya bahagia, bahkan jika itu berarti mengorbankan kebahagianmu jga."}
{"Sesuatu yg sulit ketika tahu bahwa kamu harus melepaskan, karena cinta tak terbalaskan, tp kamu tetap berharap sebuah keajaiban."}
{"Kadang kamu menjauh dari seseorang, bukan berarti kamu tak memikirkan dia, tapi kamu tahu bahwa kamu tak mungkin bisa bersamanya."}
{"Tak perlu banyak kata utk menunjukan kau peduli, karena trkadang diam-mu adl cara trbaik u/ mnunjukan kepedulianmu."}
{"Peluh yang menetes ketika kau mencari nafkah, akan terbayar dengan nikmat dan berkah yang kau makan."}
{"Jangan katakan sulit. Ketahuilah; tidak ada yang sulit bila dikerjakan dengan sepenuh hati."}
{"Taburlah sebanyak mungkin kebaikan. Sebab, buahnya akan sangat mendamaikan."}
{"Mengapa harus marah, ketika ruang MAAFKAN masih tersedia ?."}
{"Sebab, setiap perbuatan baik akan ada ganjarannya. Biarkan sang waktu yang menjawab."}
{"Menyelesaikan permasalahan dengan emosi/kemarahan hanya akan menimbulkan permasalahan lainnya."}
{"Secara tidak sadar, dengan kejujuran; kamu telah menyelamatkan dirimu sendiri."}
{"Kebohongan hanyalah ketenangan sesaat. Dan bila tidak diselesaikan, akan menjadi kegelisahan seumur hidup."}
{"Tegap langkahmu dalam mengahadi kerasnya kehidupan tidaklah cukup tanpa disertai tegapnya iman."}
{"Hidup menawarkan begitu banyak pilihan. Pilih serta jalani yang terbaik, dan menjadi seorang pemenang !."}
{"Jangan remehkan hal-hal sepele. Sebab, dari sinilah hal-hal besar biasanya terwujud."}
{"Sakit dlm perjuangan itu hanya sementara. bisa semenit/setahun. namun jika menyerah rasa sakit itu akan terasa selamanya."}
{"Mereka yang menyambut tantangan, adalah mereka yang memberi ruang pada impian tuk menjadi kenyataan."}
{"Seorang yang cerdik adalah dia yang memanfaatkan setiap peluang yang ada."}
{"Kamu adalah seorang yang istimewa. Kamu hanya tidak menyadarinya, atau mungkin belum menyadarinya."}
{"Seseorang menangis, bukan karena ia lemah. tetapi karena dia sudah terlalu lama KUAT."}
{"Secara tidak sadar, seseorang yang menyakitimu hanya akan membuatmu semakin kuat !!!."}
{"Jangan rendahkan dirimu untuk mendapatkan sesuatu, tapi rendahkan hatimu untuk berikan sesuatu."}
{"Mereka yang menyambut tantangan, adalah mereka yang memberi ruang pada impian tuk menjadi kenyataan."}
{"Ketika seseorang melukaimu, janganlah bersedih Karena Tuhan selalu menitipkan penyembuh buatmu."}
{"Dalam duka pasti ada suka. Jangan menyerah; karena dengan putus asa kita tidak lebih dari pecundang."}
{"Dosa kita kepada yang Maha Kuasa hanya taubat jawabannya, dosa kita kepada sesama berminta maaf penawarnya."}
{"Kasih yang ditabur kepada sesama, kelak akan membuahkan kebahagiaan"}
{"Akan lebih baik jika mengatakan Aku akan berusaha selalu, daripada Aku akan selalu."}
{"Kekurangan ialah kelebihan yang tertutupi. Tidak ada yg perlu ditutup, tetapi cukup membukanya."}
{"Tidak perlu berusaha tuk menjadi oranglain. Sebab, kamu adalah istimewa, dan lebih baik dari mereka."}
{"Ketika kamu menuliskan kekesalan, ketika itu; kamu hanya akan membuat dirimu mengesalkan."}
{"Kemampuan terbaikku adalah cara berpikirku. Kemampuan terbaikmu adalah cara berpikirmu."}
{"Jauh lebih lega jika kamu telah jujur mengungkapkan rasa kepada dia yg kamu cinta daripada memendamnya dalam hati."}
{"Motivasi adalah kekuatan untuk terus maju menerjang semua rintangan yg ada tuk meraih apa yg kita inginkan."}
{"Jangan terburu buru nanti akan berakibat malu, haraplah sabar biar jangan dikatakan orang bar bar."}
{"Jangan awali hari dengan penyesalan hari kemarin, karena akan menggangu hebatnya hari ini, dan akan merusak indahnya hari esok."}
{"Doaku hari ini: Tuhan, tetapkan aku dalam keimanan yang kokoh, datangkanlah kebaikan dan jauhkanlah segala keburukan."}
{"Berusahalah untuk tidak menghitung kesulitan, karena jika kamu terlalu sering menghitungnya, kemudahan akan terlihat biasa saja."}
{"Jangan terlalu memaksakan diri untuk melakukan segalanya dengan benar, karena kadang kesalahan membuatmu pribadi yang lebih baik."}
{"Doaku hari ini: Tuhan, terima kasih masih memberiku kesempatan untuk menikmati indahnya pagi. Berikan aku kebijaksanaan menjalani hari ini."}
{"Cinta butuh waktu untuk tumbuh dan berkembang. Maka bersabarlah, jangan memaksa. Sabar akan membuat cintamu dewasa."}
{"Cinta dan kesetiaan teruji ketika jarak dan waktu memisahkan. Dan hanya kepercayaanlah yang mampu mempertahankannya."}
{"Rencana Tuhan selalu berakhir dengan kebaikan. Dan jika yang kamu dapatkan belum baik, maka itu bukanlah akhir."}
{"Dengan selalu berupaya menjadi orang baik dan melakukan yang terbaik, maka kebaikan akan selulu berada disekitarmu."}
{"Sampai kapanpun, kamu tak akan pernah temukan cinta, jika yang kamu cari adalah kesempurnaan."}
{"Perbedaan tak seharusnya membuatmu berpisah, karena perbedaan menyadarkanmu bahwa kalian saling membutuhkan dan bisa saling melengkapi."}
{"Tak perlu kesempurnaan untuk bisa berbahagia. Karena bahagia sesungguhnya adalah ketika kamu melihat apapun secara sempurna."}
{"Tak perlu menunggu dicintai untuk kemudian mencintai, tapi mulailah untuk mencintai maka kamu akan dicintai dan disayangi."}
{"SULIT untuk jadi orang yang dicintai, butuh pengorbanan, namun jika kamu bersama orang yang tepat, segalanya akan menjadi MUDAH !!!."}
{"Jangan berubah hanya karena ingin dicintai seseorang. Jadilah dirimu sendiri dan seseorang akan mencintai kamu apa adanya."}
{"Terkadang lebih baik merelakan dan biarkan Tuhan yang menentukan. Hanya Tuhan yang mampu menyelesaikan berbagai masalah hidupmu."}
{"Hny butuh 1 tangan utk meraih, 2 tangan utk menggenggam. Hny butuh 1 hati utk mencintai, 2 hati utk memaknai."}
{"Setiap orang memerlukan dorongan dan pujian untuk tumbuh. Jangan cepat mencela. Ingat, kamu dapat mengkritik tanpa harus mencela !!!."}
{"Pikirkan sebelum memutuskan. Karena terkadang, yang kamu benci belum tentu buruk, pun yang kamu suka belum tentu baik."}
{"Jangan memulai sesuatu yang tak ingin kamu selesaikan. Jangan menghentikan sesuatu yang belum kamu selesaikan."}
{"Percaya pd Tuhan saat semua terasa mudah, itu biasa. Percaya pd Tuhan saat semua terasa susah, itu luar biasa."}
{"Hal pertama yg perlu diingat untuk menjadi sukses: lakukan segala sesuatu dari hati."}
{"Org menyebut Karma itu jalang. Kau menyebutku Jalang. Mungkinkah itu berarti aku adl Karma-mu."}
{"Terkadang cinta memang begitu menyakitkan, tapi karena cinta juga, kamu selalu temukan dirimu tersenyum tanpa alasan."}
{"Ketika dia yg kamu cinta meninggalkanmu, jangan gunakan matamu menangisi dirinya. Lebih baik gunakan tuk mencari dia yg lebih baik."}
{"Hidup ini indah. Dan akan lebih indah jika mau bisa membuat orang yang kamu sayangi berbahagia."}
{"Terkadang kamu harus menjauh dari seseorang. Jika dia peduli, dia akan menyadari. Jika tidak, kamu tahu bagaimana menjalani hari."}
{"Hidup akan selalu indah meski seberapapun beratnya masalah jika kamu tetap berbuat baik."}
{"Tak ada alasan untuk tidak mensyukuri nikmat Tuhan. Dengan bersyukur, hidup akan terasa lebih indah."}
{"Napasmu kini, adalah hembusan terakhir orang lain. Jadi berhentilah mengeluh. Belajarlah tuk jalani hidupmu dgn apa yg kamu miliki."}
{"Jangan pernah berhenti bermimpi, karena mimpi memberi asa dan harapan dalam menjalani kehidupan."}
{"Kata TIDAK BISA, akan membuatmu berhenti berusaha. Kata BISA akan membuatmu berusaha meski hasil akhir belum tentu. SEMANGAT !!!."}
{"Sahabat adalah mereka yg bisa melihat kamu terluka dari matamu, ketika orang lain percaya dengan senyum di wajahmu."}
{"Jangan remehkan diri sendiri. Tak seorangpun yg biasa-biasa saja. Yg ada hanya mereka yg tak menyadari betapa luar biasanya mereka."}
{"Perubahan slalu datang dari dalam ke luar. Ubah dirimu dahulu supaya km dapat mengubah hidupmu."}
{"Tak ada yg tak mungkin selama kamu yakin. Jangan pernah ragu dengan kemampuan yg ada. Berusaha dan berdoa. I'Mpossible !!!."}
{"Seseorang tak akan pernah bisa mencintaimu dengan tulus dan apa adanya, jika kamu selalu menyembunyikan kekuranganmu darinya."}
{"Hidup ini adalah pilihan yg kamu putuskan. Jika kamu tak ingin terlihat bodoh, jangan lakukan hal yg bodoh."}
{"Cowok bisa menjanjikanmu seribu kata. Pria berkomitmen kepadamu tanpa sepatah kata."}
{"Kadang kamu harus dengarkan kata hati. Jangan tanyakan siapa yg kamu cintai, tapi tanyakan siapa yg buatmu bahagia dan dihargai."}
{"Hanya karena kamu pernah gagal, tak berarti kamu takut mencoba. Percayalah, bahagia pasti datang pada mereka yg tak pernah menyerah."}
{"Jika kamu belum temukan seseorang yg tepat tuk hidupmu, bersabarlah. Tuhan menunggu waktu yg tepat tuk tempatkan dia dalam hidupmu."}
{"Sesuatu yg baik mendapat teman baru, tapi tak berarti teman lama dilupakan. Karena teman lama yg selalu ada disaat kamu butuh."}
{"Berusahalah untuk menjadi pribadi yang baik. Tapi jika kamu merasa telah baik, tak ada alasan yang memperbolehkanmu untuk sombong."}
{"Mencinta adalah membahagiakan satu sama lain, bukan menuntut satu pihak untuk membahagiakan pihak lain."}
{"Hidup tak akan indah jika semua sama. Dan perbedaan adalah untuk saling melengkapi, bukan untuk saling membenci."}
{"Sahabat adalah seseorang yang selalu ada ketika kita ingin berbagi cerita, memberi perhatian ketika kita membutuhkan."}
{"Tuhan Maha Penyayang, Tuhan Maha Penolong. Tapi pertolongan Tuhan tak akan datang dengan sendirinya, kamu harus tetap berusaha."}
{"Semua kesempatan ada di depan mata. Singkirkan segala rasa takut! Hadapi segala rintangan, untuk menuju keberhasilan."}
{"Apa yg kamu ucap, itu yg akan terjadi. Jika kamu berucap TIDAK BISA, maka kamu tak akan bisa, jika berucap BISA, kamu pasti bisa."}
{"Kadang, meskipun kamu yakin telah melupakannya, sebuah LAGU mampu membawa semua kenangan indah bersamanya kembali ke pikiranmu."}
{"Bahagia tak berarti kamu memiliki segalanya. Itu hanya berarti apapun yg kamu miliki, kamu tak pernah lupa tuk mensyukurinya."}
{"Tuhan punya 3 cara tuk jawab doamu: 1. YA, Dia berikan maumu. 2. TIDAK, Dia berikan yg lbh baik. 3. TUNGGU, Dia berikan yg terbaik."}
{"Ketika seseorang jatuh cinta padamu, ada dua hal yg sangat berarti baginya. 1. Segala yg kamu katakan. 2. Segala yg kamu lakukan."}
{"Cinta itu antara DUA hati, namun selalu ada yg tak pintar menghitung dan merusak rasa di antaranya."}
{"Jangan menyerah hanya karena sesuatu tak berjalan sesuai rencana. Sesuatu yg berarti tak akan dengan mudah kamu miliki."}
{"Jangan remehkan dirimu sendiri, ada seseorang yg merasa hidupnya lebih bahagia hanya karena senyummu hari ini."}
{"Hal buruk selalu terjadi dalam hidup. Orang akan menyakitimu, namun itu bukan alasan kamu tuk balas menyakiti."}
{"Kadang apa yg tak kamu inginkan adalah hal yg terbaik bagimu. Tuhan memiliki perspektif terbaik, Percayalah !!!."}
{"Mereka yg membenciku selalu memotivasiku. Mereka yg mencintaiku selalu menginspirasiku."}
{"Sesuatu yg ironis ketika seseorang yg mengajarkanmu tentang cinta adalah seseorang yg paling menyakitimu."}
{"Cinta itu seperti air. Dibutuhkan semua orang, cuma-cuma, tapi banyak orang yang tidak menghargainya."}
{"Ketika kamu merasa tak diperhatikan, itu bukan karena dia tak cinta, kadang dia tak tahu cara menunjukkannya."}
{"Berusahalah tuk bersabar dengan segala hal. Namun yg terpenting adalah bersabar dengan dirimu sendiri."}
{"Apa yg kau inginkan tak selalu kau dapatkan, tp Tuhan selalu beri yg kau butuhkan, kadang lebih dr yg kau bayangkan."}
{"Tuhan telah memberikan kenikmatan yg lebih dari cukup. Berhentilah mengeluh. Semakin disyukuri akan terasa nikmatnya."}
{"Sebuah hubungan akan terasa indah jika kedua pasangan bisa saling menerima, bukan menuntut untuk sempurna."}
{"Jangan tangisi keadaan, tangisilah harapan yang tak kau perjuangkan."}
{"Jika kamu ingin bahagia, jangan biarkan masa lalu mengusikmu. Kamu boleh melihat ke belakang, namun jangan membawanya kembali !!!."}
{"Sebagai Pemberi kamu patut ucapkan TERIMAKASIH pd yg kau beri, sebab tanpa Penerima kau takkan mgkn bisa jd Pemberi."}
{"Jangan pernah menangis jika kamu kalah, karena kekalahan mengajarkanmu bagaimana cara untuk menang."}
{"Memiliki banyak mimpi, dan berusaha agar mimpi menjadi nyata. Jangan hanya memjadi pemimpi, tapi jadilah pribadi yang penuh aksi."}
{"Kamu tak dapat mengubah masa lalu yang buruk, tapi kamu bisa mempersiapkan masa depan agar lebih baik."}
{"Doaku hari ini: Tuhan, terima kasih Engkau masih memberiku kesempatan menikmati akhir pekan ini. Berkatilah mereka yang kusayangi."}
{"Ketika kamu mencintai seseorang, jadilah alasan mengapa dia tersenyum, bukan alasan dia terluka dan akhirnya takut tuk mencinta."}
{"Menyedihkan ketika kamu akhirnya memberi hatimu pd dia yg berjanji tuk merawatnya, tapi dia mengembalikannya dlm keadaan terluka."}
{"Menyakitkan ketika dia buatmu merasa begitu istimewa, lalu buatmu penuh tanda tanya, dan kamu hanya bisa pura-pura tak ada apa-apa."}
{"Sulit tuk menunggu sesuatu yg kamu tahu tak akan mungkin terjadi, tapi lebih sulit menyerah ketika itu hal yg paling kamu inginkan."}
{"Seseorang harus pantas air matamu sebelum kamu menangis untuknya. Dia harus pantas cintamu sebelum kamu jatuh cinta padanya."}
{"Menyakitkan ketika melihat dia yg pernah kamu cinta mulai berubah, tapi lebih menyakitkan ketika kamu mengingat dirinya yg dulu."}
{"Dalam hidup, jangan pernah melakukan sesuatu yg menyenangkan, tapi kamu tahu pada akhirnya hanya memberimu kesedihan."}
{"Kamu tak bisa memilih dgn siapa kamu jatuh cinta. Meskipun tahu tak seharusnya mencintai dia, kadang kamu tetap akan mencintainya."}
{"Cinta adalah ketika dia tahu bahwa kamu pribadi yg sulit tuk didekati, tapi tak pernah menyerah tuk ingin jadi bagian hidupmu."}
{"Kamu tak akan pernah temukan apa yg kamu cari dalam cinta, jika kamu tak mencintai dirimu sendiri."}
{"Lebih baik bahagia jadi dirimu sendiri drpd mendustai dirimu tuk menyenangkan orang lain, tapi buatmu tak bahagia seumur hidupmu."}
{"Jika dia terus menyakiti, kamu harus membiarkannya pergi. Kamu tak akan temukan dia yg tepat, jika kamu masih bersama dia yg salah."}
{"Setiap orang menginginkan apa yg tak bisa mereka miliki. Tapi jika kamu mencintai apa yg kamu punya, kamua tak butuh yg lainnya."}
{"Ketika tulus, kamu akan selalu ingat dirinya. Dan meski kamu dan dia akhirnya berpisah, kamu tak pernah menyesal telah mengenalnya."}
{"Hidup ini bukan tentang kesalahan yg telah kita buat, tap tentang pelajaran yg kita dapat dan menyadari kita selalu punya sahabat."}
{"Apa yg dilakukan seseorang mungkin tak SELALU berimu kebahagiaan. Tapi ingatlah, tak ada kebahagiaan jika tak ada yg dilakukan."}
{"Cinta bisa membuatmu takut kehilangan seseorang, meskipun kamu tahu bahwa dia bahkan bukan milikmu."}
{"Dalam hidup, syukuri apa yg kamu miliki sebelum dia pergi, karena begitu dia pergi, dia mungkin tak akan kembali."}
{"Seseorang yg mencintaimu, takkan prnh kehabisan alasan utk mempertahankanmu & takkan mencari alasan utk melepaskanmu."}
{"Jgn bandingkan masalahmu dgn orang lain. Masalahmu slalu lbh besar. Bandingkan dgn Tuhan. Tuhan slalu lbh besar."}
{"Jangan pernah meremehkan kekuatan doa. Tuhan selalu mendengarnya, dan percayalah bahwa kekuranganmu tak akan jadi penghalangmu."}
{"Jika kamu tak menghargai dirimu sendiri, pun orang lain tak akan pernah menghargaimu. Jangan sampai kehilangan dirimu yg berharga."}
{"Sukses adalah pilihan. Mulailah hari dengan memutuskan, kemudian lanjutkan dengan tindakan. Selamat beraktivitas !!!."}
{"Doaku hari ini: Tuhan, berikan aku kekuatan untuk bisa menghadapi segala rintangan, beri aku semangat untuk mengejar keberhasilan."}
{"Guys,,, jika seorang yang telah menghancurkan hatimu, jangan biarkan dia menghancurkan juga hidupmu."}
{"Jangan tempatkan hatimu di tangan seseorang, hingga kamu yakin bahwa dia tahu bagaimana cara tuk menggenggamnya dengan erat."}
{"Dia yg mampu bersyukur dengan apa yg dia miliki, adalah dia yg selalu mampu temukan bahagia dalam dirinya sendiri."}
{"Jangan remehkan dirimu sendiri. Jadikan kekuranganmu sebagai motivasi tuk terus belajar menjadi pribadi lebih baik setiap hari."}
{"Kita dinilai dari yg kita ucapkan. Karena apa yg keluar dari mulut kita, mencerminkan apa yg ada didalam isi hati kita."}
{"Sblm kau bertindak, pikirkan. Sblm kau bicara, dengarkan. Sblm kau menghakimi, pahami. Sblm kau melupakan, maafkan."}
{"Jangan terus berharap pada dia yg telah pergi. Buktikan hidupmu lebih baik dan bahagia tanpa dirinya."}
{"Hanya karena kamu tengah mengalami hari yg buruk, tak berarti kamu harus merusak harinya orang lain."}
{"Kendalikan perasaanmu sebelum perasaanmu mengendalikanmu."}
{"Miliki hati yang tulus, hindari perasaan cemburu, jika kamu tak bisa menerima dirimu, tak ada orang lain yg akan melakukannya."}
{"Bantulah sahabatmu dengan apa yg kamu bisa, dengan ikhlas tanpa membenci, karena kita hidup untuk saling mengasihi."}
{"Bertindaklah dengan niat baikmu itu. Sekecil apapun tindakan akan sangat berarti dibandingkan hanya diam dan menunggu."}
{"Manusia diberikan kemampuan untuk memilih. Tentukan pilihan dengan hati dan logika, kemudian jalani tanpa penyesalan."}
{"Ikhlaslah menjalani hari ini, karena Kedamaian hati dan ketentraman jiwa bersumber dari keikhlasan."}
{"Setiap orang berbeda, kamu harus menghargainya. Perbedaan itu indah, tapi kamu tak harus menyukai semuanya."}
{"Kamu pribadi yg dewasa jika kamu menolak tuk menyakiti mereka yg buatmu terluka, meski kamu punya kekuatan tuk melakukannya."}
{"Kau bs tersenyum kpd semua temanmu. Tp hanya tmn sejatimu yg dpt membedakan senyumanmu yg asli & yg palsu."}
{"Terkadang butuh sebuah jarak yg cukup jauh tuk buat kamu menyadari betapa seseorang sangat berarti dalam hidupmu."}
{"Kadang seseorang terus mencari bahagia dgn menunjukkan dia tak bahagia. Jika kamu bertemu dengannya, kenalkan dia pada CINTA."}
{"Selalu ada sebuah alasan tuk apa yg terjadi dalam hidupmu. Yang terpenting adalah kamu bisa belajar dan mengambil hikmahnya."}
{"Jangan memohon pada Tuhan tuk beri apa yg kamu inginkan. Berdoalah pada Tuhan tuk beri apa yg pantas kamu dapatkan."}
{"Hati-hatilah dalam berkata, perasaan bisa terluka. Lidahmu begitu dekat dgn otakmu, jangan biarkan mulutmu mengabaikan pikiranmu."}
{"Lebih mudah memaafkan sakit yg diberi oleh dia yg tak menyukaimu, daripada memaafkan luka yg diberi oleh dia yg mencintaimu."}
{"Salah satu pemberian terbaik Tuhan pada kita adalah MUSIK, karena dengannya kita mampu mengekspresikan emosi yg ada."}
{"Dalam hidup, semakin kamu mampu memahami dirimu sendiri, semakin kamu mengerti apa yg mungkin membuat orang lain tersakiti."}
{"Apapun yg terjadi, Tuhan punya rencana besar untukmu. Percayalah, Dia tak akan buatmu terluka. Segalanya akan indah pada waktuNya."}
{"Hidup ini bukan tentang menyenangkan mereka yg menyukaimu, tapi tentang menyenangkan Tuhan dan menjadi seseorang yg Dia inginkan."}
{"Jangan menghindari sesuatu, karena kamu tak memahami hal itu. Jangan takut mencoba, jadikan dirimu lebih baik dari sebelumnya."}
{"Hargai dan nikmati setiap momen dalam hidup ini. Jangan biarkan dirimu menyesal ketika semua itu tinggal kenangan."}
{"CINTA adalah bahasa yg digunakan oleh semua orang, tapi hanya bisa dimengerti oleh HATI."}
{"Tak perlu menjadi 'NUMBER ONE' di mata dia yg kamu cinta, karena yg kamu butuh adalah menjadi 'ONLY ONE' di hatinya."}
{"Menjadi dirimu sendiri itu tidak mudah, tetapi menjadi orang lain yg bukan dirimu itu tidak mungkin."}
{"Pasti ada masalah dalam setiap cinta, tapi akan terasa indah jika dua hati terus berjuang tuk mempertahankannya."}
{"Berterima kasihlah kepada orang yg telah mengecilkan kita, sebab karena mereka kita belajar menjadi orang yg kuat."}
{"Kadang Tuhan menggunakan rasa sakit tuk mengingatkanmu, mengoreksimu, mengarahkanmu, dan menyempurnakan hidupmu !!!."}
{"Jika kamu tak mampu menerima kekalahan, maka kamu tak akan mampu merayakan kemenangan."}
{"Masalah tidak akan menjadi rumit jika kita bisa menyikapinya dengan baik dan dengan kelapangan hati."}
{"Setiap perbuatan yang membahagiakan sesama adalah suatu sikap yang mencerminkan pribadi yang mulia."}
{"Dengan semangat kita pasti bisa. Bersemangatlah dengan hati dan logika, agar semangat kita tetap dijalan kebenaran."}
{"Tersenyumlah dalam mengawali hari, itu menandakan kalau kita siap menghadapi hari dengan penuh semangat."}
{"Alangkah indah jika setiap menit yg kamu habiskan menjadi berarti. Berarti untuk orang lain dan diri sendiri."}
{"Tak seorangpun dalam hidup ini sangat kuat. Semua orang merasa kesedihan, tapi terkadang seseorang mampu pura-pura tersenyum."}
{"Ketika terluka, kadang butuh lebih dari sekedar membalikkan halaman tuk mulai lembaran baru. Kadang kamu harus menutup buku !!!."}
{"Melangkah ke depan tak berarti kamu telah lupa semua kenangan bersamanya. Kamu ingat, hanya saja tak berarti apa-apa lagi bagimu."}
{"Terkadang wanita memilih tuk sendiri, bukan karena menunggu dia yg sempurna, tapi karena mereka butuh dia yg tak pernah menyerah."}
{"Cinta sejati adalah ketika kamu harus merelakan dia pergi. Meski tahu dia tak akan kembali, tapi kamu tahu dia selalu ada di hati."}
{"Lupakan dia yg pernah meninggalkanmu demi yg lain. Meski cinta, jangan biarkan dirimu kembali terluka tuk alasan yg sama."}
{"Kadang seseorang akan selalu ada di hatimu, meski tak dalam hidupmu. Berdamailah, jangan sampai hal itu mengusik jalan hidupmu."}
{"Jika seseorang tak menyadari apa yg dia punya ketika memilikimu, kamu sebaiknya tak bersama mereka. Sadari, kamu itu berarti !!!."}
{"Tak ada yg sempurna, tp Tuhan telah persiapkan seseorang yg sempurna hanya tuk dirimu. Sabar dan persiapkan dirimu tuk menyambutnya."}
{"Dalam hidup, tak penting siapa yg menyukai atau membencimu, karena yg terpenting adalah Tuhan mencintaimu."}
{"Hidup ini pilihan, apapun yg membuatmu sedih, tinggalkan. Dan apapun yg membuatmu tersenyum, jangan lepaskan !!!."}
{"Berhenti berusaha menjadi yg sempurna hanya demi dia yg kamu puja. Dicintai karena apa adanya dirimu, jauh lebih berharga."}
{"Jangan pernah biarkan seseorang menjadi segalamu, karena ketika dia pergi meninggalkanmu, kamu tak memiliki apapun."}
{"Tidak ada yg tidak mungkin, kalau kamu percaya dan disiplin utk meraihnya."}
{"Apa yang mendekatkanmu kepada Tuhan adalah apa yang Tuhan dekatkan padamu."}
{"Ada sahabat sejati, ada yg palsu. Ada sahabat untuk selamanya, ada yg untuk sementara. Km slalu punya semuanya."}
{"Ketika dia yg berarti pergi dari hidupmu, percayalah, itu hanya cara Tuhan mempertemukanmu dgn seseorang yg lebih baik."}
{"Ikhlaskan dan fkuskan pd klebihanmu.Jadikan emosi itu motivasi utk lbih baik."}
{"Bersyukurlah,krn kpahitan ms lalu mberimu ksmpatan untk mjd kuat dan bijak."}
{"Hidup terlalu singkat tuk terus mengenang cinta di masa lalu, ketika kamu bisa menciptakan cerita baru dgn dia yg kini mencintaimu."}
{"Kesedihan bukan untuk diratapi, tapi merupakan panggilan jiwa untuk introspeksi diri dan berbuat yang lebih baik lagi."}
{"Jika kamu ingin disayang, dihargai, pun dihormati, lakukan itu sekarang, jangan tunggu orang lain melakukannya terlebih dahulu."}
{"Jika kamu tak ingin dirugikan, disakiti, dijelekan pun direndahkan, jangan pernah kamu lakukan itu pada siapapun."}
{"Tak perlu mempermasalahkan masa lalu, baik pun buruk semua telah berlalu. Tiada guna cemburu pada masa lalu."}
{"Berserah bukan berarti menyerah. Tetapi sabar menunggu hasil setelah melakukan semua upaya terbaik."}
{"Hanya dengan niat dan keinginanlah yang akan membawamu menuju cita-cita yang kamu impikan."}
{"Doaku hari ini: Tuhan, hilangkan kebencian dalam hati orang-orang yg aku sayangi. Aku ingin disayangi, sebagaimana aku menyayangi."}
{"Dalam hidup, akan selalu ada orang yg tak menyukaimu, namun itu bukan urusanmu. Lakukan apa yg kamu anggap benar dan ENJOY."}
{"Sulit tuk ucapkan selamat tinggal pada dia yg kamu cinta, tapi lebih sulit lagi ketika kenangan bersamanya tak hilang begitu saja."}
{"2 alasan mengapa seseorg tdk menyukaimu: 1.Kau menikmati hidupmu, 2.Ia tdk menikmati hidupnya."}
{"Jangan berubah tuk menyenangkan seseorang. Berubahlah karena buatmu pribadi yg lebih baik dan bawamu ke masa depan yg lebih baik."}
{"Terkadang, orang yg paling kamu inginkan adalah orang yg membuat hidupmu tak begitu banyak sedih jika tanpanya."}
{"Air mata adalah satu2nya cara bagaimana mata berbicara ketika bibir tak mampu menjelaskan apa yg telah membuat perasaanmu terluka."}
{"Ketika tulus, kamu tak akan menyesali pernah mencintai seseorang, tapi kamu mungkin menyesal telah percaya dia mencintaimu jg."}
{"CINTA slalu SETIA pd HATI, tak peduli betapa hebat LOGIKA. Tp kamu harus tahu kapan tuk gunakan logika agar hatimu tak trs TERLUKA."}
{"Jangan takut mencinta, hanya karena pernah terluka. Cinta sejati tak datang begitu saja, tp melalui proses sedih dan tawa bersama."}
{"Dalam hidup, jangan terlalu berharap, karena untuk setiap 'Hello' akan selalu berakhir dengan sebuah 'Goodbye'."}
{"Semua orang melakukan salah, kamu harus cukup dewasa tuk memaafkannya, tapi kamu selalu bisa memilih tuk tak lagi mempercayainya."}
{"Terkadang, seseorang lebih memilih tuk tersenyum, hanya karena tak ingin menjelaskan mengapa dia bersedih."}
{"Kadang, kamu rindu seseorang, bukan karena lama tak bertemu, tp karena apapun yg kamu lakukan, kamu berharap dia ada di sampingmu."}
{"Ketika seseorang hanya diam atas pertanyaanmu, itu karena mereka sulit mengakuinya atau karena terlalu sakit tuk kamu tahu."}
{"Berhenti mencari seseorang yg sempurna tuk dicintai, lebih baik belajar dan persiapkan diri menjadi seorang yg pantas tuk dicintai."}
{"Jangan pernah ucapkan selamat tinggal jika masih ingin mencoba. Jangan pernah katakan tak cinta jika masih mengharapkannya."}
{"Jika kamu tulus mencintanya, jangan pernah hiasi matanya dgn air mata, telinganya dgn dusta, dan hatinya dgn luka."}
{"Salah satu bentuk penghargaan terhadap hidup kita adalah dengan menghargai hidup orang lain."}
{"Ketika jatuh cinta, jangan berjanji tak saling menyakiti, namun berjanjilah tuk tetap bertahan, meski salah satu tersakiti."}
{"Jadilah pribadi yang bijak. Ketahui apa yang harus dihindari dan apa yang harus diberikan perhatian penuh."}
{"Kesalahan adalah pengalaman hidup, belajarlah darinya. Jangan mencoba tuk menjadi sempurna. Cobalah menjadi teladan bagi sesama."}
{"Kita tidak sendirian dalam gelap, jalan kita akan terungkap saat kita bergerak."}
{"Seorang pemenang yg sesungguhnya adalah ketika dia mampu melawan amarahnya dgn kesabarannya,dan memaafkan dgn ketulusan."}
{"Jangan menunggu waktu yang tepat untuk melakukan sesuatu, karena waktu tidak akan pernah tepat bagi mereka yg menunggu."}
{"Jangan pernah meremehkan kemampuanmu. Jika kamu menyadari betapa kuatnya pikiranmu, kamu tak akan pernah berpikir tuk menyerah."}
{"Saat kamu terjatuh, tersenyumlah. Karena orang yg pernah jatuh adalah orang yg sedang berjalan menuju keberhasilan."}
{"Apapun yg terjadi, jangan dijadikan beban. Berserah diri sepenuhnya pada Tuhan, dan yakin Tuhan telah merencanakan yg terbaik."}
{"Doaku hari ini: Tuhan, terima kasih atas pagi ini. Aku mohon Engkau menjauhkan segala petaka yg mungkin akan menimpaku."}
{"Org yg pantas kamu tangisi tdk akan membuatmu menangis, & org yg membuatmu menangis tdk pantas kamu tangisi."}
{"Tidak pernah ada kata terlambat untuk memulai. Begitu juga untuk mengakhiri."}
{"Sahabat slalu ada untukmu, ketika kamu punya masalah. Bahkan terkadang memberi saran yg bodoh hanya tuk lihat kamu tertawa."}
{"Air mata tak selalu menunjukkan kesedihan, terkadang karena kita tertawa bahagia bersama sahabat terbaik kita."}
{"Senyumlah, tinggalkan sedihmu. Bahagialah, lupakan takutmu. Sakit yg kamu rasa, tak setara dengan bahagia yg akan kamu dapat."}
{"Percayalah, hari ini akan lebih indah daripada kemarin jika kita mengawalinya dengan doa dan senyuman."}
{"Sukses tak akan datang bagi mereka yg hanya menunggu tak berbuat apa-apa, tapi bagi mereka yg selalu berusaha wujudkan mimpinya."}
{"Sahabat tak akan menghilang saat masalah datang, tapi menggandeng tanganmu dan menghadapinya bersama-sama."}
{"Hal mudah akan terasa sulit jika yg pertama diipikirkan adalah kata SULIT. Yakinlah bahwa kita memiliki kemampuan dan kekuatan."}
{"Setiap masalah pasti bisa dibicarakan. Beda itu wajar asal jgn saling menyakiti. Mari bersama rasakan DAMAI."}
{"Tdk ada org yg dpt menyakitimu, kecuali mereka yg benar2 kau peduli, atau mereka yg tdk benar2 peduli padamu."}
{"Ketika hidup memberi kata TIDAK atas apa yg kamu inginkan, percayalah, Tuhan selalu memberi kata YA atas apa yg kamu butuhkan."}
{"Kesalahan hanya membuatmu dewasa. Senyuman mampu meringankan luka. Sahabat akan selalu ada di saat kamu membutuhkannya."}
{"Kamu tak akan bisa hidup sendiri. Butuh bantuan orang lain. Pastikan bahwa mereka adalah orang yg dapat kamu andalkan."}
{"Jangan menyerah atas impianmu. Impian memberimu tujuan hidup. Ingatlah, sukses bukan kunci kebahagiaan. Semangat !!!."}
{"Jangan iri atas kesuksesan orang lain, ketahuilah bahwa mereka berada di sana karena tekad dan kerja keras."}
{"Sahabat adalah mereka yg membantumu bangkit tuk percaya diri, ketika org lain berusaha menjatuhkan dan meremehkanmu."}
{"Berhenti menyalahkan masa lalu, cobalah untuk menerimanya dan memahami bahwa itu hanya buatmu lebih kuat dan dewasa."}
{"Sukses berarti melakukan yg terbaik yg kita bisa dengan apa yg kita miliki. Bukan dengan menginginkan apa yg orang lain miliki."}
{"Jangan melihat masa lalu lebih baik dari saat ini, karena hanya buatmu sulit temukan bahagia tuk dirimu sendiri. Just Be Happy."}
{"Kamu tahu kamu jatuh cinta, ketika pupil matamu membesar saat melihat si dia."}
{"Jangan pernah biarkan kesedihan di masa lalu membuatmu takut tuk menerima seseorang yg baru. Percayalah kata hatimu."}
{"Wanita sulit jatuh cinta, karena lebih baik menunggu pria setia daripada menerima yg datang, tapi bisa pergi kapan saja."}
{"Jangan terburu-buru dalam cinta. Lebih baik menunggu seseorang yg tepat bagi hidupmu selamanya daripada hanya sementara."}
{"Jika dia memilih tuk tinggalkanmu, jgn memohonnya bertahan. Jika dia tak bisa terima kamu apa adanya, temukan seseorang yg bisa."}
{"Jika kamu biarkan masa lalu mengusik hidupmu saat ini, kamu tak akan pernah bisa berikan yg terbaik tuk dapat masa depan yg baik."}
{"Belajarlah dari mereka di atasmu. Nikmati hidup bersama mereka di sampingmu. Jangan remehkan mereka di bawahmu."}
{"Kadang kamu terlalu memikirkan indahnya masa lalu hingga menutup diri saat ini. Lupakan mereka, temukan bahagiamu."}
{"Kita tdk bs mencegah atau menghapus perasaan. Kita hanya bs mengendalikannya, atau dikendalikan olehnya."}
{"Masa lalu memang menyimpan banyak kenangan, namun itu bukan alasan tuk tak terus melangkah ke depan."}
{"Banyak hal dalam hidup ini yg bisa membahagiakanmu, namun tak ada yg lebih bahagia daripada cinta dari seseorang yg kamu cintai."}
{"Jangan pernah menyerah! Jika Tuhan belum menjawab doamu, itu karena Tuhan punya rencana yg lebih baik tuk hidupmu."}
{"Jgn berpikir kamu tak mampu hidup tanpa dia yg meninggalkanmu. Percaya, ada seseorang yg lebih baik menunggu tuk buatmu bahagia."}
{"Ketika seseorang meminta maaf atas sesuatu yg TERUS mereka lakukan, sebaiknya kamu berhenti mempercayai mereka."}
{"Jangan pernah berikan harapan jika kamu tak mampu memenuhinya. Lebih baik jujur meski pilu daripada bahagia tapi palsu."}
{"Selamat pagi nusantara.. Awali pagi hari dengan doa dan harapan, bukan dengan keluhan atau makian."}
{"Peraturannya sederhana: Jika dia tak membuatmu lebih baik tapi lebih buruk, biarkan dia pergi."}
{"Menyakitkan ketika kamu menyadari bahwa selama ini kamu dibodohi oleh seseorang yg tulus kamu cintai."}
{"Dalam hidup, ada beberapa orang yg tak akan pernah mampu berhenti mencintai seseorang. Tak peduli betapa keras mereka mencobanya."}
{"Hidup ini kamu yg jalani, lakukan apapun yg ingin kamu lakukan, tapi pastikan itu sebuah cerita yg kelak pantas tuk diceritakan."}
{"Jangan tangisi sebuah perpisahan. Suatu hari kamu akan berterimakasih, karena hal itu telah menjadikanmu pribadi yg lebih baik."}
{"Terkadang, seseorang sulit tuk jatuh cinta, karena ketika dia telah memberikan seluruh hatinya, dia tak dapatkan kembali seutuhnya."}
{"Tak perlu kata untuk ungkapkan rasa. Karena senja, cukup membaca mata."}
{"Meski tak dicintai oleh dia yg kamu cinta, tak berarti kamu merasa tak berarti. Hargai dirimu dan temukan seseorang yg tahu itu."}
{"Hidup bukan tentang seberapa besar kesalahanmu di masa lalu, tapi tentang bagaimana kamu memperbaiki diri dan kuat menjalani hari."}
{"Hidup terlalu singkat tuk mencemaskan hal kecil. Nikmati apa yg kamu miliki hari ini, bukan apa yg mungkin kamu miliki esok hari."}
{"Jangan berubah hanya karena ada yg tak menyukaimu. Jadi dirimu sendiri, akan selalu ada seseorang yg menyayangimu apa adanya."}
{"Jangan sesali apa yg telah pergi, kamu mungkin kehilangan sesuatu yg baik, api kamu juga mungkin mendapatkan sesuatu yg lebih baik."}
{"Ketika ragu menghampiri, ikuti kata hati. Beri pertanyaan, temukan sebuah jawaban. Belajarlah tuk mempercayai hati."}
{"Jika kamu tak mampu menghargai dirimu sendiri, tak ada orang yg mampu menghargaimu. Terima dirimu apa adanya. Jadi dirimu sendiri."}
{"Ketika kamu terluka, jangan menyerah. Tak perlu takut akan sakit yg ada, karena takkan kamu temukan cinta sejati tanpanya."}
{"Ketika hidup buatmu tanpa kata, sebuah pelukan kan membantumu temukan makna. Karena kadang pelukan mampu berkata yg tak terucap."}
{"Hargai orang lain, siapapun itu, dan jangan pernah menaruh dendam kepada siapapun. Isi setiap harimu dengan kebaikan."}
{"Meski perih terasa menghadapi kesalahan yg belum dimaafkan. Tuhan baik pada yg membutuhkan. Tuhan baik pada yg terluka."}
{"Jangan kamu berikan air matamu jika dia sedang menangis, tapi berikanlah pundakmu agar dia merasa nyaman."}
{"Ketika kamu sangat sakit, jangan alihkan pehatian. Rasakan sakit itu, karena kesakitan adalah pembelajaran dan pendewasaan."}
{"Seorang pemenang yg sesungguhnya adalah ketika dia mampu melawan amarahnya dgn kesabaran. Memaafkan dgn ketulusan."}
{"Tuhan maha penyayang, maha pengasih. Hanya Tuhan tempat kembali, hanya Tuhan yg mampu mengembalikan kesedihan menjadi kebahagiaan."}
{"Dibalik setiap rasa sakit, Tuhan pasti telah mempersiapkan hadiah terindah. Untuk itu, perpikir positif atas apapun yg kamu alami."}
{"Luka di tubuh dapat cepat sembuh, tapi luka di hati tidak bisa sembuh dalam hitungan hari, hanya keikhlasan yang mampu mengobati."}
{"Dalam hidup, akan ada seseorang yg meski telah menyakitimu, kamu tetap bertahan dan berharap dia akan sadar & akhirnya berubah."}
{"Hidup ini terlalu singkat tuk menghabiskan waktumu mencemaskan apa yg orang lain pikirkan tentang dirimu. Jadi dirimu sendiri."}
{"Kamu tak selalu dapat apa yg kamu inginkan, tapi jika kamu berusaha sebaik mungkin, kamu pasti dapat apa yg kamu butuhkan."}
{"Terkadang rencana Tuhan tak dapat dimengerti, tp bukan berarti rencana-Nya adalah rencana yg buruk."}
{"Menyerah tak berarti lemah, kamu cukup kuat melepaskannya. Kamu mungkin teteskan air mata, tapi itu agar hatimu tak terus terluka."}
{"Ketika kamu mencintai, jujurlah pada diri. Jadi diri sendiri, jangan biarkan seseorang jatuh cinta pada orang yg bukan dirimu."}
{"Teman sejati bknlah yg bs membuat semua masalahmu menghilang, tp yg tdk akan menghilang saat kau memiliki masalah."}
{"Hidup penuh pilihan. Apa yg kamu pilih hari ini akan menentukan masa depanmu. Pilihlah yg membuatmu jadi pribadi yg lebih baik."}
{"Tuhan selalu berikan yg terbaik. Ketika kamu merasa ditinggalkan, percayalah, Dia mempersiapkan sesuatu yg lebih baik untukmu."}
{"Dalam hidup, kadang meskipun kamu cukup baik tuk memaafkan seseorang, kamu juga harus cukup pintar tuk tak mempercayainya lagi."}
{"Seseorang terlihat kuat, tak berarti dia tak pernah bersedih. Dia bersikap seperti tak ada yg salah, tapi mungkin hatinya terluka."}
{"Hal menyakitkan ketika tahu seseorang tak mencintaimu adalah bahwa dia menghabiskan begitu banyak waktu berpura-pura mencintaimu."}
{"Jangan berjanji bahwa kamu selalu bisa mengatasi masalah sahabatmu, berjanjilah bahwa dia tak akan menghadapinya sendirian."}
{"Jangan hiraukan mereka yg berbicara buruk di belakangmu, karena merekalah yg bodoh menghabiskan waktunya memikirkan tentangmu."}
{"Tak ada yg tak mungkin selama kamu yakin. Selalu berikan yg terbaik yg kamu bisa dengan apa yg kamu punya. Semangat."}
{"Dalam hidup ini, kamu mungkin tak cukup baik bagi semua orang, namun kamu akan selalu jadi yg terbaik di mata sahabatmu."}
{"Tidak pernah ada waktu yang tepat untuk patah hati dan tidak ada waktu yang salah untuk jatuh cinta."}
{"Tidak pernah ada berbohong untuk kebaikan. Hanya ada berbohong untuk kebaikan dirimu sendiri."}
{"Apapun yg terjadi dalam hidupmu, percayalah, segalanya dlm rencana Tuhan, dan yakinlah akan selalu baik pada akhirnya."}
{"Ambil pelajaran dari masa lalu, tinggalkan sisanya. Jangan biarkan belenggu kesedihan menutup jalanmu menuju masa depan."}
{"Ingatlah, apapun yg menjadi perkataan dan tindakanmu, kamu harus bertanggung jawab atas resiko dari perkataan dan tindakanmu itu."}
{"Dia yg mengeluh adalah dia yg tak pernah bisa bersyukur, padahal tanpa ia sadari, karunia dari Tuhan telah ia nikmati setiap hari."}
{"Menjadi sabar dan ikhlas memang tak mudah, tapi itu harus. Belajarlah untuk menerima arti kehilangan dan penantian."}
{"Jadikan kepedihan masa lalu sebagai pelajaran menuju yang lebih baik. Awali dengan niat dari hati untuk mengakhiri kepedihan itu."}
{"Pintu kebahagiaan selalu terbuka didepan mata, tapi kerap kali tidak terlihat karena kamu tidak menutup pintu kesedihan masa lalu."}
{"Kemarin adalah sejarah. Hari ini adalah anugerah. Lupakan hari kemarin, jangan sia-siakan hari ini, untuk hari esok yg lebih baik."}
{"Doaku hari ini: Tuhan, terima kasih atas semua yang telah Kau berikan, maaf jika perkataan dan perbuatanku belum baik."}
{"Kadang kamu harus melepaskan seseorang, bukan karena kamu tak cinta, tapi karena kamu lebih mencintai dirimu yg terus terluka."}
{"Hanya karena pernah terluka, tak berati kamu harus takut mencinta. Ada seseorang yg tepat untukmu diluar sana. Percaya."}
{"Kamu tak akan pernah tahu jika kamu tak mencobanya. Berikan mereka kesempatan hingga mereka memberimu alasan tuk melupakannya."}
{"Cinta sejati tak memiliki akhir yg bahagia, karena ia tak pernah berakhir. Melepaskan hanya salah satu cara tuk katakan 'I LOVE YOU'."}
{"Lalu aku mulai mencintaimu, melupakan waktu, sesederhana itu."}
{"Jangan terus tangisi sesuatu yg bukan milikmu lagi. Kamu tak akan temukan bahagia jika kamu tak mampu bertahan dari sebuah luka."}
{"Jatuh cinta padamu adalah hal terbaik kedua yg pernah terjadi dalam hidupku. Yg pertama? Aku menemukanmu."}
{"Sahabat adalah mereka yg tahu ketika kamu bersedih atau terluka, bahkan jika kamu menyembunyikan semua di balik sebuah senyuman."}
{"Jadilah pribadi yg bahagia dengan kehidupanmu sendiri. Manfaatkan dirimu tuk jadi pribadi berprestasi. Percaya dirimu."}
{"Jika kita bersikap baik pd org yg tdk bersikap baik kpd kita, itu bkn disebut kemunafikan. Itu disebut kedewasaan."}
{"Cinta memang sesuatu yg sangat indah, tapi kadang cinta juga memberikan kesedihan yg dalam ketika tanpa rasa percaya."}
{"Tak perlu yg sempurna tuk hidupmu. Carilah seseorang yg bangga & bahagia memilikimu, yg akan lakukan apapun tuk hanya bersamamu."}
{"Jangan pernah lelah melakukan hal kecil tuk orang lain. Terkadang, hal kecil ini mampu berikan bahagia yg indah di hati mereka."}
}

if {![string match "*bijak_speaks*" [timers]]} {
 timer $bijak_time bijak_speaks
}
proc bijak_speaks {} {
 global bijak_msg bijak_chans bijak_time
 if {$bijak_chans == "*"} {
  set bijak_temp [channels]
 } else {
  set bijak_temp $bijak_chans
 }
 foreach chan $bijak_temp {
  set bijak_rmsg [lindex $bijak_msg [rand [llength $bijak_msg]]]
  foreach msgline $bijak_rmsg {
   puthelp "PRIVMSG $chan :[subst $msgline]"
  }
 }
 if {![string match "*bijak_speaks*" [timers]]} {
  timer $bijak_time bijak_speaks
 }
}

proc randbijak {nick uhost hand chan text} {
 global bijak_msg notc
  set bijak_rmsg [lindex $bijak_msg [rand [llength $bijak_msg]]]
  foreach msgline $bijak_rmsg {
   puthelp "PRIVMSG $chan :$nick, [subst $msgline]"
  }
}

putlog "TCL Name : TCL Kata Bijak edited by $bijak(owner) $bijak(country) $bijak(state) $bijak(version) $bijak(update)"
putlog "Running : Server $network"
putlog "Mailto : abah@ukhuwah.net"
putlog "Loaded Status : Success ...!!!"