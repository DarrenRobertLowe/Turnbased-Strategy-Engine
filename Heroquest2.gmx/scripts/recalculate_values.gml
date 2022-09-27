///recalculate_values();
/* This needs to be called when options are changed so
 * as to update the values in-game without requiring
 * any kind of restart.
 */
 
// game options
var frameScale = (1 / global.options_TargetFPS);
global.movementSpeed  = ((frameScale * default_pixelsPerSecond)           * global.options_GameSpeed);
global.animationSpeed = ((frameScale * default_animationFramesPerSecond)  * global.options_GameSpeed);


setup_delta();




/// view options
view_wview = global.options_ResolutionWidth;
view_hview = global.options_ResolutionHeight;

display_reset(global.options_AntialiasingAmount, global.options_VSync);
