// -------------------- Gravity
vertical_speed = vertical_speed + _gravity

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
	while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
	        y += sign(vertical_speed)
	}
	// checks the last value of vertical_speed to see if the player was falling
	if vertical_speed > 0 {
		is_grounded = true
	}
	vertical_speed = 0	
} else {
	is_grounded = false
}
y += vertical_speed