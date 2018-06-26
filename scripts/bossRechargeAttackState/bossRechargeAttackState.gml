bossHorizontalMovement()
		
if (is_grounded_after_attack) {
	horizontal_speed = 0
	is_grounded_after_attack = false
	// Idle Animation
	image_speed = 1
	image_xscale = enemy_xscale_flip
	if sprite_index != s_boss_idle {
		image_index = 0;
		sprite_index = s_boss_idle
	}
}
		
counter++
if (counter >= room_speed * 2) {
	counter = 0
	state = boss_states.wander
	// resets the horizontal speed and direction, so when it goes to wander, the enemy isn't still
	my_dir = choose(0, 180)
	horizontal_speed = lengthdir_x(walk_speed, my_dir)
}