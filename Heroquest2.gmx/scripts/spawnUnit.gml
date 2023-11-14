///spawnUnit(column, row, object, stats index to load from (or -1 for none));
/* 
 */
var column      = argument0;
var row         = argument1;
var objIndex    = argument2;
var statsIndex  = argument3;

if (statsIndex > -1) {
    //load_unit_stats(stats, objIndex);
}

var unit    = instance_create(getXFromColumn(column), getYFromRow(row), objIndex);

addToTurnList(unit);

return unit;
