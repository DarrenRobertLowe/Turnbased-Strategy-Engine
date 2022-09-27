/// getIsoX(x,y);
var xx = argument0;
var yy = argument1;

return (global.GRID_OFFSET_X + ((xx-yy) * global.isometricTileWidth));
