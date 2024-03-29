///walk_towards_point(pathfinding_targX, pathfinding_targY, spd);

var pathfinding_targX = argument0;
var pathfinding_targY = argument1;
var spd = argument2;

switch (direction) {
    case 0:     // east
        if ((x + spd) <= pathfinding_targX)
          then x += spd;
          else x = pathfinding_targX;
    break;

    
    case 90:    // north
        if ((y - spd) >= pathfinding_targY)
          then y -= spd;
          else y = pathfinding_targY;
    break;
    
    
    case 180:   // west
        if ((x - spd) >= pathfinding_targX)
          then x -= spd;
          else x = pathfinding_targX;
    break;

    
    case 270:   // south
        if ((y + spd) <= pathfinding_targY)
          then y += spd;
          else y = pathfinding_targY;
    break;
}
