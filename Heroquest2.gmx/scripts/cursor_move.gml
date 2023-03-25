///cursor_move();
/* Changes the move variable value
 * Calls move_instant()
*/

if (global.controls_up)    then move = DIRECTION.north;
if (global.controls_down)  then move = DIRECTION.south;
if (global.controls_left)  then move = DIRECTION.west;
if (global.controls_right) then move = DIRECTION.east;


moveInstant();
