vertical_speed = vertical_speed + gravity_speed

// -------------------- Horizontal collision
if place_meeting(x+horizontal_speed, y, obj_solid) {
    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
        x += sign(horizontal_speed);
    }
	// every time it hits a wall, changes the direction
    horizontal_speed = -horizontal_speed
    //horizontal_speed = 0
}
x += horizontal_speed

// setting the direction enemy is facing
if (horizontal_speed > 0) {
	enemy_xscale_flip = 1
} else if (horizontal_speed < 0) {
	enemy_xscale_flip = -1
}

// -------------------- Vertical collision/gravity
if place_meeting(x, y+vertical_speed, obj_solid) {
	if (done) {
		if (vertical_speed > 0) {
			enemy_attack_counter = room_speed
			state = "enemy_reseting"
			done = false
			//need to reset the horizontal and vertical speeds after reaching the ground
		}
	}
	
	while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
	        y += sign(vertical_speed)
	}
	vertical_speed = 0	
}
y += vertical_speed