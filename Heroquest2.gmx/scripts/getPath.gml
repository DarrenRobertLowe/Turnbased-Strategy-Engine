///getPath(start column, start row, target column, target row, path);

var startCol    = argument0;
var startRow    = argument1;
var targetCol   = argument2;
var targetRow   = argument3;
var pathfindingOffset = global.pathfindingOffset;

var startX      = getXFromColumn(startCol);
var startY      = getYFromRow(startRow);
var targetX     = getXFromColumn(targetRow);
var targetY     = getYFromRow(targetCol);

if (mp_grid_path(global.pathGrid, myPath, startX+pathfindingOffset, startY+pathfindingOffset, targetX+pathfindingOffset, targetY+pathfindingOffset, false))
{
    return true;
}
else return false;
