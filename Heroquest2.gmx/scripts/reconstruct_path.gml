/// reconstruct_path(fullPath, cameFromMap, gScores, current, gScore);
/*  
 *  @Returns a ds_list of each node in the path (recursively)
 */
 
 
var fullPath    = argument0;
var cameFromMap = argument1;
var gScores     = argument2;
var current     = argument3;
 gScore      = argument4; // holds the length of the path



ds_list_add(fullPath, current);
next = ds_map_find_value(cameFromMap, current);

if (next != noone) {
    gScore += ds_map_find_value(gScores, current);  // add to the path length
    current = next;
    return reconstruct_path(fullPath, cameFromMap, gScores, current, gScore);
} else {
    gScore += ds_map_find_value(gScores, current);  // add to the path length
    
    // reverse the order
    var tempList = ds_list_create();
    ds_list_copy(tempList, fullPath);
    ds_list_clear(fullPath);
    
    for(var i=ds_list_size(tempList)-1; i>=0; i--) {
        ds_list_add(fullPath, ds_list_find_value(tempList, i));
    }
    
    ds_list_destroy(tempList);
    
    
    // RETURN
    // we need to return the length of each path too for AI
    ds_priority_add(pathLengthQueue, fullPath, gScore);
    
    // return the completed path
    return fullPath;
}
