/// setup_animations()
var frames = 5;

// northwest
animation_stand_north_start     = 0;
animation_stand_north_end       = (animation_stand_north_start + frames);
animation_walk_north_start      = (animation_stand_north_end + 1);
animation_walk_north_end        = (animation_walk_north_start + frames);

animationCount = 12;   // used to quickly swap between north and south facing sprites (see animate() )


// southeast
animation_stand_south_start     = 12;//(animationCount + 1);
animation_stand_south_end       = 17;//(animation_stand_south_start + frames);
animation_walk_south_start      = 18;//(animation_stand_south_end + 1);
animation_walk_south_end        = 23;//(animation_walk_south_start + frames);



animation_stand_start = 0;
animation_stand_end  = 5;
animation_walk_start = 6;
animation_walk_end = 11;
