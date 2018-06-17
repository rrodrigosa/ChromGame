// guarantees that the gui and view have the same ratio, 
// otherwise the gui will have the ratio related to the room size and
// not the view

var gui_width = camera_get_view_width(view_camera[0])
var gui_height = camera_get_view_height(view_camera[0])

display_set_gui_size(gui_width, gui_height)