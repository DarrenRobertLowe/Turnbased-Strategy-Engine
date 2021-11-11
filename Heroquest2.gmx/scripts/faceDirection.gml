//faceDirection(0-4);

var dir = argument0;
if (dir >= 4) then dir = choose(0,1,2,3);


switch (dir)
{
    case 0:
        facing = DIRECTION.north;
        direction = 90;
        break;
    
    case 1:
        facing = DIRECTION.west;
        direction = 180;
        break;
        
    case 2:
        facing = DIRECTION.south;
        direction = 270;
        break;
        
    case 3:
        facing = DIRECTION.east;
        direction = 0;
        break;
}

return facing;
