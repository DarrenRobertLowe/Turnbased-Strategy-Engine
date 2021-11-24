///sortTargetsByHelplessness(listOfTargets);

var listOfTargets = argument0;
var size = ds_list_size(listOfTargets);
var unit = -1;
var value = 0;
var best = -1;

if (preferredTarget = AI_TARGET_CHOICES.helpless)
{
    var ailments = unit.ailments;
    var ailmentsCount = ds_list_size(ailments);
    
    for(var i=0; i<size; i++)
    {
        unit = ds_list_find_value(listOfTargets, i);
        
        if (instance_exists(unit))
        {
            for (var i=0; i<ailmentsCount; i++)
            {
                var ailment = ds_list_find_value(ailments,i);
                
                if (ailment == "Paralysis")
                or (ailment == "Sleep")
                {
                    return target;
                }
            }
        }
    }
}
