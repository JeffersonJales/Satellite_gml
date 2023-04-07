/// --- MAILPOST CONFIGURATION ---
#macro SATELLITE_RETURN_DATA_TO_AUTO_DESTROY true	/// Case the callback triggered by the SatelliteBroadcast return this value, it will mark this listener to be latter destroyed

/// SATELLITER AUTO HANDLER
#macro SATELLITE_USE_AUTO_HANDLER true					/// Case true, it will instantiate one of both satellite auto handler
#macro SATELLITE_AUTO_HANDLER_USE_MESSAGE false	/// FALSE - You will use <<obj_satellite_auto_event>> ||| TRUE - Will instantiate the <<obj_satellite_auto_message>>

/// CASE USING obj_satellite_auto_event
/// When using this, the object will trigger the <Room Start> and <Room End> events of the object
/// Case the current room is persistant on room end, it will pause, case not it destroy 
#macro SATELLITE_AUTO_CLEAN_UP true				/// Case true, it will auto destroy satellites in the current room on room end 
#macro SATELLITE_AUTO_PAUSE_RESUME true		/// CAse true, it will pause satellites on room end and resume satellites on room start

/// CASE USING obj_satellite_auto_message
/// You will use this when you can have full control when the room end and room start of the handler occours
#macro SATELLITE_MESSAGE_ROOM_END "__SatelliteRoomEnd"			/// Will destroy or pause the Satellites of the current room
#macro SATELLITE_MESSAGE_ROOM_START "__SatelliteRoomStart"	/// Will resume the Satellites of the current room

/// Ex of usage 
/// SatelliteBroadcast(SATELLITE_MESSAGE_ROOM_END);