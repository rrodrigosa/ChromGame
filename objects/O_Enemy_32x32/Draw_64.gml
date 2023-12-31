// Draw the grid
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

/// Draw the path
if path_exists(path_building)
{
    draw_path(path_building,floor(x/O_Grid.cell_width), floor(y/O_Grid.cell_height),true) ;
}