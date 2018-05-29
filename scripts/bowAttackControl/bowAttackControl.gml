// Bow input
//var shoot_input = keyboard_check_pressed(ord("L")) || gamepad_button_check_pressed(global.pad_num, gp_face4);

var shoot_input = keyboard_check(ord("L")) || gamepad_button_check(global.pad_num, gp_face4);
var shoot_input_released = keyboard_check_released(ord("L")) || gamepad_button_check_released(global.pad_num, gp_face4);

if (shoot_input != 0) {
	bow_charging = true
	bow_charge_counter++
}

if (shoot_input_released != 0) {
    if bow_charge_counter > bow_max_charge {
		// charged attack
		bow_normal_shot = false
		bow_attacking = true
        
    } else {
		// normal attack
		bow_normal_shot = true
		bow_attacking = true
	}
	bow_charging = false
    bow_charge_counter = 0
}

// can only shoot the bow if it's not attacking (put some delay to make it look better)
if (!sword_attacking) {
	if shoot_input_released != 0 && bow_counter > bow_delay {
	    //sound effects here
	    bow_counter = 0;
		with (instance_create_layer(x+5*player_xscale_flip, y, "Instances", obj_arrow)) {
	        image_xscale = other.player_xscale_flip
		}
	}
}
bow_counter += 1