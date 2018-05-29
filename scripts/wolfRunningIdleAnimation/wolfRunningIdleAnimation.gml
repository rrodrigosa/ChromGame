// -------------------- Running animation
if (horizontal_speed != 0) {
	image_speed = 1
	image_xscale = enemy_xscale_flip
	if sprite_index != s_wolf_idle {
		image_index = 0;
		sprite_index = s_wolf_idle
    }
} 
// -------------------- Idle animation
else {
	image_xscale = enemy_xscale_flip
	if sprite_index != s_wolf_idle {
		image_index = 0;
		sprite_index = s_wolf_idle
	}
}
