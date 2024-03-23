///clean_pathfinding_nodes();

for(var c=0; c<ds_grid_width(global.NODE_GRID); c++) {
    for(var r=0; r<ds_grid_height(global.NODE_GRID); r++) {
        var map = ds_grid_get(global.NODE_GRID, c, r);
        
        //var map = ds_map_find_first(node);
         
        if (ds_exists(map, ds_type_map)) {
            ds_map_destroy(map);
        }
    }
}

ds_grid_clear(global.NODE_GRID, noone);
