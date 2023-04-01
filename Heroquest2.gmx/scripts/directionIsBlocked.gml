/// directionIsBlocked(x, y, target x, target y)
var sourceX = argument0;
var sourceY = argument1;
var targetX = argument2;
var targetY = argument3;

var dir = point_direction(sourceX, sourceY, targetX, targetY);
get_direction_value(dir);

var tempRange = weapon.range;


// east
if (direction == 0) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column+tempRange, row);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != unit) {
                    return true;
                }
            }
        }
    }
}

// north
if (direction == 90) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column, row-tempRange);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != unit) {
                    return true;
                }
            }
        }
    }
}


// west
if (direction == 180) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column-tempRange, row);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != unit) {
                    return true;
                }
            }
        }
    }
}

// south
if (direction == 270) {
    for(var i=0; i<tempRange; i++) {
        var val = ds_grid_get(grid, column, row+tempRange);
        
        if (val > 0) {
            if object_is_ancestor(val.object_index, OBSTACLE) {
                if (val != unit) {
                    return true;
                }
            }
        }
    }
}


return false; // no obstacle in the way of the target

