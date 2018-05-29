// stops the player right before the attack
horizontal_speed = 0

// counter to charge the attack up
counter++
show_debug_message("Charge counter: "+string(counter))

if (counter >= room_speed) {
	counter = 0
	state = states.attack
}

// charge animation
image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_enemy_charging {
	image_index = 0;
	sprite_index = s_enemy_charging
}