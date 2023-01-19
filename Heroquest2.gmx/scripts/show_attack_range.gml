///show_attack_range();

ds_grid_clear(attackGrid, global.gridDefaultValue); // reset the grid
mp_grid_clear_all(global.pathGrid);
//gridpath_set_collisions(global.pathGrid, OBSTACLE, selected.pathfindingIgnoreList); // add obstacles to grid


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
 * our attack range and check each one for a valid path. This should be
 * based on line of sight, and take into consideration any obstacles
 * in the way.
*/

// var unit = targetHero;
// var selected = selected.id;

sout("selected = " + string(selected));
/*
var weap = unit.weapon;
sout("weap = " +string(weap));
var range = weap.range;
*/

range = 2;  // var range = targetHero.weapon.range;

sout("column is " + string(column));
sout("row is "    + string(row));



// set the min and max
var minCol = (column - range);
var minRow = (row - range);
var maxCol = (column + range);
var maxRow = (row + range);

var totalColumns = (maxCol - minCol);
var totalRows    = (maxRow - minRow);


var i = 0;
var j = 0;
var goalx = 0;
var goaly = 0;



// if diagonals are allowed (e.g. spear, etc)
for (i=0; i <= totalColumns; i++) {
    targetColumn = (minCol + i);
    
    for (j=0; j <= totalRows; j++) {
        targetRow = (minRow + j);
        
        var goalx = (gridOffsetX + (targetColumn * tileWidth) + (tileWidth/2));
        var goaly = (gridOffsetY + (targetRow * tileHeight) + (tileHeight/2));
        
        
        // check if there's a valid path to the cell
        if mp_grid_path(
            global.pathGrid     // Grid on which to calculate path (an imaginary one that contains any obstacles). 
            ,myPath             // path must indicate an existing path that will be replaced by the computed path
            ,startx
            ,starty
            ,goalx
            ,goaly
            ,false              // this would make the attack area completely square if set to true
        ) // check that it's within our attack range
        {
            if (path_get_length(myPath) <= (range * cellSize)) {
            
                var targX = (gridOffsetX + (targetColumn * tileWidth));
                var targY = (gridOffsetY + (targetRow * tileHeight));
                
                panel = instance_create(targX, targY, AttackPanel);
                panel.parent = selected;
                panel.column = targetColumn;
                panel.row = targetRow;
                
                ds_grid_set(attackGrid, targetColumn, targetRow, AttackPanel);
                
                
                // is there a valid enemy on this cell?
                var entity = ds_grid_get(grid, targetColumn, targetRow);
                sout("Target cell " +string(targetColumn) +":" + string(targetRow) + " entity is: " + string(entity));
                
                if  (entity > -1)                           // there's something there
                and (object_is_ancestor(entity.object_index, ENTITY)){   // so we don't target walls and such
                    if (entity.team != selected.team) {
                        ds_list_add(selected.listOfTargets, entity);
                        sout("Added a unit: " +string(entity) + " to our list of targets!");
                    }
                } else {
                    sout("entity: " + string(entity) +" is not an ancestor of ENTITY.");
                }
            } else {
                mp_grid_add_cell(rangeGrid,i,j);
                sout("Target cell " +string(targetColumn) +":" + string(targetRow) + " is not within our reach.");
            }
        } else {
            mp_grid_add_cell(rangeGrid,i,j);
            sout("Target cell " +string(targetColumn) +":" + string(targetRow) + " is blocked by something.");
        }
    }
}
