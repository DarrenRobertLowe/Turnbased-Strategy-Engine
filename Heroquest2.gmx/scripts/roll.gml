///roll(dice count, dice sides);
var dice  = argument0;
var sides = (argument1 -1); // shift count to be 0-5 rather than 1-6
var value = 0;

repeat (dice)
{
    value += (irandom(sides)+1); // minimum of 1
}

return value;
