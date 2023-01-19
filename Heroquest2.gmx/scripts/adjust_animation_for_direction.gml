///adjust_animation_for_direction();
/* Adds enough frames to face north instead of 
 * south.
 */

if (facing == DIRECTION.north)
or (facing == DIRECTION.west) {
    animStart += animationCount;
    animEnd   += animationCount;
}
