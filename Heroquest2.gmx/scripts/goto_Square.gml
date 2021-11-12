/// goto_Square(targetColumn, targetRow);
/**
 *
 * @Param target columm
 * @Param target row
 *
**/

targetColumn = argument0;
targetRow    = argument1;

show_debug_message("Attempting to move from "+string(column)+":"+string(row)+" to "+string(targetColumn)+":"+string(targetRow));

var targetX = getXFromColumn(targetColumn); // getCellCenterX(getXFromColumn(targetColumn));
var targetY = getYFromRow(targetRow);       // getCellCenterY(getYFromRow(targetRow));


var offset = (cellSize / 2);

if (validCell(targetColumn, targetRow))
{
    if (mp_grid_path(global.pathGrid, myPath, x+offset, y+offset, targetX +offset, targetY +offset, false))
    {
        path_shift(myPath, -offset, -offset);
        path_start(myPath, global.OPTIONS_MOVEMENT_SPEED, path_action_stop, true);
    }
}
else show_debug_message("Invald target cell! Abandoning move!");
