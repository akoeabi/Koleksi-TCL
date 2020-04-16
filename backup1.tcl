#It's just a smple backup script.
#r0gUe gad@c4.com


bind dcc n backup dcc:back
#files to be backuped!?
set bfile ""
set sfile "tequila.conf"
# Directory for files?
set bkpdir "tmp"


proc dcc:back { hand idx arg } {
  global bfile sfile bkpdir

 if {[llength $arg] > 1} {
    putdcc $idx "Syntactic: .backup <file?>"
    return
  } 
  if {![file exists $bfile]} {
    putdcc $idx "4$arg Missing! No Surch $arg to be backuped."
    return
  }
    putlog "System Files Backuped In [strftime "%c"]"
     file copy -force $bfile $sfile $bkpdir
  
  putdcc $idx "3Backup Done! '$bfile' and '$sfile' backuped to '/$bkpdir'!"
  return 1
}
 
#Put here what you whant!
  
putlog "Backup TCL loaded!"
