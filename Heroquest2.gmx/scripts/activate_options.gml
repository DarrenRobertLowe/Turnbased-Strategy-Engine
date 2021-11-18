/// activate_options();

var frameScale = (1 / global.OPTIONS_TARGET_FPS);

global.movementSpeed    = ((frameScale * default_pixelsPerSecond)           * global.OPTIONS_MOVEMENT_SPEED);
global.animationSpeed   = ((frameScale * default_animationFramesPerSecond)  * global.OPTIONS_ANIMATION_SPEED);
