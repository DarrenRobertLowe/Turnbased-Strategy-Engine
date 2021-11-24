///sortTargetsByLowestHP(listOfTargets);
var listOfTargets   = argument0;
var size    = ds_list_size(listOfTargets);
var unit    = -1;
var value   = 0;
var best    = -1;
var hp      = 0;

for(var i=0; i<ds_list_size(listOfTargets); i++)
{
    unit    = ds_list_find_value(listOfTargets, i);
    hp      = unit.hp;
    
    if (instance_exists(unit))
    {
        if (hp < best)
        or (best == -1)
        {
            ds_list_delete(listOfTargets, i);
            ds_list_insert(listOfTargets, 0, unit);
            best = hp;
            i = -1;     // repeat from start of listOfTargets
        }
    }
}
