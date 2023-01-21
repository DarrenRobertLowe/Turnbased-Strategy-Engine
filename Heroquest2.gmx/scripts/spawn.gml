///spawn(column, row, object index, facing, add to turn list?);

var column      = argument0;
var row         = argument1;
var type        = argument2;
var facing      = faceDirection(argument3);
var addToTurns  = argument4;

//var targetX = getCellCenterX(mouse_x);
//var targetY = getCellCenterY(mouse_y);


var instance  = instance_create(getXFromColumn(column), getYFromRow(row), type);


if (addToTurns)
{
    addToTurnList(instance);
}

return instance;
