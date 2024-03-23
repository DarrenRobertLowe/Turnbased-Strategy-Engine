///dist_between(current, neighbor);

var current = argument0;
var neighbor = argument1;

var currentX = ds_map_find_value(current, "x");
var currentY = ds_map_find_value(current, "y");

var neighborX = ds_map_find_value(neighbor, "x");
var neighborY = ds_map_find_value(neighbor, "y");

return abs(currentX - neighborX) + abs(currentY - neighborY);


/*
var current = argument0;
var neighbor = argument1;
return abs(current.x - neighbor.x) + abs(current.y - neighbor.y);
*/
