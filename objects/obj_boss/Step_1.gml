//if (current_health <= 0) {
//	// screen shake
//	screenShake(6, 25)
//	with (instance_create_layer(x, y, layer, obj_boss_death)) {
//		direction = other.hit_from
//		horizontal_speed = lengthdir_x(3, direction)
//		vertical_speed = lengthdir_y(3, direction)-3
//		if (sign(horizontal_speed) != 0) {
//			image_xscale = sign(horizontal_speed)
//		}
//	}
//	instance_destroy()
//}

// teste fade "thank you for playing"
if (current_health <= 0) {
	// screen shake
	screenShake(6, 25)
	with (instance_create_layer(x, y, layer, obj_boss_death)) {
		direction = other.hit_from
		horizontal_speed = lengthdir_x(3, direction)
		vertical_speed = lengthdir_y(3, direction)-3
		if (sign(horizontal_speed) != 0) {
			image_xscale = sign(horizontal_speed)
		}
	}
	// Initialize the endTransition after the boss is killed
	global.doEndTransition = true
	global.endRoom = r_EndRoom
	
	// removes the persistent healthbars
	instance_destroy(obj_player_health)
	instance_destroy(obj_boss_health)
	
	// removes the boss
	instance_destroy()
}