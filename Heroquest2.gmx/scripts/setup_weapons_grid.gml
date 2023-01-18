///setup_default_stats();
// Updating here is meaningless without also updating setup_weapons().
var index = 0;
var numberOfWeapons = 10;


global.weaponsGrid = ds_grid_create(weaponStats.length, numberOfWeapons);

// these are the default stats for all weapons
index = 0;
ds_grid_set(global.weaponsGrid, weaponStats.type,       index,  UNARMED);
ds_grid_set(global.weaponsGrid, weaponStats.name,       index,  "Unarmed");
ds_grid_set(global.weaponsGrid, weaponStats.pwr,        index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.dice,       index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.range,      index,  1);


index = 1;
ds_grid_set(global.weaponsGrid, weaponStats.type,       index,  Cutlass);
ds_grid_set(global.weaponsGrid, weaponStats.name,       index,  "Cutlass");
ds_grid_set(global.weaponsGrid, weaponStats.pwr,        index,  DAMAGE_NORMAL);
ds_grid_set(global.weaponsGrid, weaponStats.dice,       index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.range,      index,  1);

