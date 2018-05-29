/// @description Insert description here
// You can write your code in this editor
hover = false;

options[0] = "Music On/Off: ";
options[1] = "Back";

space = 64;
mpos = 0;
timer = 0;

text_pos_width[0] = string_width(string_hash_to_newline(options[0]));
text_pos_width[1] = string_width(string_hash_to_newline(options[1]));

text_pos_height[0] = string_height(string_hash_to_newline(options[0]));
text_pos_height[1] = string_height(string_hash_to_newline(options[1]));

//-------------------------------- toggle [0] --------------------------------
music = true;
text_music = options[0];
text_music_width = string_width(string_hash_to_newline(options[0]));
text_music_height = string_height(string_hash_to_newline(options[0]));
checkbox_width = sprite_get_width(s_checkbox);
checkbox_height = sprite_get_height(s_checkbox);

//-------------------------------- back [1] --------------------------------
text_back = options[1];
text_back_width = string_width(string_hash_to_newline(options[1]));
text_back_height = string_height(string_hash_to_newline(options[1]));


