///heuristic_cost_estimate(start, goal);

var node = argument0;
var goal = argument1;

var nodeX = ds_map_find_value(node, "x");
var nodeY = ds_map_find_value(node, "y");

var goalX = ds_map_find_value(goal, "x");
var goalY = ds_map_find_value(goal, "y");

return abs(nodeX - goalX) + abs(nodeY - goalY);


