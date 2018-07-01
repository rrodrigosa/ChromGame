// Death transition
if(global.deathTransition) {
	if(blackAlpha <= 1 && death_once) {
		blackAlpha += 0.02
	} else {
		instance_destroy(obj_player_death)
		death_once = false
		// teleporta o player
		global.spawn = true
		blackAlpha -= 0.05
		if(blackAlpha <= 0) {
			global.deathTransition = false
			death_once = true
			global.spawn = false
		}
	}
	
	// Draw black fade
	draw_set_alpha(blackAlpha)
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}
