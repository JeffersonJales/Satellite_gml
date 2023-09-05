
function SatelliteListenerClass(_event, _callback_function, _data, _once, _is_paused) constructor{
	data = _data;		/// The data will be passed with the callback
	event = _event;		/// The event it will listen to happen
	
	scope = method_get_self(_callback_function);
	callback = method(scope, _callback_function); /// Setting the scope of the callback 
	
	only_one_time = _once;		/// It will only happen one time them stop
	is_paused = _is_paused;		/// Case false, will not work	
	marked_to_destroy = false;	/// Case true, it will NOT be used
}