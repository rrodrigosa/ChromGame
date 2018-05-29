// Create particle System
snow = part_system_create()
part_system_depth(snow, 60)

// Create the particle
snow_particle = part_type_create()
part_type_shape(snow_particle, pt_shape_snow)
part_type_orientation(snow_particle, 0, 0, 0, 0, 1)
part_type_size(snow_particle, 0.05, 0.25, 0, 0)
part_type_speed(snow_particle, 1, 1.5, 0, 0)
part_type_direction(snow_particle, 270, 270, 0, 4)
part_type_life(snow_particle, room_speed * 3, room_speed * 9)

// Emits the particle
snow_emitter = part_emitter_create(snow)
part_emitter_region(snow, snow_emitter, -100, room_width+100, -10, -5, ps_shape_ellipse, ps_distr_linear)
part_emitter_stream(snow, snow_emitter, snow_particle, -15)