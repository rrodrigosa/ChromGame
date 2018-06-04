// -------------------- (Not Always) apply gravity
if !place_meeting(x, y+1, obj_solid) {
	vertical_speed = vertical_speed + gravity_speed
}

// -------------------- Vertical collision/gravity
if place_meeting(x, y+vertical_speed, obj_solid) {
	if (vertical_speed > 0) {
		is_grounded_after_attack = true
	}
		
	while !place_meeting(x, y+sign(vertical_speed), obj_solid) {
	        y += sign(vertical_speed)
	}
	vertical_speed = 0	
}
y += vertical_speed