///sortTurnList();

var list = global.TURNLIST;
var size = ds_list_size(list);
var unit = -1;
var spd  = 0;
var best = -10000;

for(var i=0; i<size; i++)
{
    unit = ds_list_find_value(list, i);
    
    if (instance_exists(unit)) {
        spd = calculate_initiative(unit);
        
        if (spd > best) {
            ds_list_delete(list, i);
            ds_list_insert(list, 0, unit);
            best = spd;
            i=-1; // repeat from start of list
        }
    }
}
