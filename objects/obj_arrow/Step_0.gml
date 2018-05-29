// -------------------- Horizontal collision - destroy the arrow if it hits a solid
if place_meeting(x+horizontal_speed, y, obj_solid) {
    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
        x += sign(horizontal_speed);
    }
	if (!normal_shot) {
		// each arrow only destroys its own corresponding particle system
		with (particleToDeleteId) {
			instance_destroy()
		}
	}
	// destroy the arrow
	instance_destroy()
}
x += horizontal_speed