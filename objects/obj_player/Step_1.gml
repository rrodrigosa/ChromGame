///// @desc When player dies
if (current_health <= 0) {
	instance_change(obj_player_death, true)
	direction = point_direction(other.x, other.y, x, y)
	horizontal_speed  = lengthdir_x(6, direction)
	vertical_speed = lengthdir_y(4, direction)-2

	if (sign(horizontal_speed) != 0) {
		image_xscale = sign(horizontal_speed)
	}
}