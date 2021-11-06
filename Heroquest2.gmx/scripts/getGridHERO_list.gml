///getGridHERO_list(grid, column, row);
/* Checks the cell for a selectable hero
 * character, and returns its id value.
 *
 * Returns (int) instance id or -1 if there is no hero found
*/

var grid    = argument0;
var column  = argument1;
var row     = argument2;
var selectableHero = -1;
var heroes  = global.heroesList;


var listOver = ds_grid_get(grid, column, row);
if !(ds_exists(listOver, ds_type_list))
{
    error("Target list (id: " +string(listOver) +") does not exist!", false);
}


var i = 0;
var size = ds_list_size(heroes);

for(i=0; i<size; i++)                                   // iterate through the possible heroes
{
    var hero = ds_list_find_value(heroes, i);
    var heroPos = ds_list_find_index(listOver, hero);   // does this cell contain this hero?
    
    show_debug_message("listOver = "+string(listOver));
    show_debug_message("heroPos = "+string(heroPos));
    
    if (heroPos > -1)                                   // yes the hero exists...
    {
        selectableHero = hero;
        show_debug_message("We're returning "+string(selectableHero));
    }
}


return selectableHero;
