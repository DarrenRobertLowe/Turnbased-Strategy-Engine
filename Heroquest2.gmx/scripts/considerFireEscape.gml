///considerFireEscape();
/* determines if this unit should try to
 * move away from nearby fire.
 */
var val = -1;

val = ds_grid_get(global.FIRE_GRID, column-1, row)
    if exists(val) and (val.object_index == FIRE) {
        show_debug_message("Oh no! Fire!");
        return true;
    }

val = ds_grid_get(global.FIRE_GRID, column+1, row)
    if exists(val) and (val.object_index == FIRE) {
        show_debug_message("Oh no! Fire!");
        return true;
    }

val = ds_grid_get(global.FIRE_GRID, column, row+1)
    if exists(val) and (val.object_index == FIRE) {
        show_debug_message("Oh no! Fire!");
        return true;
    }

val = ds_grid_get(global.FIRE_GRID, column, row-1)
    if exists(val) and (val.object_index == FIRE) {
        show_debug_message("Oh no! Fire!");
        return true;
    }

