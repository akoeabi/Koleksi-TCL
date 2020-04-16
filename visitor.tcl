#visitor.tcl

####################
#visitor code
####################

#implementation of visitor_send_cookie
proc visitor_send_cookie { } {
	#visitor_send_cookie_sequence; #sequence/oracle implementation
	visitor_send_cookie_no_sequence; #table/mysql implementation
}

#<begin> visitor_first_time
#<doc>
# this procedure assumes that cookie_prepare_all has been run
# and returns 1 or a 0 dependant on whether or not the user
# is a 'first time visitor' (ie - has no cookie)
proc visitor_first_time { } {

	set ::__VISITOR_ID [cookie_get_prepared __VISITOR_ID]
	
	if { $::__VISITOR_ID!="" } {
		return 0
	} else {
#		ns_log Notice "hip hip hooray, another new user"
		return 1
	}

}
#<end> visitor_first_time

#<begin> visitor_send_cookie_sequence
#<doc>
# grabs the next sequenced value for a visitor id to send to the user
# sequence/oracle implementation
proc visitor_send_cookie_sequence { } {

	set query_sql "select seq_visitor_id.nextval as visitor_id from dual"

	if ![dbs_0or1 $query_sql sequence [nsv_get __GLOBALS session_db_pool]] { 
		set ::__VISITOR_ID "bonk_select"
		log stats/visitor_id_creations "bonk on visitor id creation (database operation failure) for session_id $::__SESSION_ID"
	} else {
		if !$sequence(0or1) {
			set ::__VISITOR_ID "bonk_select"
			log stats/visitor_id_creations "bonk on visitor id creation (no rows returned) for session_id $::__SESSION_ID"
		} else {
			set ::__VISITOR_ID $sequence(visitor_id)
			log stats/visitor_id_creations "visitor_id:\t$sequence(visitor_id)\tsession_id\t$::__SESSION_ID"
		}
	}
	
	cookie_send __VISITOR_ID $::__VISITOR_ID

}
#<end> visitor_send_cookie_sequence

#<begin> visitor_send_cookie_no_sequence
#<doc>
# grabs the next value from a table using last_insert_id for a visitor id to send to the user
# table/mysql implementation
proc visitor_send_cookie_no_sequence { } {

	set dml "update visitor_sequence set id=last_insert_id(id+1)"

	if ![dbd $dml [nsv_get __GLOBALS session_db_pool]] {}

	set query_sql "select id as visitor_id from visitor_sequence"

	if ![dbs_0or1 $query_sql sequence [nsv_get __GLOBALS session_db_pool]] {
		set ::__VISITOR_ID "bonk_select"
		log stats/visitor_id_creations "bonk on visitor id creation (database operation failure) for session_id $::__SESSION_ID"
	} else {
		if !$sequence(0or1) {
			set ::__VISITOR_ID "bonk_select"
			log stats/visitor_id_creations "bonk on visitor id creation (no rows returned) for session_id $::__SESSION_ID"
		} else {
			set ::__VISITOR_ID $sequence(visitor_id)
			log stats/visitor_id_creations "visitor_id:\t$sequence(visitor_id)\tsession_id\t$::__SESSION_ID"
		}
	}

	cookie_send __VISITOR_ID $::__VISITOR_ID

}
#<end> visitor_send_cookie_no_sequence

