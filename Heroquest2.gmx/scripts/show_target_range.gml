///show_target_range(weapon);
var weapon = argument0;

show_debug_message("Weapon id: " +string(weapon));

// setup
ds_grid_clear(attackGrid, global.gridDefaultValue); // reset the grid
mp_grid_clear_all(global.pathGrid);
ds_list_clear(selected.listOfTargets);

startx = (gridOffsetX + (column * tileWidth) + (tileWidth/2));
starty = (gridOffsetY + (row * tileHeight) + (tileHeight/2));


// two types of magic, direct target or area of effect (freecast)
// direct target means we must target a specific unit, freecast allows casting anywhere.

//if (!weapon.explicitTargetRequired) {
    sout("******* SEARCHING FOR TARGETS IN ATTACK RANGE ********");
    
    /* We need to set our targetColumn and targetRow to each square within
     * our attack range and check each one for a valid path. This should be
     * based on line of sight, and take into consideration any obstacles
     * in the way.
    */
    
    var range = weapon.range;
    var targetTeam = weapon.targetTeam;
    
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
    if (weapon.diagonal == true) {
        for (i=0; i <= totalColumns; i++) {
            targetColumn = (minCol + i);
            
            for (j=0; j <= totalRows; j++) {
                targetRow = (minRow + j);
                show_attack_range_core(i, j, range, targetTeam);
            }
        }
    }
    
    else {
        // columns +
        for (i=0; i <= totalColumns; i++) {
            targetRow    = selected.row;
            targetColumn = (minCol + i);
    
            show_attack_range_core(i, j, range, targetTeam);
        }
        
        // columns -
        for (i=0; i <= totalColumns; i++) {
            targetRow = selected.row;
            targetColumn = (minCol - i);
    
            show_attack_range_core(i, j, range, targetTeam);
        }
        
        
        // rows +
        for (i=0; i <= totalRows; i++) {
            targetColumn = selected.column;
            targetRow = (minRow + i);
            
            show_attack_range_core(i, j, range, targetTeam);
        }
        
        // rows -
        for (i=0; i <= totalRows; i++) {
            targetColumn = selected.column;
            targetRow = (minRow - i);
            
            show_attack_range_core(i, j, range, targetTeam);
        }
        
    }

    sout("******* FINISHED SEARCHING FOR TARGETS IN ATTACK RANGE ********");
//}
