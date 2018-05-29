/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
for (var i = 0; i < array_length_1d(menu); i++){
    //draw shadow
    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(x + space + 4, y + (i * space) + 4, string_hash_to_newline(string(menu[i])));
    
    if mpos == i {
        if hover != true {
            draw_set_colour(c_red);
        } else {
            draw_set_colour(c_white);
        }
    } else {
        draw_set_colour(c_white);
    }
    
    // if mouse inside this box, indicator is not drawn
    if point_in_rectangle(mouse_x, mouse_y, x + space, y - (text_pos_height[i]/2) , x + space + text_pos_width[1], y + ((array_length_1d(menu) - 1) * space) + (text_pos_height[i]/2)) {
        hover = true;
        if point_in_rectangle(mouse_x, mouse_y, x + space, y + (i * space) - (text_pos_height[i]/2) , x + space + text_pos_width[i], y + (i * space) + (text_pos_height[i]/2)) {
            draw_set_colour(c_red);
            if mouse_check_button_pressed(mb_left) {
                if i == 0 {
                    room_goto(r_one);
                } else if i == 1 {
                    room_goto(r_options);
                } else if i == 2 {
                    //room_goto(r_credits);
                } else if i == 3 {
                    game_end();
                }
            }
        }
    } else {
        hover = false;
    }

    draw_set_alpha(1);
    draw_text(x + space, y + (i * space), string_hash_to_newline(string(menu[i])));
}

if hover != true {
    draw_sprite(s_menu_index, 0, x + 16, y + mpos * space);
}




