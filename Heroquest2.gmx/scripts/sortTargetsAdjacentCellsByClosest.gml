/// sortTargetsAdjacentCellsByClosest(listOfTargets, remove unreachable?, include diagonals);
/* adds potential targets to the pathfindingIgnoreList and
 * checks for routes to their exact cell, taking objects that
 * block the path into consideration.
 */


var debug = false;

if (debug) then debug_message("running sortTargetsAdjacentCellsByClosest()");

var listOfTargets       = argument0;
var removeUnreachable   = argument1;
var includeDiagonals    = argument2;
var size = ds_list_size(listOfTargets);
var unit = -1;
var value = 0;
var defaultBest = 1000000000;
var best = defaultBest;
var targetX = -1;
var targetY = -1;
var pathLength = -1;
var pathfindingOffset = global.pathfindingOffset;

var start = ds_grid_get(global.NODE_GRID, column, row);


// add our potential targets to the pathfindingIgnoreList so
// we can check for routes to their exact cell
for (var i=0; i<size; i++) {
    var value = ds_list_find_value(listOfTargets, i);
    ds_list_add(pathfindingIgnoreList, value);
}


// register remaining obstacles on the grid
mp_grid_clear_all(global.pathGrid);
global.pathGrid = gridpath_add_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList, true);


// TO DO: add heights we can't reach as obstacles too


// iterate through our potential targets and remove the unreachable ones
if (removeUnreachable) {
    for(var i=0; i<ds_list_size(listOfTargets); i++) {
        unit = ds_list_find_value(listOfTargets, i);
        
        // remove any targets that aren't reachable
        var goal = ds_grid_get(global.NODE_GRID, unit.column, unit.row);
        
        if ( ds_list_size(astar_get_path(start, goal)) == 0) {
            ds_list_delete(listOfTargets, i);
            i = -1; // go back to start of listOfTargets 
        }
        
        
        
        //targetX = getXFromColumn(unit.column);
        //targetY = getYFromRow(unit.row);
        
        /*
        if !(mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false)) {
            ds_list_delete(listOfTargets, i);
            i = -1; // go back to start of listOfTargets
        }
        */
    }
}



// Recalc the pathgrid to include all targets as obstacles now as
// we'll be looking at paths to the adjacent squares instead.
// This is incase we calculate an invalid path going through an  
// enemy somehow. For example, entities can block paths to other
// entities.
reset_pathfindingIgnoreList(pathfindingIgnoreList);
gridpath_add_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList, true);




// now take the list of remaining targets and add all their adjacent 
// cells, checking each one for a valid path. Each valid path gets
// added to a list called listOfCells.
for(var i=0; i<ds_list_size(listOfTargets); i++)
{
    unit = ds_list_find_value(listOfTargets, i);
    
    // right of target
    var goal = ds_grid_get(global.NODE_GRID, unit.column + 1, unit.row);
    //targetX = getXFromColumn(unit.column + 1);
    //targetY = getYFromRow(unit.row);
    
    //if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    if (ds_list_size( astar_get_path(start, goal) ) > 0) {
        var val = string(unit.column+1) +":" +string(unit.row);
        ds_list_add(listOfCells, val);
    }
    
    // left of target
    var goal = ds_grid_get(global.NODE_GRID, unit.column -1, unit.row);
    //targetX = getXFromColumn(unit.column - 1);
    //targetY = getYFromRow(unit.row);
    
    
    //if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    if (ds_list_size( astar_get_path(start, goal) ) > 0) {
        var val = string(unit.column-1) +":" +string(unit.row);
        ds_list_add(listOfCells, val);
    }
    
    // south of target
    var goal = ds_grid_get(global.NODE_GRID, unit.column, unit.row +1);
    //targetX = getXFromColumn(unit.column);
    //targetY = getYFromRow(unit.row+1);
    
    //if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    if (ds_list_size( astar_get_path(start, goal) ) > 0) {
        var val = string(unit.column) +":" +string(unit.row+1);
        ds_list_add(listOfCells, val);
    }
    
    // north of target
    var goal = ds_grid_get(global.NODE_GRID, unit.column, unit.row -1);
    //targetX = getXFromColumn(unit.column);
    //targetY = getYFromRow(unit.row-1);
    
    //if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    if (ds_list_size( astar_get_path(start, goal) ) > 0) {
        var val = string(unit.column) +":" +string(unit.row-1);
        ds_list_add(listOfCells, val);
    }
}




// iterate through the list of cells to find the closest
// NOTE: THIS FINDS THE NEAREST/FASTEST PATH, BUT would be better refactored
//   so that astar_get_path() creates a map of the cost of each path, then we
//   just look up the shortest one, rather than recalculating each path every
//   time.

/*
var cell = -1;
for(var i=0; i<ds_list_size(listOfCells); i++)
{
    if (debug) then debug_message("i = "+string(i));
    cell = ds_list_find_value(listOfCells, i);
    
    
    // compute the path
    var targetCol = extractColumnFromListOfCells(listOfCells, i);
    var targetRow = extractRowFromListOfCells(listOfCells, i);
    
    var goal = ds_grid_get(global.NODE_GRID, targetCol, targetRow);
    
    var myPath = astar_get_path(start, goal);
    //mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false);
    
    // get the length and compare against the other paths
    pathLength = path_get_length(myPath);
    
    if (pathLength > 0)
    {
        if (pathLength < best)
        or (best == defaultBest)
        {
            if (debug) then debug_message("phase 5: best is "+string(best));
            if (debug) then debug_message("list size is "+string(ds_list_size(listOfCells)));
            
            ds_list_delete(listOfCells, i);             // remove entry from position
            ds_list_insert(listOfCells, 0, cell);       // add it to the top of the listOfCells
            best = pathLength;
            i = -1;                                     // repeat from start of listOfCells
        }
    }
}


/// debug
for (var i=0; i<ds_list_size(listOfCells); i++)
{
    var val = ds_list_find_value(listOfCells, i);
    if (debug) then debug_message("listOfCells index "+string(i)+" = " +string(val));
}

*/

//var myPath = ds_priority_find_min(pathLengthQueue);

return pathLengthQueue;//listOfCells;
