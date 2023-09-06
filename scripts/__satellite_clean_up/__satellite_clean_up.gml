function __satellite_clean_up(){
	if(global.__satellite_listeners_remove_stack_count > 0) return;
	
	var _listener_data = ds_queue_dequeue(global.__satellite_listeners_remove_queue);
	while(_listener_data != undefined){
		
		/// Remove listener from list
		var _list = global.__satellite_listeners[? _listener_data.event];
		if(_list != undefined){
			for(var i = 0; i < ds_list_size(_list); i++){
				if(_list[| i].ref == _listener_data){
					ds_list_delete(_list, i);
					break;
				}
			}
		}
		
	
		_listener_data = ds_queue_dequeue(global.__satellite_listeners_remove_queue);
	}
}