draw_self()

if (!instance_exists(obj_boss)) exit

draw_health = lerp(draw_health, obj_boss.current_health, 0.5)

draw_rectangle_color(x+8, y+8, x+375 * draw_health / obj_boss.max_health, y+23, c_blue, c_blue, c_blue, c_blue, false)