// make it so the player and the boss can't move until the timer is over
global.can_move = false

alpha = 0
space_between_lines = 50

cam = view_camera[0]
rw = camera_get_view_width(cam) * 0.5;
rh = camera_get_view_height(cam) * 0.5

text_array[0] = "The Big Badass Wolf"
text_array[1] = "the dark spirit of the woods"

total_height = 0
height1 = 0
height2 = 0