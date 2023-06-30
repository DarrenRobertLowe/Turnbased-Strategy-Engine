///FIRE_AI_trySpread(parent);
//show_message("running FIRE_AI_trySpread");
var parent      = argument0;
var grid        = global.FIRE_GRID;
var maxWidth    = ds_grid_width(grid);
var maxHeight   = ds_grid_height(grid);

var targetCol;
var targetRow;
var hp = parent.hp-1;

// try spread north
targetColumn = parent.column;
targetRow    = (parent.row-1);
if ( targetRow > -1 ) {
    FIRE_AI_spread(targetColumn, targetRow, hp);
}

// try spread south
targetColumn = parent.column;
targetRow = (parent.row+1);
if ( targetRow < maxHeight ) {
    FIRE_AI_spread(targetColumn, targetRow, hp);
}

// try spread west
targetColumn = (parent.column-1);
targetRow = parent.row;
if ( targetColumn > -1 ) {
    FIRE_AI_spread(targetColumn, targetRow, hp);
}

/// try spread east
targetColumn = (parent.column+1);
targetRow = parent.row;
if ( targetColumn < maxWidth ) {
    FIRE_AI_spread(targetColumn, targetRow, hp);
}
