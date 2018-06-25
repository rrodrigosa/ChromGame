/// @desc Respawn the player on the last activated checkpoint
// checks to see if a checkpoint instance exist so the game won't crash
if (!instance_exists(obj_player) && global.last_activated_checkpoint != noone) {
	#region // old code for nearest checkpoint
	//global.max_checkpoint_distance = 999999 // resets the max distance so the process can happen again
	//instance_create_layer(global.closest_checkpoint.x, global.closest_checkpoint.y, "Instances", obj_player)
	#endregion
	instance_create_layer(global.last_activated_checkpoint.x, global.last_activated_checkpoint.y, "Instances", obj_player)
}