// Create particle System
rain = part_system_create()

// Create the rain particle
rain_particle = part_type_create()
part_type_shape(rain_particle, pt_shape_line)
part_type_size(rain_particle, 0.2, 0.3, 0, 0)
part_type_color2(rain_particle, c_teal, c_white)
part_type_alpha2(rain_particle, 0.5, 0.1)
part_type_gravity(rain_particle, 0.1, 290)
part_type_speed(rain_particle, 0.5, 0.5, 0, 0)
part_type_direction(rain_particle, 250, 330, 0, 1)
part_type_orientation(rain_particle, 290, 290, 0, 0, 0)
part_type_life(rain_particle, 100, 150)

// Create the puddle particle
puddle_particle = part_type_create()
part_type_shape(puddle_particle, pt_shape_circle)
part_type_size(puddle_particle, 0.5, 0.8, 0.01, 0)
part_type_scale(puddle_particle, 0.5, 0.1)
part_type_color1(puddle_particle, c_silver)
part_type_alpha2(puddle_particle, 0.4, 0)
part_type_speed(puddle_particle, 0, 0, 0, 0)
part_type_direction(puddle_particle, 0, 0, 0, 0)
part_type_gravity(puddle_particle, 0, 270)
part_type_life(puddle_particle, 50, 60)

// Set Sequence
part_type_death(rain_particle, 1, puddle_particle)

// Create and Emits the particle
rain_emitter = part_emitter_create(rain)
// If we want the emitter to follow the view, put this code in update (but it wont work 
// with part_system_update)
part_emitter_region(rain, rain_emitter, view_xview[0]-400, view_wview[0], view_yview[0]-100, view_yview[0]-100, ps_shape_line, ps_distr_linear)
part_emitter_stream(rain, rain_emitter, rain_particle, 3)

// Advance System
// Makes it so the particle system advances in time so the player doesn't see the initial effects
// Doesn't work when the object has the "part_emitter_region" and "part_emitter_stream or part_emitter_burst" 
// are placed in the step event
repeat (room_speed * 3) {
    part_system_update(rain)
}