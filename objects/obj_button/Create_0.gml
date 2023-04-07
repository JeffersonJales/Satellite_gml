/// @desc 
satellite_button = Satellite();

satellite_button.
	add(MESSAGE_KEYBOARD_PRESSED, function(){
		image_blend = choose(c_red, c_blue, c_lime);
	}).
	add(MESSAGE_KEYBOARD_ENTER_PRESSED, function(){
			image_blend = c_yellow;
	})


