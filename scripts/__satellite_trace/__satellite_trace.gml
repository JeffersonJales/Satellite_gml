function __satellite_trace(){
	var _str = "";
	
	var i = 0; 
	repeat(argument_count)
		_str += string(argument[i++]);
		
	return _str;
}