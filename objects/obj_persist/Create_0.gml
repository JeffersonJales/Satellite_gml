/// @desc 

if(instance_number(object_index) > 1) instance_destroy();

satellite = Satellite();
satellite.
	add(MESSAGE_KEYBOARD_ENTER_PRESSED, function(){
		if(room == Room1) room_goto(Room2);
	}).
	add(MESSAGE_KEYBOARD_PRESSED, function(){
		if(room == Room2) room_goto(Room1);
	})
