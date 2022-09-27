///setup_default_stats();
global.statsGrid  = ds_grid_create(stats.length, 1);

// these are the default stats for all entities
ds_grid_set(global.statsGrid, stats.type,           0, ENEMY);
ds_grid_set(global.statsGrid, stats.name,           0, "I AM ERROR");
ds_grid_set(global.statsGrid, stats.hpBase,         0, 1);
ds_grid_set(global.statsGrid, stats.mpBase,         0, 0);
ds_grid_set(global.statsGrid, stats.moveBase,       0, 3);
ds_grid_set(global.statsGrid, stats.initiativeBase, 0, 0);
ds_grid_set(global.statsGrid, stats.fortitudeBase,  0, 0);
ds_grid_set(global.statsGrid, stats.attackBase,     0, 0);
ds_grid_set(global.statsGrid, stats.defenceBase,    0, 0);
ds_grid_set(global.statsGrid, stats.weapon,         0, 0);
ds_grid_set(global.statsGrid, stats.offhand,        0, 0);
ds_grid_set(global.statsGrid, stats.armour,         0, 0);

