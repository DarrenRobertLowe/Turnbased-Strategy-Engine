///magic_target(attacker id, target id, spell id)

attacker = argument0;
target   = argument1;
spell    = argument2;

sout("MAGIC! - " +string(attacker.name) +" is casting " +string(spell.name) + " on "+string(target.name));

face_target(attacker, target);  // face the target

// begin the animation
with (attacker) {
    attackAnim = weapon.animation;
    animStart = animation_slash_start;
    adjust_animation_for_direction();
    imageIndex = animStart;
}


// do the damage
dmg = roll(spell.dice, spell.pwr);
if (spell.heals == true) then dmg = (0-dmg); // flip the damage to healing
damage(target, dmg);


// if we're using a polearm, push the enemy back a square if they're close
if (ds_list_find_index(attacker.weapon.passives, "Knockback")) {
    var adjacent = cellsAreAdjacent(attacker.column, attacker.row, target.column, target.row);
    if (adjacent) {
        // get the target cell the enemy will be pushed to
        if (facing == DIRECTION.north) {
            var tCol = target.column;
            var tRow = target.row-1; 
        }
        
        if (facing == DIRECTION.south) {
            var tCol = target.column;
            var tRow = target.row+1; 
        }
        
        if (facing == DIRECTION.east) {
            var tCol = target.column+1;
            var tRow = target.row; 
        }
        
        if (facing == DIRECTION.west) {
            var tCol = target.column-1;
            var tRow = target.row; 
        }
        
        // push the target
        if (ds_grid_get(global.GRID, tCol, tRow) < 1) { // if the target cell is empty...
            ds_grid_set(global.GRID, target.column, target.row, -1);
            ds_grid_set(global.GRID, tCol, tRow, target);
            target.column = tCol;
            target.row = tRow;
            getCoordsFromCell();    // update x/y
            
            // if target is above a hole, fall
            if (ds_grid_get(global.FLOOR_GRID, target.column, target.row) < 1) {
                target.FALLING = true;
            }
        } else {
            sout("No free cell to push target onto");
        }
    }
}


