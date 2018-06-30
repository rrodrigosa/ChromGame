/// @desc When player dies
if (instance_exists(obj_player_health)) {
	if (obj_player_health.current_health <= 0) {
		instance_change(obj_player_death, true)
		direction = point_direction(other.x, other.y, x, y)
		horizontal_speed  = lengthdir_x(6, direction)
		vertical_speed = lengthdir_y(4, direction)-2

		if (sign(horizontal_speed) != 0) {
			image_xscale = sign(horizontal_speed)
		}
	
		#region // old code for nearest checkpoint
		//// checks where the nearest checkpoint is
		//for (var i=0; i<global.checkpoint_quantity; i++) {
		//	var inst = global.checkpoint_array[i]
		//	//show_debug_message("Distancia inst: "+string(distance_to_object(inst)))
		//	global.checkpoint_distance = distance_to_object(inst)
		//	//if (global.checkpoint_distance < global.max_checkpoint_distance) {
		//	if ((global.checkpoint_distance < global.max_checkpoint_distance) && inst.active) {
		//		global.closest_checkpoint = inst
		//		global.max_checkpoint_distance = global.checkpoint_distance
		//	}
		//}
		#endregion
	}
}