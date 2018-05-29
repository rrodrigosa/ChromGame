// -------------------- Taking damage animation
if (state == "takingDamage") {
	image_speed = 1
	image_xscale = player_xscale_flip
	if sprite_index != s_player_damage {
		image_index = 0
		sprite_index = s_player_damage
    }
}