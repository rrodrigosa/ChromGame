//Fill the grid to see if there is a collision object
var hcells = ceil (room_width/cell_width) ;
//show_debug_message("hcells: "+string(hcells)) // 30 celulas
var vcells = ceil (room_height/cell_height);
//show_debug_message("vcells: "+string(vcells)) // 17 celulas
global.ds_grid_pathfinding = ds_grid_create(hcells, vcells);
    for (var i=0; i<hcells; i+=1)
    {
        for (var j=0; j<vcells; j+=1)
        {
            if place_meeting(i*cell_width,j*cell_height,O_Collision){
            ds_grid_add(global.ds_grid_pathfinding,i,j,-2)
            }
            else {
            ds_grid_add(global.ds_grid_pathfinding,i,j,-1)
            }
        }
    }