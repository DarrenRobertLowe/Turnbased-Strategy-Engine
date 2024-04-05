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
    show_debug_message("startNode:    " +string(sourceColumn) +" : " +string(sourceRow));
    show_debug_message("endNode:    " +string(targetColumn) +" : " +string(targetRow));
    
    ds_list_clear(myPathNodes);
    myPathNodes = astar_get_path(startNode, endNode);
    pathLength = ds_list_size(myPathNodes);
    
    if (pathLength == 0) { // failed to reach the goal
        show_debug_message("couldn't find a path to the goal!");
        CURSOR.MODE = MODES.free;
    } else {
        // found the goal successfully
        show_debug_message("pathLength is " +string(pathLength));
        
        ds_list_clear(pathNodesX);
        ds_list_clear(pathNodesY);
        
        for(var i=0; i<pathLength; i++) {
            var node = ds_list_find_value(myPathNodes, i);
            ds_list_add(pathNodesX, ds_map_find_value(node, "x"));
            ds_list_add(pathNodesY, ds_map_find_value(node, "y"));
        }
        
        // set the correct direction
        current_path_node = -1;
        pathfinding_next_node(); // this will setup pathfinding_targs and direction
        MOVING = true;
    }
} 
else debug_message("Invalid target cell! Abandoning move!");
