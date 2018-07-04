/// @description Insert description here
// You can write your code in this editor
hover = false;

menu[0] = "Start";
menu[1] = "Options";
menu[2] = "Exit";

space = 64;
mpos = 0;
timer = 0;
timer_bool = true;

text_pos_width[0] = string_width(string_hash_to_newline(menu[0]));
text_pos_width[1] = string_width(string_hash_to_newline(menu[1]));
text_pos_width[2] = string_width(string_hash_to_newline(menu[2]));

text_pos_height[0] = string_height(string_hash_to_newline(menu[0]));
text_pos_height[1] = string_height(string_hash_to_newline(menu[1]));
text_pos_height[2] = string_height(string_hash_to_newline(menu[2]));
