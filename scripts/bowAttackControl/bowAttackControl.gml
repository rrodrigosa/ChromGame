// Bow input
var shoot_input = keyboard_check(ord("Z")) || keyboard_check(ord("L")) || gamepad_button_check(global.pad_num, gp_shoulderr);
var shoot_input_released = keyboard_check_released(ord("Z")) || keyboard_check_released(ord("L")) || gamepad_button_check_released(global.pad_num, gp_shoulderr);

if (shoot_input != 0 && !sword_attacking && state != "rolling") {
	bow_charging = true
	bow_charge_counter++
}

if (shoot_input_released != 0 && !sword_attacking && state != "rolling") {
    if bow_charge_counter > bow_max_charge {
		// charged attack
		bow_normal_shot = false
		bow_attacking = true
        
    } else {
		// normal attack
		bow_normal_shot = true
		bow_attacking = true
	}
	//reset the variables
	bow_charging = false
    bow_charge_counter = 0
}

// can only shoot the bow if it's not sword attacking or dodging (put some delay to look better)
if (!sword_attacking && state != "rolling") {
	if shoot_input_released != 0 && bow_counter > bow_delay {
	    //sound effects here
	    bow_counter = 0;
		with (instance_create_layer(x+5*player_xscale_flip, y, "Player", obj_arrow)) {
	        image_xscale = other.player_xscale_flip
		}
	}
}
bow_counter += 1