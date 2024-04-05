///pathfinding_next_node();
/* gets the next node and sets the
 * direction to face it.
 */
 
current_path_node++;

if (current_path_node < pathLength) {
    pathfinding_targX = ds_list_find_value(pathNodesX, current_path_node);
    pathfinding_targY = ds_list_find_value(pathNodesY, current_path_node);
    
    var dir = point_direction(x, y, pathfinding_targX, pathfinding_targY);
    direction = get_direction_value(dir);
} else {
    log("current_path_node was out of bounds of pathNodes", true);
}
