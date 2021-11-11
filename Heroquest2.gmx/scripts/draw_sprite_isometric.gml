/// draw_sprite_isometric(sprite_index,image_index,column,row,alpha)
/** 
 * argument0 = sprite_index
 * argument1 = image_index
 * argument2 = column
 * argument3 = row
 * argument4 = alpha
**/

var sprite  = argument0;
var image   = argument1;
var column  = argument2;
var row     = argument3;
var alpha   = argument4;


draw_sprite_ext(
     sprite
    ,image
    ,global.GRID_OFFSET_X + ((column-row) * global.isometricTileWidth) 
    ,global.GRID_OFFSET_Y + ((column+row) * global.isometricTileHeight)
    ,1
    ,1
    ,0
    ,c_white
    ,alpha
);
