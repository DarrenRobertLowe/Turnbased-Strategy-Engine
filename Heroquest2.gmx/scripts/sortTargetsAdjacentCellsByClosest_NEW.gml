/// sortTargetsAdjacentCellsByClosest_NEW(listOfTargets, remove unreachable?, include diagonals);
/* adds potential targets to the pathfindingIgnoreList and
 * checks for routes to their exact cell, taking objects that
 * block the path into consideration.
 */

show_debug_message("running sortTargetsAdjacentCellsByClosest()");

var listOfTargets       = argument0;
var removeUnreachable   = argument1;
var includeDiagonals    = argument2;


ds_priority_clear(pathLengthQueue);

// add our potential targets to the pathfindingIgnoreList 
// so we can check for routes to their exact cell
/*
var size = ds_list_size(listOfTargets);
for (var i=0; i<size; i++) {
    var value = ds_list_find_value(listOfTargets, i);
    ds_list_add(pathfindingIgnoreList, value);
}
*/

// remove any targets that aren't reachable even with infinite movement points
if (removeUnreachable) {
    var start = ds_grid_get(global.NODE_GRID, column, row);
    for(var i=0; i<ds_list_size(listOfTargets); i++) {
        var unit = ds_list_find_value(listOfTargets, i);
        var goal = ds_grid_get(global.NODE_GRID, unit.column, unit.row);
        
        var tempPath = astar_get_path(start, goal);
        
        if ( ds_list_size(tempPath) == 0 ) {
            ds_list_delete(listOfTargets, i);
            show_debug_message("removed "+string(unit) +" (" +string(object_get_name(unit.object_index)) +") from listOfTargets because they cannot be reached");
            i = -1; // go back to start of listOfTargets
        } else {
            show_debug_message("Can reach " +string(unit) +" (" +string(object_get_name(unit.object_index)) +")");
        }
    }
}
show_debug_message("listOfTargets size after removing unreachable: "+ string(ds_list_size(listOfTargets)));


ds_priority_clear(pathLengthQueue);

for(var i=0; i<ds_list_size(listOfTargets); i++) {
    var unit = ds_list_find_value(listOfTargets, i);
    
    // east of target
    pathfinding_AI_addpath(column, row, unit.column+1, unit.row); // automatically fills pathLengthQueue;
    
    // west of target
    pathfinding_AI_addpath(column, row, unit.column-1, unit.row); // automatically fills pathLengthQueue;
    
    // south of target
    pathfinding_AI_addpath(column, row, unit.column, unit.row+1); // automatically fills pathLengthQueue;
    
    // north of target
    pathfinding_AI_addpath(column, row, unit.column, unit.row-1); // automatically fills pathLengthQueue;
}
