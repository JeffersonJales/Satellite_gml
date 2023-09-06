global.__satellite_all = ds_list_create();				/// All instances of the SatelliteClass. Unless the satellite is persistant. In that case, you have to manage manually
global.__satellite_listeners = ds_map_create();			/// All satellite listeners, waiting for a new event to occour
global.__satellite_listeners_remove_queue = ds_queue_create();	/// Whwn deleting listeners, stack them up with this
global.__satellite_listeners_remove_stack_count = 0;
