/// reconstruct_path(fullPath, cameFromMap, current);
/*  
 *  @Returns a ds_list of each node in the path (recursively)
 */
 
 
var fullPath    = argument0;
var cameFromMap = argument1;
var current     = argument2;

ds_list_add(fullPath, current);
next = ds_map_find_value(cameFromMap, current);

if (next != noone) {
    current = next;
    return reconstruct_path(fullPath, cameFromMap, current);
} else {
    // reverse the order
    var tempList = ds_list_create();
    ds_list_copy(tempList, fullPath);
    ds_list_clear(fullPath);
    
    for(var i=ds_list_size(tempList)-1; i>=0; i--) {
        ds_list_add(fullPath, ds_list_find_value(tempList, i));
    }
    
    ds_list_destroy(tempList);
    
    // return the completed path
    return fullPath;
}
