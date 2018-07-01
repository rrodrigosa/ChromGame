// variables
can_emit = false


// Create particle System
cp = part_system_create()

// Create the cp particle
cp_particle = part_type_create()
part_type_shape(cp_particle, pt_shape_flare);
part_type_size(cp_particle, 0.01, 0.05, 0, 0.5);
part_type_color3(cp_particle, c_aqua, c_lime, c_red);
part_type_alpha3(cp_particle, 0.5, 1, 0);
part_type_speed(cp_particle, 2, 5, -0.10, 0);
part_type_direction(cp_particle, 0, 359, 0, 20);
part_type_blend(cp_particle, true);
part_type_life(cp_particle, 30, 60);

