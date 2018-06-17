// Behavior (Follow)
if(instance_exists(obj_player)) {
	my_dir = point_direction(x, y, obj_player.x, obj_player.y)
}
horizontal_speed = lengthdir_x(walk_speed, my_dir)

// -------------------- Horizontal collision
if place_meeting(x+horizontal_speed, y, obj_solid) {
	while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
		x += sign(horizontal_speed);
	}
	// when following the player, make sure it stops if it hits a wall
	horizontal_speed = 0
}
x+= horizontal_speed
		
// setting the direction enemy is facing (used for animations)
if (horizontal_speed != 0) {
	enemy_xscale_flip = sign(horizontal_speed)
}
		
//Transition Trigger
if (distance_to_object(obj_player) > range_to_follow) {
	state = states.idle
}

if (distance_to_object(obj_player) <= range_to_attack) {
	state = states.charge_attack
	counter = 0
}

image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_wolf_walking {
	image_index = 0;
	sprite_index = s_wolf_walking
}