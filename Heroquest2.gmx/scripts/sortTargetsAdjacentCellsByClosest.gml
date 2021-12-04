/// sortTargetsAdjacentCellsByClosest(listOfTargets, remove unreachable?, include diagonals);

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
show_debug_message("running sortTargetsAdjacentCellsByClosest()");


// add our potential targets to the pathfindingIgnoreList so
// we can check for routes to their exact position quickly
// and easily.
for (var i=0; i<size; i++)
{
    show_debug_message("phase 1");
    var value = ds_list_find_value(listOfTargets, i);
    ds_list_add(pathfindingIgnoreList, value);
}

// register remaining obstacles on the grid
gridpath_set_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList);





// iterate through our potential targets and remove the unreachable ones
if (removeUnreachable)
{
    show_debug_message("phase 2");
    
    for(var i=0; i<ds_list_size(listOfTargets); i++)
    {
        unit = ds_list_find_value(listOfTargets, i);
        
        targetX = getXFromColumn(unit.column);
        targetY = getYFromRow(unit.row);
        
        // remove any targets that aren't reachable
        if !(mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
        {
            ds_list_delete(listOfTargets, i);
            i =- 1; // go back to start of listOfTargets
        }
    }
}



// Reset the pathgrid to include all targets as obstacles now as
// we'll be looking at paths to the adjacent squares instead.
// This is incase we calculate an invalid path going through an  
// enemy somehow. For example, entities can block paths to other
// entities.
reset_pathfindingIgnoreList(pathfindingIgnoreList);
gridpath_set_collisions(global.pathGrid, OBSTACLE, pathfindingIgnoreList);



// now take the list of remaining targets and add all their adjacent 
// cells, checking each one for a valid path. Each valid path gets
// added to a list called listOfCells.
for(var i=0; i<ds_list_size(listOfTargets); i++)
{
    show_debug_message("phase 3");
    unit = ds_list_find_value(listOfTargets, i);
    
    
    targetX = getXFromColumn(unit.column + 1);
    targetY = getYFromRow(unit.row);
    
    if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    {
        var val = string(unit.column+1) +":" +string(unit.row);
        ds_list_add(listOfCells, val);
    }
    
    
    targetX = getXFromColumn(unit.column - 1);
    targetY = getYFromRow(unit.row);
    
    if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    {
        var val = string(unit.column-1) +":" +string(unit.row);
        ds_list_add(listOfCells, val);
    }
    
    
    targetX = getXFromColumn(unit.column);
    targetY = getYFromRow(unit.row+1);
    
    if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    {
        var val = string(unit.column) +":" +string(unit.row+1);
        ds_list_add(listOfCells, val);
    }
    
    
    
    targetX = getXFromColumn(unit.column);
    targetY = getYFromRow(unit.row-1);
    
    // if getPath(column, row, unit.column, unit.row-1, myPath) {
    if (mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false))
    {
        var val = string(unit.column) +":" +string(unit.row-1);
        ds_list_add(listOfCells, val);
    }
}



// iterate through the list of cells to find the closest
var cell = -1;
for(var i=0; i<ds_list_size(listOfCells); i++)
{
    //show_debug_message("phase 4");
    show_debug_message("i = "+string(i));
    cell = ds_list_find_value(listOfCells, i);
    
    
    // compute the path
    var targetCol = extractColumnFromListOfCells(listOfCells, i);
    var targetRow = extractRowFromListOfCells(listOfCells, i);
    mp_grid_path(global.pathGrid, myPath, x+pathfindingOffset, y+pathfindingOffset, targetX +pathfindingOffset, targetY +pathfindingOffset, false);
    
    // get the length and compare against the other paths
    pathLength  = path_get_length(myPath);
    
    if (pathLength > 0)
    {
        if (pathLength < best)
        or (best == defaultBest)
        {
            show_debug_message("phase 5: best is "+string(best));
            show_debug_message("list size is "+string(ds_list_size(listOfCells)));
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
    show_debug_message("listOfCells index "+string(i)+" = " +string(val));
}



return listOfCells;
