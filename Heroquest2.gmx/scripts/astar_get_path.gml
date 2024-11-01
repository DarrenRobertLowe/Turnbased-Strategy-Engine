/// astar_get_path(start, goal);
/* 
 * @Returns a list of nodes from global.NODE_GRID that 
 *  are a path, or an empty list if a path can't be found.
 *
 * @param start The starting node. e.g. ds_grid_get(global.NODE_GRID, sourceColumn, sourceRow);
 * @param goal  The ending node.
 */


 
var start = argument0;
var goal  = argument1;

show_debug_message("astar_get_path() trying to find path from node: " +string(ds_map_find_value(start, "column")) +":" + string(ds_map_find_value(start, "row")) + "    to " +string(ds_map_find_value(goal, "column")) + ":" +string(ds_map_find_value(goal, "row")) );

// Create a ds_priority queue
var openSet = ds_priority_create();
var openSetList = ds_map_create();  // since GM doesn't support "ds_priority_exists()" we have to create a list or map to store the values in so we can check for them later.



// Add the start node to the queue with a priority of 0
ds_priority_add(openSet, start, 0);
ds_map_add(openSetList, start, true); // note the value "true" here doesn't actually mean anything but GM doesn't have Sets.


// Create a ds_map to store the costs of getting from the start node to each node
var gScores = ds_map_create();
ds_map_add(gScores, start, 0);

// Create a ds_map to store the estimated total cost from start to goal through each node
var fScore = ds_map_create();
ds_map_add(fScore, start, heuristic_cost_estimate(start, goal));

// Create a ds_map to store the best node to reach each node
var cameFromMap = ds_map_create();
ds_map_add(cameFromMap, start, noone);

while (!ds_priority_empty(openSet)) {
    // get and remove current node from priority queue
    var current = ds_priority_find_min(openSet);
    ds_priority_delete_min(openSet);
    ds_map_delete(openSetList, current);
    
    // finished?
    if (current == goal) {
        show_debug_message("goal found at " + string(current));
        
        ds_list_clear(fullPathList);
        fullPathList = reconstruct_path(fullPathList, cameFromMap, gScores, current, 0);
        
        // clean up
        ds_priority_destroy(openSet);
        ds_map_destroy(openSetList);
        ds_map_destroy(gScores);
        ds_map_destroy(fScore);
        ds_map_destroy(cameFromMap);
        
        // exit on success!
        return fullPathList;
    }
    
    // main loop
    var neighbors = get_neighbors(current);
    for (var i = 0; i < array_length_1d(neighbors); i++) {
        var neighbor = neighbors[i];
        
        //if (neighbor == noone) then continue;
        if (neighbor < 1) then continue;
        if (ds_map_find_value(neighbor, "no entry") == true) then continue;
        
        
        var tentative_gScore = ds_map_find_value(gScores, current) + dist_between(current, neighbor);
        if (!ds_map_exists(gScores, neighbor) || tentative_gScore < ds_map_find_value(gScores, neighbor)) {
            // note that if the neighbor doesn't exist, ds_map_replace() will create an entry for it.
            ds_map_replace(cameFromMap, neighbor, current);
            ds_map_replace(gScores, neighbor, tentative_gScore);
            ds_map_replace(fScore, neighbor, tentative_gScore + heuristic_cost_estimate(neighbor, goal));
            
            if !(ds_map_exists(openSetList, neighbor)) {
                ds_priority_add(openSet, neighbor, ds_map_find_value(fScore, neighbor));
            }
        }
    }
}

// FAILED TO FIND THE GOAL
show_debug_message("goal not found!");

// clean up
ds_priority_destroy(openSet);
ds_map_destroy(openSetList);
ds_map_destroy(gScores);
ds_map_destroy(fScore);
ds_map_destroy(cameFromMap);

// exit on failure
ds_list_clear(myPathNodes);
return myPathNodes;
