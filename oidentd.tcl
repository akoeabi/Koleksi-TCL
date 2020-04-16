namespace eval oident {

	namespace eval variable {
		#Set this to your idents you like to use with this Eggdrop
		variable ident "Boosen"
		#Set this to the full path of your .oidentd.conf [/home/username/.oidentd.conf]
		variable conf "/home/egg/.oidentd.conf"
	}
	bind evnt - connect-server [namespace current]::setident

	proc setident {type} {
		set file [open $::oident::variable::conf "w"]

		if {[llength $::oident::variable::ident] == 1} {
			set ident "$::oident::variable::ident"
		} elseif {[llength $::oident::variable::ident] > 1} {
			set ident "[lindex "$::oident::variable::ident" [rand [expr [llength $::oident::variable::ident] - 1]]]"
		}
		puts $file "global { reply \"$ident\"}"
		close $file
		putlog "\002OIdent\002 Ident set to $ident"
	}
}	
putlog "oidentd.tcl Version 1.0 coded by Stephan Brendel loaded"
