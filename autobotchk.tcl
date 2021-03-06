#! /bin/sh
# This trick is borrowed from Tothwolf's Wolfpack \
# Search for tclsh[0-9].[0-9] in each valid dir in PATH \
for dir in $(echo $PATH | sed 's/:/ /g'); \
do \
  if test -d $dir; \
  then \
    files=$(/bin/ls $dir | egrep '^tclsh[0-9]\.[0-9]$'); \
    if test "$files" != ""; \
    then \
      versions="${versions:+$versions }$(echo $files | sed 's/tclsh//g')"; \
    fi; \
  fi; \
done; \
for ver in $versions; \
do \
  tmpver=$(echo $ver | sed 's/\.//g'); \
  if test "$lasttmpver" != ""; \
  then \
    if test "$tmpver" -gt "$lasttmpver"; \
    then \
      lastver=$ver; \
      lasttmpver=$tmpver; \
    fi; \
  else \
    lastver=$ver; \
    lasttmpver=$tmpver; \
  fi; \
done; \
exec tclsh$lastver "$0" "$@"
#
# AutoBotchk - An Eggdrop utility to autogenerate botchk/crontab entries
#
# Copyright (C) 1999, 2000, 2001, 2002 Jeff Fisher (guppy@eggheads.org)
#
# How to use
# ----------
#
#   Most people begin to use AutoBotchk by moving it from the script
# directory to their Eggdrop directory -- this will save you from having to
# use the -dir option.
#
#   If you run AutoBotchk without any arguments, it will present you with
# a list of valid ones. Most people run AutoBotchk by doing:
#
#     ./autobotchk <config file>
#
#   This will setup crontab to check every 10 minutes to see whether or not
# your bot needs to be restarted and it will e-mail if a restart was
# performed. A lot of people turn off crontab e-mail support; however, I do
# not recommend this since you will be unable to see any errors that might
# happen.
#
# Updates
# -------
#   27Sep2001: added new pidfile setting
#   14Nov2001: removed old autobotchk update entries and updated the help
#              section a little bit. also made autobotchk move down one
#              directory if being run from the scripts directory.
#
# $Id: autobotchk,v 1.9 2002/01/02 05:04:52 guppy Exp $
#

if {$argc == 0} {
 puts "\nusage: $argv0 <eggdrop config> \[options\]"
 puts " -dir     (directory to run from instead of the current one)"
 puts " -noemail (redirect crontab e-mail to /dev/null)"
 puts " -5       (5 minute checks)"
 puts " -10      (10 minute checks)"
 puts " -15      (15 minute checks)"
 puts " -30      (30 minute checks)"
 puts ""
 exit
} {
 puts "\nAutoBotchk 1.09.1, (C) 2002 Jeff Fisher (guppy@eggheads.org)"
 puts "------------------------------------------------------------"

 set x [join [lindex [split $argv] 0]]
 set q [lrange $argv 1 end]
 set dir [pwd]
 set delay 10
 set email 1

 # If you renamed your eggdrop binary, you should change this variable
 set binary "autobot"

 for {set z 0} {$z < [llength $q]} {incr z} {
  set opt [join [lindex $q $z]]
  switch -- $opt {
   -time -
   -1 {set delay 1}
   -5 {set delay 5}
   -10 {set delay 10}
   -15 {set delay 15}
   -20 {set delay 20}
   -30 {set delay 30}
   -nomail -
   -noemail {set email 0}
   -dir {
    set dir [string trimright [join [lindex $q [expr $z + 1]]] /]
    if {[string match -* $dir]} {
     puts " *** ERROR: you did not supply a directory name"
     puts ""
     exit
    }
    if {![file isdirectory $dir]} {
     puts " *** ERROR: the directory you supplied is not a directory"
     puts ""
     exit
    }
    incr z
   }
  }
 }
 switch -- $delay {
  30 { set minutes "0,30" }
  15 { set minutes "0,15,30,45" }
   5 { set minutes "0,5,10,15,20,25,30,35,40,45,50,55" }
   1 { set minutes "*" }
  default { set minutes "0,10,20,30,40,50" }
 }
 if {[string match "*/scripts" $dir]} {
  set dir [string range $dir 0 [expr [string length $dir] - 8]]
  puts " *** AutoBotchk is running from the scripts directory, moving down one directory"
 }
 if {![file exists $dir/$x]} {
  puts " *** ERROR: you supplied a non-existant filename"
  puts ""
  exit
 } elseif {![file isfile $dir/$x]} {
  puts " *** ERROR: unknown filetype, config files should be text files"
  puts ""
  exit
 } elseif {![file readable $dir/$x]} {
  puts " *** ERROR: unable to open the file, permission denied"
  puts ""
  exit
 } elseif {![file exists $dir/help] || ![file isdirectory $dir/help]} {
  puts " *** ERROR: are you sure you are running from a bot directory?"
  puts ""
  exit
 } elseif {![file exists $dir/$binary]} {
  puts " *** ERROR: are you sure you are running from a bot directory?"
  puts ""
  exit
 }
 puts " *** Processing '$x', this will take only a second ..."

 set f [open $dir/$x r]
 while {![eof $f]} {
  set z [split [gets $f]]
  if {[join [lindex $z 0]] != "set"} {continue}
  switch -- [join [lindex $z 1]] {
   pidfile -
   nick -
   userfile -
   botnet-nick {
    set [join [lindex $z 1]] [join [lindex $z 2]]
    puts "     !! scanned: [join $z]"
   }
  }
 }
 close $f
 if {![info exists {botnet-nick}] && [info exists nick]} {
  puts "         !! setting \$botnet-nick to $nick"
  set botnet-nick $nick
 }
 if {![info exists pidfile]} {
  puts "         !! setting \$pidfile to pid.${botnet-nick}"
  set pidfile "pid.${botnet-nick}"
 }
 if {![info exists {botnet-nick}] || ![info exists userfile]} {
  puts " *** ERROR: could not find either \$userfile or \$botnet-nick"
  puts "      !! you sure its a valid Eggdrop config file?"
  puts ""
  exit
 }
 if {[catch {open $dir/${botnet-nick}.botchk w} fd]} {
  puts " *** ERROR: unable to open '${botnet-nick}.botchk' for writing"
  puts "      !! without this, this program is useless"
  puts ""
  exit
 }
 puts $fd "
#! /bin/sh
#
# ${botnet-nick}.botchk (generated on [clock format [clock seconds] -format "%B %d, %Y @ %I:%M%p"])
#
# Generated by AutoBotchk 1.09.1
# Copyright (C) 1999, 2000, 2001, 2002 Jeff Fisher <guppy@eggheads.org>
#

# change this to the directory you run your bot from:
botdir=\"$dir\"

# change this to the name of your bot's script in that directory:
botscript=\"$binary $x\"

# change this to the nickname of your bot (capitalization COUNTS)
botname=\"${botnet-nick}\"

# change this to the name of your bot's userfile (capitalization COUNTS)
userfile=\"$userfile\"

# change this to the name of your bot's pidfile (capitalization COUNTS)
pidfile=\"$pidfile\"

########## you probably don't need to change anything below here ##########

cd \$botdir

# is there a pid file?
if test -r \$pidfile
then
  # there is a pid file -- is it current?
  botpid=`cat \$pidfile`
  if `kill -CHLD \$botpid >/dev/null 2>&1`
  then
    # it's still going -- back out quietly
    exit 0
  fi
  echo \"\"
  echo \"Stale \$pidfile file, erasing...\"
  rm -f \$pidfile
fi

if test -r CANTSTART.\$botname
then
  if test -r \$userfile || test -r \$userfile~new || test -r \$userfile~bak
  then
    echo \"\"
    echo \"Userfile found, removing check file 'CANTSTART.\$botname'...\"
    rm -f CANTSTART.\$botname
  fi
fi

# test if we have run botchk previously and didn't find a userfile
if test ! -f CANTSTART.\$botname
then
  echo \"\"
  echo \"Couldn't find bot '\$botname' running, reloading...\"
  echo \"\"
  # check for userfile and reload bot if found
  if test -r \$userfile
  then
    # It's there, load the bot
    ./\$botscript
    exit 0
  else
    if test -r \$userfile~new
    then
      # Bot f*@!ed up while saving the userfile last time.  Move it over.
      echo \"Userfile missing.  Using last saved userfile...\"
      mv -f \$userfile~new \$userfile
      ./\$botscript
      exit 0
    else
      if test -r \$userfile~bak
      then
        # Userfile is missing, use backup userfile.
        echo \"Userfile missing.  Using backup userfile...\"
        cp -f \$userfile~bak \$userfile
        ./\$botscript
        exit 0
      else
        # Well, nothing to work with...
        echo \"No userfile.  Could not reload the bot...\"
        echo \"no userfile\" > CANTSTART.\$botname
        exit 1
      fi
    fi
  fi
fi

exit 0
 "
 close $fd
 puts " *** Wrote '${botnet-nick}.botchk' successfully ([file size $dir/${botnet-nick}.botchk] bytes)"
 if {[catch {exec chmod u+x $dir/${botnet-nick}.botchk} 0]} {
  puts "      *** ERROR: unable to 'chmod u+x' the output file"
  puts ""
  exit
 }
 puts "      !! chmod u+x completed"
 puts " *** Crontab mode?? Heaven forbid this is automated ..."
 set tmp "$dir/.autobotchk"
 if {$delay != "10"} {puts "      *** Using a time delay of $delay minutes."}
 if {$email} {
  set line "$minutes \* \* \* \* $dir/${botnet-nick}.botchk"
 } {
  set line "$minutes \* \* \* \* $dir/${botnet-nick}.botchk >\/dev\/null 2>&1"
  puts "      *** Making crontab line to NOT send e-mail."
 }
 if {[catch {exec crontab -l > $tmp} error ]} {
  if {![string match "*no*cron*" [string tolower $error]] &&
      ![string match "*can't open*" [string tolower $error]]} {
   catch {exec rm -rf $tmp} 0
   puts "      *** ERROR: unable to get crontab listing"
   puts "           *** MSG: $error"
   puts ""
   exit
  }
 }
 set fd [open $tmp r]
 while {![eof $fd]} {
  set z [split [gets $fd]]
  if {[string match "*$dir/${botnet-nick}.botch*" $z]} {
   puts "      !! ${botnet-nick}.botchk already has a crontab entry, skipping this stage"
   puts ""
   exit
  }
 }
 close $fd
 set fd [open $tmp a]
 puts $fd $line
 puts "      !! adding new crontab line to existing crontab"
 close $fd
 if {[catch {exec crontab $tmp} error]} {
  puts "      *** ERROR: unable to do 'crontab $tmp'"
  puts "           *** MSG: $error"
  puts ""
  exit
 }
 catch {exec rm -f $tmp} 0
 puts "      !! crontab reloaded"
 puts ""
 puts "      !! Use 'crontab -r' to remove all your crontab entries"
 puts "      !!     'crontab -l' to view the current crontabs"
 puts ""
 exit
}
