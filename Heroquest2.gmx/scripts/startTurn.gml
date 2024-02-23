///startTurn();

if (exists(global.TURN)) {
    with (global.TURN) {
        reset_baseStats();
        for(var i=0; i<ds_list_size(afflictions); i++){
            var affliction = ds_list_find_value(afflictions, i);
            with (affliction) {
                event_user(0); // perform the affliciton
            }
        }
    }
} else sout("Attempted to set turn to non existant entity: " +string(global.TURN) + "!");

