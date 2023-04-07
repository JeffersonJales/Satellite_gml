/// @desc Init Satellite

satellite = Satellite();

satellite.
	add(SATELLITE_MESSAGE_ROOM_START, __SatelliteAutoResume). 
	add(SATELLITE_MESSAGE_ROOM_END, function(){
		if(room_persistent) __SatelliteAutoPause();
		else __SatelliteAutoCleanUp();
	})