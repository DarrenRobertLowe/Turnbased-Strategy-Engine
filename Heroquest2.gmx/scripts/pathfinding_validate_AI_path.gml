/// pathfinding_validate_AI_path(column, row)

var column = argument0;
var row = argument1;

if (validCell(column, row)) {
    var goal = ds_grid_get(global.NODE_GRID, column, row);
    var listOfNodesOnPath = astar_get_path(start, goal);
    
    if (ds_list_size(listOfNodesOnPath) > 0) {
        //var val = string(column) +":" +string(row);
        //ds_list_add(listOfCells, val);
        return true;
    }
}
