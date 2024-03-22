///heuristic_cost_estimate(start, goal);

var node = argument0;
var goal = argument1;
return abs(node.x - goal.x) + abs(node.y - goal.y);

