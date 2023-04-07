
function __SatelliteClass(instance_scope, instance_persist) constructor{
	listeners_data = ds_list_create();
	
	scope_reference = instance_scope;
	scope_room = undefined; 
	
	paused = false;
	paused_data = 0;
	is_persistant = instance_persist;
	
	/// If the instance is persistant, it have to manually handled
	if(!instance_persist){
		scope_room = room;
		ds_list_add(global.__satellite_all, self);
	}
	else 
		ds_list_add(global.__satellite_all_persistent, self);
	
	/// Add a new event listner to the Satellite
	static add = function(event, callback, data = undefined, once = false){
		var _listener_data = new SatelliteListenerClass(event, callback, scope_reference, data, once);
		ds_list_add(listeners_data, weak_ref_create(_listener_data));
		__Satellite_add_listener(_listener_data);
		
		return self;
	}
	
	/// Remove a listener of the instance
	static remove = function(event){
		var _ldata;
		
		for(var i = 0; i < ds_list_size(listeners_data); i++){
			_ldata = listeners_data[| i];
			if(weak_ref_alive(_ldata)){
				_ldata = _ldata.ref;
				if(_ldata.__event == event){
					__Satellite_remove_listener(_ldata);
					ds_list_delete(listeners_data, i);
					break;
				}
			}
			else {
				ds_list_delete(listeners_data, i--);
			}
		}
		
		return self;
	}
	
	/// Remove all listeners of the instance 
	static remove_all = function(){
		
		var _ldata;
		for(var i = 0; i < ds_list_size(listeners_data); i++){
			_ldata = listeners_data[| i];
			if(weak_ref_alive(_ldata)) __Satellite_remove_listener(_ldata.ref);
		}
		ds_list_clear(listeners_data);
		
		return self;
	}
	
	/// Stop all listeners of the instance
	static pause = function(){
		if(!paused){
			paused = true;
			
			
			/// Remove listeners dead
			var _ldata;
			for(var i = 0; i < ds_list_size(listeners_data); i++){
				_ldata = listener_data[| i];
				if(!weak_ref_alive(_ldata)) 
					ds_list_delete(listeners_data, i--);
			}
			
			/// Store listener data and remove listeners
			paused_data = array_create(ds_list_size(listener_data));
			for(var i = 0; i < ds_list_size(listener_data); i++){
				_ldata = listener_data[| i].ref;
				paused_data[i] = new SatelliteListenerClass(_ldata.__event, _ldata.callback, scope_reference, _ldata.__data, _ldata.__only_one_time);
				__Satellite_remove_listener(_ldata);
			}
			
			ds_list_clear(listener_data);
		}
		
		return self;
	}
	
	/// Activate all listeners of the instance
	static resume = function(){
		if(paused){ 
			paused = false;
			
			/// Add listeners again
			for(var i = 0; i < array_length(paused_data); i++){
				ds_list_add(listeners_data, weak_ref_create(paused_data[i]));
				__Satellite_add_listener(paused_data[i]);
			}
			
			paused_data = 0;
		}
		
		return self;
	}
	
	/// Manualy destroy satellite
	static clean_up = function(){
		remove_all();
		ds_list_destroy(listeners_data);
		
		var _list = is_persistant ? global.__satellite_all_persistent : global.__satellite_all;
		
		var _index = ds_list_find_index(_list, self);
		if(_index >= 0)
			ds_list_delete(_list, _index);
	}
}