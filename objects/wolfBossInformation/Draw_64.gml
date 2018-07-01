draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (alpha <= 1.5) {
	alpha += 0.005
	for (var i = 0; i < array_length_1d(text_array); i++){
		if (i == 0) {
			draw_set_font(fnt_Arial_36px);
			height1 = string_height(text_array[i])
		} else {
			draw_set_font(fnt_Arial_24px);
			height2 = string_height(text_array[i])
		}
		var total_height = ((height1 + height2 + space_between_lines) - height1/2) / 2
	
		draw_set_alpha(0.5 * alpha);
		draw_set_colour(c_black);
		draw_text(rw + 4, (rh + 4) + (i * space_between_lines) - total_height, text_array[i]);
	
		draw_set_alpha(1 * alpha);
		draw_set_colour(c_white);
		draw_text(rw, rh + (i * space_between_lines) - total_height, text_array[i]);
	}
} else {
	// used on player and boss
    global.can_move = true; 
	
	// resets the camera back to the player
	with(camera) {
		follow = obj_player
	}
	
    //if !audio_is_playing(sn_sound) {
    //    audio_play_sound(sn_sound, 0, true);
    //}
	// resets font to default size
	draw_set_font(-1);
    instance_destroy();
}