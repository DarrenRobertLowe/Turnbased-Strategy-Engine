/// pathfinding_add_empty_floors()
// add missing floor tiles as obstacles (keep after gridpath_set_collisions)
var width  = ds_grid_width(global.FLOOR_GRID);
var height = ds_grid_height(global.FLOOR_GRID);
for (var column=0; column<width; column++) {
    for (var row=0; row<height; row++) {
        if (ds_grid_get(global.FLOOR_GRID, column, row) <= 0) {
            mp_grid_add_cell(global.pathGrid, column, row);
        }
    }
}
