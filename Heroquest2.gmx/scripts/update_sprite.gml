///update_sprite();
/* NOTE: imageMirror works the same as image_xscale
 * We had to add our own variable because mirroring sprites
 * with image_xscale causes the bounding box to move! 
*/

switch(direction)
{
    case 0:
        facing = DIRECTION.east;
        imageMirror = -1;  // mirror the sprite
        break;
        
    case 90:
        facing = DIRECTION.north;
        imageMirror = -1;  // mirror the sprite
        break;
        
    case 180:
        facing = DIRECTION.west;
        imageMirror = 1;  // don't mirror the sprite
        break;
        
    case 270:
        facing = DIRECTION.south;
        imageMirror = 1;  // don't mirror the sprite
        break;
    
    default:
        facing = DIRECTION.none;
        image_xscale = 1;
        break;
}



