/// getBaseStats(unit index);
/** Sets the calling instance's stats variables to
 * the given hero index.
 * 
 * What we're doing here is using a grid to represent
 * the stats values for each entity, effectively like
 * a spreadsheet.
 * 
 * "stats" is just an enum that makes it convenient
 * to add or remove stats as we refine the game.
 * 
 * The values contained in the grid are the base values,
 * so like hpMax, mpMax, etc, except we want to be able
 * to buff those values, so they're a baseline rather
 * than a max. 
 * 
 * See setup_enums() for "stats" enum
 * See setup_default_stats() for values
*/ 
var statsIndex  = argument0;
var units       = global.persistent_units;   // deglobalize

type            = ds_grid_get(units, unitStats.type,            statsIndex);
name            = ds_grid_get(units, unitStats.name,            statsIndex);
hpBase          = ds_grid_get(units, unitStats.hpBase,          statsIndex);
mpBase          = ds_grid_get(units, unitStats.mpBase,          statsIndex);
moveBase        = ds_grid_get(units, unitStats.moveBase,        statsIndex);
initiativeBase  = ds_grid_get(units, unitStats.initiativeBase,  statsIndex);    // who moves first
fortitudeBase   = ds_grid_get(units, unitStats.fortitudeBase,   statsIndex);    // mental strength against panic, fear, etc
attackBase      = ds_grid_get(units, unitStats.attackBase,      statsIndex);
defenceBase     = ds_grid_get(units, unitStats.defenceBase,     statsIndex);
weapon          = ds_grid_get(units, unitStats.weaponId,        statsIndex);
offhand         = ds_grid_get(units, unitStats.offhand,         statsIndex);
armour          = ds_grid_get(units, unitStats.armour,          statsIndex);
avatar          = ds_grid_get(units, unitStats.avatar,          statsIndex);

hp          = hpBase;
mp          = mpBase;
move        = moveBase;
initiative  = initiativeBase;
fortitude   = fortitudeBase;
attack      = attackBase;
defence     = defenceBase;


