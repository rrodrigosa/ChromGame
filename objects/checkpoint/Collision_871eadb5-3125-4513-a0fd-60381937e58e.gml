if (!active) {
	active = true
	global.last_activated_checkpoint = id
	
	// activates the checkpoint particles
	checkpointParticle.can_emit = true
}