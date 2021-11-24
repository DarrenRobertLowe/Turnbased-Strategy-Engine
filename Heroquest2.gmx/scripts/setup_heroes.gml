///setup_heroes(); 
/* See also setup_enums()
*/
global.heroStats  = ds_grid_create(0, HEROSTATS.length);
global.heroesList = ds_list_create();
var heroStats = global.heroStats;

add_new_hero(HERO,  SEXES.female,   "Schala",   10, 10, 4, 1, 2, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
add_new_hero(HERO,  SEXES.male,     "Enright",  10, 10, 4, 2, 2, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
add_new_hero(HERO,  SEXES.female,   "Mara",     10, 10, 4, 3, 2, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
add_new_hero(HERO,  SEXES.male,     "Devlin",   10, 10, 4, 4, 2, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
