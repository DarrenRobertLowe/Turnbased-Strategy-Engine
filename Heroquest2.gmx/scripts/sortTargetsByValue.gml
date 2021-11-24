///sortTargetsByValue(listOfTargets, preferredTarget value);

var list = argument0;
var preferredTarget = argument1;
var size = ds_list_size(list);
var unit = -1;
var value = 0;
var best = -1;



if (preferredTarget = AI_TARGET_CHOICES.lowestHP)
{
    var hp = unit.hp;
    
    for(var i=0; i<size; i++)
    {
        unit = ds_list_find_value(list, i);
    
        if (instance_exists(unit))
        {
            if (hp < best)
            or (best == 1)
            {
                ds_list_delete(list, i);
                ds_list_insert(list, 0, unit);
                best = hp;
                i = -1; // repeat from start of list
            }
        }
    }
}




if (preferredTarget = AI_TARGET_CHOICES.helpless)
{
    var ailments = unit.ailments;
    var ailmentsCount = ds_list_size(ailments);
    
    for(var i=0; i<size; i++)
    {
        unit = ds_list_find_value(list, i);
        
        if (instance_exists(unit))
        {
            for (var i=0; i<ailmentsCount; i++)
            {
                if (hp < best)
                or (best == 1)
                {
                    ds_list_delete(list, i);
                    ds_list_insert(list, 0, unit);
                    best = hp;
                    i = -1; // repeat from start of list
                }
            }
                
        }
    }
}
