draw_self() // the same as if we dont have this draw event (same as default draw)
//draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, true)

if (immune) {
	blinking_counter--
	if (blinking_counter >= 0) {
		shader_set(shRed)
		draw_self()
		shader_reset()
	} else if (blinking_counter <= -(room_speed/4)) {
		// resets the counter
		blinking_counter = room_speed / 4
	}
}