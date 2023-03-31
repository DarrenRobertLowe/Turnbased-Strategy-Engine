///checkEnemyAdjacent(range, diagonals?);
/** Returns the unit instance id or -1 if 
  * nothing is found.
 */
 
var unit;
var range     = argument0;
var diagonals = argument1;

// north
if ((row-range) > -1) {
    unit = containsEnemyUnit(global.GRID, column, row-range)
    if (unit > -1)
        return unit;
}

// south
if ((row+range) < ds_grid_width(global.GRID)) {
    unit = containsEnemyUnit(global.GRID, column, row+range);
    if (unit > -1)
        return unit;
}


// west
if ((column-range) > -1) {
unit = containsEnemyUnit(global.GRID, column-range, row);
if (unit > -1)
    return unit;
}

// east
if ((column+range) < ds_grid_height(global.GRID)) {
unit = containsEnemyUnit(global.GRID, column+range, row);
if (unit > -1)
    return unit;
}


// diagonals
range--; // so a spear with range of 2, will have 1 diagonal
if (diagonals) {
    unit = containsEnemyUnit(global.GRID, column-range, row-range);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column-range, row+range);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column+range, row-range);
    if (unit > -1)
        return unit;
    
    unit = containsEnemyUnit(global.GRID, column+range, row+range);
    if (unit > -1)
        return unit;
}


// default if nothing found
return -1;

