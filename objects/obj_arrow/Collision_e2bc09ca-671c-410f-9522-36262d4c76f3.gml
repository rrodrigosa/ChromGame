with (other) {
	current_health--
	flash = 3
	hit_from = other.direction
}

if (!normal_shot) {
	// each arrow only destroys its own corresponding particle system
	with (particleToDeleteId) {
		instance_destroy()
	}
}

instance_destroy()