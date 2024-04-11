/// reconstruct_path_map(fullPathMap, cameFromMap, current)
/*
 * @Returns a ds_map of nodes from global.NODE_GRID that 
 *  are a path, with their corresponding path lengths, or an empty map if a path can't be found.
 *
 * @param fullPathMap The map to store the path and its length.
 * @param cameFromMap The map storing the best node to reach each node.
 * @param current The current node.
 */

var fullPathMap = argument0;
var cameFromMap = argument1;
var current = argument2;

while (ds_map_exists(cameFromMap, current)) {
    ds_map_add(fullPathMap, current, ds_map_find_value(gScore, current));
    current = ds_map_find_value(cameFromMap, current);
}

return fullPathMap;

