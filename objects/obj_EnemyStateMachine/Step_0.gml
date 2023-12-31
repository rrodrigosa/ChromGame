enemyVerticalMovement1()

// ---------------------------------------- State Machine
switch (state) {
	#region Idle
	case states.idle:
		enemyIdleState1()
	break
	#endregion
	
	#region Wander
	case states.wander:
		enemyWanderState1()
	break
	#endregion
	
	#region Follow
	case states.follow:
		enemyFollowState1()
	break
	#endregion
	
	#region Charge Attack
	case states.charge_attack:
		enemyChargeAttackState1()
	break
	#endregion
	
	#region Attack
	case states.attack:
		enemyAttackState1()
	break
	#endregion
	
	#region Recharge Attack
	case states.recharge_attack:
		enemyRechargeAttackState1()
	break
	#endregion
	
	#region Taking Damage/Shaking
	case states.damaged:
		// resets the counter
		counter = 0
	
		// enemy shake
		x += random_range(-shake_remain, shake_remain)
		y += random_range(-shake_remain, shake_remain)
		shake_remain = max(0, shake_remain-((1/shake_lenght)*shake_magnitude))
		
		// resets the state
		if (shake_remain <= 0) {
			// after the shaking, resets its valid position
			x = before_shaking_x
			y = before_shaking_y
			
			min_time_change_state--
			if (min_time_change_state <= 0) {
				min_time_change_state = room_speed
				state = states.wander
				// resets the horizontal speed and direction, so when it goes to wander, the enemy isn't still
				my_dir = choose(0, 180)
				horizontal_speed = lengthdir_x(walk_speed, my_dir)
			}
		}
		
		// Taking Damage animation
		image_speed = 1
		image_xscale = enemy_xscale_flip
		if sprite_index != s_enemy_damaged {
			image_index = 0;
			sprite_index = s_enemy_damaged
		}
		
	break
	#endregion
}