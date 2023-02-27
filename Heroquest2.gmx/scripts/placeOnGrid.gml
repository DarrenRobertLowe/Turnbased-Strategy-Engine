/// placeOnGrid(grid, column, row, id)
var grid     = argument0;
var column   = argument1;
var row      = argument2;
var instance = argument3;


if (ds_grid_get(grid, column, row) == -1) {
    ds_grid_set(grid, column, row, instance);
} else {
    sout(
        "Grid cell already occupied! #
        Error: attempted to create object "+string(object_get_name(instance.object_index))
        +", id:" + string(instance)
        +" at position : " + string(column) + ":" +string(row)
        +"# but we encountered something there already!
        #value:" +string(ds_grid_get(grid, column, row))
        );
    /*
    show_error(
        "Grid cell already occupied! #
        Error: attempted to create object "+string(object_get_name(instance.object_index))
        +", id:" + string(instance)
        +" at position : " + string(column) + ":" +string(row)
        +"# but we encountered something there already!
        #value:" +string(ds_grid_get(grid, column, row)), false);
    */
}
