/// astar_get_path(start, goal);
/* 
 * @Returns a ds_list of nodes that are a path
 *  or -1 if no path is found.
 */

var start = argument0;
var goal  = argument1;

// Create a ds_priority queue
var openSet = ds_priority_create();
var openSetList = ds_map_create();  // since GM doesn't support "ds_priority_exists()" we have to create a list or map to store the values in so we can check for them later.

// Add the start node to the queue with a priority of 0
ds_priority_add(openSet, start, 0);
ds_map_add(openSetList, start, true); // note the value here doesn't actually mean anything but GM doesn't have Sets.


// Create a ds_map to store the costs of getting from the start node to each node
var gScore = ds_map_create();
ds_map_add(gScore, start, 0);

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
        fullPath = ds_list_create();
        fullPathArray = reconstruct_path(fullPath, cameFromMap, current);
        ds_list_destroy(fullPath);  // garbage collection is blind to data structures
        
        // clean up
        ds_priority_destroy(openSet);
        ds_map_destroy(openSetList);
        ds_map_destroy(gScore);
        ds_map_destroy(fScore);
        ds_map_destroy(cameFromMap);
        
        // exit on success!
        return fullPathArray;
    }
    
    
    var neighbors = get_neighbors(current);
    for (var i = 0; i < array_length_1d(neighbors); i++) {
        var neighbor = neighbors[i];
        
        if (neighbor == noone) then continue;
        
        var tentative_gScore = ds_map_find_value(gScore, current) + dist_between(current, neighbor);
        if (!ds_map_exists(gScore, neighbor) || tentative_gScore < ds_map_find_value(gScore, neighbor)) {
            ds_map_replace(cameFromMap, neighbor, current);
            ds_map_replace(gScore, neighbor, tentative_gScore);
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
ds_map_destroy(gScore);
ds_map_destroy(fScore);
ds_map_destroy(cameFromMap);

// exit on failure
return -1;


