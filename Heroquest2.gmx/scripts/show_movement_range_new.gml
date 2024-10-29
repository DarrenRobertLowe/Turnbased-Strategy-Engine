/// show_movement_range_new()

// SETUP
// clear grids, etc
ds_grid_clear(movementGrid, -1);

// add obstacles to movement grid (already done in NODE_GRID)

// add empty floors as obstacles to movement grid (already done in NODE_GRID ?)

// ** check platform height for disgaea style jumping **

// CALCULATE PATHS
/* We need to set our targetColumn and targetRow to each square within
 * our moveDistance range and check each one for a valid path. The path will
 * take the tiles walked into account as well, so moving around
 * objects reduces the range in a given direction.
 */

with (selected) {
    var moveDistance = move+1;
    
    // set the min and max
    var minCol = (column - moveDistance);
    var minRow = (row - moveDistance);
    var maxCol = (column + moveDistance);
    var maxRow = (row + moveDistance);
    
    var totalColumns = (maxCol - minCol);
    var totalRows = (maxRow - minRow);
    
    var startNode = ds_grid_get(global.NODE_GRID, column, row);
    
    
    for (var i=0; i < totalColumns; i++) {
        var targetColumn = (minCol + i);
        
        for (var j=0; j < totalRows; j++) {
            var targetRow = (minRow + j);
            
            if (validCell(targetColumn, targetRow)) {
                var endNode = ds_grid_get(global.NODE_GRID, targetColumn, targetRow);
                if (ds_map_find_value(endNode, "no entry") == true) {
                    continue; // can't go here so don't create a movement panel
                }
                
                myPathNodes = astar_get_path(startNode, endNode);
                pathLength  = ds_list_size(myPathNodes);
                
                ds_list_clear(myPathNodes);
                myPathNodes = astar_get_path(startNode, endNode);
                pathLength = ds_list_size(myPathNodes);
                
                if ( (pathLength > 0) and (pathLength <= moveDistance) ) {
                    
                    var targX = getXFromColumn(targetColumn);
                    var targY = getYFromRow(targetRow);
                    
                    panel = instance_create(targX, targY, obj_MovementPanel);
                    panel.parent = id; //selected.id;
                    panel.column = targetColumn;
                    panel.row = targetRow;
                    
                        /* // uncomment for z axis checking 
                        if (selected.z > 0)
                            then panel.unitHeight = (selected.z/global.PIXELS_PER_HEIGHT);
                        else panel.unitHeight = 0;*/
                    
                    ds_grid_set(movementGrid, targetColumn, targetRow, obj_MovementPanel);
                }
            }
        }
    }
}
