///get_neighbors(node);

var node = argument0;

myArray[0] = ds_map_find_value(node, "north");
myArray[1] = ds_map_find_value(node, "south");
myArray[2] = ds_map_find_value(node, "east");
myArray[3] = ds_map_find_value(node, "west");

return myArray;
