///validCell(column, row);

var column  = argument0;
var row     = argument1;

if  (column >= 0)
and (column < global.gridWidth)
and (row >= 0)
and (row < global.gridHeight) {
    return true;
}
