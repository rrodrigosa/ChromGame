horizontal_speed = 0
vertical_speed = 0
gravity_speed = 0.2
done = 0

image_speed = 0
image_index = 0

//ScreenShake(6, 60)
//audio_play_sound(sndPlayerDeath, 10, false)
game_set_speed(30, gamespeed_fps) //uncomment

// tells the camera it should follow this object instead of the alive player
with (camera) {
	follow = other.id
}