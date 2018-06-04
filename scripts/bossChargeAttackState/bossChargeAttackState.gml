// stops the boss right before the attack
horizontal_speed = 0

// counter to charge the attack up
counter++
if (counter >= room_speed) {
	counter = 0
	state = boss_states.attack
}

// charge animation
image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_boss_charging {
	image_index = 0;
	sprite_index = s_boss_charging
}