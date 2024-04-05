///walk_towards_point(pathfinding_targX, pathfinding_targY, spd);


var pathfinding_targX = argument0;
var pathfinding_targY = argument1;
var spd = argument2;

show_debug_message("current xy: " +string(x) +"   " +string(y));
show_debug_message("target xy: "+ string(pathfinding_targX) + "    " +string(pathfinding_targY));

switch (direction) {
    case 0:     // east
        show_debug_message("moving east");
        if ((x + spd) <= pathfinding_targX)
          then x += spd;
          else x = pathfinding_targX;
    break;

    
    case 90:    // north
        show_debug_message("moving north");
        if ((y - spd) >= pathfinding_targY)
          then y -= spd;
          else y = pathfinding_targY;
    break;
    
    
    case 180:   // west
        show_debug_message("moving west");
        if ((x - spd) >= pathfinding_targX)
          then x -= spd;
          else x = pathfinding_targX;
    break;

    
    case 270:   // south
        show_debug_message("moving south");
        if ((y + spd) <= pathfinding_targY)
          then y += spd;
          else y = pathfinding_targY;
    break;
}
