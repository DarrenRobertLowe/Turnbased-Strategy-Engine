/// add_new_unit_to_stats()
/********************************
heroStats layout
-----------------------------
Hero1   type    name    sex     etc...
Hero2   type    name    sex     etc...
Hero3   type    name    sex     etc...
Hero4   type    name    sex     etc...
********************************/
var stats           = global.statsGrid;     // deglobalize
var numberOfEntries = ds_grid_height(stats);
var numberOfStats   = ds_grid_width(stats);
var index           = numberOfEntries;

// resize the grid
ds_grid_resize(stats, numberOfStats, index+1);


set_stats_index_to_default(index);


//show_message("add_new_unit_to_stats says: added index " + string(index));


return index;               // return the new unit index
