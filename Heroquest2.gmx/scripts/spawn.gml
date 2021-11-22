///spawn(column, row, object index, facing);

var column  = argument0;
var row     = argument1;
var type    = argument2;
var facing  = faceDirection(argument3);

var targetX = getCellCenterX(mouse_x);
var targetY = getCellCenterY(mouse_y);


var object  = instance_create(getXFromColumn(column), getYFromRow(row), type);

with(object)
{
    //event_user(TRIGGERS.getStats); // initialize the stats (see setup_enums)
}
