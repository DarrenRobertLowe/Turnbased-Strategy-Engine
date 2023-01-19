/// setup_animations()
global.animation_hit_time = 10;



// stand
animation_stand_start   = 0;
animation_stand_end     = 5;

// walk
animation_walk_start    = 6;
animation_walk_end      = 11;

// melee
animation_melee_start   = 12;
animation_melee_end     = 15;

// slash
animation_slash_start   = 16;
animation_slash_end     = 19;

// heavy
animation_heavy_start   = 20;
animation_heavy_end     = 23;

// bow
animation_bow_start     = 24;
animation_bow_end       = 27;

// use
animation_use_start     = 28;
animation_use_end       = 28;

// hurt
animation_hurt_start    = 29;
animation_hurt_end      = 29;


// north facing sprites
animationCount = (animation_hurt_end + 1); // used to quickly swap between north and south facing sprites (see animate() )




