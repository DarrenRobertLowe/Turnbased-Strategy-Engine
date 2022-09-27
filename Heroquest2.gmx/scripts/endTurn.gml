/// endTurn();
/// RESET VARIABLES AT START OF TURN
movedThisTurn = false;
actedThisTurn = false;
performedActionThisTurn = false;
listOfTargetsFilled = false;

if (object_is_ancestor(object_index, NPC)) {
    AI_getOptionsQueue();
}

nextTurn();
