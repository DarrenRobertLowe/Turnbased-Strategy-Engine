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

var targetX = getXFromColumn(targetColumn); // getCellCenterX(getXFromColumn(targetColumn));
var targetY = getYFromRow(targetRow);       // getCellCenterY(getYFromRow(targetRow));


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
        var size = ds_list_size(myPathNodes);
        if (size > 0) { // if there's a path
        
            // get the x and y coords of each node as an array
            for(var i=0; i<size; i++) {
                var node = ds_list_find_value(myPathNodes, i);
                pathNodes[i, 0] = node.x;
                pathNodes[i, 1] = node.y;
            }
            
            current_path_node = 0;
            next_path_node = 1;
            
            MOVING = true;
        }
    }
    /*
    mp_grid_clear_all(global.pathGrid);
    gridpath_add_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList, true);

    
    if (mp_grid_path(global.pathGrid, myPath, x+offset, y+offset, targetX +offset, targetY +offset, false))
    {
        var spd = delta(global.movementSpeed);
        path_shift(myPath, -offset, -offset);
        
        // we'll probably want to replace this with a custom 
        // path movement that works for both the hero units
        // and the NPCs. Also see ENTITY step event
        //if !(object_is_ancestor(object_index,NPC)) {
            // path_start(myPath, spd, path_action_stop, true);
            
            
            for(var i=0; i<path_get_number(myPath); i++) {
                pathNodes[i, 0] = path_get_x(myPath, i);
                pathNodes[i, 1] = path_get_y(myPath, i);
                sout("pathNodes["+ string(i) +", 0] = " +string(pathNodes[i, 0]));
                sout("pathNodes["+ string(i) +", 1] = " +string(pathNodes[i, 1]));
            }            
            
            current_path_node = -1;
            next_path_node = 0;
            
            //sout("target path ends at: " +string(path_get_x(myPath, path_get_number(myPath))) + " : " +string(path_get_y(myPath, path_get_number(myPath))) );
        //}
        
        MOVING = true;
    }*/
} 
else debug_message("Invalid target cell! Abandoning move!");
