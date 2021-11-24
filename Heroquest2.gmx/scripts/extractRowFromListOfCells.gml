///extractRowFromListOfCells(list, index);
/* Extracts the column from the cell id.
 * Cells are stored as strings in the format of 
 *   "columnNumber:rowNumber" e.g. "11:2"
 */
var list    = argument0;
var index   = argument1;

if (ds_list_size(list) > index) {
    var str = ds_list_find_value(list, index);

    var pos = string_pos(":", str);
    
    if (pos > 0) {
        var row = string_copy(str, pos+1, string_length(str));
        return real(string_digits(row));
    }
    else return false;
}
else return false;
