if (!normal_shot) {
	// each arrow only destroys its own corresponding particle system
	with (particleToDeleteId) {
		instance_destroy()
	}
}

// destroy the arrow
instance_destroy()