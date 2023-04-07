/// @desc PERSISTANT ROOMS 
if(room_persistent){ 
	if(SATELLITE_AUTO_PAUSE_RESUME) 
		__SatelliteAutoPause();
}
else if(SATELLITE_AUTO_CLEAN_UP)
	__SatelliteAutoCleanUp();


