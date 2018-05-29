// Dodge input
var dodge_input = keyboard_check_pressed(ord("J"));

if(dodge_input) {
	state = "rolling"
	alarm[0] = room_speed / 2
}

if (state == "rolling") {
	horizontal_speed = player_xscale_flip * roll_speed
	// changes the friction so the character speed goes down in the end of the animation
	_friction = 0.3
}