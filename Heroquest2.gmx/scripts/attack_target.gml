///attack_target(source id, target id)

attacker = argument0;
target   = argument1;
sout("ATTACK! - " +string(attacker) +" is attacking "+string(target));

face_target(attacker, target);  // face the target

dmg = roll(attacker.weapon.dice, attacker.weapon.pwr);

//critical = choose(0, 0, 0, 0, 1); // 20% chance of crit



// begin the animation
with (attacker) {
    attackAnim = weapon.animation;
    animStart = animation_slash_start;
    adjust_animation_for_direction();
    imageIndex = animStart;
}

// do the damage
damage(target, dmg);

// if we're using a polearm, push the enemy back a square if they're close
// we need a check for polearm or maybe "push force" as a weapon stat... oOOooooOhh!
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


