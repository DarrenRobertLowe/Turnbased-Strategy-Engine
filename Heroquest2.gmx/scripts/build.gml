///build(column, row, object index, facing);
/* Used to build terrain, walls, etc.
 * NOTE: In this case, facing is mostly used  to
 *   create a random variations in appearance.
 */

var column      = floor(argument0); // floor() is a safety feature in case random() is used instead of irandom()
var row         = floor(argument1); // floor() is a safety feature in case random() is used instead of irandom()
var type        = argument2;
var facing      = faceDirection(argument3);


var instance  = instance_create(getXFromColumn(column), getYFromRow(row), type);

return instance;
