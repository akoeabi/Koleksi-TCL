bind pub - !bank pub_bank
proc pub_bank {nick uhost hand channel arg} {
  global bank symbolbank botnick
  if {($arg == "") || ([llength $arg] > 1) || ([string length $arg] <4)} {
    putserv "NOTICE $nick :Correct usage: !bank <cc number>"
    putserv "NOTICE $nick :      Example: !bank [lindex $symbolbank [rand [llength $bank]]]"
    return 0
  }
  set kepala [string range $arg 0 0]
  set arg [string range $arg 0 3]

  set this [lsearch -exact $symbolbank [string trimleft [string toupper $arg] .]]
  if {$this > -1} {
    putserv "NOTICE $nick :[string trimleft [string toupper $arg] .] :: [lindex $bank $this]"
    return 1
  } else {
    if {$kepala == 3} {
	putserv "NOTICE $nick :$arg :: American Express ::phone:: 800-528-4800"
	return 0
    }
    if {$kepala == 4} {
	putserv "NOTICE $nick :$arg :: Visa Cards ::phone:: 800-847-2750"
	return 0
    }
    if {$kepala == 5} {
	putserv "NOTICE $nick :$arg :: MasterCard ::phone:: 800-622-7747"
	return 0
    }
    if {$kepala == 6} {
	putserv "NOTICE $nick :$arg :: Discover ::phone:: 800-347-2683"
	return 0
    }
    putserv "NOTICE $nick :Error :: Gak Ada"
    return 0
  }
}

set bank {
 "American Express ::phone:: 800-528-4800"
 "American Express ::phone:: 800-528-4800"
 "American Express ::phone:: 800-327-2177"
 "American Express ::phone:: 800-528-4800"
 "American Express ::phone:: 800-327-2177"
 "American Express ::phone:: 800-528-4800"
 "American Express ::phone:: 800-635-5955"
 "American Express ::phone:: 800-528-4800"
 "American Express ::phone:: 800-528-4800"
 "AT&T Universal Card ::phone:: 800-852-8880"
 "Security Bank and Trust ::phone:: not found"
 "Bank of America ::phone:: 800-622-0789"
 "Bank of America ::phone:: 800-622-0789"
 "First Cincinatti ::phone:: not found"
 "Navy Fed. Credit Union ::phone:: 800-336-3333"
 "Security Pacific ::phone:: 213-763-6400"
 "Bank of America ::phone:: 800-622-0789"
 "Cal. 1rst Union Bank ::phone:: 800-230-4922"
 "American Savings and Loan ::phone:: not found"
 "Westside Auto Empl. Fed. ::phone:: not found"
 "Manny Hanny(mass+8+6483355) ::phone:: 800-648-9911"
 "Atlantic Financial ::phone:: 800-556-5678"
 "USAA Federal Savings ::phone:: 800-922-9092"
 "Citibank Classic ::phone:: 800-843-0777"
 "State Street Bank ::phone:: not found"
 "1rst Interstate ::phone:: not found"
 "Great America 1st Sav. ::phone:: not found"
 "Bank One of Columbus ::phone:: not found"
 "Norwest Banks ::phone:: not found"
 "Marine Midland ::phone:: 800-435-4350"
 "Chase Manhattan ::phone:: 800-842-8403"
 "Chase Lincoln First Classic ::phone:: 800-242-7325"
 "Chase Lincoln First Classic ::phone:: 800-242-7325"
 "American Savings and Loan ::phone:: not found"
 "Core State ::phone:: not found"
 "Nat. Westminster Bank ::phone:: 800-527-0086"
 "jkjjj cago ::phone:: not found"
 "`irst Omni ::phone:: not found"
 "Great Western ::phone:: not found"
 "Citibank Prefered ::phone:: 800-843-0777"
 "First Union of Florida ::phone:: not found"
 "HHBC ::phone:: not found"
 "VNB ::phone:: not found"
 "Irvine Bank ::phone:: not found"
 "HHB ::phone:: not found"
 "Imperial Savings ::phone:: not found"
 "Manufacture Hanover Trust ::phone:: not found"
 "Security Pacific ::phone:: 800-553-7762"
 "Gold Dome ::phone:: 800-334-1601"
 "Cal. Fed. Sav./Loan ::phone:: not found"
 "North Carolina Nat. ::phone:: not found"
 "West Side Auto Union ::phone:: not found"
 "Bank One of Dayton ::phone:: not found"
 "Bank One of N.Y. ::phone:: 800-942-1977"
 "Bank One of Columbus ::phone:: not found"
 "Unisys Fed. Cred. Union ::phone:: not found"
 "Sumitomo Bank ::phone:: 818-912-2501"
 "Cal. First Interstate ::phone:: 714-980-3509"
 "Melon Bank of Delaware ::phone:: 302-995-5769"
 "Cal. First Interstate ::phone:: 714-980-3509"
 "Bank of Hoven ::phone:: not found"
 "Citibank ::phone:: 800-843-0777"
 "1st Interstate ::phone:: not found"
 "Western Savings Az. ::phone:: not found"
 "Merrill Lynch Bank & Trust ::phone:: not found"
 "FootHill Independent ::phone:: not found"
 "Citibank Maryland Nat. ::phone:: not found"
 "G.M.A.C. Fed. Cred. union ::phone:: not found"
 "L.A. Fed. Cred. Union ::phone:: not found"
 "First Bankcard ::phone:: not found"
 "Milage Plus United ::phone:: not found"
 "Wells Fargo ::phone:: 800-642-4720"
 "TRW Sys. Fed. Credit Union ::phone:: not found"
 "Bank of Hawaii ::phone:: not found"
 "San Bernd. County Cent. CU ::phone:: not found"
 "GE Capitol ::phone:: not found"
 "GE Capitol ::phone:: not found"
 "Village Bank of Cincinatti ::phone:: not found"
 "Citizen's Bank ::phone:: 800-645-7420"
 "Associates Financial Corp ::phone:: not found"
 "Wells Fargo ::phone:: 800-642-4720"
 "Bank of LA. ::phone:: not found"
 "Guardian Trust of Canada ::phone:: not found"
 "Feather River State Bank ::phone:: not found"
 "Bank of Montreal ::phone:: not found"
 "Security Pacific ::phone:: 800-553-7762"
 "Chemical ::phone:: not found"
 "San Diego 1rst Interstate ::phone:: not found"
 "First Trust Bank ::phone:: 714-983-0511"
 "Torrance Savings ::phone:: not found"
 "Marine Midland ::phone:: 800-435-4350"
 "Manufacturer's Hanover Trust ::phone:: not found"
 "Golden Pacific Bank ::phone:: 714-983-4600"
 "Bank of California ::phone:: 818-965-0881"
 "Vineyard National Bank ::phone:: 800-241-0177"
 "Upland Bank ::phone:: 714-946-2265"
 "Rancho Bank ::phone:: 818-915-1966"
 "Coldwell First Interstate ::phone:: not found"
 "1rst Nat. Sav. Bank ::phone:: 714-982-4016"
 "Hunington Bank ::phone:: not found"
 "Guardian Trust of Canada ::phone:: not found"
 "Virginia Nat. Bank ::phone:: not found"
 "Chevy Chase Fed. Savings ::phone:: 800-553-1401"
 "Bank of America ::phone:: 800-622-0789"
 "Chemical ::phone:: not found"
 "First Interstate of Neb. ::phone:: not found"
 "Security Pacific ::phone:: 800-553-7762"
 "Atlantic Financial ::phone:: 800-556-5678"
 "Bank of Amer. MC Gold ::phone:: 800-622-0789"
 "First Interstate ::phone:: not found"
 "Wells Fargo ::phone:: 800-642-4720"
 "Chase Lincoln First ::phone:: 800-242-7325"
 "Village National Bank ::phone:: not found"
 "Norwest ::phone:: 800-284-0322"
 "West Savings Az. ::phone:: not found"
 "Bank of N.Y. ::phone:: 800-942-1977"
 "Western Financial Savings ::phone:: 800-635-0581"
 "Maryland Bank National ::phone:: 800-421-2110"
 "Citibank Prefered ::phone:: 800-843-0777"
 "Wells Fargo (West) ::phone:: 800-642-4720"
 "Citibank Prefered ::phone:: not found"
 "First Finland Bk of Omaha ::phone:: not found"
 "First Bankcard ::phone:: not found"
 "Sanwa Bank of Cal. ::phone:: 714-627-7601"
 "Nat. Westmister Bank ::phone:: 800-527-0086"
 "Key Federal ::phone:: not found"
 "Nothrup Credit Union ::phone:: not found"
 "Colonial Nat. Bank ::phone:: 800-544-8205"
 "HouseHold Bank of Cal. ::phone:: not found"
 "USAA Fed. Savings Bank ::phone:: 800-922-2092"
 "Bank of N.Y. ::phone:: 800-942-1977"
 "Sacremento Savings and Loan ::phone:: not found"
 "First Interstate ::phone:: not found"
 "Bank One of Northern Cal. ::phone:: 209-996-3500"
 "Bank of Hoven ::phone:: not found"
 "Colonial National Bank ::phone:: 800-544-8205"
 "Hughes Emp. Fed. Union ::phone:: not found"
 "Citibank Classic ::phone:: not found"
 "Citibank ::phone:: 800-843-0777"
 "Bank of N.Y. ::phone:: 800-942-1977"
 "Chase Manhattan ::phone:: 800-842-8403"
}

set symbolbank {
3710
3712
3718
3728
3728
3731
3737
3782
3787
4000
4000
4019
4024
4052
4060
4071
4085
4085
4090
4094
4102
4121
4121
4128
4131
4168
4168
4168
4205
4215
4225
4231
4232
4233
4239
4241
4250
4262
4262
4271
4301
4302
4302
4302
4303
4310
4310
4313
4317
4317
4356
4369
4384
4387
4387
4388
4408
4411
4417
4418
4428
4428
4428
4429
4443
4444
4500
4577
4654
4673
4673
4726
4735
4811
4820
4841
4880
4897
4911
5050
5121
5127
5140
5146
5191
5204
5211
5212
5213
5215
5215
5217
5220
5221
5225
5226
5227
5228
5230
5233
5240
5241
5242
5254
5263
5264
5270
5271
5273
5277
5282
5286
5287
5317
5320
5323
5329
5329
5410
5410
5410
5411
5411
5413
5414
5414
5415
5415
5416
5416
5417
5418
5419
5419
5419
5420
5423
5424
5424
5432
5465
}
putlog "TCL loaded: BanktCL by Ryuki Loaded.....!!"






