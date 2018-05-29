// to know if the mouse moved or not
old_x = mouse_x
old_y = mouse_y

// Create particle System
dust = part_system_create()

// Create the particle
dust_particle = part_type_create()
part_type_size(dust_particle, 1, 2, 0, 0)
part_type_color1(dust_particle, 55295)
part_type_alpha2(dust_particle, 1, 0)
part_type_speed(dust_particle, 0.8, 1, 0, 0)
part_type_direction(dust_particle, 0, 359, 0, 0)
part_type_gravity(dust_particle, 0.02, 270)
part_type_blend(dust_particle, 1)
part_type_life(dust_particle, room_speed * 2, room_speed * 4)

// Create the emitter
dust_emitter = part_emitter_create(dust)