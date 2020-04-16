# +----------------------------------------------------------------------+
# | Author(s): Alexander 'aLeX' Martin <info@dev.alex.ip-am.de>          |
# +----------------------------------------------------------------------+
# don't change anything if you don't know what ...
# report bugs to #king on quakenet or info@dev.alex.ip-am.de

# {{{ bitchmode

    # {{{ configuration

        # {{{ variables

            set bm(trigger) "\$"

            set bm(version) "1.0.0.0"
            set bm(author)  "aLeX (#king on quakenet)"

        # }}}
        # {{{ bindings

            bind PUB n|n "$bm(trigger)adv" bitchmode:panel

            bind MODE -|- "*" bitchmode:check
 
        # }}}

    # }}}
    # {{{ source

        # {{{ panel

            proc bitchmode:panel { nickname hostname handle channel arguments } {
                global botnick lastbind bm

                set option [lindex $arguments 0]
                set victim [lindex $arguments 1]

                switch -- $option {

                    "add" {
 
                        if {($victim == "")} {
                            putserv "NOTICE $nickname :Usage: $lastbind $option \037nickname\037 (must be on $channel) or \037nickname!ident@hostname\037"
                        } elseif {![onchan $victim $channel]} {

                            if {![string match "*!*@*" $victim]} {
                                putserv "NOTICE $nickname :Invalid hostname specified, could not add."
                                return 0
                            }

                        } elseif {[onchan $victim $channel]} {

                            set victim [getchanhost $victim $channel]

                            if {[string match "*users.quakenet.org" $victim]} {
                                set victim *!*@[lindex [split $victim "@"] 1]
                            } else {
                                set victim [maskhost $victim]
                            }
                        }

                        if {![validuser AutoDevoice]} {
                            adduser AutoDevoice
                        }

                        if {![matchattr AutoDevoice |E $channel]} {
                            chattr AutoDevoice |+E $channel
                        }

                        if {[setuser AutoDevoice hosts $victim]} {
                            putserv "NOTICE $nickname :$victim has been successfully added to the auto devoice list in $channel"
                        } else {
                            putserv "NOTICE $nickname :Sorry, could not add $victim to the auto devoice list in $channel"
                        }

                    }

                    "rem" {

                        if {($victim == "")} {
                            putserv "NOTICE $nickname :Usage: $lastbind $option \037nickname\037 (must be on $channel) or \037nickname!ident@hostname\037"
                        } elseif {![onchan $victim $channel]} {

                            if {![string match "*!*@*" $victim]} {
                                putserv "NOTICE $nickname :Invalid hostname specified, could not remove."
                                return 0
                            }

                        } elseif {[onchan $victim $channel]} {

                            set victim [getchanhost $victim $channel]

                            if {[string match "*users.quakenet.org" $victim]} {
                                set victim *!*@[lindex [split $victim "@"] 1]
                            } else {
                                set victim [maskhost $victim]
                            }

                        } elseif {![validuser AutoDevoice]} {
                            putserv "NOTICE $nickname :No entries found in the auto devoice list in $channel"
                            return 0
                        }

                        if {[delhost AutoDevoice $victim]} {
                           putserv "NOTICE $nickname :$victim has been successfully removed to the auto devoice list in $channel"                         
                        } else {
                           putserv "NOTICE $nickname :Sorry, could not find $victim in the auto devoice list in $channel"                         
                        }

                    }

                    "list" {

                        if {([llength [userlist |E $channel]] == "0")} {
                            putserv "NOTICE $nickname :No hostnames added to the auto devoice list in $channel"
                            return 0
                        }

                        set list ""

                        foreach hosts [getuser AutoDevoice hosts] {

                            lappend list $hosts

                            if {([llength $list] == "10")} {
                                putserv "NOTICE $nickname :[join $list ", "]"; set list ""
                            }

                        }

                        if {([llength $list] != "0")} { 
                            putserv "NOTICE $nickname :[join $list ", "]"
                        }

                    }

                }
                
            }

        # }}}
        # {{{ check if bitchmode is required

            proc bitchmode:check { nickname hostname handle channel mode victim } {
                global botnick

                if {![botisop $channel]} {
                    return 0
                } elseif {([llength [userlist |E $channel]] == "0")} {
                    return 0
                } elseif {($mode != "+v")} {
                    return 0
                } elseif {![matchattr [nick2hand $victim] |E $channel]} {
                    return 0
                } else {
                    pushmode $channel -v $victim
                }

            }

        # }}}

    # }}}
    # {{{ copyright

        putlog "||- Bitchmode version $bm(version) scripted by $bm(author)"

    # }}}

# }}}

