set serv(address) "misha.project-on.net"
set serv(port) 3000
set serv(field_query) "TITLE CATEGORY TOTAL GENRE YEAR STUDIO USDISTRO RATING UPDATED DESCRIPTION LINK"

# Configuration: Enable or not public, privmsg or ctcp
# 1 to enable, 0 to disable
set serv(pub) 1
set serv(msg) 0
set serv(ctcp) 0

# Configuration: Length max of the required info
# (what come after the trigger :)
set serv(maxlength) 30

bind pub - `animenfo pub:animenfo_query

proc pub:animenfo_query { nick uhost hand channel text } {
	global serv

	if { $serv(pub) == 0 } { return 1 }
	if {[string length $text] > $serv(maxlength) } {
		putserv "privmsg $channel :$nick , kepanjangen !!!"
		return
	}
	if { [string length $text] == 0 } {
		putserv "privmsg $channel :$nick , infonya apa ?"
		return
	}

	set sockfd [connect_to_server $serv(address) $serv(port)]
	if { $sockfd == "-1" } {
		return 1
	} else {
		if { [send_query $sockfd "<ANIME><TITLE>$text</TITLE><FIELD>$serv(field_query)</FIELD></ANIME>"] != -1 } {
			format_output $nick $channel [receive_result $sockfd]
                  putserv "privmsg $channel :14busuk infoz !!!"
		}
	}
}
################################################################
# Connect to AnimeNfo Server on specified address and port     #
# return: sockfd - success                                     #
#         -1     - failure                                     #
################################################################
proc connect_to_server { address port } {
	
	if { [catch { socket $address $port } sockfd] } {
		return -1
	}

	fconfigure $sockfd -buffering line -translation binary
	return $sockfd
}
##############################################################
# Receive result of a query from AnimeNfo Server             #
# return: array of result - success                          #
#         empty           - failure                          #
##############################################################
proc receive_result { sockfd } {

	if { [catch { gets $sockfd } buffer] } {
		return
	}
	lappend data $buffer
	
	while { [string length $buffer] > 0 } {
		if { [catch { gets $sockfd } buffer] } {
			return
		}
		lappend data $buffer
	}
	return $data
}

##############################################################
# Send query to AnimeNfo Server                              #
# return:  0 - success                                       #
#         -1 - failure                                       #
##############################################################
proc send_query { sockfd data } {
	if { [catch { puts $sockfd $data }]} {
		return -1
	}
	return 0
}

##############################################################
# Remove tags                                                #
# This is dumb (I know..) A better solution is needed!       #
##############################################################
proc remove_tags { original_string } {
	regsub -all "<TITLE>" $original_string "" result
	regsub -all "</TITLE>" $result "" result
	regsub -all "<CATEGORY>" $result "" result
	regsub -all "</CATEGORY>" $result "" result
	regsub -all "<TOTAL>" $result "" result
	regsub -all "</TOTAL>" $result "" result
	regsub -all "<GENRE>" $result "" result
	regsub -all "</GENRE>" $result "" result
	regsub -all "<YEAR>" $result "" result
	regsub -all "</YEAR>" $result "" result
	regsub -all "<STUDIO>" $result "" result
	regsub -all "</STUDIO>" $result "" result
	regsub -all "<USDISTRO>" $result "" result
	regsub -all "</USDISTRO>" $result "" result
	regsub -all "<RATING>" $result "" result
	regsub -all "</RATING>" $result "" result
	regsub -all "<UPDATED>" $result "" result
	regsub -all "</UPDATED>" $result "" result
	regsub -all "<DESCRIPTION>" $result "" result
	regsub -all "</DESCRIPTION>" $result "" result
	regsub -all "<LINK>" $result "" result
	regsub -all "</LINK>" $result "" result
	regsub -all "<RESULT>" $result "" result
	regsub -all "</RESULT>" $result "" result
	regsub -all "<OUTPUT>" $result "" result
	regsub -all "</OUTPUT>" $result "" result
	regsub -all "<ITEM.*?>" $result "" result
	regsub -all "</ITEM.*?>" $result "" result
	regsub -all "<ERROR>" $result "" result
	regsub -all "</ERROR>" $result "" result
	return $result
}

##############################################################
# Format output for IRC                                      #
##############################################################
proc format_output { nick chan data } {

	foreach line $data {
		
		set contents [remove_tags $line]
		set display ""
		
		if { [regexp "<TITLE>" $line] == 1 } {
			set display "\00214Title:\002 "
		} elseif { [regexp "<CATEGORY>" $line] == 1 } {
			set display "\00214Category:\002 "
		} elseif { [regexp "<TOTAL>" $line] == 1 } {
			set display "\00214Total:\002 "
		} elseif { [regexp "<GENRE>" $line] == 1 } {
			set display "\00214Genre:\002 "
		} elseif { [regexp "<YEAR>" $line] == 1 } {
			set display "\00214Year:\002 "
		} elseif { [regexp "<STUDIO>" $line] == 1 } {
			set display "\00214Studio:\002 "
		} elseif { [regexp "<USDISTRO>" $line] == 1 } {
			set display "\00214US Distribution:\002 "
		} elseif { [regexp "<RATING>" $line] == 1 } {
			set display "\00214Rating:\002 "
		} elseif { [regexp "<UPDATED>" $line] == 1 } {
			set display "\00214Updated:\002 "
		} elseif { [regexp "<LINK>" $line] == 1 } {
			set display "\00214Link:\002 "
		} elseif { [regexp "<DESCRIPTION>" $line] == 1 } {
			set display \00214Description:\002"
		} elseif { [regexp "<RESULT>" $line] == 1 } {
			if { $contents == 1 } {
				set display ""
				set contents ""
			} elseif { $contents == 0 } {
				set display "\002No results found\002"
				set contents ""
			} else {
				set display "Found \002"
				append display $contents
				append display "\002 results:"
				set contents ""
			}
		} elseif { [regexp "<ERROR>" $line] == 1 } {
			set display "Error \002"
			append display $contents
			append display "\002 msg jes_ for more information"
			set contents ""
		}
		
		if { $display != "" || $contents != "" } { 
			putserv "PRIVMSG $chan :$display$contents"
		}
	}
}