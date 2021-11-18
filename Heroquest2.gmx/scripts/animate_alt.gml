///animate_alt();
/*
switch (facing)
{
    case DIRECTION.north:
    case DIRECTION.west:
        //sprite_index = northSprite;
        //show_debug_message("changed sprite index to northSprite");
    break;

    
    case DIRECTION.south:
    case DIRECTION.east:
        //sprite_index = southSprite;
        //show_debug_message("changed sprite index to southSprite");
    break;
}
*/

global.currentFrame++;
show_debug_message("Current frame is "+string(global.currentFrame));

var animStart   = 0;
var animEnd     = 0;

if !(MOVING)//(isMoving()) // standing
{
    animStart = animation_stand_start;
    animEnd   = animation_stand_end;
    show_debug_message("We're not walking, so set animtation start and end to "+string(animStart)+":"+string(animEnd));
}
else show_debug_message("MOVING = true");


if (MOVING)//(isMoving()) // walking
{
    animStart = animation_walk_start;
    animEnd   = animation_walk_end;
    show_debug_message("We ARE walking, so set animtation start and end to "+string(animStart)+":"+string(animEnd));
}
else show_debug_message("MOVING = false");


//image_index += global.animationSpeed;

if (image_index < animStart) then image_index = animStart;
if (image_index > animEnd)   then image_index = animStart;

show_debug_message("Image index = "+string(image_index));
