/// writeUnitStatsToStatsGrid(instance containing stats, grid index to write to);

var instance = argument0;
var index    = argument1;

for(var i=0; i<STATS.length; i++){
   ds_grid_set(global.statsGrid, i, index, );
}

ds_grid_set(global.statsGrid, STATS.type, index, instance.type);
ds_grid_set(global.statsGrid, STATS.name, index, instance.name);
