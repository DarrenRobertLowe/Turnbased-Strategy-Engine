///animate_alt();

global.currentFrame++;
show_debug_message(" ****** Current frame is "+string(global.currentFrame) +" ****** ");
show_debug_message("image index going in is "+string(imageIndex));
var animStart = 0;
var animEnd   = 0;

if !(MOVING) // standing
{
    animStart = animation_stand_start;
    animEnd   = animation_stand_end;
    show_debug_message("We're not walking, so set animtation start and end to "+string(animStart)+":"+string(animEnd));
    imageIndex += global.animationSpeed;
}
else show_debug_message("MOVING = true");


if (MOVING) // walking
{
    animStart = animation_walk_start;
    animEnd   = animation_walk_end;
    show_debug_message("We ARE walking, so set animtation start and end to "+string(animStart)+":"+string(animEnd));
    imageIndex += global.animationSpeed;
}
else show_debug_message("MOVING = false");




if (imageIndex < animStart) then imageIndex = animStart;
if (imageIndex > animEnd)   then imageIndex = animStart;

show_debug_message("Image index on way out is "+string(imageIndex));
