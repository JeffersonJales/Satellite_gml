function satallite(){
	var _satellite = new SatelliteClass();
	var _weak_ref = weak_ref_create(_satellite);
	ds_list_add(global.__satellite_all, _weak_ref);
	
	return _satellite;
}