function satellite_broadcast(_event, _broadcast_data = undefined){
	
	/// Stack Trace - init
	var _name = instance_exists(other) ? object_get_name(other.object_index) : "Unknow";
	var _satellite_stack_trace = __satellite_trace("<Satellite> Event: ", _event, " | By: ", _name, " | Data: ", _broadcast_data, "\n");
	/// 
	
	var _listeners = global.__satellite_listeners[? _event];
	if(_listeners != undefined){
		var _ldata;
		
		for(var i = 0; i < ds_list_size(_listeners); i++){
			_ldata = _listeners[| i];
			
			if(weak_ref_alive(_ldata)){
				_ldata = _ldata.ref;
				
				if(!_ldata.marked_to_destroy && !_ldata.is_paused){
					
					/// Stack Trace - Get Receiver
					_satellite_stack_trace = __satellite_trace(_satellite_stack_trace, "Received By: ", object_get_name(_ldata.scope.object_index), " | id: ", _ldata.scope, "\n");
					
					if(_ldata.callback(_broadcast_data, _ldata.data) == SATELLITE_RETURN_DATA_TO_AUTO_DESTROY || _ldata.only_one_time)
						_ldata.marked_to_destroy = true;
				}
			}
			else 
				ds_list_delete(_listeners, i--);
		}
	}
	
	
	/// Stack Trace End
	if(SATELLITE_STACK_TRACE) show_debug_message(_satellite_stack_trace + "Broacast end");
}