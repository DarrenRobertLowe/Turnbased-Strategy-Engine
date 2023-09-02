///isBattleOver();


var list = global.TURNLIST;
var size = ds_list_size(list);
var allies  = 0;
var enemies = 0;


for(var i=0; i<size; i++){
    var entity = ds_list_find_value(list, i);
    if (entity.team == TEAMS.ally)  then allies++;
    if (entity.team == TEAMS.enemy) then enemies++;
}

// end the battle under these circumstances...
if (allies == 0) {
    show_message("Game Over!");
    game_end();
    return true;
}

if (enemies == 0) {
    show_message("Victory!");
    game_end();
    return true;
}

// continue the battle by default
return false;
