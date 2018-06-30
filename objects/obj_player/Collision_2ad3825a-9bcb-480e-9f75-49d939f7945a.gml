if (state != "rolling" && !immune) {
	//current_health--
	obj_player_health.current_health--
	immune = true
	alarm[0] = room_speed * 2
}