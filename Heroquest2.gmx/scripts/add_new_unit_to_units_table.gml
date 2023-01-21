/// add_new_unit_to_units_table()
/********************************
heroStats layout
-----------------------------
Hero1   type    name    sex     etc...
Hero2   type    name    sex     etc...
Hero3   type    name    sex     etc...
Hero4   type    name    sex     etc...
********************************/
var units           = global.persistent_units;     // deglobalize
var numberOfEntries = ds_grid_height(units);
var numberOfStats   = ds_grid_width(units);
var index           = numberOfEntries;

// resize the grid
ds_grid_resize(units, numberOfStats, index+1);


//set_unit_stats_to_default(index);
ds_grid_set(units, unitStats.type,          index, HERO);
ds_grid_set(units, unitStats.name,          index, "I AM ERROR");
ds_grid_set(units, unitStats.hpBase,        index, 1);
ds_grid_set(units, unitStats.mpBase,        index, 1);
ds_grid_set(units, unitStats.moveBase,      index, 1);
ds_grid_set(units, unitStats.attackBase,    index, 1);
ds_grid_set(units, unitStats.weaponId,      index, 0);


return index;               // return the new unit index
