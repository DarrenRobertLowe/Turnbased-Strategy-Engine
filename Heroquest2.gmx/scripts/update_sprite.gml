///update_sprite();

switch(direction)
{
    case 90:
        facing = DIRECTION.north;
        image_xscale = -1;
        break;
        
    case 180:
        facing = DIRECTION.west;
        image_xscale = 1;
        break;
        
    case 270:
        facing = DIRECTION.south;
        image_xscale = 1;
        break;
        
    case 0:
        facing = DIRECTION.east;
        image_xscale = -1;
        break;
}



