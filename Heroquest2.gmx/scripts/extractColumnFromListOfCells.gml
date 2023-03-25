///extractColumnFromListOfCells(list, index);
/* Extracts the cell column from the value stored at the
 * given position (index), in the listOfCells (list)
 * Cells are stored as strings in the format of 
 *   "columnNumber:rowNumber" e.g. "11:2"
 */
var list    = argument0;
var index   = argument1;
debug   = false;

var str = ds_list_find_value(list, index);

if !(is_undefined(str)) {
    var pos = string_pos(":", str);
    
    if (pos > 0) { // if ":" is found
        var col = string_copy(str, 1, pos-1);
        return real(string_digits(col));
    }
    else return -1; // if ":" is NOT found
}
else return -1;
