// Identifies when a gamepad is connected or disconected
switch(async_load[? "event_type"]) {             // Parse the async_load map to see which event has been triggered
	case "gamepad discovered":                     // A game pad has been discovered
        var pad = async_load[? "pad_index"]       // Get the pad index value from the async_load map
        gamepad_set_axis_deadzone(pad, 0.5)       // Set the "deadzone" for the axis
        gamepad_set_button_threshold(pad, 0.1)    // Set the "threshold" for the triggers

		show_debug_message("Async exists")
		global.pad_num = async_load[? "pad_index"]
		break
}