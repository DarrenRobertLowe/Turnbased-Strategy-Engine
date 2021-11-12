/// getXFromColumn(column number)
/* returns INT
 *
 * converts a column number into an x co-ordinate
 * Note: This returns the center position of the column.
*/

var column = argument0;

return (global.GRID_OFFSET_X + (column * global.tileWidth));// + (global.halfTileWidth));
