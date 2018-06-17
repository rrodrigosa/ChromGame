playerCollisions()

hinput = (keyboard_check(ord("D")) || keyboard_check(vk_right) || (gamepad_axis_value(global.pad_num, gp_axislh) > 0)) - (keyboard_check(ord("A")) || keyboard_check(vk_left) || (gamepad_axis_value(global.pad_num, gp_axislh) < 0))
vinput = keyboard_check(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(global.pad_num, gp_face1)

// ---------------------------------------- State Machine
switch (state) {
	// ---------------------- Moving
	#region Idle
	case player_states.idle:
	show_debug_message("Idle")
		// if it comes from a moving state, slowly decreases its speed
		horizontal_speed = lerp(horizontal_speed, 0, _friction)
		
		// if running or jumping
		if (hinput != 0 || vinput != 0) {
			state = player_states.moving
		}
		
		// idle animation
		image_xscale = player_xscale_flip
		if sprite_index != s_player_idle {
			image_index = 0
			sprite_index = s_player_idle
		}
	break
	#endregion
	
	#region Running or Jumping
	case player_states.moving:
		// if it's not moving anymore, go back to idle
		if (horizontal_speed == 0 || vertical_speed == 0) {
			state = player_states.idle
		}
		
		// -------------
		if hinput != 0 {
			if (hinput > 0) {
				player_xscale_flip = 1
			} else if (hinput < 0) {
				player_xscale_flip = -1
			}
			horizontal_speed += hinput * acceleration
		    horizontal_speed = clamp(horizontal_speed, -max_hspeed, max_hspeed)
		}
	
		image_speed = 1
		image_xscale = player_xscale_flip
		if sprite_index != s_player_running {
			image_index = 0
			sprite_index = s_player_running
	    }
		
		// -------------------------------------------------------------
		// -------------------- Jump
		if (is_grounded && vinput != 0) {
			vertical_speed = jump_height
			is_grounded = false
		}
		
		// -------------------- Jumping animation up
		if (vertical_speed < 0) {
			image_speed = 1
			image_xscale = player_xscale_flip
			if sprite_index != s_player_jump_up {
				image_index = 0
				sprite_index = s_player_jump_up
		    }
		} 
		// -------------------- Jumping animation down
		else if (vertical_speed > 0) {
			image_speed = 1
			image_xscale = player_xscale_flip
			if sprite_index != s_player_jump_down {
				image_index = 0
				sprite_index = s_player_jump_down
		    }
		}
		
		if (is_grounded) {
			state = player_states.idle
		}
		
	break
	#endregion
	
	#region Dodge
	case player_states.dodge:

	break
	#endregion
	
	// ---------------------- Attacking
	#region Sword Attack
	case player_states.sword_attack:

	break
	#endregion
	
	#region Bow Attack
	case player_states.bow_attack:

	break
	#endregion
		
	#region Taking Damage
	case player_states.damaged:

	break
	#endregion

}



//// -------------------- Controls
//// Check movement inputs
//movementControls()
//// Check sword input
//swordAttackControl()
//// Check bow input
//bowAttackControl()
//// Check dodge input
//dodgeControl()

//// -------------------- Animations
//// Idle or running
//runningIdleAnimation()
//// Jump
//jumpAnimation()
//// Sword attack/combos
//swordAnimation()
//// Bow attack/charge
//bowAnimation()
//// Taking damage
//damageAnimation()
//// Dodge
//dodgeAnimation()

// -------------------- Transition
// transitions the player to specified room with fade in/out
playerTransition()