if (state == "enemy_attacking" && done_attack == false) {
	// stops the player right before the attack
	horizontal_speed = 0
	// counter to charge attack up
	enemy_attack_counter--
	if (enemy_attack_counter <= 0) {
		// jumps on player - TODO: make an animation
		// checks if the player still exists (didn't kill himself by colliding with the enemy in the 
		// attack animation)
		if (instance_exists(obj_player)) {
			direction=point_direction(x, y, obj_player.x, obj_player.y)
			show_debug_message("Direction: "+string(direction))
			horizontal_speed = lengthdir_x(5, direction)
			vertical_speed = lengthdir_y(3, direction)-3
			if (sign(horizontal_speed) != 0) {
				image_xscale = sign(horizontal_speed)
			}
		}
		done = true
		done_attack = true
	}
}