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

var targetX = getCellCenterX(getXFromColumn(targetColumn));
var targetY = getCellCenterY(getYFromRow(targetRow));

if (validCell(getColumnFromX(targetX), getRowFromY(targetY) ))
{
    if (mp_grid_path(global.pathGrid, myPath, x, y, targetX, targetY, false))
    {
        path_start(myPath, 4, path_action_stop, false);
    }
}
else show_debug_message("Invald target cell! Abandoning move!");
