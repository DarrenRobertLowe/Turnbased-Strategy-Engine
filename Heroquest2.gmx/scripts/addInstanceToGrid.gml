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
show_debug_message("Trying to add instance:"+string(inst)+" to "+cellStr);

var contents = ds_grid_get(grid, col, row);

if (contents == global.gridDefaultValue)
{
    ds_grid_set(grid, col, row, inst);
    return true;
}
else
{
    show_error("ERROR in addInstanceToGrid(): Target cell ("+string(cellStr)+") is not empty!# Contents: "+string(contents), true);
    return false;
}


/*
// THE FOLLOWING CODE IS FOR LIST BASED GRID CELLS
var list = ds_grid_get(grid, col, row);             // find the list
show_debug_message("list id is" +string(list));

if (ds_exists(list, ds_type_list))                  // if the list exists
{
    var ind = ds_list_find_index(list, inst);       // check the instance for the list
    
    if (ind < 0)                                    // if it's not found...
    {
        ds_list_add(list, inst);                    // add it
        show_debug_message("Successfully added instance:"+string(inst)+" to "+cellStr);
        return true;
    }
    else 
    {
        return false;  // means the instance already existed there!
        log("Instance id " +string(inst)+ "already exists at target cell "+cellStr+" !", true);
    }
}
else
{
    error("ERROR in addInstanceToGrid()!#No list found at grid coords "+cellStr+" !", false);
    return false;
}
*/
