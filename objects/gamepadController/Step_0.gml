// Verifies if there is a connected gamepad
if _flag == true {
    _flag = false
	for (var i=0; i<8; i++) {
        if gamepad_is_connected(i) {
			show_debug_message("Step exists")
			gamepad_set_axis_deadzone(i, 0.5) // Set the "deadzone" for the axis
			gamepad_set_button_threshold(i, 0.1) // Set the "threshold" for the triggers
			// it's global because when the room changes, the new created player knows wich gamepad
			// it belongs (that it should listen for inputs)
			global.pad_num = i
			break
		}
	}
}