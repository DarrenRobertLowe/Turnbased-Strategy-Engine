/// addInstanceToGrid(grid id, instance id, column, row);
/* Tries to add the given instance id
 *  to the grid cell's list.
 *
 * Returns boolean
 *   True  on success
 *   False on failure to find a list or the instance already exists there
*/


var grid = argument0;
var inst = argument1;
var col  = argument2;
var row  = argument3;
var cellStr = ("col:"+string(col)+" row:"+string(row));
//show_debug_message("addInstanceToGrid():"+string(inst)+" to "+cellStr);

var contents = ds_grid_get(grid, col, row);

if (contents == global.gridDefaultValue) {
    ds_grid_set(grid, col, row, inst);
    return true;
} else {
    show_error("ERROR in addInstanceToGrid(): Target cell ("+string(cellStr)+") is not empty!# Contents: "+string(contents), true);
    return false;
}
