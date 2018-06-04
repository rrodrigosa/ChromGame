var ax = argument0;   // Start X position
//show_debug_message("ax 64: "+string(ax))
var ay = argument1;    // Start Y position
//show_debug_message("ay 64: "+string(ay))
var xgoal = argument2;   // X Position where we want to go
//show_debug_message("xgoal: "+string(xgoal))
var ygoal = argument3;  // Y Position where we want to go
//show_debug_message("ygoal: "+string(ygoal))
var path_found;      // A way was found
var n;  // Variable when you fall
var a; // Variable when you fall
path_found = 0;  // 0 means that the path is not found

/// Copy the global pathfinding
ds_gridpathfinding = ds_grid_create(ds_grid_width(global.ds_grid_pathfinding), ds_grid_height(global.ds_grid_pathfinding));
ds_grid_copy (ds_gridpathfinding, global.ds_grid_pathfinding);

/// Add the first point into the list
var point_list = ds_list_create();
ds_list_add (point_list, ax);
ds_list_add (point_list, ay);
ds_grid_set(ds_gridpathfinding,ax,ay,0); // onde o inimigo começa é 0
//for (var rd = 0; rd<ds_list_size(point_list); rd++) {
//	show_debug_message("List: "+string(ds_list_find_value(point_list, rd)))
//}

// Completa no máximo 200 blocos/passos na grid
for (var i=1; i<200; i+=1) {
	// -------------------------- Path Found
    if path_found == 1 {
	    ds_list_destroy(point_list); // We don't need the list anymore because we find a path.
	    ///ds_grid_destroy(ds_gridpathfinding); /// Grid has to be delete. We keep it only for debuger purposes
	    return path_found;
	    break;
    }
	
	// -------------------------- Size List
	var size_list = ds_list_size(point_list);  // Update the size of the list. It is for delete all the previous points.
	if size_list == 0 {    // When size list is zero, it means that, we check all the positions where the enemy could go, and no one is the goal position
		ds_list_destroy(point_list);   // Destroy the list because it takes up memory and we don't need it anymore.
		ds_grid_destroy(ds_gridpathfinding); // // Destroy the grid because it takes up memory.
		return path_found;  /// It will return 0, so if script returns 0, it means that no path was found to reach the goal.
		break;
	}

	// -------------------------- Loop size_list and all following code
	// É de 2 em 2 pois a lista possui sempre o valor ax e o valor ay em seguida, logo a cada 2 posições na lista equivale a uma nova posição na grid
	for (var j=0; j<size_list; j+=2) {
	    ax = ds_list_find_value(point_list,j)
	    ay = ds_list_find_value(point_list,j+1)
	    if ax==xgoal && ay==ygoal {
		    path_found = 1;
		    scr_build_the_path_64(xgoal,ygoal);
		    break;
	    }
		
		// -------------------------- RIGHT SIDE
	
		n=1 ; /// Variable for the Fall

		/// Check if the enemy can go to the right
		// original
		if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+1,ay+1)==-2 {
		//if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+1,ay+1)==-2 && ds_grid_get(ds_gridpathfinding,ax+2,ay+1)==-2 {
			ds_grid_set(ds_gridpathfinding,ax+1,ay,i);
			ds_list_add (point_list, ax + 1);
			ds_list_add (point_list, ay);
		
		} else {   /// If the enemy can go to the right, the other movement will be impossible. So we can put a else to skip all the following code

			/// Check if we can go jump one block vertically (right side)
			// original
			if (ds_grid_get(ds_gridpathfinding,ax+1,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+1,ay-1)==-1) { 
			//if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+1,ay-1)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay-1)==-1 {
				ds_grid_set(ds_gridpathfinding,ax+1,ay-1,i);
				ds_list_add (point_list, ax + 1);
				ds_list_add (point_list, ay-1);
				
			} else {  /// If the ennemy can go jump one block horizontally, the others movement will be impossible. So we can put a else to skip all the following code
				
				/// Check if the enemy can do a diagonal jump (Big Jump). (Right side);
				// original
				if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+2,ay-1)==-1 {
				//if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+3,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+4,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax+3,ay-1)==-1 && ds_grid_get(ds_gridpathfinding,ax+4,ay-1)==-1 {
					ds_grid_set(ds_gridpathfinding,ax+2,ay-1,i);
					ds_list_add (point_list, ax + 2);
					ds_list_add (point_list, ay-1);
					//ds_grid_set(ds_gridpathfinding,ax+3,ay-1,i);
					//ds_list_add (point_list, ax + 3);
					//ds_list_add (point_list, ay-1);
				}

				///Check if the enemy can jump horizontally (jump over a void). (Right side)
				// original
				if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay+1)==-2 { 
				//if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+3,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+4,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+3,ay+1)==-2 && ds_grid_get(ds_gridpathfinding,ax+4,ay+1)==-2 {
					ds_grid_set(ds_gridpathfinding,ax+2,ay,i);
					ds_list_add (point_list, ax + 2);
					ds_list_add (point_list, ay);
					//ds_grid_set(ds_gridpathfinding,ax+3,ay,i);
					//ds_list_add (point_list, ax + 3);
					//ds_list_add (point_list, ay);
				}

				/// Check if the enemy can fall (Right side).
				// original
				if ds_grid_get(ds_gridpathfinding,ax+1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax+1,ay+1)==-1 {
					{
						do {
							n=n+1 ;
							a = ds_grid_get(ds_gridpathfinding,ax+1,ay+n);
						}
						until (a==-2) ||  (ay+n == ds_grid_height(ds_gridpathfinding)) 
					}
				
					if ds_grid_get(ds_gridpathfinding,ax+1,ay+n-1)==-1 && ds_grid_get(ds_gridpathfinding,ax+1,ay+n)== -2 {
						ds_grid_set(ds_gridpathfinding,ax+1,ay+n-1,i);
				        ds_list_add (point_list, ax + 1);
				        ds_list_add (point_list, ay+n-1);
					}
					
					//if ds_grid_get(ds_gridpathfinding,ax+1,ay+n-1)==-1 && ds_grid_get(ds_gridpathfinding,ax+2,ay+n-1)==-1 && ds_grid_get(ds_gridpathfinding,ax+1,ay+n)== -2 && ds_grid_get(ds_gridpathfinding,ax+2,ay+n)== -2 {
					//	ds_grid_set(ds_gridpathfinding,ax+2,ay+n-1,i);
				    //    ds_list_add (point_list, ax + 2);
				    //    ds_list_add (point_list, ay+n-1);
					//}
				}
		    }
		}
	
	
		// -------------------------- LEFT SIDE

		n=1 ; /// Re-initialize variable for the Fall (left side)

		/// Check if the enemy can go to the left
		// original
		if ds_grid_get(ds_gridpathfinding,ax-1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax-1,ay+1)==-2 {
			ds_grid_set(ds_gridpathfinding,ax-1,ay,i);
			ds_list_add (point_list, ax -1);
			ds_list_add (point_list, ay);
		
		} else {
			
			/// Check if we can go jump one block vertically (left side)
			// original
			if ds_grid_get(ds_gridpathfinding,ax-1,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax-1,ay-1)==-1 { 
				ds_grid_set(ds_gridpathfinding,ax-1,ay-1,i);
				ds_list_add (point_list, ax-1);
				ds_list_add (point_list, ay-1);
			
			} else {
				
				/// Check if the enemy can do a diagonal jump (Big Jump). (left side);
				// original
				if ds_grid_get(ds_gridpathfinding,ax-1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax-2,ay)==-2 && ds_grid_get(ds_gridpathfinding,ax-2,ay-1)==-1 {
					ds_grid_set(ds_gridpathfinding,ax-2,ay-1,i);
					ds_list_add (point_list, ax-2);
					ds_list_add (point_list, ay-1);
				}
			
				///Check if the enemy can jump horizontally (over a void). (left side)
				// original
				if ds_grid_get(ds_gridpathfinding,ax-1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax-2,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax-2,ay+1)==-2 {
					ds_grid_set(ds_gridpathfinding,ax-2,ay,i);
					ds_list_add (point_list, ax-2);
					ds_list_add (point_list, ay);
				}
			
				/// Check if the enemy can fall (left side).
				if ds_grid_get(ds_gridpathfinding,ax-1,ay)==-1 && ds_grid_get(ds_gridpathfinding,ax-1,ay+1)==-1 {
					{
						do {
							n=n+1 ;
				            a = ds_grid_get(ds_gridpathfinding,ax-1,ay+n);
				        } 
						until (a=-2) || (ay+n==ds_grid_height(ds_gridpathfinding))
					}
				
					if ds_grid_get(ds_gridpathfinding,ax-1,ay+n-1)==-1 && ds_grid_get(ds_gridpathfinding,ax-1,ay+n)== -2 {
					    ds_grid_set(ds_gridpathfinding,ax-1,ay+n-1,i);
					    ds_list_add (point_list, ax-1);
					    ds_list_add (point_list, ay+n-1);
					}
				}
	        }
	    }
	}
	
	/// Delete all the previous points
	for (var k=0; k< size_list; k+=1) {
	    ds_list_delete (point_list, 0);
	}
}