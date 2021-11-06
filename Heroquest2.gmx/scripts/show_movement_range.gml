///show_movement_range();

ds_grid_clear(movementGrid,-1); // allows for proper movement calculation over tall terrain.

tempGrid = mp_grid_create(
    gridOffsetX,
    gridOffsetY,
    gridWidth,
    gridHeight,
    tileWidth,
    tileHeight
    );


// CHECKS THE GRID FOR OBJECTS AND MARKS THEIR COORDS AS PROHIBITED
mp_grid_add_instances(tempGrid, OBSTACLE, 0);   // Add all OBSTACLE objects
mp_grid_clear_cell(tempGrid, column, row);      // Except our own cell, which is free.

/* // uncomment for Disgaea style platform jumping
// CHECKS EACH PLATFORM OBJECT TO SEE IF IT CAN BE REACHED.
with PLATFORM{
    if height > (other.selected.height+other.selected.Jump){
        mp_grid_add_cell(other.tempGrid,column,row);
    }
}
*/


// IN THIS CASE, STARTX and STARTY WILL BE USED AS THE GOAL
startx = (gridOffsetX + (column * tileWidth) + (tileWidth/2));
starty = (gridOffsetY + (row * tileHeight) + (tileHeight/2));

/* We need to set our targetColumn and targetRow to each square within
 * our movement range, whilst also checking each square for a path. The
 * path will take the tiles walked into account as well, so moving around
 * objects reduces the range in a given direction.
*/
var i,j;
var fullRange = ((Movement*2)+1);
//var lastColumn = (global.gridWidth-1);
//var lastRow = (global.gridHeight-1);


for (i = fullRange; i>0; i--) {
    targetColumn = (column - Movement) + (i-1);
    
    //if (targetColumn > lastColumn) then continue;
    
    
    for (j = fullRange; j>0; j--) {
        targetRow = ((row - Movement) + (j-1));
        
        var goalx = (gridOffsetX + (targetColumn * tileWidth) + (tileWidth/2)) ;
        var goaly = (gridOffsetY + (targetRow * tileHeight) + (tileHeight/2));
        
        
        //if (targetRow > lastRow) then continue;
        
        
        if mp_grid_path(
            tempGrid        // Grid on which to calculate path (an imaginary one that we're making temporarily). 
            ,myPath         // path must indicate an existing path that will be replaced by the computed path
            ,goalx
            ,goaly
            ,startx
            ,starty
            ,0              // Allow diagonals?
        )
        and (path_get_length(myPath)<((Movement+1) * (tileWidth))) {
            
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
            
            ds_grid_set(movementGrid, targetRow, targetColumn, obj_MovementPanel);
        }
        else
        {
            mp_grid_add_cell(rangeGrid,i,j);
        }
    }
}
