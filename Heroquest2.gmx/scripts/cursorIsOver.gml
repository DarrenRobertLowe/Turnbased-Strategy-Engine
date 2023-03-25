///cursorIsOver();
/* Checks for an ENTITY under the cursor and
 * returns its id if there is one.
 */
var xx = CURSOR.x;
var yy = CURSOR.y;

var ent = instance_position(xx, yy, ENTITY);

if (ent > 0)
  then return ent;
else return 0;
