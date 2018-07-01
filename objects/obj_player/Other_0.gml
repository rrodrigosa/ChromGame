#region // old code for nearest checkpoint
// checks the nearest checpoint the player is
//for (var i=0; i<global.checkpoint_quantity; i++) {
//	var inst = global.checkpoint_array[i]
//	global.checkpoint_distance = distance_to_object(inst)
//	//if (global.checkpoint_distance < global.max_checkpoint_distance) {
//	if ((global.checkpoint_distance < global.max_checkpoint_distance) && inst.active) {
//		global.closest_checkpoint = inst
//		global.max_checkpoint_distance = global.checkpoint_distance
//	}
//}
#endregion

// destroy player health bar when killed
instance_destroy(obj_player_health)

global.deathTransition = true

instance_destroy()