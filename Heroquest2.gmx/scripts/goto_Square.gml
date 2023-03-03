/// goto_Square(targetColumn, targetRow);
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
if !(validCell(targetColumn, targetRow))
{
    show_error("Error in goto_Square()# Target cell is outside of the world!", false);
}



debug_message("Attempting to move from "+string(column)+":"+string(row)+" to "+string(targetColumn)+":"+string(targetRow));

var targetX = getXFromColumn(targetColumn); // getCellCenterX(getXFromColumn(targetColumn));
var targetY = getYFromRow(targetRow);       // getCellCenterY(getYFromRow(targetRow));


var offset = global.pathfindingOffset;

if (validCell(targetColumn, targetRow))
{
    // DEBUG
    // for (var i=0; i<ds_list_size(pathfindingIgnoreList); i++){
    //     var val = ds_list_find_value(pathfindingIgnoreList, i);
    //     debug_message("I am not taking into consideration the following instance:" +string(val));
    // }
    // end of DEBUG
    
    
    gridpath_set_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList);
    
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
}
else debug_message("Invalid target cell! Abandoning move!");
