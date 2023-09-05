global.__satellite_all = ds_list_create();				/// All instances of the SatelliteClass. Unless the satellite is persistant. In that case, you have to manage manually
global.__satellite_listeners = ds_map_create();			/// All satellite listeners, waiting for a new event to occour
global.__satelllite_timesource_flush = undefined;


if(SATELLITE_AUTO_FLUSH_TIME_FRAMES > 0)
	global.__satelllite_timesource_flush = call_later(SATELLITE_AUTO_FLUSH_TIME_FRAMES, time_source_units_frames, satellite_flush, true);