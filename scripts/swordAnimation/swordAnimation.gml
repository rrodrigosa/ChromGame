// -------------------- Sword animation
// attack animation 1
if (sword_attacking && sword_attack_animation == 1) {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_sword_attack {
		image_index = 0;
		sprite_index = s_player_sword_attack
    }
	if (image_index > 5) {
		sword_attacking = false
		sword_attack_animation = 2
		sword_combo_active = true
		sword_can_attack = true
	}
}
// attack animation 2
else if (sword_attacking && sword_attack_animation == 2) {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_sword_attack {
		image_index = 6;
		sprite_index = s_player_sword_attack
    }
	if (image_index > 12) {
		sword_attacking = false
		sword_attack_animation = 3
		sword_can_attack = true
	}
}
// attack animation 3
else if (sword_attacking && sword_attack_animation == 3) {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_sword_attack {
		image_index = 13;
		sprite_index = s_player_sword_attack
    }
	var numOfSubImages = sprite_get_number(s_player_sword_attack)
	if (image_index > numOfSubImages - 1) {
		sword_attacking = false
		sword_attack_animation = 1
		sword_can_attack = true
	}
}