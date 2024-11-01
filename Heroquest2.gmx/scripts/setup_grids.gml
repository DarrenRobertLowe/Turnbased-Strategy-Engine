///setup_grids();
global.gridWidth        = argument0;
global.gridHeight       = argument1;

global.tileWidth            = 32;
global.tileHeight           = 32;
global.isometricTileWidth   = 32;
global.isometricTileHeight  = 16;
global.cellSize             = global.tileWidth;
global.pathfindingOffset   = (global.cellSize / 2);

var tw = global.tileWidth;
var th = global.tileHeight;
global.GRID_OFFSET_X = (global.isometricTileWidth  * 10); // (global.gridWidth/2));
global.GRID_OFFSET_Y = (global.isometricTileHeight * 10); // (global.gridHeight/2));


global.halfTileWidth  = (tw/2);
global.halfTileHeight = (th/2);
global.halfIsometricTileWidth  = (global.isometricTileWidth/2);
global.halfIsometricTileheight = (global.isometricTileHeight/2);

var w = global.gridWidth;
var h = global.gridHeight;
global.GRID         = ds_grid_create(w, h);     // objects such as UNITS and CHESTS
global.MOVE_GRID    = ds_grid_create(w, h);     // for movement tiles
global.FLOOR_GRID   = ds_grid_create(w, h);     // the floor, duh
global.CURSOR_GRID  = ds_grid_create(w, h);     // grid for the cursor (used in map rotation)
global.ATTACK_GRID  = ds_grid_create(w, h);     // grid for attacks
global.FIRE_GRID    = ds_grid_create(w, h);     // grid that fire will occupy
global.PLATFORM_GRID = ds_grid_create(w, h);    // grid above the floor that units walk on, affecting Z value.
global.NODE_GRID    = ds_grid_create(w, h);     // used for pathfinding
//global.NODES        = ds_map_create();          // used for pathfinding

global.gridDefaultValue = -1;
ds_grid_clear(global.FLOOR_GRID,    3); // this represents the floor health
ds_grid_clear(global.GRID,          global.gridDefaultValue);
ds_grid_clear(global.CURSOR_GRID,   global.gridDefaultValue);
ds_grid_clear(global.MOVE_GRID,     global.gridDefaultValue);
ds_grid_clear(global.ATTACK_GRID,   global.gridDefaultValue);
ds_grid_clear(global.FIRE_GRID,     global.gridDefaultValue);

// pathfinding
mp_grid_destroy(global.pathGrid);
global.pathGrid = mp_grid_create(global.GRID_OFFSET_X, global.GRID_OFFSET_Y, w, h, tw, th);

