///update_sprite();

switch(direction)
{
    case 0:
        facing = DIRECTION.east;
        image_xscale = -1;  // mirror the sprite
        break;
        
    case 90:
        facing = DIRECTION.north;
        image_xscale = -1;  // mirror the sprite
        break;
        
    case 180:
        facing = DIRECTION.west;
        image_xscale = 1;  // de-mirror the sprite
        break;
        
    case 270:
        facing = DIRECTION.south;
        image_xscale = 1;  // de-mirror the sprite
        break;
    
    default:
        facing = DIRECTION.none;
        image_xscale = 1;
        break;
}



