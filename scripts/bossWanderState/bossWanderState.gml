// Behavior (Move)
counter++
bossHorizontalMovement()
		
//Transition Trigger
if (counter >= room_speed * 2) {	
	counter = 0
	var change = choose(0, 1, 2)
	switch(change){
		case 0: 
			state = boss_states.idle
		case 1: 
			my_dir = choose(0, 180)
			horizontal_speed = lengthdir_x(walk_speed, my_dir)
			break
		case 2: 
			state = boss_states.choose_path
	}
}
if (distance_to_object(obj_player) <= range_to_follow) {
	state = boss_states.follow
}

image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_boss_walking {
	image_index = 0;
	sprite_index = s_boss_walking
}