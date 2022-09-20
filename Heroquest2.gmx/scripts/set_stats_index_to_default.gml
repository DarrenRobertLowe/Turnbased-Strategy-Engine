///set_stats_index_to_default(index);
/* Called when creating a new unit. Sets all the stats
 * for the given index to the default values.
*/

var index = argument0;
var stats = global.statsGrid;


var type = ds_grid_get(stats, stats.type, index);
ds_grid_set(stats, stats.type, index, type);

var name = ds_grid_get(stats, stats.name, index);
ds_grid_set(stats, stats.name, index, name);

var hpBase = ds_grid_get(stats, stats.hpBase, index);
ds_grid_set(stats, stats.hpBase, index, hpBase);

var mpBase = ds_grid_get(stats, stats.mpBase, index);
ds_grid_set(stats, stats.mpBase, index, mpBase);

var moveBase = ds_grid_get(stats, stats.moveBase, index);
ds_grid_set(stats, stats.moveBase, index, moveBase);

var initiativeBase = ds_grid_get(stats, stats.initiativeBase, index);
ds_grid_set(stats, stats.initiativeBase, index, initiativeBase);

var fortitudeBase = ds_grid_get(stats, stats.fortitudeBase, index);
ds_grid_set(stats, stats.fortitudeBase, index, fortitudeBase);

var attackBase = ds_grid_get(stats, stats.attackBase, index);
ds_grid_set(stats, stats.attackBase, index, attackBase);

var defenceBase = ds_grid_get(stats, stats.defenceBase, index);
ds_grid_set(stats, stats.defenceBase, index, defenceBase);

var weapon = ds_grid_get(stats, stats.weapon, index);
ds_grid_set(stats, stats.weapon, index, weapon);

var offhand = ds_grid_get(stats, stats.offhand, index);
ds_grid_set(stats, stats.offhand, index, offhand);

var armour = ds_grid_get(stats, stats.armour, index);
ds_grid_set(stats, stats.armour, index, armour);





