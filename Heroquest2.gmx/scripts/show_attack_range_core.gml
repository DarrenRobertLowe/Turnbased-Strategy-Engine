///show_attack_range_core(i, j);
var i = argument0;
var j = argument1;
var goalx = (gridOffsetX + (targetColumn * tileWidth) + (tileWidth/2));
var goaly = (gridOffsetY + (targetRow * tileHeight) + (tileHeight/2));
var range = targetHero.weapon.range;

//show_debug_message("i: " + string(i) + "    j: "+ string(j));
//show_debug_message("targetColumn: " + string(targetColumn) + "    targetRow: "+ string(targetRow));


// ADD OBSTACLES
mp_grid_add_instances(global.pathGrid, OBSTACLE, false);
// ...EXCEPT POTENTIAL TARGETS
with (ENTITY){
    mp_grid_clear_cell(global.pathGrid, column, row);
}

mp_grid_clear_cell(global.pathGrid, targetHero.column, targetHero.row);
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
        if (entity > 0) then sout("Target cell " +string(targetColumn) +":" + string(targetRow) + " entity is: " + string(entity));
        
        
        // ADD TARGET TO listOfTargets
        if  (entity > -1)                                           // there's something there
        and (object_is_ancestor(entity.object_index, ENTITY)) {     // don't target walls and such
            if (entity.team != selected.team) {
                ds_list_add(selected.listOfTargets, entity);
                sout("Added a unit: " +string(entity) + " to our list of targets!");
            }
        }
        
        // Default selected target to the first index
        if (ds_list_size(selected.listOfTargets) > 0) {
            attackTarget = ds_list_find_value(selected.listOfTargets, selected.targetIndex);
            CURSOR.column = attackTarget.column;
            CURSOR.row = attackTarget.row;
        }
        
    } else {
        mp_grid_add_cell(rangeGrid,i,j); // forbid this cell
    }
} else {
    mp_grid_add_cell(rangeGrid,i,j);     // forbid this cell
}
