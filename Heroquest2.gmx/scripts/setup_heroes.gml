///setup_heroes(); 
/* See: setup_enums()
*/

global.heroesList  = ds_list_create();

var stats = global.statsGrid; // deglobalize
var newUnitIndex;

newUnitIndex = add_new_unit_to_stats();
ds_grid_set(stats, stats.type,        newUnitIndex, HERO);
ds_grid_set(stats, stats.name,        newUnitIndex, "Serana");
ds_grid_set(stats, stats.hpBase,      newUnitIndex, 8);
ds_grid_set(stats, stats.mpBase,      newUnitIndex, 10);
ds_grid_set(stats, stats.moveBase,    newUnitIndex, 3);
ds_grid_set(stats, stats.attackBase,  newUnitIndex, 3);


newUnitIndex = add_new_unit_to_stats();
ds_grid_set(stats, stats.type,        newUnitIndex, HERO);
ds_grid_set(stats, stats.name,        newUnitIndex, "Devlin");
ds_grid_set(stats, stats.hpBase,      newUnitIndex, 10);
ds_grid_set(stats, stats.mpBase,      newUnitIndex, 0);
ds_grid_set(stats, stats.moveBase,    newUnitIndex, 3);
ds_grid_set(stats, stats.attackBase,  newUnitIndex, 8);

