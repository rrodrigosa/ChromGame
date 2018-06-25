if (mode != TRANS_MODE.OFF) {
	if (mode == TRANS_MODE.INTRO) {
		percent = max(0, percent - max((percent/10), 0.005))
	} else {
		percent = min(1, percent + max(((1 - percent)/10), 0.005))
	}
	
	if (percent == 1 || percent == 0) {
		switch (mode) {
			case TRANS_MODE.INTRO:
				show_debug_message("INTRO")
				mode = TRANS_MODE.OFF
				break

			case TRANS_MODE.NEXT:
				show_debug_message("NEXT")
				mode = TRANS_MODE.INTRO
				room_goto_next()
				break
			
			case TRANS_MODE.GOTO:
				show_debug_message("GOTO")
				mode = TRANS_MODE.INTRO
				room_goto(target)
				break
			
			case TRANS_MODE.RESTART:
				show_debug_message("RESTART")
				game_restart()
				break
		}
	}
}

