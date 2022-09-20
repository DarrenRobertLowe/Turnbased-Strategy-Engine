///spawnUnit(column, row, global.stats index, facing, add to turnlist?);
show_debug_message(" ********** RUNNING SPAWN UNIT  ********** ");
var column      = argument0;
var row         = argument1;
var index       = argument2;
var facing      = faceDirection(argument3);
var addToTurns  = argument4;


var obj         = ds_grid_get(global.statsGrid, stats.type, index);

var instance    = instance_create(getXFromColumn(column), getYFromRow(row), obj);

if (stats.type == HERO) {
    ds_list_add(global.heroesList, hero);
}
if (stats.type == ENEMY) {
    ds_list_add(global.enemiesList, hero);
}


instance.statsIndex = index;


with(instance) {
    getBaseStats(statsIndex); // sets the baseline stats for this hero.
}

if (addToTurns) {
    addToTurnList(instance);
}

return instance;
