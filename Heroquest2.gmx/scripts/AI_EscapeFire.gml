///AI_EscapeFire

show_debug_message("Escaping fire!");

// add ourselves to pathfindingIgnoreList
ds_list_clear(pathfindingIgnoreList);
ds_list_add(pathfindingIgnoreList, id);

// create a grid of obstacles that aren't us
gridpath_add_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList);


//badTargetCells = ds_grid_create(gridWidth, gridHeight);      // cells we can't move to
ds_grid_clear(badTargetCells, 0);       // anything > 0 means we can't move there


with (OBSTACLE) {
    var t=other;
    if (ds_list_find_index(t.pathfindingIgnoreList, id) == -1) {
        ds_grid_set(t.badTargetCells, column, row, id);
    }
}


// add all FIRE and adjacent tiles to the badTargetCells
with (FIRE) {
    var t = other;
    badTargetCells = t.badTargetCells;
    ds_grid_set(badTargetCells, column, row, id);
    
    // predict fire
    if (hp > 1) { // fire only spreads if hp > 1
        // north
        if ( validCell(column, row+1) ){
            ds_grid_set(badTargetCells, column, row+1, id);
        }
        
        // south
        if ( validCell(column, row-1) ){
            ds_grid_set(badTargetCells, column, row-1, id);
        }
        
        // east
        if ( validCell(column+1, row) ){
            ds_grid_set(badTargetCells, column+1, row, id);
        }
        
        // west
        if ( validCell(column-1, row) ){
            ds_grid_set(badTargetCells, column-1, row, id);
        }
    }
}



// now we'll check outwards from our position each cell.
// if the cell is not a badTargetCell then we check for a path there.
// if a path exists to there we will move there and exit.
cells = get_cells_spiral();
var size = ds_list_size(cells);

// decode the next list item into col and row
for (var i=0; i<size; i++) {
    var myStr = ds_list_find_value(cells, i);

    var pos  = string_pos(":", myStr);
    var iCol = real(string_copy(myStr, 1, pos-1));
    var iRow = real(string_copy(myStr, pos+1, string_length(myStr)));

    if (ds_grid_get(badTargetCells, iCol, iRow) == 0) {
        movementPoints  = move;
        startColumn     = column;
        startRow        = row;
        show_debug_message("Cell " + string(iCol) + ":" +string(iRow) + " looks safe! Moving there...");
        goto_Square(iCol, iRow);
        path_end();                                 // stop the path immediately
        exit;
    }
}


