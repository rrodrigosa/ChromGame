draw_set_font(fnt_Arial_36px);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

for (var i = 0; i < array_length_1d(text_array); i++) {
	if (i == 0) {
		draw_set_font(fnt_Arial_36px);
		height1 = string_height(text_array[i])
	} else {
		draw_set_font(fnt_Arial_24px);
		height2 = string_height(text_array[i])
		height3 = string_height(text_array[i])
	}
	var total_height = ((height1 + height2 + height2 + space_between_lines) - height1/2) / 2
		
	// draw shadow
	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_text(rw + 4, (rh + 4) + (i * space_between_lines) - total_height, text_array[i]);
    
	// draw white text
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_text(rw, rh + (i * space_between_lines) - total_height, text_array[i]);
}

// resets font to default size
draw_set_font(-1);