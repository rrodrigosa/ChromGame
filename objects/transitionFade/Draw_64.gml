// Transitions between rooms
if(doTransition){
	// Handle black fase/room transition
	if(room != spawnRoom){
		blackAlpha += 0.1
		if(blackAlpha >= 1) room_goto(spawnRoom)
	} else {
		blackAlpha -= 0.1
		if(blackAlpha <= 0) doTransition = false
	}
	
	// Draw black fade
	draw_set_alpha(blackAlpha)
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}


// Transition to "Thank you for playing" room
if(global.doEndTransition == true) {
	// Handle black fase/room transition
	if(room != global.endRoom) {
		blackAlpha += 0.003
		if(blackAlpha >= 1) room_goto(global.endRoom)
	} else {
		// alpha decreases slower in the beginning
		if (blackAlpha > 0.9) blackAlpha -= 0.0005
		if (blackAlpha <= 0.9 && blackAlpha > 0.7) blackAlpha -= 0.002
		if (blackAlpha <= 0.7 && blackAlpha > 0.6) blackAlpha -= 0.003
		if (blackAlpha <= 0.6 && blackAlpha > 0.5) blackAlpha -= 0.004
		if (blackAlpha <= 0.5) blackAlpha -= 0.005
		
		if(blackAlpha <= 0) {
			global.doEndTransition = false
		}
	}
	
	// Draw black fade
	draw_set_alpha(blackAlpha)
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false)
	draw_set_alpha(1)
}
