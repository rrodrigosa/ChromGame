if keyboard_check_pressed(ord("S"))
{
     /// Reset all variable when we build a new path because enemy might be in path when we press S
     speed_h = 0;
     speed_v = 0;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;

    scr_fill_the_grid_64(floor(x/O_Grid.cell_width), floor(y/O_Grid.cell_height), floor(O_Player.x/O_Grid.cell_width), floor(O_Player.y/O_Grid.cell_height));
}

// Follow the path if path exists
if path_exists(path_building)
{
    scr_follow_the_path_64(path_building);
}


// Apply gravity
if !place_meeting (x, y+1, O_Collision)
    {
        speed_v = speed_v + game_gravity ;
    }

// Check if there is a collsiion
scr_collision_64 () ;
