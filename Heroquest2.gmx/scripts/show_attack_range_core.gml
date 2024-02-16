///show_attack_range_core(i, j, range, targetTeam);
var i           = argument0;
var j           = argument1;
var range       = argument2;
var targetTeam  = argument3;

// ADD OBSTACLES TO PATHFINDING
mp_grid_add_instances(global.pathGrid, OBSTACLE, false);
// ...EXCEPT POTENTIAL TARGETS
with (ENTITY) {
    mp_grid_clear_cell(global.pathGrid, column, row);
}


// check if there's a valid path to the cell
mp_grid_clear_cell(global.pathGrid, selected.column, selected.row);
var goalx = (gridOffsetX + (targetColumn * tileWidth) + (tileWidth/2));
var goaly = (gridOffsetY + (targetRow * tileHeight) + (tileHeight/2));
if mp_grid_path(
    global.pathGrid     // Grid on which to calculate path (an imaginary one that contains any obstacles). 
    ,myPath             // path must indicate an existing path that will be replaced by the computed path
    ,startx
    ,starty
    ,goalx
    ,goaly
    ,false              // this would make the attack area completely square if set to true
) {
    if (path_get_length(myPath) <= (range * cellSize)) {    // check that it's within our attack range
    
        var targX = (gridOffsetX + (targetColumn * tileWidth));
        var targY = (gridOffsetY + (targetRow * tileHeight));
        
        panel = instance_create(targX, targY, AttackPanel);
        panel.parent = selected;
        panel.column = targetColumn;
        panel.row = targetRow;
        
        ds_grid_set(attackGrid, targetColumn, targetRow, AttackPanel);
        
        
        // is there a valid enemy on this cell?
        var target = ds_grid_get(grid, targetColumn, targetRow);
        if (target > -1) then sout("Target cell " +string(targetColumn) +":" + string(targetRow) + " target is: " + string(target));
        
        
        
        // ADD TARGET TO listOfTargets
        if  (target > -1)                                           // there's something there
        and (object_is_ancestor(target.object_index, ENTITY)) {     // don't target walls and such
            var addTarget = false;
            show_debug_message("Trying to add target, checking if valid team");
            switch (targetTeam) {
                case "ally":
                    show_debug_message("Checking for an ally...");
                    if (target.team == targetTeam) {
                        addTarget = true;
                        show_debug_message("Target is an ally, adding target!");
                    }
                    break;
                
                case "enemy":
                    show_debug_message("Checking for an enemy...");
                    if (target.team == targetTeam) {
                        addTarget = true;
                        show_debug_message("Target is an enemy, adding target!");
                    }
                    break;
                
                case "any":
                    show_debug_message("Checking for anyone...");
                    show_debug_message("Target is any, adding target!");
                    addTarget = true;
                    break;
            }
            
            if (addTarget == true) {
                ds_list_add(selected.listOfTargets, target);
                sout("Added a unit: " +string(target) + " to our list of targets!");
            }
        }
        
        // Default selected target to the first index
        if (ds_list_size(selected.listOfTargets) > 0) {
            attackTarget = ds_list_find_value(selected.listOfTargets, 0);//selected.targetIndex);
            show_debug_message("attackTarget: "+ string(attackTarget));
            CURSOR.column = attackTarget.column;
            CURSOR.row = attackTarget.row;
        }
        
    } else {
        mp_grid_add_cell(rangeGrid,i,j); // forbid this cell
    }
} else {
    mp_grid_add_cell(rangeGrid,i,j);     // forbid this cell
}
