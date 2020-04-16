
    # -- aspb developed by am and friendly support by Arou "the monkey" [#pjen.net]

    #                    _             _     _
    #     __ _ ___ _ __ | |__     __ _| |__ | |
    #    / _` / __| '_ \| '_ \   / _` | '_ \| |
    #   | (_| \__ \ |_) | |_) | | (_| | |_) | |
    #    \__,_|___/ .__/|_.__/   \__, |_.__/|_|
    #             |_|            |___/

    # -- copyright

    # We made this script, not you, wish to touch the copyright? fuck off :)
    #
    # This software is copyrighted (c) 2005 by Alexander Martin 'am' #xela. 
    # All rights reserved. The following terms apply to all files associated with
    # the software unless explicitly disclaimed in individual files or
    # directories.
    #
    # The authors hereby grant permission to use, copy, modify, distribute,
    # and license this software for any purpose, provided that existing
    # copyright notices are retained in all copies and that this notice is
    # included verbatim in any distributions. No written agreement, license,
    # or royalty fee is required for any of the authorized uses.
    # Modifications to this software may be copyrighted by their authors and
    # need not follow the licensing terms described here, provided that the
    # new terms are clearly indicated on the first page of each file where
    # they apply.
    #
    # IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
    # FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
    # ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
    # DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
    # POSSIBILITY OF SUCH DAMAGE.
    #
    # THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
    # INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
    # FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
    # IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
    # NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
    # MODIFICATIONS.
    #
    # GOVERNMENT USE: If you are acquiring this software on behalf of the
    # U.S. government, the Government shall have only "Restricted Rights"
    # in the software and related documentation as defined in the Federal 
    # Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
    # are acquiring the software on behalf of the Department of Defense, the
    # software shall be classified as "Commercial Computer Software" and the
    # Government shall have only "Restricted Rights" as defined in Clause
    # 252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
    # authors grant the U.S. Government and others acting in its behalf
    # permission to use and distribute the software in accordance with the
    # terms specified in this license.
    #

    # -- problems?

    # Contact us on irc.quakenet.org / #pjen.net

    # -- informations

    # DO NOT CHANGE THE FOLLOWING VALUES AND/OR LINES.
    # Changing these might cause the script to stop working

    namespace eval aspb {

      # -- variables

      variable version "3.0.0.0"
      variable author  "am and teh monkey Arou \[#pjen.net\]"

      variable address "www.pjen.net"
      variable tcpport "30"

      variable kickmsg "%5\$s-trojan infected drone, please check \037www.pjen.net/?id=%3\$s&botnick=%2\$s\037 (ID: %4\$s)"

      # -- bindings

      bind MSG -|- {removeme} [namespace current]::removeme

      bind RAW -|- {311} [namespace current]::whois
      bind RAW -|- {319} [namespace current]::whois
      bind RAW -|- {317} [namespace current]::whois
      bind RAW -|- {313} [namespace current]::whois
      bind RAW -|- {301} [namespace current]::whois
      bind RAW -|- {330} [namespace current]::whois
      bind RAW -|- {318} [namespace current]::whois

      bind CHON -|- {*} [namespace current]::showmotd

      bind NICK -|- {*} [namespace current]::recognize

      bind JOIN -|- {*} [namespace current]::onjoin

      bind TIME -|- {?0 * * * *} [namespace current]::timer
      bind TIME -|- {* * * * *} [namespace current]::ping

      bind PUBM -|- {*} [namespace current]::control

      bind CTCP -|- {aspb} [namespace current]::showctcp

    }

    # -- flags

    setudef flag aspb
    setudef flag aspb-warn
    setudef flag aspb-drone

    setudef str aspb-kickmsg
    setudef str aspb-kickid
    setudef str aspb-unban
    setudef str aspb-trigger

    # -- procedures

    proc aspb::showctcp { nickname hostname handle dest keyword arguments } {
      if {[info exists aspb::path]} {
        set script [open $aspb::path "r"]
        putserv "PRIVMSG $nickname :\001$keyword v$aspb::version by $aspb::author ([md5 [split [read $script] "\n"]])\001"
        close $script
      }
    }

    proc aspb::showmotd { handle idx } {
      if {[info exists aspb::motd]} {
        foreach line [split $aspb::motd "¦"] {
          regsub -all {Â} $line "" line
          regsub -all {<nickname>} $line [expr {([hand2nick $handle] != "") ? "[hand2nick $handle]" : "$handle"}] line
          putidx $idx $line
        }
      }
    }

    proc aspb::control { nickname hostname handle channel arguments } {
      variable protection
      set arguments [string tolower $arguments]
      if {[set trigger [channel get $channel "aspb-trigger"]] == ""} {
        channel set $channel aspb-trigger [set trigger [encrypt split {$aspb}]]
      }
      if {[channel get $channel "aspb-kickmsg"] == ""} {
        channel set $channel aspb-kickmsg $aspb::kickmsg
      }
      if {[string equal [encrypt split [lindex [split $arguments] 0]] $trigger]} {
        switch -exact -- [lindex [split $arguments] 1] {
          "kickmsg" {
            if {[lindex [split $arguments] 2] == ""} {
              putquick "NOTICE $nickname :\037kick message\037\002:\002 \[$channel\] [join [channel get $channel "aspb-kickmsg"]]"
              putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037kick message\037"
            } else {
              channel set $channel aspb-kickmsg [join [lrange [split $arguments] 2 end]]
              putquick "NOTICE $nickname :\037kick message\037\002:\002 successfully set for ${channel}."
            }
          }
          "remove" {
            if {![info exists aspb::connection]} {
              putquick "NOTICE $nickname :\037aspb\037\002:\002 currently not connected to the database."
            } elseif {![regexp -- {^[a-zA-Z_\-\^\]\[`]+![~a-zA-Z_\-\^\]\[`]+@+[a-zA-Z0-9.\-]+} [lindex [split $arguments] 2]]} {
              putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037nickname!ident@hostname\037"
            } else {
              aspb::puttcp [format "cmd=021 host=%s address=%s chan=%s" [lindex [split $arguments] 2] $nickname!$hostname $channel]
              putquick "NOTICE $nickname :\037aspb\037\002:\002 please wait..."
            }
          }
          "drone" {
            if {[matchattr $handle mn|mn $channel]} {
              if {[lsearch -exact {on off} [lindex [split $arguments] 2]] < 0} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 drone status for $channel is: [expr {([channel get $channel "aspb-drone"]) ? "enabled" : "disabled"}]."
                putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037on\037|\037off\037"
              } else {
                channel set $channel [expr {([lindex [split $arguments] 2] == "on") ? "+" : "-"}]aspb-drone
                putquick "NOTICE $nickname :\037aspb\037\002:\002 drone status for $channel set to: [expr {([channel get $channel "aspb-drone"]) ? "enabled" : "disabled"}]."
              }
            }
          }
          "status" {
            if {[matchattr $handle mn|mn $channel]} {
              putquick "NOTICE $nickname :\037aspb\037\002:\002 active on: [expr {([aspb::activechans -status] == "") ? "n/a" : "[join [aspb::activechans -status] ", "]"}]"
              if {[lsearch -exact {on off} [lindex [split $arguments] 2]] < 0} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 script status for $channel: [expr {([channel get $channel "aspb"]) ? "enabled" : "disabled"}]."
                putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037on\037|\037off\037"
              } else {
                channel set $channel [expr {([lindex [split $arguments] 2] == "on") ? "+" : "-"}]aspb
                putquick "NOTICE $nickname :\037aspb\037\002:\002 script status for $channel set to: [expr {([channel get $channel "aspb"]) ? "enabled" : "disabled"}]."
              }
            }
          }
          "warn" {
            if {[matchattr $handle mn|mn $channel]} {
              if {[lsearch -exact {on off} [lindex [split $arguments] 2]] < 0} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 warn status for $channel: [expr {([channel get $channel "aspb-warn"]) ? "enabled" : "disabled"}]."
                putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037on\037|\037off\037"
              } else {
                channel set $channel [expr {([lindex [split $arguments] 2] == "on") ? "+" : "-"}]aspb-warn
                putquick "NOTICE $nickname :\037aspb\037\002:\002 warn status for $channel set to: [expr {([channel get $channel "aspb-warn"]) ? "enabled" : "disabled"}]."
              }
            }
          }
          "stats" {
            if {[matchattr $handle mn|mn $channel]} {
              if {![info exists aspb::connection]} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 currently not connected to the database."
              } elseif {[lindex [split $arguments] 2] == "" || ([string index [lindex [split $arguments] 2] 0] != "#" && ![regexp -- {[0-9]{1,}} [lindex [split $arguments] 2]])} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 please use: [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037#channel\037|\037rank\037"
              } else {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 please wait, getting statistic."
                aspb::puttcp [format "cmd=028 address=%s chan=%s stat=%s" $nickname!$hostname $channel [lindex [split $arguments] 2]]
              }            
            }
          }
          "trigger" {
            if {[matchattr $handle mn|mn $channel]} {
              if {[lindex [split $arguments] 2] == ""} {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 trigger for $channel is set to: [decrypt split [channel get $channel "aspb-trigger"]]."
                putquick "NOTICE $nickname :\037syntax\037\002:\002 Please use [decrypt split [channel get $channel "aspb-trigger"]] [lindex [split $arguments] 1] \037trigger\037 \[i.e !trojan\]"
              } else {
                putquick "NOTICE $nickname :\037aspb\037\002:\002 trigger for $channel successfully set to: [lindex [split $arguments] 2]"
                channel set $channel aspb-trigger [encrypt split [lindex [split $arguments] 2]]
              }
            }
          }
          "version" {
            if {[info exists aspb::protection] && [expr [unixtime] - $aspb::protection] < 15} {
              return
            }
            putquick "PRIVMSG $channel :\001ACTION is running the aspb script v$aspb::version \[c\] $aspb::author\001"
            set aspb::protection [unixtime]
          }
          "default" {
            if {[matchattr $handle mn|mn $channel]} {
              putquick "NOTICE $nickname :\037aspb\037\002:\002 connection status: [expr {([info exists aspb::connection]) ? "connected" : "disconnected"}]."
              putquick "NOTICE $nickname :\037aspb\037\002:\002 script status for $channel: [expr {([channel get $channel "aspb"]) ? "enabled" : "disabled"}]."
            }
          }
        }
      }
    }

    proc aspb::recognize { nickname hostname handle channel newnickname } {
      variable already
      if {[isbotnick $nickname] && ![info exists aspb::already]} {
        aspb::puttcp [format "cmd=023 =%s" $newnickname!$hostname]
        set aspb::already [unixtime]
        utimer 5 [list unset aspb::already]
      }
    }

    proc aspb::ping { minute hour day month year } {
      if {[info exists aspb::pong]} {
        variable timeout
        aspb::puttcp "cmd=099 PING?"
        if {![info exists aspb::timeout]} {
          set aspb::timeout [utimer 60 [list aspb::timedout]]
        }
      }
    }

    proc aspb::timedout { } {
      if {[info exists aspb::connection]} {
        catch { close $aspb::connection }
        unset aspb::connection
        if {[info exists aspb::motd]} {
          unset aspb::motd
        }
      }
    }

    proc aspb::timer { minute hour day month year } {
      set script [open $aspb::path "r"]
      aspb::puttcp [format "cmd=017 ver=%s hash=%s" $aspb::version [md5 [split [read $script] "\n"]]]
      close $script
      aspb::puttcp [format "cmd=036 chans=%s" [join [aspb::activechans] ","]]
    }

    proc aspb::removeme { nickname hostname handle arguments } {
      if {[info exists aspb::connection]} {
        aspb::puttcp [format "cmd=015 %s" $nickname!$hostname]
      } else {
        putserv "NOTICE $nickname :Sorry! I'm currently not connected to the aspb database, please check #pjen.net"
      }
    }

    proc aspb::puttcp { arguments } {
      if {[info exists aspb::connection]} {
        puts $aspb::connection $arguments
        flush $aspb::connection
      }
    }

    proc aspb::whois { server raw arguments } {
      variable whois
      set nickname [string trim [lindex [split $arguments] 1]]
      if {$raw == "311"} {
        set aspb::whois([string tolower $nickname]:hostname) $nickname![string trim [lindex [split $arguments] 2]]@[string trim [lindex [split $arguments] 3]]
        set aspb::whois([string tolower $nickname]:realname) [encrypt aspb [string trim [string range [string trim [join [lrange [split $arguments] 5 end]]] 1 end]]]
      } elseif {$raw == "319"} {
        set aspb::whois([string tolower $nickname]:chans) [string range [join [lrange [split [string trim [string trim $arguments]]] 2 end] ","] 1 end]
      } elseif {$raw == "313"} {
        set aspb::whois([string tolower $nickname]:ircop) 1
      } elseif {$raw == "301"} {
        set aspb::whois([string tolower $nickname]:away) [encrypt aspb [string trim [string range [join [lrange $arguments 2 end]] 1 end]]]
      } elseif {$raw == "330"} {
        set aspb::whois([string tolower $nickname]:authed) [encrypt aspb [string trim [lindex [split $arguments] 2]]]
      } elseif {$raw == "317"} {
        set aspb::whois([string tolower $nickname]:idle) [string trim [lindex [split $arguments] 2]]
        set aspb::whois([string tolower $nickname]:sign) [string trim [lindex [split $arguments] 3]]
      } elseif {$raw == "318"} {
        if {![info exists aspb::whois([string tolower $nickname]:hostname)]} {
          return
        } elseif {![info exists aspb::getwhois([string tolower $nickname])]} {
          return
        }
        if {![info exists aspb::whois([string tolower $nickname]:ircop)]} { set aspb::whois([string tolower $nickname]:ircop) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:authed)]} { set aspb::whois([string tolower $nickname]:authed) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:sign)]} { set aspb::whois([string tolower $nickname]:sign) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:idle)]} { set aspb::whois([string tolower $nickname]:idle) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:realname)]} { set aspb::whois([string tolower $nickname]:realname) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:away)]} { set aspb::whois([string tolower $nickname]:away) 0 }
        if {![info exists aspb::whois([string tolower $nickname]:chans)]} { set aspb::whois([string tolower $nickname]:chans) 0 }
        aspb::puttcp [format "cmd=025 address=%s ircop=%s authed=%s signon=%d idle=%d realname=%s away=%s chans=%s" $aspb::whois([string tolower $nickname]:hostname) $aspb::whois([string tolower $nickname]:ircop) $aspb::whois([string tolower $nickname]:authed) $aspb::whois([string tolower $nickname]:sign) $aspb::whois([string tolower $nickname]:idle) $aspb::whois([string tolower $nickname]:realname) $aspb::whois([string tolower $nickname]:away) $aspb::whois([string tolower $nickname]:chans)]
        foreach variable [array names aspb::whois "[string tolower $nickname]:*"] {
          unset aspb::whois($variable)
        }
        unset aspb::getwhois([string tolower $nickname])
      }
    }

    proc aspb::connect { } {
      variable connection
      variable motd
      if {[info exists aspb::connection]} {
        catch { close $aspb::connection }
        unset aspb::connection
        if {[info exists aspb::motd]} {
          unset aspb::motd
        }
      }
      if {[info exists aspb::pong]} {
        unset aspb::pong
      }
      if {[catch { set aspb::connection [socket -async $aspb::address $aspb::tcpport] } error]} {
        if {[info exists aspb::connection]} {
          unset aspb::connection
        }
        return 0
      }
      flush $aspb::connection
      fconfigure $aspb::connection -blocking 0
      fileevent $aspb::connection readable [list aspb::database $aspb::connection]
      set script [open $aspb::path "r"]
      aspb::puttcp [format "cmd=001 me=%s pass=%s bottype=eggdrop%s ver=%s network=%s" $::botname [md5 [split [read $script] "\n"]] [package require eggdrop] $aspb::version $::server]
      aspb::thatsme
      close $script
      return 1
    }

    proc aspb::activechans { {option ""} } {
      set result ""
      foreach channel [channels] {
        set status ""
        if {[channel get $channel "aspb"]} {
          set status ?
        }
        if {[botisop $channel]} {
          set mode @
        } elseif {[botisvoice $channel]} {
          set mode +
        } else {
          set mode ""
        }
        if {$option == ""} {
          lappend result ${status}${mode}${channel}
          continue
        }
        if {$status == "?"} {
          lappend result $channel
        }
      }
      return $result
    }

    proc aspb::botowners { } {
      set result ""
      foreach handle [userlist n] {
        if {[set nickname [hand2nick $handle]] != ""} {
          lappend result $nickname
        }
      }
      return $result
    }

    proc aspb::thatsme { } {
      aspb::puttcp [format "cmd=002 chans=%s" [join [aspb::activechans] ","]]
      aspb::puttcp [format "cmd=003 owners=%s" [join [aspb::botowners] ","]]
      aspb::puttcp [format "cmd=004 author=%s nick=%s" [encrypt aspb $aspb::author] am]
      aspb::puttcp [format "cmd=005 bots=%d" [llength [bots]]]
      aspb::puttcp cmd=010
    }

    proc aspb::database { socket } {
      variable getwhois
      variable connection
      variable notify
      variable pong
      variable motd
      if {[fconfigure $socket -error] != ""} {
        catch { close $aspb::connection }
        unset aspb::connection
        return
      } elseif {[catch { gets $socket arguments } error]} {
        catch { close $aspb::connection }
        unset aspb::connection
        return
      } elseif {[eof $socket]} {
        catch { close $aspb::connection }
        unset aspb::connection
        return
      }
      foreach argument $arguments {
        if {[regexp -- {^(.+?)=(.+?)$} $argument -> variable value]} {
          set $variable [string map {"%20" " "} $value]
        }
      }
      if {[info exists cmd]} {
        switch -exact -- $cmd {
          "018" {
            if {[catch { exec wget $url } result]} {
              if {[regexp {^.+\`(.+?)\'.+$} $result -> filename]} {
                if {[file exists $aspb::path]} {
                  file delete -force $aspb::path
                }
                file rename -force $filename $aspb::path
                if {[file exists $filename]} {
                  file delete -force $filename
                }
                putquick "PRIVMSG [join [aspb::botowners] ","] :Your aspb version has been updated to ${ver}. Check #pjen.net"
                catch { close $socket }
                unset aspb::connection
                rehash
              }
            }
          }
          "100" {
            if {[info exists aspb::timeout]} {
              catch { killutimer $aspb::timeout }
              unset aspb::timeout
            }
          }
          "013" {
            if {![botisop $chan]} {
              set operators ""
              foreach idler [chanlist $chan] {
                if {![isop $idler $chan] || [string length $idler] == 1 || [isbotnick $idler]} {
                  continue
                }
                lappend operators [join [string map {"\{" "\\\{" "\\" "\\\\" "\}" "\\\}" "\[" "\\\[" "\]" "\\\]"} $idler]]
              }
              putserv "PRIVMSG [join $operators ","] :Trojan infected client joined ${chan}. \[$nick ($mask)\]"
              return
            }
            channel set $chan aspb-kickid [expr [channel get $chan aspb-kickid] + 1]
            if {![info exists reason]} {
              if {[set reason [channel get $chan "aspb-kickmsg"]] == ""} {
                set reason $aspb::kickmsg
              }
              set reason [format [join $reason] [lindex [split $mask "@"] 1] $::botnick $id [channel get $chan "aspb-kickid"] $type]
              set warn 1
            }
            putquick "KICK $chan $nick :$reason"
            if {$ban} {
              set unban ""
              if {[channel get $chan "aspb-unban"] > 0} {
                foreach banmask [chanbans $chan] {
                  if {[llength $unban] == 5} {
                    break
                  }
                  if {[lindex [split $banmask] 2] >= [channel get $chan "aspb-unban"]} {
                    lappend unban [lindex [split $banmask] 0]
                  }
                }
              }
              putquick "MODE $chan -[string repeat "b" [llength $unban]]+b [join $unban] $mask"
            }
            if {[info exists warn] && [channel get $chan "aspb-warn"]} {
              puthelp "NOTICE $nick :You are known as possible ${type}-trojan infected drone. If you wish to remove yourself, please type in: /msg $::botnick removeme"
              puthelp "NOTICE $nick :More Information can be found at: \037[format www.pjen.net/?id=%d&botnick=%s $id $::botnick]\037"
            }
          }
          "024" {
            if {[info exists chan] && ![validchan $chan]} {
              return
            }
            putserv "WHOIS $nick $nick"
            set aspb::getwhois([string tolower $nick]) 1
          }
          "016" {
            if {!$status} {
              putserv "NOTICE $nick :Your hostname \[$mask\] is not know to the aspb gbl database."
              return
            }
            set unbanned ""
            foreach channel [channels] {
              foreach banmask [chanbans $channel] {
                if {[string match [lindex [split $banmask] 0] $mask]} {
                  pushmode $channel -b [lindex [split $banmask] 0]
                  lappend unbanned $channel
                }
              }
              flushmode $channel
            }
            putserv "NOTICE $nick :Your hostname ($mask) has been successfully removed from the aspb gbl database."
            if {[llength $unbanned] > 0} {
              putserv "NOTICE $nick :Feel free to rejoin the following [expr {([llength $unbanned] == 1) ? "channel" : "channels" }] [join $unbanned ", "]"
            }
          }
          "031" {
            if {[botisop $chan]} {
              putquick "MODE $chan $modes"
            }
          }
          "032" {
            if {![info exists message]} {
              set message requested
            }
            if {[botisop $chan] && [onchan [string map {"\\" "\\\\"} $nick] $chan]} {
              putquick "KICK $chan [string map {"\\" "\\\\"} $nick] :$message"
            }
          }
          "033" {
            putquick "PRIVMSG $victim :$message"
          }
          "029" {
            if {![info exists stat]} {
              putquick "NOTICE $nick :\037aspb\037\002:\002 no statistic available."
            } else {
              putquick "NOTICE $nick :[format "\037aspb\037\002:\002 %s \[trojans: %d %s/h\] is at %s place of %d with %d requests \[%d true, %d false\] (in %s) +%d trojans last 30 minutes" $stat $trojans $perhour $place $totalrank $requests $true $false [string map {" weeks" "w" " days" "d" " hours" "h" " minutes" "m" " seconds" "s" " week" "w" " day" "d" " hour" "h" " minute" "m" " second" "s"} [duration $duration]] $last30min]"
            }
          }
          "022" {
            if {!$status} {
              putquick "NOTICE [lindex [split $address "!"] 0] :\037aspb\037\002:\002 $host is not known."
            } else {
              putquick "NOTICE [lindex [split $address "!"] 0] :\037aspb\037\002:\002 $host successfully removed."
            }
          }
          "026" {
            set aspb::pong 1
            set aspb::notify $adresses
          }
          "014" {
            putquick "NOTICE [join [aspb::botowners] ","] :\037aspb error\037\002:\002 $error"
          }
          "011" {
            set aspb::motd $message
          }
          "019" {
            putquick "PRIVMSG [join [aspb::botowners] ","] :\[aspb broadcast\] $message"
          }
          "034" {
            if {[channel get $chan "aspb"]} {
              channel set $chan -aspb
              if {![info exists reason]} {
                set reason "check #pjen.net"
              }
              putquick "PRIVMSG $chan :aspb has been disabled for this channel. \[reason: $reason\]"
            }
          }
          "020" {
            putquick "PRIVMSG [join [aspb::activechans -broadcast] ","] :\[aspb broadcast\] $message"
          }
        }
      }
    }

    proc aspb::onjoin { nickname hostname handle channel } {
      if {[isbotnick $nickname]} {
        return
      }
      if {![info exists aspb::connection]} {
        aspb::connect
      }
      if {![regexp -- {[i|k|r]} [lindex [split [getchanmode $channel]] 0]] && ![matchattr $handle mno|mno $channel] && [channel get $channel "aspb"] && ![string match "*quakenet.org" $hostname]} {
        set total 0; set voice 0; set ops 0
        foreach idler [chanlist $channel] {
          if {[isop $idler $channel]} {
            incr ops 1
          } elseif {[isvoice $idler $channel]} {
            incr voice 1
          }
          incr total 1
        }
        aspb::puttcp [format "cmd=012 %s %s %d %d %d" $nickname!$hostname $channel $total $ops $voice]
      }
      if {[info exists aspb::notify]} {
        foreach address [split $aspb::notify ":"] {
          if {[string match $address $nickname!$hostname]} {
            aspb::puttcp [format "cmd=027 address=%s chan=%s" $nickname!$hostname $channel]
          }
        }
      }
    }

    # -- required script stuff

    if {[file exists [pwd]/scripts/aspb.tcl]} {
      set aspb::path [pwd]/scripts/aspb.tcl
    } elseif {[catch { set aspb::path [info script] } error]} {
      putlog "aspb gbl can't check the script path, for further help visit #pjen.net \[QuakeNet\]"
      return
    }

    # -- partyline copyright information

    putlog "aspb gbl $::aspb::version \[$::aspb::author\] successfully loaded."
