///extractRowFromListOfCells(list, index);
/* Extracts the column from the cell id.
 * Cells are stored as strings in the format of 
 *   "columnNumber:rowNumber" e.g. "11:2"
 */
debug = false; 
var list    = argument0;
var index   = argument1;

var str = ds_list_find_value(list, index);


if !(is_undefined(str)) {
    var pos = string_pos(":", str);
    
    if (pos > 0) { // if ":" is found
        var row = string_copy(str, pos+1, string_length(str));
        debug_message("extractRowFromListOfCells() says: row = "+string(row));
        return real(string_digits(row));
    }
    else return -1; // if ":" is NOT found
}
else return -1;
