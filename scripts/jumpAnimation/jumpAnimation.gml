// -------------------- Jumping animation up
if (vertical_speed < 0 && !sword_attacking && !bow_attacking && state != "rolling") {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_jump_up {
		image_index = 0
		sprite_index = s_player_jump_up
    }
} 
// -------------------- Jumping animation down
else if (vertical_speed > 0 && !sword_attacking && !bow_attacking && state != "rolling") {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_jump_down {
		image_index = 0
		sprite_index = s_player_jump_down
    }
}


