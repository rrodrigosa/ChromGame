//// Update Emitter - on step event so it follows the moving view
//// It's not working with the Advance system
//view_xview is obsolete, using now camera_get_view to get the correct coordinates
//part_emitter_region(rain, rain_emitter, camera_get_view_x(view_camera[0])-room_width, camera_get_view_x(view_camera[0])+room_width, camera_get_view_y(view_camera[0])-100, camera_get_view_y(view_camera[0])-100, ps_shape_line, ps_distr_linear)
//part_emitter_burst(rain, rain_emitter, rain_particle, 3)