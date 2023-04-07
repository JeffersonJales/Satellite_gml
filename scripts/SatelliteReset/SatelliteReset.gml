
function SatelliteReset(){
	global.__satellite_broadcast_stack_index = 0;
	ds_list_clear(global.__satellite_auto_room);
	ds_list_clear(global.__satellite_all);
	ds_list_clear(global.__satellite_all_persistent);
	ds_queue_clear(global.__satellite_remove_queue);

	var _map_keys = ds_map_keys_to_array(global.__satellite_listeners);
	for(var i = 0; i < array_length(_map_keys); i++){
		var _list = global.__satellite_listeners[? _map_keys[i]];
		ds_list_destroy(_list);
	}
	
	ds_map_clear(global.__satellite_listeners);
}