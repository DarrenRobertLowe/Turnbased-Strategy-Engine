///update_sprite();

switch(direction)
{
    case 0:
        facing = DIRECTION.east;
        isoSprite = southSprite;
        image_xscale = -1;  // mirror the sprite
        break;
        
    case 90:
        facing = DIRECTION.north;
        isoSprite = northSprite;
        image_xscale = -1;  // mirror the sprite
        break;
        
    case 180:
        facing = DIRECTION.west;
        isoSprite = northSprite;
        image_xscale = 1;  // de-mirror the sprite
        break;
        
    case 270:
        facing = DIRECTION.south;
        isoSprite = southSprite;
        image_xscale = 1;  // de-mirror the sprite
        break;
    
    default:
        facing = DIRECTION.none;
        isoSprite = southSprite
        image_xscale = 1;
        break;
}



