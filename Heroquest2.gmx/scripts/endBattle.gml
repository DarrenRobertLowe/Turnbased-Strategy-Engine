///endBattle()

/* CLEAN UP ENEMY WEAPON OBJECTS
 * Note: These could be used for spoils of war
 * after combat before deletion. */ 


// delete remaining weapons
var list = global.COMBAT_spoilsOfWar;
var size = ds_list_size(global.COMBAT_spoilsOfWar);

for (var i=0; i<size; i++) {
    var item = ds_list_find_value(global.COMBAT_spoilsOfWar, i);
    instance_destroy(item, true);
}

global.TURN = -1;
room = level2_Test;
