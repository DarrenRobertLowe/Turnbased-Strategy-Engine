///show_movement_range();

ds_grid_clear(movementGrid,-1); // allows for proper move calculation over tall terrain.

gridpath_set_collisions(global.pathGrid, OBSTACLE, selected.pathfindingIgnoreList);


// CHECKS THE GRID FOR OBJECTS AND MARKS THEIR COORDS AS PROHIBITED
//mp_grid_add_instances(global.pathGrid, OBSTACLE, false);   // Add all OBSTACLE objects
//mp_grid_clear_cell(global.pathGrid, column, row);      // Except our own cell, which is free.

/* // uncomment for Disgaea style platform jumping
// CHECKS EACH PLATFORM OBJECT TO SEE IF IT CAN BE REACHED.
with PLATFORM{
    if height > (other.selected.height+other.selected.Jump){
        mp_grid_add_cell(other.global.pathGrid,column,row);
    }
}
*/


startx = (gridOffsetX + (column * tileWidth) + (tileWidth/2));
starty = (gridOffsetY + (row * tileHeight) + (tileHeight/2));



/* We need to set our targetColumn and targetRow to each square within
 * our move range and check each one for a valid path. The path will
 * take the tiles walked into account as well, so moving around
 * objects reduces the range in a given direction.
*/

// set the min and max
var minCol = (column - move);
var minRow = (row - move);
var maxCol = (column + move);
var maxRow = (row + move);

var totalColumns = (maxCol - minCol);
var totalRows = (maxRow - minRow);


var i = 0;
var j = 0;
var goalx = 0;
var goaly = 0;

 
for (i=0; i <= totalColumns; i++) {
    targetColumn = (minCol + i);
    
    for (j=0; j <= totalRows; j++) {
        targetRow = (minRow + j);
        var goalx = (gridOffsetX + (targetColumn * tileWidth) + (tileWidth/2)) ;
        var goaly = (gridOffsetY + (targetRow * tileHeight) + (tileHeight/2));
        
        
        //if (targetRow > lastRow) then continue;
        
        // check if there's a valid path to the cell
        if mp_grid_path(
            global.pathGrid        // Grid on which to calculate path (an imaginary one that we're making temporarily). 
            ,myPath         // path must indicate an existing path that will be replaced by the computed path
            ,startx
            ,starty
            ,goalx
            ,goaly
            ,0              // Allow diagonals?
        ) // check that it's within our movement range
        and (path_get_length(myPath) <= (move * cellSize)) {
            
            var targX = (gridOffsetX + (targetColumn * tileWidth));
            var targY = (gridOffsetY + (targetRow * tileHeight));
            
            panel = instance_create(targX, targY, obj_MovementPanel);
            panel.parent = selected.id;
            panel.column = targetColumn;
            panel.row = targetRow;
            
                /* // uncomment for z axis checking 
                if (selected.z > 0)
                    then panel.unitHeight = (selected.z/global.PIXELS_PER_HEIGHT);
                else panel.unitHeight = 0;*/
            
            ds_grid_set(movementGrid, targetColumn, targetRow, obj_MovementPanel);
        }
        else
        {
            mp_grid_add_cell(rangeGrid,i,j);
        }
    }
}
