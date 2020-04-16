# +----------------------------------------------------------------------+
# | Author(s): Alexander 'aLeX' Martin <info@dev.alex.ip-am.de>          |
# +----------------------------------------------------------------------+
#  Please report any bugs to me at info@dev.alex.ip-am.de.
#  Idea and suggestion to new features are also welcome.
#  Default Trigger is: .whatpulse [account name]

# {{{ whatpulse

    # {{{ configuration

        # {{{ packages

            package require http

        # }}}
        # {{{ variables

            set whatpulse(author)     "Alexander 'aLeX' Martin (#king on quakenet (info@dev.alex.ip-am.de))"
            set whatpulse(version)    "1.0.0.0"

            set whatpulse(flood,prot) "120"
            set whatpulse(trigger)    "."

            set whatpulse(url)        "http://www.whatpulse.org/api/user.php?account=%s"
            set whatpulse(channel)    "#mychannel"

            set whatpulse(skin)       {»» Account: :account: »» Team: :team: × LastPulse: :lastpulse: × TotalKeys: :keys: × TotalClicks: :clicks: × Rank: :teamrank: × TeamRank: :rank: ««}

            # {{{ copyright

                set ctcp-version "whatpulse eggdrop script v. $whatpulse(version) by $whatpulse(author)"

            # }}}

        # }}}
        # {{{ bindings

            bind PUB -|- "$whatpulse(trigger)whatpulse" whatpulse:user:informations

        # }}}

    # }}}
    # {{{ procs

        # {{{ get member whatpulse information

            proc whatpulse:user:informations { nickname hostname handle channel arguments } {
                global whatpulse

                set whatpulse(account) [string trim [lindex [split $arguments] 0]]

                if {($whatpulse(account) == "")} {
                    putserv "NOTICE $nickname :Please use: '$whatpulse(trigger) \037account name\037' instead."
                    return 0
                }

                if {[info exists whatpulse(last,used)]} {

                    set whatpulse(last,used,diff) [expr [unixtime] - $whatpulse(last,used)]

                    if {$whatpulse(last,used,diff) < $whatpulse(flood,prot)} {
                        putserv "NOTICE $nickname :The last whatpulse request was just [duration $whatpulse(last,used,diff)] ago. Please wait [duration [expr $whatpulse(flood,prot) - $whatpulse(last,used,diff)]] and try again."
                        return 0
                    }

                }

                set whatpulse(last,used)  [unixtime]
                set whatpulse(connection) [http::config -useragent "Mozilla 4.0"]

                catch { set whatpulse(connection) [http::geturl [format $whatpulse(url) "$whatpulse(account)"] -timeout 3000] } whatpulse(error)

                if {([http::status $whatpulse(connection)] == "ok")} {

                    set whatpulse(tmp,information) [string trim [http::data $whatpulse(connection)]]

                    http::cleanup $whatpulse(connection)

                    set whatpulse(line) 0

                    if {[string match -nocase "*Invalid AccountName*" $whatpulse(tmp,information)]} {
                        putserv "NOTICE $nickname :Unknown account name. Please try again."
                        return 0
                    }

                    foreach whatpulse(information) [split $whatpulse(tmp,information) "\n"] {

                        if {($whatpulse(information) == "")} {
                            continue
                        }

                        incr whatpulse(line)

                        if {($whatpulse(line) == "2")} {
                            set whatpulse(account)   [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "16")} {
                            set whatpulse(team)      [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "6")} {
                            set whatpulse(lastpulse) [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "8")} {
                            set whatpulse(keys)      [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "9")} {
                            set whatpulse(clicks)    [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "14")} {
                            set whatpulse(trank)     [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        } elseif {($whatpulse(line) == "22")} {
                            set whatpulse(rank)      [string trim [join [lrange [split $whatpulse(information) { }] 2 end]]]
                        }

                    }

                    set template $whatpulse(skin)

                    regsub -all -- {:account:}   $template "$whatpulse(account)"   template
                    regsub -all -- {:team:}      $template "$whatpulse(team)"      template
                    regsub -all -- {:lastpulse:} $template "$whatpulse(lastpulse)" template
                    regsub -all -- {:keys:}      $template "$whatpulse(keys)"      template
                    regsub -all -- {:clicks:}    $template "$whatpulse(clicks)"    template
                    regsub -all -- {:rank:}      $template "$whatpulse(rank)"      template
                    regsub -all -- {:teamrank:}  $template "$whatpulse(trank)"     template

                    putserv "PRIVMSG $channel :$template"

                }

            }

        # }}}

    # }}}

# }}}