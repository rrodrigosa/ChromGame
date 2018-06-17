// Sword input
var sword_input = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("K")) || gamepad_button_check_pressed(global.pad_num, gp_face2);

// Resets the combo counter when attack is pressed while on a attack animation
if (sword_combo_active && sword_input != 0) {
	sword_combo_counter = 0
}

// Resets the attack combo animation step when the combo counter is more then 1 second, so the next attack 
// animation is the first one again
if (sword_combo_counter > room_speed) {
	sword_attack_animation = 1
	sword_combo_counter = 0
	sword_combo_active = false
}

// Starts combo counter when the first attack animation is displayed
if (sword_combo_active) {
	sword_combo_counter += 1
}

// Allow the player to attack after a specific delay
//if sword_input != 0 && sword_counter > sword_delay {
if sword_input != 0 && sword_can_attack && state != "rolling" {
    sword_attacking = true
	// limits other animations so they dont overwrite the attack animation
    // sound effects here
	sword_can_attack = false // resets after end of animation
	with (instance_create_layer(x, y, "Instances", obj_sword)) {
        image_xscale = other.player_xscale_flip
    }
}