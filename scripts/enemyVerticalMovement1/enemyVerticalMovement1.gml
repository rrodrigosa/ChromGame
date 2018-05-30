// -------------------- Always apply gravity
vertical_speed = vertical_speed + gravity_speed

// -------------------- Checks if should avoid ledges
if (is_grounded && avoid_ledges && !place_meeting(x+horizontal_speed, y+1, obj_solid)) {
	horizontal_speed = -horizontal_speed
}

// -------------------- Vertical collision/gravity
if place_meeting(x, y+vertical_speed, obj_solid) {
	if (vertical_speed > 0) {
		is_grounded = true
		is_grounded_after_attack = true
	}
		
	while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
	        y += sign(vertical_speed)
	}
	vertical_speed = 0	
} else {
	is_grounded = false
}
y += vertical_speed