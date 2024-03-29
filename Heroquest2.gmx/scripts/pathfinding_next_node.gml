///pathfinding_next_node();
current_path_node++;

if (current_path_node < array_height_2d(pathNodes)) {
    pathfinding_targX = pathNodes[current_path_node, 0];
    pathfinding_targY = pathNodes[current_path_node, 1];
    
    var dir = point_direction(x, y, pathfinding_targX, pathfinding_targY);
    direction = get_direction_value(dir);
}
