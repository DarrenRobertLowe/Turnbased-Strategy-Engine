///delta(speed);
// NOTE: This may need to account for global.PAUSED


if (global.useDeltaTime) {
    return (((argument0 * global.delta_multiplier) * global.options_GameSpeed));
}
else return argument0;
