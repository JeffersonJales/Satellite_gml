

function SatelliteBroadcast(event, broadcast_data = undefined){

	if(global.__satellite_broadcast_stack_index++ == 0)  
		__Satellite_destroy_queued_listeners();
	
	var _listeners = global.__satellite_listeners[? event];
	
	if(_listeners != undefined){
		var _ldata;
		
		for(var i = 0; i < ds_list_size(_listeners); i++){
			_ldata = _listeners[| i];
			
			if(!_ldata.__marked_to_destroy){
				var _return_data = _ldata.__callback(broadcast_data, _ldata.__data);
				if(_return_data == SATELLITE_RETURN_DATA_TO_AUTO_DESTROY || _ldata.__only_one_time){
					__Satellite_remove_listener(_ldata);	
				}
			}
		}
	}
	
	/// Check if can destroy listeners
	if(--global.__satellite_broadcast_stack_index == 0) 
		__Satellite_destroy_queued_listeners();
}