/// draw_sprite_isometric_ext(sprite_index,image_index,column,row,xscale,yscale,rotation,color,alpha)

var sprite  = argument0;
var image   = argument1;
var column  = argument2;
var row     = argument3;
var xscale  = argument4;
var yscale  = argument5;
var rotation= argument6;
var color   = argument7;
var alpha   = argument8;


draw_sprite_ext(
     sprite
    ,image
    ,global.GRID_OFFSET_X + ((column-row) * global.isometricTileWidth) 
    ,global.GRID_OFFSET_Y + ((column+row) * global.isometricTileHeight)
    ,xscale
    ,yscale
    ,rotation
    ,color
    ,alpha
);
