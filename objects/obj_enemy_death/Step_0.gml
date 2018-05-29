if (done == 0) {
	vertical_speed = vertical_speed + gravity_speed

	// -------------------- Horizontal collision
	if place_meeting(x+horizontal_speed, y, obj_solid) {
	    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
	        x += sign(horizontal_speed);
	    }
	    horizontal_speed = 0
	}
	x += horizontal_speed

	// -------------------- Vertical collision/gravity
	if place_meeting(x, y+vertical_speed, obj_solid) {
		if (vertical_speed > 0) {
			done = 1
			// sets the last animation frame before colliding with the floor
			image_index = 1
		}
		
		while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
		        y += sign(vertical_speed)
		}
		vertical_speed = 0	
	}
	y += vertical_speed
}