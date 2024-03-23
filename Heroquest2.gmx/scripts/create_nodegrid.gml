///create_nodegrid(obstacle and unit grid);
/* 
 * Fills the global.NODE_GRID with NODEs for pathfinding
 */

// Clean from previous pathfinding
clean_pathfinding_nodes();


// add a node to each grid cell
for (var c=0; c<ds_grid_width(global.GRID); c++) {
    for (var r=0; r<ds_grid_height(global.GRID); r++) {
        
        // create the node
        node = ds_map_create();
        
        // determine accessibility
        var val = ds_grid_get(global.GRID, c, r);
        if (object_is_ancestor(val.object_index, OBSTACLE)) {
            ds_map_add(node, "allow entry", false);
        }
        
        // add properties
        ds_map_add(node, "north", noone);
        ds_map_add(node, "south", noone);
        ds_map_add(node, "west", noone);
        ds_map_add(node, "east", noone);
        ds_map_add(node, "x", getXFromColumn(c));
        ds_map_add(node, "y", getYFromRow(r));
        ds_map_add(node, "allow entry", true);
        ds_map_add(node, "allow exit", true);
        /*
        ds_map_add(node, "column", c);
        ds_map_add(node, "row", r);
        ds_map_add(node, "north access", true);
        ds_map_add(node, "south access", true);
        ds_map_add(node, "west access", true);
        ds_map_add(node, "east access", true);
        ds_map_add(node, "north egress", true);
        ds_map_add(node, "south egress", true);
        ds_map_add(node, "west egress", true);
        ds_map_add(node, "east egress", true);
        */
        
        ds_grid_set(global.NODE_GRID, c, r, node);
        
        // get the neighbour nodes
        if ((c-1) >= 0) {
            var west = ds_grid_get(global.NODE_GRID, c-1, r);
            ds_map_replace(node, "west", west);
            if ((west != noone) and (ds_map_find_value(west, "allow entry") == true))
              then ds_map_replace(west, "east", node);
        }
        
        if ((r-1) >= 0) {
            var north = ds_grid_get(global.NODE_GRID, c, r-1);
            ds_map_replace(node, "north", north);
            if ((north != noone) and (ds_map_find_value(north, "allow entry") == true)) 
              then ds_map_replace(north, "south", node);
        }
    }
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
/*
var grid = argument0;
ds_grid_clear(global.NODE_GRID, noone);
global.NODES = ds_map_create();


var c = 0;
var r = 0;
// add a node to each grid cell
for (c=0; c < global.gridWidth; c++) {
    for (r=0; r < global.gridHeight; r++) {
        
        //// exclude obstacles
        //var val = ds_grid_get(global.GRID, c, r);
        //if ((val > 0) and (object_is_ancestor(val.object_index, OBSTACLE))) {
        //    continue;
        //}
        
        var xx = getXFromColumn(c);
        var yy = getYFromRow(r);
        var node = instance_create(xx, yy, NODE);
        ds_map_add(global.NODES, node, true);       // using a map to prevent duplicates
        
        node.column = c;
        node.row = r;
        ds_grid_set(global.NODE_GRID, c, r, node.id);
        
        
        // get the neighbour nodes
        with (node) {
            if ((column-1) >= 0) {
                west = ds_grid_get(global.NODE_GRID, column-1, row);
                if (west != noone) then west.east = id;
            }
            
            if ((row-1) >= 0) {
                north = ds_grid_get(global.NODE_GRID, column, row-1);
                if (north != noone) then north.south = id;
            }
        }
        
    }
}
*/