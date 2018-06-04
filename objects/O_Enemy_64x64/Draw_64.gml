// Draw the grid (the numbers)
if ds_exists(ds_gridpathfinding,ds_type_grid) {
    for (var i=0; i<ds_grid_width(ds_gridpathfinding); i+=1)
    {
        for (var j=0; j<ds_grid_height(ds_gridpathfinding); j+=1)
        {
            var value = ds_grid_get(ds_gridpathfinding,i,j);
            
            draw_text_transformed(i*O_Grid.cell_width + 8, j*O_Grid.cell_height + 8,string(value), 1, 1,0);
        }
    }
}

/// Draw the path (the black line)
if path_exists(path_building)
{
    draw_path(path_building,floor(x/O_Grid.cell_width), floor(y/O_Grid.cell_height),true) ;
}


// desenha o centro - rd
//draw_rectangle_color(x-16, y-4, x-22, y, c_yellow, c_yellow, c_yellow, c_yellow, false)
//draw_rectangle_color(anchor_x, y-2, anchor_x-4, y+2, c_purple, c_purple, c_purple, c_purple, false)

//draw_rectangle_color(x+16, y-4, x+20, y, c_yellow, c_yellow, c_yellow, c_yellow, false)
//draw_rectangle_color(anchor_x, anchor_y, anchor_x+4, anchor_y+4, c_purple, c_purple, c_purple, c_purple, false)

draw_rectangle_color(anchor_x, anchor_y, anchor_x+4, anchor_y+4, c_yellow, c_yellow, c_yellow, c_yellow, false)







draw_rectangle_color(304, 336-2, 308, 336+2, c_purple, c_purple, c_purple, c_purple, false)
draw_rectangle_color(336, 336-2, 340, 336+2, c_purple, c_purple, c_purple, c_purple, false)
draw_rectangle_color(368, 336-2, 372, 336+2, c_purple, c_purple, c_purple, c_purple, false)
draw_rectangle_color(400, 336-2, 404, 336+2, c_purple, c_purple, c_purple, c_purple, false)
