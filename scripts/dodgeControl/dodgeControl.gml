// Dodge input

// Adicionar gamepad!!!!!!
var dodge_input = keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("J"));

if(dodge_input && is_grounded && !sword_attacking && !bow_attacking && !bow_charging) {
	state = "rolling"
}

if (state == "rolling") {
	horizontal_speed = player_xscale_flip * roll_speed
	// changes the friction so the character speed goes down in the end of the animation
	_friction = 0.3
}