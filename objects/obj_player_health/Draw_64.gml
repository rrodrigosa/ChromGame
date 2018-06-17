draw_self()

if (!instance_exists(obj_player)) exit

draw_health = lerp(draw_health, obj_player.current_health, 0.5)

draw_rectangle_color(x+4, y+4, x+123 * draw_health / obj_player.max_health, y+11, c_blue, c_blue, c_blue, c_blue, false)