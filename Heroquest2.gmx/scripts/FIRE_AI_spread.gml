///FIRE_AI_spread(targetColumn, targetRow, hp);

var targetColumn = argument0;
var targetRow    = argument1;
var hp           = argument2;


// check a floor exists on that tile
if (ds_grid_get(global.FIRE_GRID, targetColumn, targetRow) == -1)
//if (ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) > 0) 
{
    spawn_fire(targetColumn, targetRow, hp);
}
