/// attackDirectionIsBlocked(x, y, target x, target y, target)
var sourceX = argument0;
var sourceY = argument1;
var targetX = argument2;
var targetY = argument3;
var target  = argument4;

var dir = point_direction(sourceX, sourceY, targetX, targetY);
var tempDir = get_direction_value(dir);

var tempRange = weapon.range;


// east
if (tempDir == 0) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column+tempRange, row);
        
        if (val > 0) {
            if (object_is_ancestor(val.object_index, OBSTACLE)) {
                if (val != target) {
                    sout("___ Can't attack, that direction is blocked by " + object_get_name(val.object_index));
                    return true;
                }
            }
        }
    }
}

// north
if (tempDir == 90) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column, row-tempRange);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != target) {
                    sout("___ Can't attack, that direction is blocked by " + object_get_name(val.object_index));
                    return true;
                }
            }
        }
    }
}


// west
if (tempDir == 180) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column-tempRange, row);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != target) {
                    sout("___ Can't attack, that direction is blocked by " + object_get_name(val.object_index));
                    return true;
                }
            }
        }
    }
}

// south
if (tempDir == 270) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column, row+tempRange);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != target) {
                    sout("___ Can't attack, that direction is blocked by " + object_get_name(val.object_index));
                    return true;
                }
            }
        }
    }
}


return false; // no obstacle in the way of the target

