///delta(steps);
// NOTE: This may need to account for global.PAUSED

var steps = argument0;

if (global.useDeltaTime) {
    return (((steps * global.delta_multiplier) * global.options_GameSpeed));
} else {
    return (steps * (global.defaultFPS / global.options_TargetFPS) * global.options_GameSpeed);
}
