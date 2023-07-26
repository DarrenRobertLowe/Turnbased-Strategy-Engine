/// gridpath_set_collisions(pathGrid, target objects, list of instance ids to ignore);
/* Clears the given pathGrid and adds all
 * instances of the given object type, except
 * those that are on the ignoreList
*/

var pathGrid    = argument0;
var objectIndex = argument1;
var ignoreList  = argument2;

ignoreList = gridpath_ignore_fire(ignoreList);

mp_grid_clear_all(pathGrid);


with(objectIndex) {
    if ((ds_list_find_index(ignoreList, id)) < 0) { // if we're not on the ignoreList
        mp_grid_add_cell(pathGrid, column, row);
    }
}

return pathGrid;
