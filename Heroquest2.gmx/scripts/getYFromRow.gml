/// getYFromRow(row number)
/* returns INT
 *
 * converts a row number into a y co-ordinate (NOT ISOMETRIC!)
*/

var row = argument0;

return (global.GRID_OFFSET_Y + (row * global.tileHeight));// + (global.halfTileHeight));
