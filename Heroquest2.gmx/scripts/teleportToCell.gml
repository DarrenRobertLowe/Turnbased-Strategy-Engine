/// teleportToCell(instance id, column, row)
/* Moves an object from one grid position to another
 * without traversing the space in between.
 * 
*/

var inst= argument0;
var c   = argument1;
var r   = argument2;

if (instance_exists(inst))
{
    with (inst)
    {
        column = c;
        row = r;
        getCoordsFromCell();    // update our x/y
    }
}
else
{
    error("ERROR in teleportToCell() #Trying to set position of a non-existing instance!#(id: " +string(inst) + ")", false);
}
