// This one is located on a step event because it'll change it's position everyframe
// Emits the particle
part_emitter_region(dust, dust_emitter, arrowToFollowId.x-5, arrowToFollowId.x+5, arrowToFollowId.y-5, arrowToFollowId.y+5, 0, 0)
part_emitter_burst(dust, dust_emitter, dust_particle, 10)