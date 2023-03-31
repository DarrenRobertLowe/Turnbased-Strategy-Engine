/// removeInstanceFromGrid(grid id, instance id, column, row);
/* Tries to find the given instance in the grid cell
 * and deletes it if it's there.
 *
 * Returns boolean
 *   True  on success
 *   False on failure to find a list or the instance
*/


var grid = argument0;
var inst = argument1;
var col  = argument2;
var row  = argument3;
var cellStr = ("col:"+string(col)+" row:"+string(row));
//show_debug_message("running removeInstanceFromGrid(): "+string(inst)+" from "+cellStr);


if (ds_grid_get(grid, col, row) == inst) {
    ds_grid_set(grid, col, row, global.gridDefaultValue);
    return true;
} else {
    show_error("ERROR in removeInstanceFromGrid(): Target instance was not found at the indicated grid position : "+string(cellStr), false);
    return false;
}
