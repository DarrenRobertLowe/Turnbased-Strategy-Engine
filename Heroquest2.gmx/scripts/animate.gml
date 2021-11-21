///animate();

//if (global.DEBUG) then global.currentFrame++;

var animStart = 0;
var animEnd   = 0;


if !(MOVING) // standing
{
    animStart = animation_stand_start;
    animEnd   = animation_stand_end;
    imageIndex += delta(global.animationSpeed * 0.5);   // 0.5 because standing animations are slower
}

if (MOVING) // walking
{
    animStart = animation_walk_start;
    animEnd   = animation_walk_end;
    imageIndex += delta(global.animationSpeed);
}


// if (takingDamage)
// if (attackMelee)
// if (attackSlash)
// if (attackBash())
// if (attackBow())
// if (castingSpell())



// adjust for north facing
if (facing == DIRECTION.north)
or (facing == DIRECTION.west)
{
    animStart   += animationCount;
    animEnd     += animationCount;
}

if (imageIndex < animStart) then imageIndex = animStart;
if (imageIndex > animEnd)   then imageIndex = animStart;
