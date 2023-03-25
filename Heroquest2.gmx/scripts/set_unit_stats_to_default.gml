///set_unit_unitStats_to_default(index);
/* Called when creating a new unitStats. Sets all the unitStats
 * for the given unit's index to the default values.
 *
 * see setup_units() for default values
*/

var index = argument0;
var unit  = global.persistent_units;

var type = ds_grid_get(unit, unitStats.type, index);
ds_grid_set(unit, unitStats.type, index, type);

var name = ds_grid_get(unit, unitStats.name, index);
ds_grid_set(unit, unitStats.name, index, name);

var level = ds_grid_get(unit, unitStats.level, index);
ds_grid_set(unit, unitStats.level, index, type);

var hpBase = ds_grid_get(unit, unitStats.hpBase, index);
ds_grid_set(unit, unitStats.hpBase, index, hpBase);

var mpBase = ds_grid_get(unit, unitStats.mpBase, index);
ds_grid_set(unit, unitStats.mpBase, index, mpBase);

var moveBase = ds_grid_get(unit, unitStats.moveBase, index);
ds_grid_set(unit, unitStats.moveBase, index, moveBase);

var initiativeBase = ds_grid_get(unit, unitStats.initiativeBase, index);
ds_grid_set(unit, unitStats.initiativeBase, index, initiativeBase);

var fortitudeBase = ds_grid_get(unit, unitStats.fortitudeBase, index);
ds_grid_set(unit, unitStats.fortitudeBase, index, fortitudeBase);

var attackBase = ds_grid_get(unit, unitStats.attackBase, index);
ds_grid_set(unit, unitStats.attackBase, index, attackBase);

var defenceBase = ds_grid_get(unit, unitStats.defenceBase, index);
ds_grid_set(unit, unitStats.defenceBase, index, defenceBase);

var weapon = ds_grid_get(unit, unitStats.weaponId, index);
ds_grid_set(unit, unitStats.weaponId, index, weapon);

var offhand = ds_grid_get(unit, unitStats.offhand, index);
ds_grid_set(unit, unitStats.offhand, index, offhand);

var armour = ds_grid_get(unit, unitStats.armour, index);
ds_grid_set(unit, unitStats.armour, index, armour);





