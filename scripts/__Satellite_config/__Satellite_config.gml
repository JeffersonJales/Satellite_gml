/// --- SATELLITE CONFIGURATION ---
#macro SATELLITE_STACK_TRACE true					/// Will print on console WHO sent the message and data | Also will show the listeners for this event
#macro SATELLITE_RETURN_DATA_TO_AUTO_DESTROY true	/// Case the callback triggered by the satellite_broadcast return this value, it will mark this listener to be latter destroyed

#macro SATELLITE_AUTO_FLUSH_TIME_FRAMES 3000		/// Will clean up the memory usage of this lib for you.
/// You can also set this to zero and do it manually
/// In case you nedd to manually clean:
/// Them you can: satellite_flush : clean up everything you dont use anymore.
/// Or you can use: satellite_room_clean_up : it will destroy all satellites created in the current room, flushing them right away. 