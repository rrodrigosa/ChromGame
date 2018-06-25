space_between_lines = 64
rw = room_width/2;
rh = room_height/2;

menu[0] = "Thank you for playing!";
menu[1] = "Follow us on facebook =D";

text_pos_width[0] = string_width(string_hash_to_newline(menu[0]));
text_pos_height[0] = string_height(string_hash_to_newline(menu[0]));

text_pos_width[1] = string_width(string_hash_to_newline(menu[1]));
text_pos_height[1] = string_height(string_hash_to_newline(menu[1]));