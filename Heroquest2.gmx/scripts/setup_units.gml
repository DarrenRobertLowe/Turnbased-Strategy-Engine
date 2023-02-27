///setup_units(); 
/*
 * See: setup_enums() for unitStats
*/
global.heroesList  = ds_list_create();
global.persistent_units = ds_grid_create(unitStats.length,1);


// CREATE THE FIRST ENTRY
// see getBaseStats()
var index = 0;
ds_grid_set(global.persistent_units, unitStats.type,              index, NPC);
ds_grid_set(global.persistent_units, unitStats.name,              index, "I AM ERROR");
ds_grid_set(global.persistent_units, unitStats.hpBase,            index, 1);
ds_grid_set(global.persistent_units, unitStats.mpBase,            index, 1);
ds_grid_set(global.persistent_units, unitStats.moveBase,          index, 1);
ds_grid_set(global.persistent_units, unitStats.attackBase,        index, 1);
ds_grid_set(global.persistent_units, unitStats.initiativeBase,    index, 1);
ds_grid_set(global.persistent_units, unitStats.fortitudeBase,     index, 1);
ds_grid_set(global.persistent_units, unitStats.attackBase,        index, 1);
ds_grid_set(global.persistent_units, unitStats.defenceBase,       index, 1);
ds_grid_set(global.persistent_units, unitStats.weaponId,          index, 0);
ds_grid_set(global.persistent_units, unitStats.avatar,            index, 0);


// CREATE THE ACTUAL UNITS
index = add_new_unit_to_units_table();  // create a blank unit entry
// give the unit their starting stats
ds_grid_set(global.persistent_units, unitStats.type,          index, HERO);
ds_grid_set(global.persistent_units, unitStats.name,          index, "Serana");
ds_grid_set(global.persistent_units, unitStats.hpBase,        index, 8);
ds_grid_set(global.persistent_units, unitStats.mpBase,        index, 10);
ds_grid_set(global.persistent_units, unitStats.moveBase,      index, 3);
ds_grid_set(global.persistent_units, unitStats.attackBase,    index, 3);
ds_grid_set(global.persistent_units, unitStats.weaponId,      index, 1);
ds_grid_set(global.persistent_units, unitStats.avatar,        index, avatar_index.female);


index = add_new_unit_to_units_table();  // create a blank unit entry
// give the unit their starting stats
ds_grid_set(global.persistent_units, unitStats.type,          index, HERO);
ds_grid_set(global.persistent_units, unitStats.name,          index, "Devlin");
ds_grid_set(global.persistent_units, unitStats.hpBase,        index, 10);
ds_grid_set(global.persistent_units, unitStats.mpBase,        index, 0);
ds_grid_set(global.persistent_units, unitStats.moveBase,      index, 3);
ds_grid_set(global.persistent_units, unitStats.attackBase,    index, 8);
ds_grid_set(global.persistent_units, unitStats.weaponId,      index, 1);
ds_grid_set(global.persistent_units, unitStats.avatar,        index, avatar_index.male);
