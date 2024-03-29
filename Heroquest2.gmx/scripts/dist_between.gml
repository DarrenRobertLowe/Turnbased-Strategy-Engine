///dist_between(current, neighbor);

var current = argument0;
var neighbor = argument1;

var currentX = ds_map_find_value(current, "x");
var currentY = ds_map_find_value(current, "y");

var neighborX = ds_map_find_value(neighbor, "x");
var neighborY = ds_map_find_value(neighbor, "y");

var neighborAllowed = ds_map_find_value(neighbor, "no entry") * 1000000; // adds an impossibly high value to the path

// we can add stuff here to increase the difficulty of reaching the node
return abs(currentX - neighborX) + abs(currentY - neighborY);//+ neighborAllowed;

