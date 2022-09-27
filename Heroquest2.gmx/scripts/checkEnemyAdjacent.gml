///checkEnemyAdjacent(diagonals?);
/** Returns the unit instance id or -1 if 
  * nothing is found.
 */
 
var unit;
var diagonals = argument0;

// north
if ((row-1) > -1) {
    unit = containsEnemyUnit(global.GRID, column, row-1)
    if (unit > -1)
        return unit;
}

// south
if ((row+1) < ds_grid_width(global.GRID)) {
    unit = containsEnemyUnit(global.GRID, column, row+1);
    if (unit > -1)
        return unit;
}


// west
if ((column-1) > -1) {
unit = containsEnemyUnit(global.GRID, column-1, row);
if (unit > -1)
    return unit;
}

// east
if ((column+1) < ds_grid_height(global.GRID)) {
unit = containsEnemyUnit(global.GRID, column+1, row);
if (unit > -1)
    return unit;
}

// diagonals
if (diagonals) {
    unit = containsEnemyUnit(global.GRID, column-1, row-1);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column-1, row+1);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column+1, row-1);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column+1, row+1);
    if (unit > -1)
        return unit;
}


// default if nothing found
return -1;

