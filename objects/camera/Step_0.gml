// update destination

show_debug_message("Follow: "+string(follow))


if (instance_exists(follow)) {
	xTo = follow.x
	yTo = follow.y
	
	// checks if it should follow the obj_player_death on normal speed and not divided by 25
	if (follow.object_index == obj_player_death) {
		x = xTo
		y = yTo
	}
}

// update object position
x += (xTo - x) / 25
y += (yTo - y) / 25

// doesn't let the camera move beyond the room borders
x = clamp(x, view_w_half+buff, room_width-view_w_half-buff)
y = clamp(y, view_h_half+buff, room_height-view_h_half-buff)

// screen shake
x += random_range(-shake_remain, shake_remain)
y += random_range(-shake_remain, shake_remain)
shake_remain = max(0, shake_remain-((1/shake_lenght)*shake_magnitude))

// update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half)

// see how to optimize for performance, by documentation it's not the best way of doing it
if (layer_exists("BackgroundMountains")) {
	layer_x("BackgroundMountains", x/2)
}

if (layer_exists("BackgroundTrees")) {
	layer_x("BackgroundTrees", x/4)
}