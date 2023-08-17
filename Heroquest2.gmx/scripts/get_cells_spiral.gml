/// get_cells_spiral(column, row)
/* returns a list of all the cells in a spiral
 * starting from the left, then top, then right
 * then down at a distance of 1. Distance is
 * then increased and the spiral continues until
 * the maximum size of the grid has been checked,
 * thus every possible cell.
 * Note: The cells are encoded as strings; "colNum:rowNum"
 * @return list
*/
var finished = false;
var tList = ds_list_create();
var phase = 0;
var progress = 0;
var maxCol = gridWidth -1;
var maxRow = gridHeight -1;
var minCol = 0;
var minRow = 0;

while (finished == false) {
    if (phase == 0) {
        distance = 1;               // distance from source column
        phase++;
    }
    
    
    // PHASE 1
    if (phase == 1) {
        show_debug_message(" ");
        show_debug_message("**** PHASE 1 ****");
        show_debug_message("**** left side moving south to north ****");
        show_debug_message("distance is "+string(distance));
        
        // setup phase
        endRow  = (row - distance);
        iCol = (column - distance);     // this won't change
        iRow = ((row + distance -1) - progress);  // offset by 1, otherwise we'll cover the same tiles twice
        
        
        if !validColumn(iCol) {         // skip out of bounds
            phase++;
            progress = 0;
        } else {
            if (iRow != endRow-1) {
                show_debug_message("iCol: " +string(iCol) +  "   iRow:" + string(iRow));
                
                if (iCol <= maxCol) and (iRow <= maxRow) {  // if in-bounds
                    ds_list_add(tList, string(iCol) + ":"  + string(iRow));
                }
                
                progress++;
            }
            
            if (iRow == endRow) {
                progress = 0;
                phase++;
            }
        }
    }
    
    
    // PHASE 2
    if (phase == 2) {
        show_debug_message(" ");
        show_debug_message("**** PHASE 2 ****");
        show_debug_message("**** north side moving left to right ****");
        show_debug_message("distance is "+string(distance));
            
        // setup phase
        endCol  = (column + distance);
        iRow = (row - distance);            // this won't change
        iCol = ((column - distance +1) + progress); // offset by 1, otherwise we'll cover the same tiles twice
        
        if !validRow(iRow) {     // skip out of bounds
            phase++;
            progress = 0;
        } else {
            if (iCol != endCol+1) {
                show_debug_message("iCol: " +string(iCol) +  "   iRow:" + string(iRow));
                
                if (iCol <= maxCol) and (iRow <= maxRow) {  // if in-bounds
                    ds_list_add(tList, string(iCol) + ":"  + string(iRow));
                }
                
                progress++;
            }
            
            if (iCol == endCol) {
                progress = 0;
                phase++;
            }
        }
    }
    
    
    
    // PHASE 3
    if (phase == 3) {
        show_debug_message(" ");
        show_debug_message("**** PHASE 3 ****");
        show_debug_message("**** right side moving north to south ****");
        show_debug_message("distance is "+string(distance));
            
        // setup phase
        endRow  = (row + distance);
        iCol = (column + distance);         // this won't change
        iRow = ((row - distance +1) + progress); // offset by 1, otherwise we'll cover the same tiles twice
        
        
        if !validColumn(iCol) {     // skip out of bounds
            phase++;
            progress = 0;
        } else {
            if (iRow != endRow+1) {
                //show_debug_message("iCol: " +string(iCol) +  "   iRow:" + string(iRow));
                
                if (iCol <= maxCol) and (iRow <= maxRow) {  // if in-bounds
                    ds_list_add(tList, string(iCol) + ":"  + string(iRow));
                }
                
                progress++;
            }
            
            if (iRow == endRow) {
                progress = 0;
                phase++;
            }
        }
    }
    
    
    // PHASE 4
    if (phase == 4) {
        show_debug_message(" ");
        show_debug_message("**** PHASE 4 ****");
        show_debug_message("**** south side moving right to left ****");
        show_debug_message("distance is "+string(distance));
            
        // setup phase
        endCol  = (column - distance);
        iRow    = (row + distance);         // this won't change
        iCol    = ((column + distance -1) - progress); // offset by 1, otherwise we'll cover the same tiles twice
        
        
        if !validRow(iRow) {     // skip out of bounds
            phase++;
            progress = 0;
        } else {
            if (iCol != endCol-1) {
                show_debug_message("iCol: " +string(iCol) +  "   iRow:" + string(iRow));
                
                if (iCol >= minCol) {  // if in-bounds
                    ds_list_add(tList, string(iCol) + ":"  + string(iRow));
                }
                
                progress++;
            }
            
            if (iCol == endCol) {
                progress = 0;
                phase++;
            }
        }
    }
    
    
    if (phase == 5) {
        // increase the search distance
        var maxSize = max(gridWidth, gridHeight);
        
        if (distance < maxSize) {  // means we know for certain we've covered every block
            distance++;
            phase = 1;  // repeat
        } else {
            show_debug_message("FINISHED get_cells_spiral()");
            finished = true;
        }
    }
}

return tList;
