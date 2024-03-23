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
    // reverse the list into an array
    var newlist = ds_list_create();
    
    for(var i=ds_list_size(fullPath)-1; i>-1; i--) {
        var val = ds_list_find_value(fullPath, i);
        //ds_list_add(newlist, val); // lists are not garbage collected
        returnArray[i] = ds_list_find_value(fullpath, i);
    }
    
    return returnArray;
}
 
 
 
/*
var fullPath    = argument0;
var cameFromMap = argument1;
var current     = argument2;

ds_list_add(fullPath, current);
next = ds_map_find_value(cameFromMap, current);

if (next != noone) {
    current = next;
    return reconstruct_path(fullPath, cameFromMap, current);
} else {
    // reverse the list
    var newlist = ds_list_create();
    
    for(var i=ds_list_size(fullPath)-1; i>-1; i--) {
        var val = ds_list_find_value(fullPath, i);
        ds_list_add(newlist, val);
    }
    
    // return final list of the nodes
    return newlist;
}

