/// gridpath_add_collisions(pathGrid, target objects, list of instance ids to ignore, consider the floor?);
/* Adds all instances of the given object type,
 * except those that are on the ignoreList.
 * You might set checkFloor to false for flying creatures.
*/

var pathGrid    = argument0;
var objectIndex = argument1;
var ignoreList  = argument2;
var checkFloor  = argument3;

ignoreList = gridpath_ignore_fire(ignoreList);

with(objectIndex) {
    if ((ds_list_find_index(ignoreList, id)) < 0) { // if we're not on the ignoreList
        //mp_grid_add_cell(pathGrid, column, row);
        pathfinding_block_node(column, row);
    }
}

if (checkFloor){
    pathfinding_add_empty_floors(pathGrid);
}

return pathGrid;
