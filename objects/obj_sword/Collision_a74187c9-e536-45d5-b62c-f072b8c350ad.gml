// screen shake
screenShake(2, 10)

with (other) {
	health_points--
	flash = 3
	// because the sword object direction is always 0, use the player_xscale (or change the sword direction 
	// variable in the create event, so we can use it here, both ways work)
	if (obj_player.player_xscale_flip > 0) {
		hit_from = 0
	} else if (obj_player.player_xscale_flip < 0) {
		hit_from = 180
	}
	
	// set its last valid position in the room before getting hit
	before_shaking_x = x
	before_shaking_y = y
	// changes it state and shake the enemy
	state = states.damaged
	enemyShake(4, 20)
}