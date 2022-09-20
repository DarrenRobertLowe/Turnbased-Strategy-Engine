/// getHeroStats(hero index);
/* Sets the calling instance's stats variables to
 * the given hero index.
 * 
 * What we're doing here is using a grid to represent
 * the stats values for each hero, effectively like a
 * spreadsheet.
 * 
 * HEROSTATS is just an enum that makes it convenient
 * to add or remove stats that maybe we don't want.
 * 
 * The values contained in the grid are the base values,
 * so like hpMax, mpMax, etc, except we want to be able
 * to buff those values, so they're a baseline rather
 * than a max. 
 * 
 * See setup_enums() for HEROSTATS enum.
*/ 

var heroStats = global.heroStats;   // deglobalize

type            = ds_grid_get(heroStats, statsIndex, HEROSTATS.type);
name            = ds_grid_get(heroStats, statsIndex, HEROSTATS.name);
sex             = ds_grid_get(heroStats, statsIndex, HEROSTATS.sex);
hpBase          = ds_grid_get(heroStats, statsIndex, HEROSTATS.hp);
mpBase          = ds_grid_get(heroStats, statsIndex, HEROSTATS.mp);
moveBase        = ds_grid_get(heroStats, statsIndex, HEROSTATS.move);
initiativeBase  = ds_grid_get(heroStats, statsIndex, HEROSTATS.initiative); // who moves first
fortitudeBase   = ds_grid_get(heroStats, statsIndex, HEROSTATS.fortitude);  // mental strength against panic, fear, etc
attackBase      = ds_grid_get(heroStats, statsIndex, HEROSTATS.attack);
defenceBase     = ds_grid_get(heroStats, statsIndex, HEROSTATS.defence);
weapon          = ds_grid_get(heroStats, statsIndex, HEROSTATS.weapon);
offhand         = ds_grid_get(heroStats, statsIndex, HEROSTATS.offhand);
armour          = ds_grid_get(heroStats, statsIndex, HEROSTATS.armour);
ring1           = ds_grid_get(heroStats, statsIndex, HEROSTATS.ring1);
hair            = ds_grid_get(heroStats, statsIndex, HEROSTATS.hair);
face            = ds_grid_get(heroStats, statsIndex, HEROSTATS.face);
skin            = ds_grid_get(heroStats, statsIndex, HEROSTATS.skin);

hp          = hpBase;
mp          = mpBase;
move        = moveBase;
initiative  = initiativeBase;
fortitude   = fortitudeBase;
attack      = attackBase;
defence     = defenceBase;
