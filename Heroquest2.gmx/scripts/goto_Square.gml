/// goto_square(targetColumn, targetRow);
/**
 *
 * @Param target columm
 * @Param target row
 *
**/
debug = false;
sourceColumn = column;
sourceRow    = row;
targetColumn = argument0;
targetRow    = argument1;



// validate
if !(validCell(targetColumn, targetRow)) {
    show_error("Error in goto_Square()# Target cell is outside of the world!", false);
}

var targetX = getXFromColumn(targetColumn);
var targetY = getYFromRow(targetRow);

var offset =  0;

if (validCell(targetColumn, targetRow)) {
    /// gridpath_add_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList, true);
    
    var startNode = ds_grid_get(global.NODE_GRID, sourceColumn, sourceRow);
    var endNode   = ds_grid_get(global.NODE_GRID, targetColumn, targetRow);
    
    // try to find a path
    myPathNodes = astar_get_path(startNode, endNode);
    
    if ((myPathNodes) == -1) { // failed to reach the goal
        show_message("couldn't find a path to the goal!");
        CURSOR.MODE = MODES.free;
    } else {
        // found the goal successfully
        var pathLength = array_length_1d(fullPathArray);
        if (pathLength > 0) { // if there's a path
            
            // get the x and y coords of each node as an array
            for(var i=0; i<pathLength; i++) {
                var node = fullPathArray[i]; 
                pathNodes[i, 0] = ds_map_find_value(node, "x");
                pathNodes[i, 1] = ds_map_find_value(node, "y");
                current_path_node = -1;
                pathfinding_next_node();
            }
            
            ///current_path_node = 0; // we're arleady at the first node, so skip it
            
            MOVING = true;
        }
    }
} 
else debug_message("Invalid target cell! Abandoning move!");
