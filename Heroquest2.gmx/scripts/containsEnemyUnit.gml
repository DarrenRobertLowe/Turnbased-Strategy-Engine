/// containsEnemyUnit(grid id, column, row);
var grid    = argument0;
var column  = argument1;
var row     = argument2;


unit = ds_grid_get(grid, column, row);

if (unit > 0)
and (object_is_ancestor(unit.object_index, ENTITY))
and (unit.team != team) {
    return unit;
} else 
    return -1;

