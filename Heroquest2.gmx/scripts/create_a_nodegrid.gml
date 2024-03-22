///create_a_nodegrid(obstacle and unit grid, path grid);
/* 
 * Creates a grid of nodes on which we can build a path.
 * @returns ds_grid
 */

var grid = argument0;
var nodeGrid = argument1;
 
// add a node to each grid cell
for (var c=0; c<ds_grid_width(global.GRID); c++) {
    for (var r=0; r<ds_grid_height(global.GRID); r++) {
        
        // exclude obstacles
        var val = ds_grid_get(global.GRID, c, r);
        if ((val > 0) and (object_is_ancestor(val.object_index, OBSTACLE))) {
            continue;
        }
        
        
        var xx = (c * tileWidth);
        var yy = (r * tileHeight);
        var node = instance_create(xx, yy, NODE);
        node.column = c;
        node.row = r;
        ds_grid_add(nodeGrid, c, r, node);
        
        // get the neighbour nodes
        with (node) {
            if ((column-1) >= 0) {
                west = ds_grid_get(nodeGrid, column-1, row);
                if (west != noone) west.east = id;
            }
            
            if ((row-1) >= 0) {
                north = ds_grid_get(nodeGrid, column, row-1);
                if (north != noone) north.south = id;
            }
        }
    }
}

return nodeGrid;
