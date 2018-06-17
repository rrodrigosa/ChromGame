// New Attack - goes really fast in the player direction?
// TODO
show_debug_message("Atak1")
// checks if the player still exists (didn't kill himself by colliding with the enemy in the 
// attack animation)
if (instance_exists(obj_player)) {
	direction=point_direction(x, y, obj_player.x, obj_player.y)
	horizontal_speed = lengthdir_x(5, direction)
	vertical_speed = lengthdir_y(3, direction)-3
	state = boss_states.recharge_attack
	is_grounded_after_attack = false
}


// Animation - draw him trying to bite the player?
image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_boss_jump {
	image_index = 0;
	sprite_index = s_boss_jump
}