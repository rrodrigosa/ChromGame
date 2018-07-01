if (state != "rolling" && !immune) {
	//current_health--
	obj_player_health.current_health--
	immune = true
	other_x = other.x
	other_y = other.y
	alarm[0] = room_speed * 2
}