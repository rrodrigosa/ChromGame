//switch (state) {
//	#region Idle
//	case states.idle:
//		// Behavior
//		counter++
		
//		//Transition Trigger
//		if (counter >= room_speed * 3) {
//			var change = choose(0, 1)
//			switch(change){
//				case 0: state = states.wander
//				case 1: counter = 0 break
//			}
//		}
//		if (distance_to_object(obj_player) <= range_to_follow) {
//			state = states.follow
//		}
		
//		// Sprite
//		sprite_index = s_enemy_idle
//	break
//	#endregion
	
//	#region Wander
//	case states.wander:
//		// Behavior
//		counter++
//		x+= moveX
		
//		//Transition Trigger
//		if (counter >= room_speed * 3) {
//			var change = choose(0, 1)
//			switch(change){
//				case 0: state = states.idle
//				case 1: 
//				my_dir = choose(0, 180)
//				moveX = lengthdir_x(spd, my_dir)
//				counter = 0 break
//			}
//		}
//		if (distance_to_object(obj_player) <= range_to_follow) {
//			state = states.follow
//		}
		
//		// Sprite
//		sprite_index = s_enemy_idle
//		image_xscale = sign(moveX)
//	break
//	#endregion
	
//	#region Follow
//	case states.follow:
//		// Behavior
//		my_dir = point_direction(x, y, obj_player.x, obj_player.y)
//		moveX = lengthdir_x(spd, my_dir)
//		x+= moveX
		
//		//Transition Trigger
//		if (!distance_to_object(obj_player) <= range_to_follow) {
//			state = states.idle
//		}

//		if (distance_to_object(obj_player) <= range_to_attack) {
//			state = states.attack
//		}
		
//		// Sprite
//		sprite_index = s_enemy_idle
//		image_xscale = sign(moveX)
//	break
//	#endregion
	
//	#region Attack
//	case states.attack:
//	break
//	#endregion
//}