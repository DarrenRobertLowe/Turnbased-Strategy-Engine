///spawnUnitOld(column, row, persistent_units index, facing, add to turnlist?);
/* 
 * see setup_units() for persistent_units
 */
var column      = argument0;
var row         = argument1;
var index       = argument2;
var facing      = faceDirection(argument3);
var addToTurns  = argument4;

var obj         = ds_grid_get(global.persistent_units, unitStats.type, index);

var unit    = instance_create(getXFromColumn(column), getYFromRow(row), obj);



unit.statsIndex = index; // the unit will need to read and write to its own stats


with(unit) {
    //getBaseStats(statsIndex); // sets the baseline stats for this hero.
}

// instantiate weapons, armor, etc.
/*
var weaponInst = load_weapon(unit.weapon);
sout("Loaded weapon is: " + string(weaponInst));
sout("weapon name is: " + string(weaponInst.name));
sout("weapon attack is: " + string(weaponInst.pwr));

unit.weapon = weaponInst;
*/

if (addToTurns) {
    addToTurnList(unit);
}

return unit;
