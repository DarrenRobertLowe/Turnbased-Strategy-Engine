///sortTurnList();
/*
var list = global.TURNLIST;
var unit = -1;
var spd  = 0;
var best = -1;

for(var i=0; i<ds_list_size(list); i++) {
    unit = ds_list_find_value(list, i);
    
    if (instance_exists(unit)) {
        spd = calculate_initiative(unit);
        
        if (spd > best) 
        or (best == -1) {
            ds_list_delete(list, i);
            ds_list_insert(list, 0, unit);
            best = spd;
            i=-1; // repeat from start of list
        }
    }
}
*/
