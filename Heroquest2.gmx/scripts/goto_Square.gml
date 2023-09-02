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

//debug_message("Moving from "+string(column)+":"+string(row)+" to "+string(targetColumn)+":"+string(targetRow));

var targetX = getXFromColumn(targetColumn); // getCellCenterX(getXFromColumn(targetColumn));
var targetY = getYFromRow(targetRow);       // getCellCenterY(getYFromRow(targetRow));


var offset = global.pathfindingOffset;

if (validCell(targetColumn, targetRow)) {
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
            path_start(myPath, spd, path_action_stop, true);
        //}
        
        MOVING = true;
    }
} else debug_message("Invalid target cell! Abandoning move!");
