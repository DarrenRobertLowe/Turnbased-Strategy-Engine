/// draw_self_ext();

// CARTESIAN VIEW (DEBUGGING)
if !(global.isometricView){
    depth = -y;
    draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, colour, 1);
    
    if (object_index == obj_MovementPanel) {
        draw_set_alpha(0.5);
        draw_rectangle_colour(x, y, x+32, y+32, c_teal, c_teal, c_teal, c_teal, false);
        draw_rectangle_colour(x, y, x+32, y+32, c_white, c_white, c_black, c_black, true);
    }
    else if (object_index == CURSOR) {
        draw_set_alpha(0.8);
        draw_rectangle_colour(x, y, x+32, y+32, c_yellow, c_yellow, c_yellow, c_yellow, false);
        draw_rectangle_colour(x, y, x+32, y+32, c_black, c_black, c_black, c_black, true);
    }
    else {
        draw_set_alpha(1);
        draw_rectangle_colour(x, y, x+32, y+32, c_white, c_white, c_white, c_white, false);
        draw_rectangle_colour(x, y, x+32, y+32, c_teal, c_teal, c_teal, c_teal, true);
    }
    
    
    
    if (MOVING) {
        // Draw the path
        draw_collision_mask();
        draw_set_alpha(1);
        
        var pathLngth = ds_list_size(myPathNodes);
        prevX = x;
        prevY = y;
        var offsetX = 16;
        var offsetY = 16;
        
        for(var i=0; i<pathLngth; i++) {
            x1 = ds_list_find_value(pathNodesX, i);
            y1 = ds_list_find_value(pathNodesY, i);
            
            draw_line_colour(prevX +offsetX -1, prevY +offsetY -1, x1 +offsetX -1, y1 +offsetY -1, c_white, c_red);
            draw_line_colour(prevX +offsetX, prevY +offsetY, x1 +offsetX, y1 +offsetY, c_white, c_red);
            draw_line_colour(prevX +offsetX +1, prevY +offsetY +1, x1 +offsetX +1, y1 +offsetY +1, c_white, c_red);
            
            prevX = x1;
            prevY = y1;
        }
    }
    
}

// ISOMETRIC VIEW
else {
    // should we go transparent?
    //alpha = 1;
    
    var currentUnit = global.TURN;
    
    if (global.TURN > 0) {
        if (keepVisible == false) {
            if (blockingVisibility(id, CURSOR)) {
                alpha = transparencyAlpha;
            }
            
            if (currentUnit != id) {
                if (blockingVisibility(id, currentUnit)) {
                    alpha = transparencyAlpha;
                }
            }
        }
    }// end of transparency check
    
    
    // draw the sprite
    draw_sprite_ext(
         isoSprite
        ,floor(imageIndex)
        ,getIsometricXFromCell(column, row)
        ,(getIsometricYFromCell(column, row)) - (z)
        ,imageMirror
        ,image_yscale
        ,0
        ,colour
        ,alpha
        );
}
