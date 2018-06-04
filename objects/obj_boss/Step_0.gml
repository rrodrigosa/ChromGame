bossVerticalMovement()

// ---------------------------------------- State Machine
switch (state) {
	// ---------------------- Moving
	#region Idle
	case boss_states.idle:
		bossIdleState()
	break
	#endregion
	
	#region Wander
	case boss_states.wander:
		bossWanderState()
	break
	#endregion
	
	#region Follow
	case boss_states.follow:
		bossFollowState()
	break
	#endregion
	
	// ---------------------- Attacking
	#region Choose Attack
	case boss_states.choose_attack:
		var rand = choose(0, 1)
		if (0) {
			state = boss_states.charge_attack
		} else {
			state = boss_states.charge_attack2
		}
	break
	#endregion
	
	#region Charge Attack
	case boss_states.charge_attack:
		bossChargeAttackState()
	break
	#endregion
	
	#region Charge Attack2
	case boss_states.charge_attack2:
		// stops the boss right before the attack
		horizontal_speed = 0

		// counter to charge the attack up
		counter++
		if (counter >= room_speed) {
			counter = 0
			state = boss_states.attack2
		}

		// charge animation
		image_speed = 1
		image_xscale = enemy_xscale_flip
		if sprite_index != s_boss_charging2 {
			image_index = 0;
			sprite_index = s_boss_charging2
		}
	break
	#endregion
	
	#region Attack
	case boss_states.attack:
		bossAttackState()
	break
	#endregion
	
	// New Attack - goes really fast in the player direction?
	#region Attack2
	case boss_states.attack2:
		// -------------------- Custom Horizontal collision
		if place_meeting(x+horizontal_speed, y, obj_solid) {
		    while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
		        x += sign(horizontal_speed);
		    }
			horizontal_speed = 0
			can_attack = false
		}
		x += horizontal_speed
		// setting the direction enemy is facing
		if (horizontal_speed != 0) {
			show_debug_message("xscale: "+string(enemy_xscale_flip))
			enemy_xscale_flip = sign(horizontal_speed)
		}
		
		// checks if the player still exists (didn't kill himself by colliding with the enemy in the 
		// attack animation)
		if (instance_exists(obj_player)) {
			if (player_pos_once) {
				my_dir = point_direction(x, y, obj_player.x, y) // ignores player y
				player_last_x = obj_player.x
				player_pos_once = false
			}
			
			// while the boss haven't reach the player last x, keep moving him
			if (can_attack && abs(player_last_x - x) > sprint_speed) {
				horizontal_speed = lengthdir_x(sprint_speed, my_dir)
			} 
			// if he has reached, start deaccelerating
			else {
				can_attack = false
				horizontal_speed = lerp(horizontal_speed, 0, _friction)
			}
			
			// once he reached a low speed, change state
			if (abs(horizontal_speed) <= 1) {
				state = boss_states.idle
				player_pos_once = true
				can_attack = true
			}
		}

		// Animation - draw him trying to bite the player?
		image_speed = 1
		image_xscale = enemy_xscale_flip
		if sprite_index != s_boss_walking {
			image_index = 0;
			sprite_index = s_boss_walking
		}
		
		// Fazer a animação de fade atras do boss quando ele atacar
		bossDashAnimation()
	break
	#endregion
	
	#region Recharge Attack
	case boss_states.recharge_attack:
		bossRechargeAttackState()
	break
	#endregion
	
	#region Taking Damage/Shaking
	case boss_states.damaged:
		bossDamagedState()
	break
	#endregion
	
	
	// ---------------------- Climbing
	// Algum state vai chamar o choose_path. O que seria legal? Algum contador, dar ou receber 3 ataques, 
	// usar como fuga do boss?
	#region Choose path
	case boss_states.choose_path:
		// deve escolher apenas aquele que pode chegar
		path = choose(0, 1, 2, 3)
		obj_path = bossPathController.boss_path_array[path]
		
		// verifica se escolheu um path possível (na mesma altura/altura parecida)
		if (abs(obj_path.y - y) <= 100) {
			state = boss_states.move_to_path
		}
	break
	#endregion
	
	#region Move to path
	case boss_states.move_to_path:
		var path_dir = point_direction(x, y, obj_path.x, y)
		horizontal_speed = lengthdir_x(walk_speed, path_dir)
		
		// -------------------- Horizontal collision
		if place_meeting(x+horizontal_speed, y, obj_solid) {
			while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
				x += sign(horizontal_speed);
			}
			horizontal_speed = 0
		}
		x+= horizontal_speed
		// setting the direction enemy is facing
		if (horizontal_speed != 0) {
			enemy_xscale_flip = sign(horizontal_speed)
		}
		
		// original. use the distance_to_object to something else
		//if (distance_to_object(obj_path) <= walk_speed) {
		//	state = boss_states.climb_platform
		//}
		
		// checks if it's in the minimum distance to jump
		if (abs(obj_path.x - x) <= walk_speed) {
			// snaps the boss x to the object so it can jump from the correct position
			x = obj_path.x
			// making sure to reset the speeds otherwise the jump will be affected by the old values
			horizontal_speed = 0
			vertical_speed = 0
			state = boss_states.climb_platform
		}
		
	break
	#endregion
	
	#region Climb platform
	case boss_states.climb_platform:
		// -------------------- Horizontal collision
		if place_meeting(x+horizontal_speed, y, obj_solid) {
			while !place_meeting(x+sign(horizontal_speed), y, obj_solid) {
				x += sign(horizontal_speed);
			}
			horizontal_speed = 0
		}
		x+= horizontal_speed
		// setting the direction enemy is facing
		if (horizontal_speed != 0) {
			enemy_xscale_flip = sign(horizontal_speed)
		}

		if (is_grounded_after_attack) {
			horizontal_speed = 0
			is_grounded_after_attack = false
			can_jump = true
		}
		
		// precisa saber qual path/obj ele está
		// path 0 = left side going up
		if (path == 0 && can_jump) {
			jump_count++
			state = boss_states.jump_left_up
		} 
		// path 1 = right side going up
		else if (path == 1 && can_jump) {
			jump_count++
			state = boss_states.jump_right_up
		}
		// path 2 = left side going down
		else if (path == 2 && can_jump) {
			jump_count++
			state = boss_states.jump_left_down
		}
		// path 3 = right side going down
		else if (path == 3 && can_jump) {
			jump_count++
			state = boss_states.jump_right_down
		}
		// path -5 (leave the climb state)
		else if (path == -5 && can_jump) {
			state = boss_states.idle
		}
	break
	#endregion
	
	#region Jump left up
	case boss_states.jump_left_up:
		if (jump_count == 1) {
			jump_dir = 130
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(10, jump_dir)-0.8
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 2) {
			jump_dir = 45
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(12, jump_dir)+0.2
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 3) {
			jump_dir = 45
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(12, jump_dir)
			state = boss_states.climb_platform
			path = -5 // any number so it doesnt enter the same path again
			can_jump = false
			jump_count = 0 // so it can start all over again
		}
	break
	#endregion
	
	#region Jump left down
	case boss_states.jump_left_down:
		if (jump_count == 1) {
			jump_dir = 130
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(4, jump_dir)
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 2) {
			jump_dir = 130
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(6, jump_dir)
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 3) {
			jump_dir = 35
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(6, jump_dir)
			state = boss_states.climb_platform
			path = -5 // any number so it doesnt enter the same path again
			can_jump = false
			jump_count = 0 // so it can start all over again
		}
	break
	#endregion
	
	#region Jump right up
	case boss_states.jump_right_up:
		if (jump_count == 1) {
			jump_dir = 50
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(10, jump_dir)-0.8
			state = boss_states.climb_platform
			can_jump = false
		} 
		else if (jump_count == 2) {
			jump_dir = 135
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(12, jump_dir)+0.2
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 3) {
			jump_dir = 135
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(12, jump_dir)
			state = boss_states.climb_platform
			path = -5 // any number so it doesnt enter the same path again
			can_jump = false
			jump_count = 0 // so it can start all over again
		}
	break
	#endregion
	
	#region Jump right down
	case boss_states.jump_right_down:
		if (jump_count == 1) {
			jump_dir = 50
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(4, jump_dir)
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 2) {
			jump_dir = 50
			horizontal_speed = lengthdir_x(7, jump_dir)
			vertical_speed = lengthdir_y(6, jump_dir)
			state = boss_states.climb_platform
			can_jump = false
		} else if (jump_count == 3) {
			jump_dir = 145
			horizontal_speed = lengthdir_x(6, jump_dir)
			vertical_speed = lengthdir_y(6, jump_dir)
			state = boss_states.climb_platform
			path = -5 // any number so it doesnt enter the same path again
			can_jump = false
			jump_count = 0 // so it can start all over again
		}
	break
	#endregion
}