///setup_default_stats();
var index = 0;
var numberOfWeapons = 10;


global.weaponsGrid = ds_grid_create(weaponStats.length, numberOfWeapons);

// these are the default stats for all weapons
// see setup_enums()
index = 0;
ds_grid_set(global.weaponsGrid, weaponStats.type,       index,  UNARMED);
ds_grid_set(global.weaponsGrid, weaponStats.name,       index,  "Unarmed");
ds_grid_set(global.weaponsGrid, weaponStats.pwr,        index,  global.DAMAGE_MINIMAL);
ds_grid_set(global.weaponsGrid, weaponStats.dice,       index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.range,      index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.diagonal,   index,  false);
ds_grid_set(global.weaponsGrid, weaponStats.animation,  index,  attackAnimations.punch);

index++;
ds_grid_set(global.weaponsGrid, weaponStats.type,       index,  Cutlass);
ds_grid_set(global.weaponsGrid, weaponStats.name,       index,  "Cutlass");
ds_grid_set(global.weaponsGrid, weaponStats.pwr,        index,  global.DAMAGE_NORMAL);
ds_grid_set(global.weaponsGrid, weaponStats.dice,       index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.range,      index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.diagonal,   index,  false);
ds_grid_set(global.weaponsGrid, weaponStats.animation,  index,  attackAnimations.slash);

index++;
ds_grid_set(global.weaponsGrid, weaponStats.type,       index,  WoodenMop);
ds_grid_set(global.weaponsGrid, weaponStats.name,       index,  "Wooden Mop");
ds_grid_set(global.weaponsGrid, weaponStats.pwr,        index,  global.DAMAGE_NORMAL);
ds_grid_set(global.weaponsGrid, weaponStats.dice,       index,  1);
ds_grid_set(global.weaponsGrid, weaponStats.range,      index,  2);
ds_grid_set(global.weaponsGrid, weaponStats.diagonal,   index,  true);
ds_grid_set(global.weaponsGrid, weaponStats.animation,  index,  attackAnimations.slash);
