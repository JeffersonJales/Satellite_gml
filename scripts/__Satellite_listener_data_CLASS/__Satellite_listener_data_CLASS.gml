
function Satellite_listener_data_class(event, callback_function, scope_reference, data, once) constructor{
	__data = data;		/// The data will be passed with the callback
	__event = event;	/// The event it will listen to happen
	
	__callback = method(scope_reference, callback_function); /// Setting the scope of the callback 
	
	__only_one_time = once;	/// It will only happen one time them stop
	__marked_to_destroy = false;	/// Case true, it will NOT be used
}