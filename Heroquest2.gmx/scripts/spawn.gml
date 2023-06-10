///spawn(column, row, object index, facing, add to turn list?);
// Note: the grid is determined by the object itself
var column      = argument0;
var row         = argument1;
var type        = argument2;
var facing      = faceDirection(argument3);
var addToTurns  = argument4;

var instance  = instance_create(getXFromColumn(column), getYFromRow(row), type);

if (addToTurns) {
    addToTurnList(instance);
}

return instance;
