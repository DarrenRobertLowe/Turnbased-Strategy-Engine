///AI_tryAdvance()
show_debug_message("Advancing");
//debug_message("We haven't yet moved... considering moving...");
                            
// get a list of targets, sorted by the closest one
listOfCells = sortTargetsAdjacentCellsByClosest(listOfTargets, true, weapon.diagonal);


if (ds_list_size(listOfCells) > 0) {
    // if there is at least 1 target...
    var index       = ds_list_find_value(listOfCells, 0);
    targetColumn    = extractColumnFromListOfCells(listOfCells, index);
    targetRow       = extractRowFromListOfCells(listOfCells, index);
    
    // move towards the closest
    if (validCell(targetColumn, targetRow)) {
        movementPoints  = move;
        startColumn     = column;
        startRow        = row;
        goto_square(targetColumn, targetRow);
        //path_end();                                 // stop the path immediately
    }
} else {
    // if there are no targets then consider us as having moved
    movedThisTurn = true;
}
