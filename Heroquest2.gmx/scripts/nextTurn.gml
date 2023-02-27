/// nextTurn();
/* Takes the first element of the turnlist
 * and moves it to the end
*/
var list = global.TURNLIST;

var turnEnding = ds_list_find_value(list, 0);   // get the first element (current turn)
ds_list_add(list, turnEnding);                  // append that element to the list
ds_list_delete(list, 0);                        // delete the first element (current turn)
global.TURN = ds_list_find_value(list, 0);      // change the turn to the new first element

var nextUnit = global.TURN;

if !(is_undefined(nextUnit)) {
    if (instance_exists(nextUnit)) {
        CURSOR.column = nextUnit.column;
        CURSOR.row = nextUnit.row;
    }
}

show_debug_message("global.TURN is now " + string(global.TURN));

