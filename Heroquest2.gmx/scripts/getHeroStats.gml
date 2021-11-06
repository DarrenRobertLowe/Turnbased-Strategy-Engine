/// getHeroStats(hero index);
/* Sets the calling instance's stats variables to
 *  the given hero index.
*/ 

var heroStats = global.heroStats;

type    = ds_grid_get(heroStats, statsIndex, HEROSTATS.type);
name    = ds_grid_get(heroStats, statsIndex, HEROSTATS.name);
sex     = ds_grid_get(heroStats, statsIndex, HEROSTATS.sex);
hp      = ds_grid_get(heroStats, statsIndex, HEROSTATS.hp);
mp      = ds_grid_get(heroStats, statsIndex, HEROSTATS.mp);
move    = ds_grid_get(heroStats, statsIndex, HEROSTATS.move);
attack  = ds_grid_get(heroStats, statsIndex, HEROSTATS.attack);
defence = ds_grid_get(heroStats, statsIndex, HEROSTATS.defence);
weapon  = ds_grid_get(heroStats, statsIndex, HEROSTATS.weapon);
offhand = ds_grid_get(heroStats, statsIndex, HEROSTATS.offhand);
amulet  = ds_grid_get(heroStats, statsIndex, HEROSTATS.amulet);
armour  = ds_grid_get(heroStats, statsIndex, HEROSTATS.armour);
ring1   = ds_grid_get(heroStats, statsIndex, HEROSTATS.ring1);
ring1   = ds_grid_get(heroStats, statsIndex, HEROSTATS.ring2);
hair    = ds_grid_get(heroStats, statsIndex, HEROSTATS.hair);
face    = ds_grid_get(heroStats, statsIndex, HEROSTATS.face);
skin    = ds_grid_get(heroStats, statsIndex, HEROSTATS.skin);
