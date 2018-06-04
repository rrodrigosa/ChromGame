//Input of the player. Horrizontal mouvement
var player_input = keyboard_check(ord("D")) - keyboard_check(ord("A")) ;
if player_input != 0
    {
        speed_h += player_input * acceleration;
        speed_h = clamp(speed_h, -max_speed, max_speed);
    }
        else
        {
            speed_h = lerp(speed_h, 0, game_friction);
        }

//Jump input of the player. Vertical mouvement
if !place_meeting (x, y+1, O_Collision)
    {
        speed_v = speed_v + game_gravity ;
    }
    else    {
                if keyboard_check(ord("W"))
                {
                    speed_v = jump_height ;
                }
            }
    
// Check if there is collision
scr_collision();