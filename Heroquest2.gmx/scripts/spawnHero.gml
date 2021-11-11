///spawnHero(column, row, global.heroStats index, facing);
var column    = argument0;
var row       = argument1;
var index     = argument2;
var facing    = faceDirection(argument3);
var heroStats = global.heroStats;

var obj  = ds_grid_get(heroStats, index, HEROSTATS.type);
var hero = instance_create(getXFromColumn(column), getYFromRow(row), obj);
ds_list_add(global.heroesList, hero);





hero.statsIndex = index;

with(hero)
{
    event_user(TRIGGER.getStats); // get stats
}

return hero;
