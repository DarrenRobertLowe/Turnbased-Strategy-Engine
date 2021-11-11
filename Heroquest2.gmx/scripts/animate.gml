/// animate()
/* Sets up and runs the animations.
 * Note: here we're using the northwest facing sprites by
 *  default, then adding animationCount to make them south
 *  facing.
 *
 * Also see: setup_animations()
*/
//global.animationID++;
//show_debug_message("global.animationID : "+string(global.animationID));
//show_debug_message("MOVING = "+string(MOVING));

var animStart   = 0;
var animEnd     = 0;

// standing
animStart   = animation_stand_north_start;
animEnd     = animation_stand_north_end;


if (isMoving()) // walking
{
    animStart = animation_walk_north_start;
    animEnd   = animation_walk_north_end;
}

// if (takingDamage())
// if (attackWithFist())
// if (attackWithStab())
// if (attackWithBash())
// if (attackWithBow())
// if (castingSpell())



// if facing south/east, jump the index down to where those sprites start
if (facingSouthEast())
{
    //show_debug_message("facing southeast... "+string(facing));
    animStart += animationCount;
    animEnd   += animationCount;
}
else show_debug_message("facing northwest... "+string(facing));
show_debug_message("Actual direction is "+string(direction));


// run the animation
show_debug_message("animStart = "+string(animStart) + " : animEnd = "+string(animEnd) + " : image index is "+string(image_index));
image_index += global.animationSpeed;
if (image_index > animEnd)  then image_index = animStart;
if (image_index < animStart)then image_index = animStart;
