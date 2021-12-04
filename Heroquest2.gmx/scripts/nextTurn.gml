/// nextTurn();
var list = global.TURNLIST;
var turnEnding = ds_list_find_value(list, 0);
ds_list_add(list, turnEnding);
ds_list_delete(list, 0);
global.TURN = ds_list_find_value(list, 0);

if !(is_undefined(global.TURN))
{
    if instance_exists(global.TURN)
    {
        CURSOR.column = global.TURN.column;
        CURSOR.row = global.TURN.row;
    }
}
