function satellite_reset(){
	ds_list_clear(global.__satellite_all);

	var _map_keys = ds_map_keys_to_array(global.__satellite_listeners);
	for(var i = 0; i < array_length(_map_keys); i++){
		var _list = global.__satellite_listeners[? _map_keys[i]];
		ds_list_destroy(_list);
	}
	
	ds_map_clear(global.__satellite_listeners);
}