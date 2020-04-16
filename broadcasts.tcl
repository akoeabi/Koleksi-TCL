    bind PUB n|n "?broadcast" command:broadcast

    proc command:broadcast { nickname hostname handle channel arguments } {
        global botnick botname lastbind

        if {($arguments == "")} {
            putquick "NOTICE $nickname :You forgot the message, syntax: $lastbind \037message\037"; return 0
        }

        regsub -all {\003[\d]{0,2}(,[\d]{0,2})?|\017|\006|\007|\t|\n} $arguments "" arguments-regsub

        set failed-channels ""

        foreach {broadcast-channel} [channels] {

            if {[onchan S ${broadcast-channel}] && ![botisop ${broadcast-channel}]} {
                lappend failed-channels ${broadcast-channel}
            } else {

                if {[string match "*c*" [lindex [getchanmode ${broadcast-channel}] 0]]} {
                    utimer 5 [list puthelp "PRIVMSG ${broadcast-channel} :\(Broadcast\) ${arguments-regsub}"]
                } else {
                    utimer 5 [list puthelp "PRIVMSG ${broadcast-channel} :\(Broadcast\) ${arguments}"]
                }

            }

        }

        if {(${failed-channels} == "")} {
            putquick "NOTICE $nickname :The broadcast has been sent successfully."
        } else {
            putquick "NOTICE $nickname :The broadcast has been sent successfully, except in [join ${failed-channels} ", "]. \(S is on these channels and bot is not opped\)"
        }

    }