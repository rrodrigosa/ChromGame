// Behavior (Move)
counter++
enemyHorizontalMovement1()
		
//Transition Trigger
if (counter >= room_speed * 2) {
	var change = choose(0, 1)
	switch(change){
		case 0: state = states.idle
		case 1: 
		my_dir = choose(0, 180)
		horizontal_speed = lengthdir_x(walk_speed, my_dir)
		counter = 0 break
	}
}
if (distance_to_object(obj_player) <= range_to_follow) {
	state = states.follow
}

image_speed = 1
image_xscale = enemy_xscale_flip
if sprite_index != s_enemy_walking {
	image_index = 0;
	sprite_index = s_enemy_walking
}