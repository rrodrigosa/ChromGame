if (health_points <= 0) {
	with (instance_create_layer(x, y, layer, obj_wolf_death)) {
		direction = other.hit_from
		horizontal_speed = lengthdir_x(3, direction)
		vertical_speed = lengthdir_y(3, direction)-3
		if (sign(horizontal_speed) != 0) {
			image_xscale = sign(horizontal_speed)
		}
	}
	instance_destroy()
}