wolfVerticalMovement()

// ---------------------------------------- State Machine
switch (state) {
	#region Idle
	case states.idle:
		wolfIdleState()
	break
	#endregion
	
	#region Wander
	case states.wander:
		wolfWanderState()
	break
	#endregion
	
	#region Follow
	case states.follow:
		wolfFollowState()
	break
	#endregion
	
	#region Charge Attack
	case states.charge_attack:
		wolfChargeAttackState()
	break
	#endregion
	
	#region Attack
	case states.attack:
		wolfAttackState()
	break
	#endregion
	
	#region Recharge Attack
	case states.recharge_attack:
		wolfRechargeAttackState()
	break
	#endregion
	
	#region Taking Damage/Shaking
	case states.damaged:
		wolfDamagedState()
		
	break
	#endregion
}