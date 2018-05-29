// checks player distance
// if player is in range, starts following
if (state == "enemy_walking") {
	if (distance_to_object(obj_player) <= range_to_follow) {
		// direction: 0º - 359º
		// enemy moves in the direction of the player, this will need to be more complex if player is above
		// or below the enemy
		direction=point_direction(x, y, obj_player.x, obj_player.y)
	    if (direction > 90 && direction < 270) {
			horizontal_speed = -2
		} else {
			horizontal_speed = 2
		}
	}
	//random_side = true
	// if the enemy is in range for attacking, performs the attack
	if (distance_to_object(obj_player) <= range_to_attack) {
		state = "enemy_attacking"
		done_attack = false
	}
}

if (state == "enemy_reseting") {
	// if the enemy loses the range to follow the player, choose a random side to keep walking
	show_debug_message("Random!")
	if (irandom(1) == 0) {
		horizontal_speed = 2
	} else {
		horizontal_speed = -2
	}
	state = "enemy_walking"
}