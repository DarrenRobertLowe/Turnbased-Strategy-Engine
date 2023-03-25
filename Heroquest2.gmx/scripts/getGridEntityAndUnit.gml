///getGridEntityAndUnit(grid, column, row);

grid        = argument0;
column      = argument1;
row         = argument2;

unitOver    = 0;
entityOver  = getGridEntity(grid, column, row);

if (entityOver > 0) {
    if (entityIsUnit(entityOver))
      then unitOver = entityOver;
}
