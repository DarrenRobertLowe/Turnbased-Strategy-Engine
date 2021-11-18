///update_sprite();

switch(direction)
{
    case 90:
        facing = DIRECTION.north;
        isoSprite = northSprite;
        image_xscale = -1;
        break;
        
    case 180:
        facing = DIRECTION.west;
        isoSprite = northSprite;
        image_xscale = 1;
        break;
        
    case 270:
        facing = DIRECTION.south;
        isoSprite = southSprite;
        image_xscale = 1;
        break;
        
    case 0:
        facing = DIRECTION.east;
        isoSprite = southSprite;
        image_xscale = -1;
        break;
        
    default:
        facing = DIRECTION.none;
        sprite_index = spr_none;
        image_xscale = 1;
        break;
}



