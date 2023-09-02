/// moveInstant();
/* Instantly repositions an object 1 cell in
 *  a given direction.
 * Note: This should really only be used by
 * the cursor
 * 
 * Teleports to the new cell
 * Resets the move var
*/


if (move = DIRECTION.north) {
    if ( (row-1) >= 0) {
        teleportToCell(id, column, row-1);
    }
}

if (move = DIRECTION.south) {
    if ((row+1) < gridHeight) {
        teleportToCell(id, column, row+1);
    }
}

if (move = DIRECTION.east) {
    if ((column+1) < gridWidth) {
        teleportToCell(id, column+1, row);
    }
}

if (move = DIRECTION.west) {
    if ((column-1) >= 0) {
        teleportToCell(id, column-1, row);
    }
}



move = DIRECTION.none;

