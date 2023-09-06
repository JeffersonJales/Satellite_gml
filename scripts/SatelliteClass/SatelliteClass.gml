function SatelliteClass(_is_persistent, _is_paused) constructor{
	listeners_data_arr = [];
	
	is_paused = _is_paused;
	scope_room = _is_persistent ? undefined : room; 
	scope_room_pers = room;
	
	/// Add a new event listner to the Satellite
	static add = function(event, callback, data = undefined, once = false){
		var _listener_data = new SatelliteListenerClass(event, callback, data, once, is_paused);
		array_push(listeners_data_arr, _listener_data);

		var _weak_ref = weak_ref_create(_listener_data);
		__satellite_add_listener(_weak_ref, event);
		
		return self;
	}
	
	/// Remove a listener of the instance
	static remove = function(event){
		var _listener
		for(var i = 0; i < array_length(listeners_data_arr); i++){
			if(listeners_data_arr[i].event == event){
				listeners_data_arr[i].marked_to_destroy = true;
				ds_queue_enqueue(global.__satellite_listeners_remove_queue, listeners_data_arr[i]);
				array_delete(listeners_data_arr, i, 1);
				break;
			}
		}
		
		return self;
	}
	
	/// Remove all listeners of the instance 
	static remove_all = function(){
		for(var i = 0; i < array_length(listeners_data_arr); i++){
			listeners_data_arr[i].marked_to_destroy = true;
			ds_queue_enqueue(global.__satellite_listeners_remove_queue, listeners_data_arr[i]);
		}
		
		listeners_data_arr = [];
		return self;
	}
	
	/// Stop all listeners of the instance
	static pause = function(){
		if(!is_paused){
			is_paused = true;
			
			for(var i = 0; i <array_length(listeners_data_arr); i++){
				listener_data[i].is_paused = true;
			}
		}
	}
	
	/// Activate all listeners of the instance
	static resume = function(){
		if(is_paused){ 
			is_paused = false;
			for(var i = 0; i < array_length(listeners_data_arr); i++){
				listener_data[i].is_paused = false;
			}
		}
	}
	
	/// Manualy destroy satellite
	static clean_up = function(){
		remove_all();
		listeners_data_arr = 0;
		
		var _sat_ref;
		for(var i = 0; i < ds_list_size(global.__satellite_all); i++){
			if(global.__satellite_all[| i].ref == self){
				ds_list_delete(global.__satellite_all, i);
				break;
			}
		}
		
		__satellite_clean_up();
	}

	/// Will not be affected by Satellite functions
	static set_persist = function(flag){
		scope_room = flag ? undefined : scope_room_pers;
		return self;
	}

	ds_list_add(global.__satellite_all, weak_ref_create(self));
}