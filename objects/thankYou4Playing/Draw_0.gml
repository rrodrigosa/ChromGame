// teste fonts e tamanho
draw_set_font(fnt_FontEndRoom);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length_1d(menu); i++){
	// draw shadow
	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	draw_text(rw + 4, (rh + 4) + (i * space_between_lines), string_hash_to_newline(string(menu[i])));
    
	// draw white text
	draw_set_colour(c_white);
	draw_set_alpha(1);
	//draw_text(x + space, y + (i * space), string_hash_to_newline(string(menu[i])));
	draw_text(rw, rh + (i * space_between_lines), string_hash_to_newline(string(menu[i])));
}

// resets to normal font (only needed if drawing more text)
draw_set_font(-1);