function __satellite_add_listener(_listener_weak_ref, _event){
	
	var _list = global.__satellite_listeners[? _event];
	if(_list == undefined){
		_list = ds_list_create();
		global.__satellite_listeners[? _event] = _list;
	}

	ds_list_add(_list, _listener_weak_ref);
}