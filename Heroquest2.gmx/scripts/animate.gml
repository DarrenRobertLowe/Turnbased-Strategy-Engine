/// animate()
/* Sets up and runs the animations.
 * Note: here we're using the northwest facing sprites by
 *  default, then adding animationCount to make them south
 *  facing.
 *
 * Also see: setup_animations()
*/


var animStart   = 0;
var animEnd     = 0;
/*
//if (facingNorthWest())
if (facing == DIRECTION.north)
or (facing == DIRECTION.west)
{
    // standing
    if !(isMoving()) // standing
    {
        animStart   = animation_stand_north_start;
        animEnd     = animation_stand_north_end;
        show_debug_message("I'm standing north west");
    }
    
    if (isMoving()) // walking
    {
        animStart = animation_walk_north_start;
        animEnd   = animation_walk_north_end;
        show_debug_message("I'm walking north west");
    }
}
*/
// if (takingDamage())
// if (attackWithFist())
// if (attackWithStab())
// if (attackWithBash())
// if (attackWithBow())
// if (castingSpell())



// if facing south/east, jump the index down to where those sprites start

//if (facingSouthEast())
switch (facing)
{
    case DIRECTION.north:
    case DIRECTION.west:
        if !(isMoving()) // standing
        {
            animStart   = animation_stand_north_start;
            animEnd     = animation_stand_north_end;
            show_debug_message("I'm standing north west");
        }
        
        if (isMoving()) // walking
        {
            animStart = animation_walk_north_start;
            animEnd   = animation_walk_north_end;
            show_debug_message("I'm walking north west");
        }
    break;

    
    case DIRECTION.south:
    case DIRECTION.east:
        if !(isMoving()) // standing
        {
            animStart   = animation_stand_south_start;
            animEnd     = animation_stand_south_end;
            show_debug_message("I'm standing south east");
        }
        
        if (isMoving()) // walking
        {
            animStart = animation_walk_south_start; //+= animationCount;
            animEnd   = animation_walk_south_end; //+= animationCount;
            show_debug_message("I'm walking south east");
        }
    break;
}








/*
if (facing == DIRECTION.south)
or (facing == DIRECTION.east)
{
    
    if !(isMoving()) // standing
    {
        animStart   = animation_stand_south_start;
        animEnd     = animation_stand_south_end;
        show_debug_message("I'm standing south east");
    }
    
    if (isMoving()) // walking
    {
        animStart = animation_walk_south_start; //+= animationCount;
        animEnd   = animation_walk_south_end; //+= animationCount;
        show_debug_message("I'm walking south east");
    }
}
//show_debug_message("facing = "+string(getFacingAsString(facing)));
*/



// run the animation
show_debug_message("animStart = "+string(animStart) + " : animEnd = "+string(animEnd) + " : image index is "+string(image_index));
image_index += global.animationSpeed;

if (image_index < animStart)then image_index = animStart;
if (image_index > animEnd)  then image_index = animStart;
