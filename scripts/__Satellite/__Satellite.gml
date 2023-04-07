/// Satellte 

global.__satellite_all = ds_list_create();			/// All instances of the Satellite_class. Unless the satellite is persistant. In that case, you have to manage manually
global.__satellite_all_persistent = ds_list_create();

global.__satellite_listeners = ds_map_create();	/// All satellite listeners, waiting for a new event to occour
global.__satellite_remove_queue = ds_queue_create();	/// All satellite listeners marked to be destroyd. Case it's here, it will not be played
global.__satellite_broadcast_stack_index = 0;	/// For handling multiple SatelliteBroadcast stacks

if(SATELLITE_USE_AUTO_HANDLER) call_later(1, time_source_units_frames, __SatelliteAutoCreate);

/// Add a new Listener 
function __Satellite_add_listener(listener_data){
	var _list = global.__satellite_listeners[? listener_data.__event];
	if(_list == undefined){
		_list = ds_list_create();
		global.__satellite_listeners[? listener_data.__event] = _list;
	}

	ds_list_add(_list, listener_data);
}

/// Enqueue the listener data to be destroyed 
function __Satellite_remove_listener(listener_data){
	listener_data.__marked_to_destroy = true;
	ds_queue_enqueue(global.__satellite_remove_queue, listener_data);
}

/// Destroy the queued listeners data
function __Satellite_destroy_queued_listeners(){
	var _listener_data = ds_queue_dequeue(global.__satellite_remove_queue);
	while(_listener_data != undefined){
		
		var _list = global.__satellite_listeners[? _listener_data.__event];
		if(_list != undefined){
			var _ind = ds_list_find_index(_list, _listener_data);
			if(_ind >= 0) ds_list_delete(_list, _ind);
		}
		
		delete _listener_data;
		_listener_data = ds_queue_dequeue(global.__satellite_remove_queue);
	}
}


/// SATELLITE AUTO MANAGER
global.__satellite_auto_room = ds_list_create();

/// Creates the Satellite auto handler
function __SatelliteAutoCreate(){
	if(SATELLITE_AUTO_HANDLER_USE_MESSAGE) 
		instance_create_depth(0,0,0, obj_satellite_auto_message);
	else 
		instance_create_depth(0,0,0, obj_satellite_auto_event);
}

/// Search for all Satellites in the current room, destroying them
function __SatelliteAutoCleanUp(){
	for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
		_satellite = global.__satellite_all[| i];
		if(_satellite.scope_room == room){
			_satellite.clean_up();
		}
	}
	
	__Satellite_destroy_queued_listeners();
}

/// Search for all Satellites in the current room, pausing them
function __SatelliteAutoPause(){
	ds_list_add(global.__satellite_auto_room, room);
	
	var _satellite;
	for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
		_satellite = global.__satellite_all[| i];
		if(_satellite.scope_room == room){
			_satellite.pause();
		}
	}
}

/// Search for all Satellites in the current room, resuming them
function __SatelliteAutoResume(){
	var _ind = ds_list_find_index(global.__satellite_auto_room, room);
	if(_ind >= 0){
		ds_list_delete(global.__satellite_auto_room, _ind);

		var _satellite;
		for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
			_satellite = global.__satellite_all[| i];
			if(_satellite.scope_room == room){
				_satellite.resume();
			}
		}
	}
	
}
