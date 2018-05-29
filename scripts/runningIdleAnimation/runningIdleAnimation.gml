// -------------------- Running animation
if (horizontal_speed != 0 && !sword_attacking && !bow_attacking && !bow_charging && is_grounded) {
	sword_attacking = false
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_running {
		image_index = 0
		sprite_index = s_player_running
    }
} 
// -------------------- Idle animation
else {
	if (!sword_attacking && vertical_speed == 0 && !bow_attacking && !bow_charging) {
		image_xscale = player_xscale_flip
		if sprite_index != s_player_idle {
			image_index = 0
			sprite_index = s_player_idle
	    }
		////ping pong animation
		//if (image_index == 0) {
		//	image_speed = 1
		//}
		//var numOfSubImages = sprite_get_number(s_player_idle)
		//if (image_index >= numOfSubImages) {
		//	image_speed = -1
		//	image_index = numOfSubImages - 1
		//}
	}
}


