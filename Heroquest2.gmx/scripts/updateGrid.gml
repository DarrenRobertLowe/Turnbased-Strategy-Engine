///updateGrid(inst, oldColumn, oldRow, newColumn, newRow)
/*
 * Replaces the old grid cell with -1 and
 * adds the unit's ID to the new one.
*/

var inst        = argument0;
var oldColumn   = argument1;
var oldRow      = argument2;
var newColumn   = argument3;
var newRow      = argument4;
var grid        = global.GRID;


removeInstanceFromGrid(grid, inst, oldColumn, oldRow);
addInstanceToGrid(grid, inst, newColumn, newRow);
