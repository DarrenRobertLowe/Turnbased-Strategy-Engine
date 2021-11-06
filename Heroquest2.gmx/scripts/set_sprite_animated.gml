///set_sprite_animated()

switch(direction)
{
    case 0:
        //isoSprite = east_sprite;
        facing = "East";
        image_xscale = -1;
        break;
        
    case 90:
        //isoSprite = north_sprite;
        facing = "North";
        image_xscale = -1;
        break;
        
    case 180:
        //isoSprite = west_sprite;
        facing = "West";
        image_xscale = 1;
        break;
        
    case 270:
        //isoSprite = south_sprite;
        facing = "South";
        image_xscale = 1;    
        break;
        
    default:    // default to south
        //isoSprite = south_sprite;
        facing = "South";
        image_xscale = 1;  
}
