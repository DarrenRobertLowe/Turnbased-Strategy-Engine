///getValidTargets(range, diagonal?);
/** Returns a list of valid targets that
 * could be attacked (if not blocked somehow)
 */
 
var unit;
var range           = argument0;

/****/
var diagonal        = argument1;
var diagonal        = false;
/****/

var listOfTargets   = argument2;
ds_list_clear(listOfTargets);




var height = ds_grid_height(global.GRID);
var width  = ds_grid_width(global.GRID);

var targCell = -1;


for(var i=range; i>0; i--) { // check all tiles within range
    // north
    sout("Checking north");
    targCell = (row - range);
    if (targCell > -1) {
        unit = containsEnemyUnit(global.GRID, column, targCell)
        if (unit > -1) {
            ds_list_add(listOfTargets, unit);
            sout("target " + string(unit) + " is in range of our attack!");
        }
    }
    
    // south
    sout("Checking south");
    targCell = (row+range);
    if (targCell < height) {
        unit = containsEnemyUnit(global.GRID, column, targCell);
        if (unit > -1)  {
            ds_list_add(listOfTargets, unit);
            sout("target " + string(unit) + " is in range of our attack!");
        }
    }
    
    // west
    sout("Checking west");
    targCell = (column-range);
    if (targCell > -1) {
        unit = containsEnemyUnit(global.GRID, targCell, row);
        if (unit > -1) {
            ds_list_add(listOfTargets, unit);
            sout("target " + string(unit) + " is in range of our attack!");
        }
    }
    
    // east
    sout("Checking east");
    targCell = (column+range);
    if (targCell < width) {
        unit = containsEnemyUnit(global.GRID, targCell, row);
        if (unit > -1) {
            ds_list_add(listOfTargets, unit);
            sout("target " + string(unit) + " is in range of our attack!");
        }
    }
    
    
    // diagonals
    range--; // so a spear with range of 2, will have 1 diagonal
    if (diagonal) {
    
        // west north
        if ( (column-range) > -1 and (row-range) > -1 ) {
            unit = containsEnemyUnit(global.GRID, column-range, row-range);
            if (unit > -1) {
                ds_list_add(listOfTargets, unit);
                sout("target " + string(unit) + " is in range of our attack!");
            }
        }
        
        // west south
        if ( (column-range) > -1 and (row+range) < height ) {
            unit = containsEnemyUnit(global.GRID, column-range, row+range);
            if (unit > -1) {
                ds_list_add(listOfTargets, unit);
                sout("target " + string(unit) + " is in range of our attack!");
            }
        }
        
        // east north
        if ( (column+range) < width and (row-range) > -1 ) {
            unit = containsEnemyUnit(global.GRID, column+range, row-range);
            if (unit > -1) {
                ds_list_add(listOfTargets, unit);
                sout("target " + string(unit) + " is in range of our attack!");
            }
        }
        
        // east south
        if ( (column+range) < width and (row+range) < height ) {
            unit = containsEnemyUnit(global.GRID, column+range, row+range);
            if (unit > -1) {
                ds_list_add(listOfTargets, unit);
                sout("target " + string(unit) + " is in range of our attack!");
            }
        }
    }
}

// return the list of targets
return listOfTargets;

