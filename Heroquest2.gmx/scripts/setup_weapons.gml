///setup_weapons();
var index = 0;
var numberOfWeapons = 10;


global.default_weapons = ds_grid_create(weaponStats.length, numberOfWeapons);
global.persistent_weapons = ds_grid_create(weaponStats.length, numberOfWeapons); // we'll actually JSON encode and decode for this

// PERSISTENT WEAPONS
index = 0;
ds_grid_set(global.persistent_weapons, weaponStats.type,       index,  UNARMED);
ds_grid_set(global.persistent_weapons, weaponStats.name,       index,  "Ceci n'est pas une weapon");
ds_grid_set(global.persistent_weapons, weaponStats.pwr,        index,  global.DAMAGE_MINIMAL);
ds_grid_set(global.persistent_weapons, weaponStats.dice,       index,  1);
ds_grid_set(global.persistent_weapons, weaponStats.range,      index,  1);
ds_grid_set(global.persistent_weapons, weaponStats.diagonal,   index,  false);
ds_grid_set(global.persistent_weapons, weaponStats.animation,  index,  attackAnimations.punch);


index++;
ds_grid_set(global.persistent_weapons, weaponStats.type,       index,  WoodenMop);
ds_grid_set(global.persistent_weapons, weaponStats.name,       index,  "Wooden Mop");
ds_grid_set(global.persistent_weapons, weaponStats.pwr,        index,  global.DAMAGE_NORMAL);
ds_grid_set(global.persistent_weapons, weaponStats.dice,       index,  1);
ds_grid_set(global.persistent_weapons, weaponStats.range,      index,  2);
ds_grid_set(global.persistent_weapons, weaponStats.diagonal,   index,  true);
ds_grid_set(global.persistent_weapons, weaponStats.animation,  index,  attackAnimations.bash);


// these are the default stats for all weapons
// see setup_enums()
index = 0;
ds_grid_set(global.default_weapons, weaponStats.type,       index,  UNARMED);
ds_grid_set(global.default_weapons, weaponStats.name,       index,  "Unarmed");
ds_grid_set(global.default_weapons, weaponStats.pwr,        index,  global.DAMAGE_MINIMAL);
ds_grid_set(global.default_weapons, weaponStats.dice,       index,  1);
ds_grid_set(global.default_weapons, weaponStats.range,      index,  1);
ds_grid_set(global.default_weapons, weaponStats.diagonal,   index,  false);
ds_grid_set(global.default_weapons, weaponStats.animation,  index,  attackAnimations.punch);

index++;
ds_grid_set(global.default_weapons, weaponStats.type,       index,  Cutlass);
ds_grid_set(global.default_weapons, weaponStats.name,       index,  "Cutlass");
ds_grid_set(global.default_weapons, weaponStats.pwr,        index,  global.DAMAGE_NORMAL);
ds_grid_set(global.default_weapons, weaponStats.dice,       index,  1);
ds_grid_set(global.default_weapons, weaponStats.range,      index,  1);
ds_grid_set(global.default_weapons, weaponStats.diagonal,   index,  false);
ds_grid_set(global.default_weapons, weaponStats.animation,  index,  attackAnimations.slash);

index++;
ds_grid_set(global.default_weapons, weaponStats.type,       index,  WoodenMop);
ds_grid_set(global.default_weapons, weaponStats.name,       index,  "Wooden Mop");
ds_grid_set(global.default_weapons, weaponStats.pwr,        index,  global.DAMAGE_NORMAL);
ds_grid_set(global.default_weapons, weaponStats.dice,       index,  1);
ds_grid_set(global.default_weapons, weaponStats.range,      index,  2);
ds_grid_set(global.default_weapons, weaponStats.diagonal,   index,  true);
ds_grid_set(global.default_weapons, weaponStats.animation,  index,  attackAnimations.bash);
