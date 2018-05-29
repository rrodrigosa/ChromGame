// This one is located on a step event because it'll change it's position everyframe

// Emits the particle
part_emitter_region(dust, dust_emitter, mouse_x-5, mouse_x+5, mouse_y-5, mouse_y+5, 0, 0)

if old_x != mouse_x || old_y != mouse_y {
	part_emitter_burst(dust, dust_emitter, dust_particle, 10)
}

old_x = mouse_x
old_y = mouse_y