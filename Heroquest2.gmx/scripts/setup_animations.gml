/// setup_animations()
var frames = 5;

// northwest
animation_stand_north_start     = 0;
animation_stand_north_end       = (animation_stand_north_start + frames);
animation_walk_north_start      = (animation_stand_north_end + 1);
animation_walk_north_end        = (animation_walk_north_start + frames);

animationCount = 11;   // used to quickly swap betwee north and south facing sprites (see animate() )


// southeast
animation_stand_south_start     = (animationCount + 1);
animation_stand_south_end       = (animation_stand_south_start + frames);
animation_walk_south_start      = (animation_stand_south_end + 1);
animation_walk_south_end        = (animation_walk_south_start + frames);
