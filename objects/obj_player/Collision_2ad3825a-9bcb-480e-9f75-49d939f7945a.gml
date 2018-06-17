if (state != "rolling" && !immune) {
	current_health--
	immune = true
	alarm[0] = room_speed * 2
}