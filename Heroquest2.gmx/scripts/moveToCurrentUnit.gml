/// moveToCurrentUnit(instance to move);
/* !WARNING!
 * DO NOT DO THIS WITH GRID OBJECT!
 * THE GAME WILL BREAK!
 * THIS IS REALLY JUST FOR THE CURSOR!
 */
var instance = argument0;

if instance_exists(global.TURN) {
    instance.column  = global.TURN.column;
    instance.row     = global.TURN.row;
}
