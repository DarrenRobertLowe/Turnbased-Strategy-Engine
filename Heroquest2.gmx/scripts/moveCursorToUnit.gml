/// moveCursorToUnit(instance id)
/* Teleports the cursor to the target unit's position.
*/

var unit = argument0;

if !(is_undefined(unit)) {
    if (instance_exists(unit)) {
        CURSOR.column = unit.column;
        CURSOR.row = unit.row;
        CAMERA.target = CURSOR;
    }
}
