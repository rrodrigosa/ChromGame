// -------------------- Horizontal collision
if place_meeting(x+horizontal_speed, y, obj_solid) {
    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
        x += sign(horizontal_speed);
    }
	// every time it hits a wall, changes the direction
    horizontal_speed = -horizontal_speed
    //horizontal_speed = 0 // or use this one?
}
x += horizontal_speed

// setting the direction enemy is facing
if (horizontal_speed != 0) {
	enemy_xscale_flip = sign(horizontal_speed)
}