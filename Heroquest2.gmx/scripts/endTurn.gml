/// endTurn();
/// RESET VARIABLES AT START OF TURN
var entity = ds_list_find_value(global.TURNLIST,0);

with (entity) {
    movedThisTurn = false;
    actedThisTurn = false;
    performedActionThisTurn = false;
    listOfTargetsFilled = false;
    
    if (object_is_ancestor(object_index, NPC)) {
        AI_getOptionsQueue();
    }
}

nextTurn();
