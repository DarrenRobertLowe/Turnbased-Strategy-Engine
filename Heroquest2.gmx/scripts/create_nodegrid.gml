///create_nodegrid(obstacle and unit grid);
/* 
 * Fills the global.NODE_GRID with NODEs for pathfinding
 */

var grid = argument0;
ds_grid_clear(global.NODE_GRID, noone);
global.NODES = ds_map_create();


var c = 0;
var r = 0;
// add a node to each grid cell
for (c=0; c < global.gridWidth; c++) {
    for (r=0; r < global.gridHeight; r++) {
        
        /*// exclude obstacles
        var val = ds_grid_get(global.GRID, c, r);
        if ((val > 0) and (object_is_ancestor(val.object_index, OBSTACLE))) {
            continue;
        }*/
        
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
