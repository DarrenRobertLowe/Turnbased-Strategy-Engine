///build(column, row, object index, facing);
/* Used to build terrain, walls, etc.
 * NOTE: In this case, facing is mostly used  to
 *   create a random variations in appearance.
 */

var column      = argument0;
var row         = argument1;
var type        = argument2;
var facing      = faceDirection(argument3);

var instance  = instance_create(getXFromColumn(column), getYFromRow(row), type);

return instance;
