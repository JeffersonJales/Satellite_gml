function satellite_flush(){
	for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
		if(!weak_ref_alive(global.__satellite_all[| i]))
			ds_list_delete(global.__satellite_all, i--);
	}
	
	var _map_keys = ds_map_keys_to_array(global.__satellite_listeners);
	for(var i = 0; i < array_length(_map_keys); i++){
		var _list = global.__satellite_listeners[? _map_keys[i]];
		for(var f = 0; f < ds_list_size(_list); f++){
			if(!weak_ref_alive(_list[| f]))
				ds_list_delete(_list, f--);
		}
	}
}