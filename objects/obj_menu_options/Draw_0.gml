/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
for (var i = 0; i < array_length_1d(options); i++){
    //draw shadow
    draw_set_alpha(0.5);
    draw_set_colour(c_black);
    draw_text(x + space + 4, y + (i * space) + 4, string_hash_to_newline(string(options[i])));
    
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
    if point_in_rectangle(mouse_x, mouse_y, x + space, y - (text_pos_height[i]/2) , x + space + text_pos_width[0] + checkbox_width, y + (1 * space) + (text_pos_height[i]/2)) {
        hover = true;
        if point_in_rectangle(mouse_x, mouse_y, x + space, y + (i * space) - (text_pos_height[i]/2) , x + space + text_pos_width[i], y + (i * space) + (text_pos_height[i]/2)) {
            draw_set_colour(c_red);
            if mouse_check_button_pressed(mb_left) {
                if i == 0 {
                    music = !music;
                    if music == false {
                        //audio_stop_sound(sound5);
                    } else {
                        //audio_play_sound(sound5, 0, true);
                    }
                } else if i == 1 {
                    room_goto(r_menu);
                }
            }
        }
    } else {
        hover = false;
    }

    draw_set_alpha(1);
    draw_text(x + space, y + (i * space), string_hash_to_newline(string(options[i])));
            
    if i == 0 {
        draw_sprite(s_checkbox, 0, x + space + text_music_width, y - checkbox_height/2);
    }
}

if hover != true {
    draw_sprite(s_menu_index, 0, x + 16, y + mpos * space);
}

if music == true {
   draw_sprite(s_checkbox_tick, 0, x + space + text_music_width, y - checkbox_height/2);
}