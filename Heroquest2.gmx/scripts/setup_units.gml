///setup_units(); 
/* See: setup_enums()
*/
global.heroesList  = ds_list_create();
global.persistent_units = ds_grid_create(unitStats.length,1);
units = global.persistent_units;        // deglobalize


// CREATE THE FIRST ENTRY
// see getBaseStats()
var index = 0;
ds_grid_set(units, unitStats.type,              index, NPC);
ds_grid_set(units, unitStats.name,              index, "I AM ERROR");
ds_grid_set(units, unitStats.hpBase,            index, 1);
ds_grid_set(units, unitStats.mpBase,            index, 1);
ds_grid_set(units, unitStats.moveBase,          index, 1);
ds_grid_set(units, unitStats.attackBase,        index, 1);
ds_grid_set(units, unitStats.initiativeBase,    index, 1);
ds_grid_set(units, unitStats.fortitudeBase,     index, 1);
ds_grid_set(units, unitStats.attackBase,        index, 1);
ds_grid_set(units, unitStats.defenceBase,       index, 1);
ds_grid_set(units, unitStats.weaponId,          index, 0);


// CREATE THE ACTUAL UNITS
index = add_new_unit_to_units_table();  // create a blank unit entry
// give the unit their starting stats
ds_grid_set(units, unitStats.type,          index, HERO);
ds_grid_set(units, unitStats.name,          index, "Serana");
ds_grid_set(units, unitStats.hpBase,        index, 8);
ds_grid_set(units, unitStats.mpBase,        index, 10);
ds_grid_set(units, unitStats.moveBase,      index, 3);
ds_grid_set(units, unitStats.attackBase,    index, 3);
ds_grid_set(units, unitStats.weaponId,      index, 1);

index = add_new_unit_to_units_table();  // create a blank unit entry
// give the unit their starting stats
ds_grid_set(units, unitStats.type,          index, HERO);
ds_grid_set(units, unitStats.name,          index, "Devlin");
ds_grid_set(units, unitStats.hpBase,        index, 10);
ds_grid_set(units, unitStats.mpBase,        index, 0);
ds_grid_set(units, unitStats.moveBase,      index, 3);
ds_grid_set(units, unitStats.attackBase,    index, 8);
