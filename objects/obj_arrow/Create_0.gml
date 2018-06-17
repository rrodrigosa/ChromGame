// -------------------- Arrow default variables
if (obj_player.player_xscale_flip) > 0 {
    horizontal_speed = 10
	// set in angles,  0° being right, 90° being up, 180° being left and 270° being down.
	direction = 0
} else if (obj_player.player_xscale_flip) < 0 {
    horizontal_speed = -10
	direction = 180
}

// -------------------- Charged Shot
normal_shot = obj_player.bow_normal_shot
// save the particle object id created by the arrow, so we can delete the exact particle object after
particleToDeleteId = 0
if (!normal_shot) {
	// -------------------- Creates its own particle system
	with (instance_create_layer(x, y, "Particles", arrowParticle)) {
	    x = other.x
	    y = other.y
		// assign the id the particle system should follow
		arrowToFollowId = other.id
		// assign the particle object id the arrow should destroy when it's needed
		other.particleToDeleteId = id
	}
}