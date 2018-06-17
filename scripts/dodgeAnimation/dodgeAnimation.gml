if (state == "rolling") {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_dodge {
		image_index = 0
		sprite_index = s_player_dodge
    }
	
	var numOfSubImages = sprite_get_number(s_player_dodge)
	if (image_index > numOfSubImages - 1) {
		state = "idle"
		_friction = 1
	}
}