///set_unit_stats_to_default(index);
/* Called when creating a new stats. Sets all the stats
 * for the given unit's index to the default values.
*/

var index = argument0;
var unit  = global.persistent_units;


var type = ds_grid_get(unit, stats.type, index);
ds_grid_set(unit, stats.type, index, type);

var name = ds_grid_get(unit, stats.name, index);
ds_grid_set(unit, stats.name, index, name);

var hpBase = ds_grid_get(unit, stats.hpBase, index);
ds_grid_set(unit, stats.hpBase, index, hpBase);

var mpBase = ds_grid_get(unit, stats.mpBase, index);
ds_grid_set(unit, stats.mpBase, index, mpBase);

var moveBase = ds_grid_get(unit, stats.moveBase, index);
ds_grid_set(unit, stats.moveBase, index, moveBase);

var initiativeBase = ds_grid_get(unit, stats.initiativeBase, index);
ds_grid_set(unit, stats.initiativeBase, index, initiativeBase);

var fortitudeBase = ds_grid_get(unit, stats.fortitudeBase, index);
ds_grid_set(unit, stats.fortitudeBase, index, fortitudeBase);

var attackBase = ds_grid_get(unit, stats.attackBase, index);
ds_grid_set(unit, stats.attackBase, index, attackBase);

var defenceBase = ds_grid_get(unit, stats.defenceBase, index);
ds_grid_set(unit, stats.defenceBase, index, defenceBase);

var weapon = ds_grid_get(unit, stats.weaponId, index);
ds_grid_set(unit, stats.weaponId, index, weapon);

var offhand = ds_grid_get(unit, stats.offhand, index);
ds_grid_set(unit, stats.offhand, index, offhand);

var armour = ds_grid_get(unit, stats.armour, index);
ds_grid_set(unit, stats.armour, index, armour);





