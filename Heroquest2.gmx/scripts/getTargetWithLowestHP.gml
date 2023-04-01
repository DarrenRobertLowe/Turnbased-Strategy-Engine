/// getTargetWithLowestHP(listOfTargets)

var targets = argument0;
var size = ds_list_size(targets);

var lowestHP = global.MAX_HP;
var chosen = -1;

for(var i=0; i<size; i++) {
    var unit = ds_list_find_value(targets, i);
    if (unit.hp < lowestHP) then chosen = unit;
}

return chosen;
