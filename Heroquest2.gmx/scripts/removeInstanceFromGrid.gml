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
show_debug_message("Trying to remove instance:"+string(inst)+" from "+cellStr);


if (ds_grid_get(grid, col, row) == inst) {
    ds_grid_set(grid, col, row, global.gridDefaultValue);
    return true;
}
else 
{
    show_error("ERROR in removeInstanceFromGrid(): Target instance was not found at the indicated grid position : "+string(cellStr), false);
    return false;
}


/* 
// THE FOLLOWING CODE IS FOR LIST BASED GRID CELLS
var list = ds_grid_get(grid, col, row);          // find the list


if (ds_exists(list, ds_type_list))               // if the list exists
{
    var ind = ds_list_find_index(list, inst);    // find the instance on the list
    
    if (ind > -1)
    {
        ds_list_delete(list, ind);               // delete it
        show_debug_message("Successfuilly removed instance:"+string(inst)+" from "+cellStr);
        return true;
    }
    else
    {
        return false;  // just means the instance wasn't found, might be useful
        log("Couldn't find the target instance at the grid coords", true);
    }
}
else
{
    show_error("ERROR in removeInstanceFromGrid()!#No list found at grid coords!", false);
    return false;
}
