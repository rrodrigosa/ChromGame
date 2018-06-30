/// @desc Respawn the player on the last activated checkpoint

//show_debug_message("Player Count: "+string(instance_number(obj_player)))

// everytime the room changes, resets last_activated_checkpoint, so the game doesn't crash in the last room
if (old_room != room) {
	old_room = room
	global.last_activated_checkpoint = noone
}

// checks to see if a checkpoint instance exist so the game won't crash
if (!instance_exists(obj_player) && global.last_activated_checkpoint != noone) {
	#region // old code for nearest checkpoint
	//global.max_checkpoint_distance = 999999 // resets the max distance so the process can happen again
	//instance_create_layer(global.closest_checkpoint.x, global.closest_checkpoint.y, "Instances", obj_player)
	#endregion
	instance_create_layer(global.last_activated_checkpoint.x, global.last_activated_checkpoint.y, "Instances", obj_player)
}