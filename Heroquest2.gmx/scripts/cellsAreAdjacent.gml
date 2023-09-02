///cellsAreAdjacent(column1, row1, column2, row2)
/* checks if the given cells are next to eachother
 * @Returns bool
*/

var column1 = argument0;
var row1    = argument1;
var column2 = argument2;
var row2    = argument3;

if (column1 == column2-1)
or (column1 == column2+1) {
    if (row1 == row2) {
        return true;
    }
}

if (row1 == row2-1)
or (row1 == row2+1) {
    if (column1 == column2) {
        return true;
    }
}
