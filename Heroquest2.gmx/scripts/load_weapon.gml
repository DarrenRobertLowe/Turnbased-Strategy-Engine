/// load_weapon(index on weaponsGrid)
/* This will load the persistent record of
 * a weapon (e.g. for heroes)
 *
 * For basic weapons you can simply
 * use weapon = instance_create(Cutlass) etc
 *
 * See also: setup_enums();
 */
 
persistent_weapons = global.persistent_weapons;

index       = argument0;
obj         = ds_grid_get(persistent_weapons, weaponStats.type, index);
weaponInst  = instance_create(0, 0, obj);

weaponInst.name     = ds_grid_get(persistent_weapons, weaponStats.name, index);
sout("Replacing weapon.name with : " + string(weaponInst.name));
weaponInst.pwr      = ds_grid_get(persistent_weapons, weaponStats.pwr, index);
weaponInst.dice     = ds_grid_get(persistent_weapons, weaponStats.dice, index);
weaponInst.range    = ds_grid_get(persistent_weapons, weaponStats.range, index);
weaponInst.diagonal = ds_grid_get(persistent_weapons, weaponStats.diagonal, index);
//weaponInst.modifiers = ds_grid_get(persistent_weapons, weaponStats.modifiers, index);
weaponInst.animation = ds_grid_get(persistent_weapons, weaponStats.animation, index);

return weaponInst;
