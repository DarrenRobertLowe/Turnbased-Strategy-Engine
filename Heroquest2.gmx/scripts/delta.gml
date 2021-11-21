///delta(speed);
if (global.useDeltaTime)
{
    return (((argument0 * global.delta_multiplier) * global.deltaTimeScale) * global.options_GameSpeed);
}
else return argument0;
