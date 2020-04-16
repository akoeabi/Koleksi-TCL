# {{{ Anti Massmodes \[+/-o\]

    # {{{ configuration

        # {{{ variables

            set massmode(trigger)    "\$"

            set massmode(version)    "1.0"
            
            set massmode(flood,prot) "40"

            set massmode(default)    "5:10"

        # }}}
        # {{{ bindings

            bind pub -|- "$massmode(trigger)massmode" anti:massmode:protection

            bind join -|- "*" anti:massmode:service:change
            bind mode -|- "*" anti:massmode:secure

        # }}}
        # {{{ setudef

            # {{{ str

                setudef str massmode-max

            # }}}

        # }}}

    # }}}
    # {{{ source

        proc anti:massmode:secure { nickname hostname handle channel modechange victim } {
            global massmode

            if {[matchattr $handle mnb|Smn $channel] || ([string length $nickname] == "1") || ![onchan $nickname $channel] || [isbotnick $nickname] || ([channel get $channel "massmode-max"] == "") || ([userlist |S $channel] == "")} {
                return 0
            }

            if {($modechange == "+o")} {

                if {![info exists massmode($channel,op)]} {
                    set massmode($channel,op) 1; unset [lindex [split [channel get $channel "massmode-max"] ":"] 1] [list unset massmode($channel,op)]
                } else {
                    incr massmode($channel,op)

                    if {($massmode($channel,op) == "[lindex [split [channel get $channel "massmode-max"] ":"] 0]")} {
                        putquick "PRIVMSG [userlist |S $channel] :RECOVER $channel"
                    }

                }


            } elseif {($modechange == "-o")} {

                if {![info exists massmode($channel,deop)]} {
                    set massmode($channel,deop) 1; unset [lindex [split [channel get $channel "massmode-max"] ":"] 1] [list unset massmode($channel,deop)]
                } else {
                    incr massmode($channel,deop)

                    if {($massmode($channel,deop) == "[lindex [split [channel get $channel "massmode-max"] ":"] 0]")} {
                        putquick "PRIVMSG [userlist |S $channel] :RECOVER $channel"
                    }

                }

            }

        }

        proc anti:massmode:service:change { nickname hostname handle channel } {
            global massmode

            if {($nickname != "L") && ($nickname != "Q")} {
                return 0
            }

            foreach service [userlist |S $channel] {
                chattr $service |-S $channel
            }

            if {($nickname == "Q")} {

                if {![validuser Q]} {
                    adduser Q *!TheQBot@CServe.quakenet.org
                }

                chattr Q |+S $channel

            } elseif {($nickname == "L")} {

                if {![validuser L]} {
                    adduser L *!TheLBot@lightweight.quakenet.org
                }

                chattr L |+S $channel

            }

        }

        proc anti:massmode:protection { nickname hostname handle channel arguments } {
            global massmode lastbind

            set option [lindex [split $arguments] 0]

            if {![validuser $handle]} {

                if {[info exists massmode(last,used,$channel)]} {

                    if {[expr [unixtime] - $massmode(last,used,$channel)] < $massmode(flood,prot)} {
                        return 0
                    }

                }

                set massmode(last,used,$channel) [unixtime]

            }

            switch -- $option {

                "enable" {

                    if {![matchattr $handle mn|mn $channel]} {
                       return 0
                    }

                    set massmodemax [lindex [split $arguments] 1]

                    if {([channel get $channel "massmode-max"] != "") && ([channel get $channel "massmode-max"] != "0")} {
                        putquick "NOTICE $nickname :Anti Massmode is already enabled in $channel. Use '$lastbind update \037modes:seconds\037' instead"
                    } elseif {![onchan Q $channel] && ![onchan L $channel]} {
                        putquick "NOTICE $nickname :Anti Massmodes need L or Q in $channel"
                    } elseif {![string match "*:*" $massmodemax] || ($massmodemax == "")} {
                        putquick "NOTICE $nickname :Wrong Syntax: $lastbind enable \037modes:seconds\037"
                    } elseif {![isnumber [lindex [split $massmodemax ":"] 0]] || ![isnumber [lindex [split $massmodemax ":"] 1]]} {
                        putquick "NOTICE $nickname :Invalid number(s) specified!"
                    } else {

                        if {[onchan Q $channel]} {

                            if {![validuser Q]} {
                                adduser Q *!TheQBot@CServe.quakenet.org
                            }

                            chattr Q |+S $channel

                            set service Q

                        } elseif {[onchan L $channel]} {

                            if {![validuser L]} {
                                adduser L *!TheLBot@lightweight.quakenet.org
                            }

                            chattr L |+S $channel

                            set service L

                        }

                        putquick "NOTICE $nickname :Anti Massmode is now enabled in $channel using $service to recover (max [lindex [split $massmodemax ":"] 0] modes in [lindex [split $massmodemax ":"] 1] seconds)"

                        channel set $channel massmode-max $massmodemax

                    }

                }

                "update" {

                    set massmodemax [lindex [split $arguments] 1]

                    if {([channel get $channel "massmode-max"] == "") || ([channel get $channel "massmode-max"] == "0")} {
                        putquick "NOTICE $nickname :Anti Massmode is disabled in $channel. Use '$lastbind enable \037modes:seconds\037' instead"
                    } elseif {![string match "*:*" $massmodemax] || ($massmodemax == "")} {
                        putquick "NOTICE $nickname :Wrong Syntax: $lastbind update \037modes:seconds\037"
                    } elseif {![isnumber [lindex [split $massmodemax ":"] 0]] || ![isnumber [lindex [split $massmodemax ":"] 1]]} {
                        putquick "NOTICE $nickname :Invalid number(s) specified!"
                    } else {

                        putquick "NOTICE $nickname :Anti Massmode updated from [channel get $channel "massmode-max"] to $massmodemax"

                        channel set $channel massmode-max $massmodemax

                    }

                }

                "disable" {

                    if {([channel get $channel "massmode-max"] == "") || ([channel get $channel "massmode-max"] == "0")} {
                        putquick "NOTICE $nickname :Anti Massmode is already disabled in $channel."
                    } else {

                        foreach service [userlist |S $channel] {
                            chattr $service |-S $channel
                        }

                        channel set $channel massmode-max 0

                        putquick "NOTICE $nickname :Anti Massmode is now disabled in $channel."

                    }

                }

                "help" {
                    putquick "NOTICE $nickname :Anti Massmodes version $massmode(version) command overview:"
                    putquick "NOTICE $nickname :$lastbind \037enable\037|\037update\037 \037modes:seconds\037"
                    putquick "NOTICE $nickname :$lastbind \037disable\037|\037version\037"
                }


                "default" {

                    if {![matchattr $handle mn|mn $channel]} {
                       return 0
                    }

                    putquick "NOTICE $nickname :Invalid command specified! Use '$lastbind help' instead"

                    if {([channel get $channel "massmode-max"] == "") || ([channel get $channel "massmode-max"] == "0")} {
                        putquick "PRIVMSG $channel :Anti Massmodes is disabled for this channel."
                    } else {
                        putquick "PRIVMSG $channel :Anti Massmodes is enabled for this channel. (max [lindex [split [channel get $channel "massmode-max"] ":"] 0] modes in [lindex [split [channel get $channel "massmode-max"] ":"] 1] seconds)"
                    }

                }

            }
            

        }

    # }}}
    # {{{ copyright

        putlog "||- Anti Massmodes \[+/-o\] version $massmode(version)"

    # }}}

# }}}