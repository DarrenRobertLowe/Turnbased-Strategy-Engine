/// nextTurn();
/* Takes the first element of the turnlist
 * and moves it to the end
*/
var list = global.TURNLIST;

if ( !isBattleOver() ) {
    var turnEnding = ds_list_find_value(list, 0);   // get the first element (current turn)

    ds_list_delete(list, 0);                        // delete the first element (current turn)
    global.TURN = ds_list_find_value(list, 0);      // change the turn to the new first element
    
    // add the entity to the bottom of the turnlist if it isn't dead
    if (instance_exists(turnEnding)) {
        ds_list_add(list, turnEnding);
    }
    
    moveCursorToUnit(global.TURN);
} else {
    endBattle();
}
