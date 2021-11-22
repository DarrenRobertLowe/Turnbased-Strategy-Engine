///spawnHero(column, row, global.heroStats index, facing, add to turnlist?);
var column      = argument0;
var row         = argument1;
var index       = argument2;
var facing      = faceDirection(argument3);
var addToTurns  = argument4;
var heroStats   = global.heroStats; // deglobalize


var obj  = ds_grid_get(heroStats, index, HEROSTATS.type);
var hero = instance_create(getXFromColumn(column), getYFromRow(row), obj);
ds_list_add(global.heroesList, hero);

hero.statsIndex = index;


with(hero)
{
    getHeroStats(statsIndex);
    //event_user(TRIGGER.getStats); // get stats
}

if (addToTurns)
{
    addToTurnList(hero);
}

return hero;
