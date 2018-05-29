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
			image_index = 1
			image_speed = 0
			//right before hitting the ground, restarts the game/room whitin 0.5 seconds
			alarm[0] = room_speed/2 // uncomment
		}
		
		while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
		        y += sign(vertical_speed)
		}
		vertical_speed = 0	
	}
	y += vertical_speed
}

// animação
if (vertical_speed != 0) {
	image_speed = 1
	if sprite_index != s_player_damage {
		image_index = 0
		sprite_index = s_player_damage
	}
}
