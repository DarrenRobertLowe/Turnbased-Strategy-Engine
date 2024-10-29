///pathfinding_block_node(column, row);

var column  = argument0;
var row     = argument1;

var node = ds_grid_get(global.NODE_GRID, column, row);

show_debug_message("node is: " +string(column) + ":" +string(row) +"   value: "+ string(node));

ds_map_replace(node, "no entry", true);
