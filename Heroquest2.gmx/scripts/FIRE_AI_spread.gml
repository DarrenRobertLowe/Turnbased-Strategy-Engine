///FIRE_AI_spread(targetColumn, targetRow, hp);

var targetColumn = argument0;
var targetRow    = argument1;
var hp           = argument2;


// check a floor exists on that tile
if  (ds_grid_get(global.FIRE_GRID,  targetColumn, targetRow) == -1) // don't spawn on existing fires
and (ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) > 0)   // don't spawn where there's no floor
//if (ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) > 0) 
{
    spawn_fire(targetColumn, targetRow, hp);
}/* else {
    if !(ds_grid_get(global.FLOOR_GRID, targetColumn, targetRow) > 0) {
        show_message("can't spread to " +string(targetColumn) +":" +string(targetRow));
    }
}*/
