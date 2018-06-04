// Behavior
counter++
		
//Transition Trigger
if (counter >= room_speed * 2) {
	var change = choose(0, 1)
	switch(change){
		case 0: 
		state = states.wander
		my_dir = choose(0, 180)
		horizontal_speed = lengthdir_x(walk_speed, my_dir)
		case 1: counter = 0 break
	}
}
if (distance_to_object(obj_player) <= range_to_follow) {
		state = states.follow
}

// Idle Animation
image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_wolf_idle {
	image_index = 0;
	sprite_index = s_wolf_idle
}