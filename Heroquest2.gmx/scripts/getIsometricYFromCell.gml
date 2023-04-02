/// getIsometricYFromCell(column, row)
var column  = argument0;
var row     = argument1;

return global.GRID_OFFSET_Y + ((column+row) * global.isometricTileHeight);

