///getValidTargets(range, diagonal?);
/** Returns a list of valid targets that
 * could be attacked (if not blocked somehow)
 */
 
var unit;
var range    = argument0;
var diagonal = argument1;
var listOfTargets = argument2;
ds_list_clear(listOfTargets);


var height = ds_grid_height(global.GRID);
var width  = ds_grid_width(global.GRID);




for(var i=range; i>0; i--) { // check all tiles within range
    // north
    if ((row-range) > -1) {
        unit = containsEnemyUnit(global.GRID, column, row-range)
        if (unit > -1)
            //return unit;
            ds_list_add(listOfTargets, unit);
    }
    
    // south
    if ((row+range) < height) {
        unit = containsEnemyUnit(global.GRID, column, row+range);
        if (unit > -1)
            //return unit;
            ds_list_add(listOfTargets, unit);
    }
    
    // west
    if ((column-range) > -1) {
        unit = containsEnemyUnit(global.GRID, column-range, row);
        if (unit > -1)
            //return unit;
            ds_list_add(listOfTargets, unit);
    }
    
    // east
    if ((column+range) < width) {
        unit = containsEnemyUnit(global.GRID, column+range, row);
        if (unit > -1)
            //return unit;
            ds_list_add(listOfTargets, unit);
    }
    
    
    // diagonals
    range--; // so a spear with range of 2, will have 1 diagonal
    if (diagonal) {
    
        // west north
        if ( (column-range) > -1 and (row-range) > -1 ) {
            unit = containsEnemyUnit(global.GRID, column-range, row-range);
            if (unit > -1)
                //return unit;
                ds_list_add(listOfTargets, unit);
        }
        
        // west south
        if ( (column-range) > -1 and (row+range) < height ) {
            unit = containsEnemyUnit(global.GRID, column-range, row+range);
            if (unit > -1)
               //return unit;
               ds_list_add(listOfTargets, unit);
        }
        
        // east north
        if ( (column+range) < width and (row-range) > -1 ) {
            unit = containsEnemyUnit(global.GRID, column+range, row-range);
            if (unit > -1)
                //return unit;
                ds_list_add(listOfTargets, unit);
        }
        
        // east south
        if ( (column+range) < width and (row+range) < height ) {
            unit = containsEnemyUnit(global.GRID, column+range, row+range);
            if (unit > -1)
                //return unit;
                ds_list_add(listOfTargets, unit);
        }
    }
}

// return the list of targets
return listOfTargets;

