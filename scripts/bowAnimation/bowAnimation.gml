// -------------------- Bow animation
// bow animation
if (bow_attacking && !sword_attacking) {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_bow_attack {
		image_index = 0
		sprite_index = s_player_bow_attack
    }
	
	var numOfSubImages = sprite_get_number(s_player_bow_attack)
	//if (image_index > numOfSubImages - 1) {
	if (image_index > 2.6) {
		bow_attacking = false
	}
} 
else if (bow_charging && !sword_attacking) {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_bow_attack {
		image_index = 0
		sprite_index = s_player_bow_attack
    }
	// if its already in the charging animation, only plays the last but one animation 
	else {
		image_index = 1
	}	
}