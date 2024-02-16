///show_attack_range();
sout("******* SEARCHING FOR TARGETS IN ATTACK RANGE ********");
ds_grid_clear(attackGrid, global.gridDefaultValue); // reset the grid
mp_grid_clear_all(global.pathGrid);

ds_list_clear(selected.listOfTargets);

startx = (gridOffsetX + (column * tileWidth) + (tileWidth/2));
starty = (gridOffsetY + (row * tileHeight) + (tileHeight/2));


/* We need to set our targetColumn and targetRow to each square within
 * our attack range and check each one for a valid path. This should be
 * based on line of sight, and take into consideration any obstacles
 * in the way.
*/

var weapon = targetHero.weapon;
var range = weapon.range;


// set the min and max
var minCol = (column - range);
var minRow = (row - range);
var maxCol = (column + range);
var maxRow = (row + range);

var totalColumns = (maxCol - minCol);
var totalRows    = (maxRow - minRow);

var i = 0;
var j = 0;
var goalx = 0;
var goaly = 0;

// if diagonals are allowed (e.g. spear, etc)
if (targetHero.weapon.diagonal == true) {
    for (i=0; i <= totalColumns; i++) {
        targetColumn = (minCol + i);
        
        for (j=0; j <= totalRows; j++) {
            targetRow = (minRow + j);
            show_attack_range_core(i, j, weapon.range, weapon.targetTeam);
        }
    }
}

else {
    // columns +
    for (i=0; i <= totalColumns; i++) {
        targetRow = targetHero.row;
        targetColumn = (minCol + i);

        show_attack_range_core(i, j, weapon.range, weapon.targetTeam);
    }
    
    // columns -
    for (i=0; i <= totalColumns; i++) {
        targetRow = targetHero.row;
        targetColumn = (minCol - i);

        show_attack_range_core(i, j, weapon.range, weapon.targetTeam);
    }
    
    
    // rows +
    for (i=0; i <= totalRows; i++) {
        targetColumn = targetHero.column;
        targetRow = (minRow + i);
        
        show_attack_range_core(i, j, weapon.range, weapon.targetTeam);
    }
    
    // rows -
    for (i=0; i <= totalRows; i++) {
        targetColumn = targetHero.column;
        targetRow = (minRow - i);
        
        show_attack_range_core(i, j, weapon.range, weapon.targetTeam);
    }
    
}

sout("******* FINISHED SEARCHING FOR TARGETS IN ATTACK RANGE ********");
