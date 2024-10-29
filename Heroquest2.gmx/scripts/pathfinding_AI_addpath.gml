/// pathfinding_AI_path(startColumn, startRow, targetColumn, targetRow)

var startCol  = argument0;
var startRow  = argument1;
var targetCol = argument2;
var targetRow = argument3;


if ( validCell(targetCol, targetRow) 
and validCell(startCol, startRow)) {
    start = ds_grid_get(global.NODE_GRID, startCol, startRow);
    show_debug_message("pathfinding_AI_addpath(): start is ["+string(startCol)+","+string(startRow)+"] is "+string(start));
    goal  = ds_grid_get(global.NODE_GRID, targetCol, targetRow);
    show_debug_message("pathfinding_AI_addpath() : goal is ["+string(targetCol)+","+string(targetRow)+"] is "+string(goal));
    
    if ( (start > 0) and (goal > 0) ) {
        gScore = 0;
        var newPath = astar_get_path(start, goal);
        
        if (ds_list_size(newPath) > 0) {
            ds_priority_add(pathLengthQueue, newPath, gScore);
            show_debug_message("added a new path to [" +string(targetCol) +":" + string(targetRow) +"] with gScore " + string(gScore));
        }
    } else {
        show_debug_message("pathfinding_AI_addpath() no path from : " +string(startCol) + " : " +string(startRow) +"   to   " +string(targetCol) + " : " +string(targetRow) );
    }
} else {
    show_debug_message("pathfinding_AI_addpath() failed to validate path from : " +string(startCol) + " : " +string(startRow) +"   to   " +string(targetCol) + " : " +string(targetRow) );
    return -1;
}
