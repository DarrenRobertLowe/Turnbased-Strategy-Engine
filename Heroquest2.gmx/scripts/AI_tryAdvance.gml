///AI_tryAdvance()
show_debug_message("Advancing");

sortTargetsAdjacentCellsByClosest_NEW(listOfTargets, true, weapon.diagonal); // auto fills pathLengthQueue

show_debug_message("number of potential paths to enemies found: "+string(ds_list_size(fullPathList)));

var shortestPath = ds_priority_find_min(pathLengthQueue);

// shortestPath refers to a fullPath to a node adjacent to our given target cell.
// fullPath is a list of nodes.
// each node is a map containing a column and a row // and more, see create_nodegrid()
// so to get the targetColumn and targetRow we need to go to the end of the fullPath list.


if ( ds_list_size(shortestPath) > 0 ) {    // if there is at least 1 target...
    //targetColumn    = //extractColumnFromListOfCells(listOfCells, index);
    //targetRow       = //extractRowFromListOfCells(listOfCells, index);
    
    var size = ds_list_size(shortestPath);
    for(var i=0; i<size; i++){
        var node = ds_list_find_value(shortestPath, i);
        show_debug_message("shortestPath[" 
            +string(i) 
            + "] is " 
            +string(ds_map_find_value(node, "column")) 
            + ":" 
            +string(ds_map_find_value(node, "row"))
        );
    }
    
    var lastNode    = ds_list_find_value(shortestPath, ds_list_size(shortestPath)-1);
    show_debug_message("lastNode index is "+ string(lastNode));
    targetColumn    = ds_map_find_value(lastNode, "column");
    targetRow       = ds_map_find_value(lastNode, "row");
    
    show_debug_message("lastNode: "+ string(targetColumn) + ":"+ string(targetRow));
    
    show_message("AI decided that " +string(targetColumn) + " : " + string(targetRow) + "  was the best cell to move to attack " +string(target));
    //var endNode     = ds_grid_get(global.NODE_GRID, targetColumn, targetRow);
    
    
    // move towards the cell
    movementPoints  = move;
    startColumn     = column;
    startRow        = row;
    goto_square(targetColumn, targetRow);

} else {
    // if there are no targets then consider us as having moved
    show_debug_message("*sigh* AI_tryAdvance says shortestPath was empty...");
    movedThisTurn = true;
}




/*
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
    }
} else {
    // if there are no targets then consider us as having moved
    movedThisTurn = true;
}

*/

