var number_of_points = path_get_number(argument0);
var path_direction ;

path_direction = sign(path_get_point_x(argument0, path_point+1)-path_get_point_x(argument0, path_point));

anchor_y = y + 16
// ajusta a ancora para próximo ponto (path_point) que seja FALL. é feito da maneira oposta de quando se anda normalmente
if (path_direction) == -1 { // indo para esquerda
	ajust_x_pixel = -16
} else if (path_direction == 1) { // indo para direita
	ajust_x_pixel = 16
}

if action == 0 {

	/// Check if the next point is to move left or right
    if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1) && path_get_point_x(argument0, path_point) + O_Grid.cell_width*path_direction == path_get_point_x(argument0, path_point+1) {
		//show_debug_message("Right")
	    speed_h = max_speed * path_direction ;
	    action = 1;
		
    } else {
		
        /// Check if the next point is horizontal jump / jump over a void.
        if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1) && path_get_point_x(argument0, path_point) + 2*O_Grid.cell_width*path_direction == path_get_point_x(argument0, path_point+1) {
			//show_debug_message("Jump Void")
	        speed_h = max_speed * path_direction ;
	        speed_v = jump_height *0.7 ;
	        //speed_v = jump_height * 2;
	        action = 1;
				
	    } else {
			
			// TESTANDO AQUI \/ FALL (BIGGER JUMP)
			
            /// Check if the next point is to fall
            if path_get_point_y(argument0, path_point) < path_get_point_y(argument0, path_point+1) {
				//show_debug_message("Fall")
				speed_h = max_speed * path_direction ;
                if x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <(x + speed_h*path_direction) {
                //if anchor_x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <(anchor_x + speed_h*path_direction) {
	                action = 1 ;
	                speed_h = 0 ;
	                //x = path_get_point_x(argument0, path_point+1); // original
	                x = path_get_point_x(argument0, path_point+1) + ajust_x_pixel;
					temp = true
                }
						
            } else {
				/// Check if the next point is a diagonal jum /big jump
                if path_get_point_x(argument0, path_point) == path_get_point_x(argument0, path_point+1)-O_Grid.cell_width*2*path_direction && path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1)+O_Grid.cell_height {
					show_debug_message("Diagonal Jump")
	                speed_h = max_speed * path_direction * 0.625 ;
	                speed_v = jump_height * 1.1 ;
	                //speed_v = jump_height * 4 ;
	                action = 1;
							
	            } else {
					/// Check if the next point is a jump one block vertically
                    if path_get_point_y(argument0, path_point) == path_get_point_y(argument0, path_point+1)+O_Grid.cell_height && path_get_point_x(argument0, path_point) + O_Grid.cell_width*path_direction == path_get_point_x(argument0, path_point+1) {
						//show_debug_message("Jump vertically")
						speed_h = max_speed * path_direction / 2;
                        if place_meeting(x, y+1, O_Collision) && jump_action == 0 {
                        //if place_meeting(anchor_x, anchor_y+1, O_Collision) && jump_action == 0 {
	                        speed_v = jump_height * 0.9 ;
	                        //speed_v = jump_height * 2 ;
	                        jump_action = 1 ;
	                        speed_h = max_speed * path_direction ;
                        }
                    }
                }
			}
		}
	}
}


if (!temp) {
	// ajusta a ancora para ir corretamente para o próximo ponto (path_point)
	if (path_direction) == -1 {
		anchor_x = x-16
	} else if (path_direction == 1) {
		anchor_x = x+16
	}
}

if (temp) {
	if (path_direction) == -1 {
		anchor_x = x+16
	} else if (path_direction == 1) {
		anchor_x = x-16
	}
}

//show_debug_message(string(anchor_x)+" <= "+string(path_get_point_x(argument0, path_point+1)))
//show_debug_message(string(path_get_point_x(argument0, path_point+1))+" <= "+string(anchor_x + speed_h*path_direction))
//show_debug_message(string(path_get_point_y(argument0, path_point+1))+" == "+string(y - sprite_yoffset - (O_Grid.cell_height/2 - sprite_height)))
////show_debug_message("sprite_yoffset: "+string(sprite_yoffset))
////show_debug_message("div: "+string(O_Grid.cell_height/2))
////show_debug_message("s_height: "+string(sprite_height))
//show_debug_message("---------==========---------")

/// Check if enemy reached the next point
//if x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <= x + speed_h*path_direction && path_get_point_y(argument0, path_point+1)== y - sprite_yoffset - (O_Grid.cell_height/2 - sprite_height)
if anchor_x <= path_get_point_x(argument0, path_point+1) && path_get_point_x(argument0, path_point+1) <= anchor_x + speed_h*path_direction && path_get_point_y(argument0, path_point+1)== y - sprite_yoffset - (O_Grid.cell_height/2 - sprite_height) {
	
	temp = false
	
    path_point = path_point + 1;
    action = 0;
    jump_action = 0;
	
	/// Check if it is the last point of the path
	if path_point == number_of_points -1 {
	    speed_h = 0;
	    speed_v = 0;
	    path_delete (argument0);
	    path_point = 0;
	}
}
