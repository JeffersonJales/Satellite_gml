function satellite_room_clean_up(){
	var _clean_up = function(_satellite_ref, _count){
		_satellite_ref.clean_up();
		return --_count
	}
	
	__satallite_room(_clean_up);
}