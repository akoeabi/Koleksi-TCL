# channel 
 set irc_chan "#channel" 

 # html file 
 set channel_file "/home/www/chat.html" 

 # max lines number 
 set output_lines 20 

 ##################################################33 
 bind pubm -|- "*" log_channel 

 if {![file exists $channel_file]} { 
    set create_new [open $channel_file w] 
    close $create_new 
 } 

 proc log_channel { nick uhost hand chan text } { 
    global irc_chan channel_file output_lines 

    if {$irc_chan != $chan} { 
       return 
    } 

    set log_time [clock format [clock seconds] -format "%H:%M:%S"] 
    set log_date [clock format [clock seconds] -format "%d %B %Y"] 

    set log_line "<b>($log_date) ($log_time) ($nick) ($text)</b><br>" 

    set read_current [open $channel_file r] 
    set get_all [split [read $read_current] "\n"] 
    close $read_current 

    lappend get_all $log_line 

    set get_all [lrange $get_all end-$output_lines end] 

    set line_idx 1 

    set rewrite [open $channel_file w] 
    foreach each_line $get_all { 
       if {$each_line != ""} { 
          regsub {^[0-9]+\. } $each_line "" each_line 
          puts $rewrite "$line_idx\. $each_line" 
          incr line_idx 1 
       } 
    } 
    close $rewrite 
 } 

 putlog "html-chan-log.tcl"