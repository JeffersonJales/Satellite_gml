function __satallite_room(_callback_alive){
	var _satellite;
	for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
		_satellite = global.__satellite_all[| i];
		if(weak_ref_alive(_satellite)){
			if(room == _satellite.ref.scope_room)
				i = _callback_alive(_satellite.ref, i);
		}
		else
			ds_list_delete(global.__satellite_all, i);
	}
}