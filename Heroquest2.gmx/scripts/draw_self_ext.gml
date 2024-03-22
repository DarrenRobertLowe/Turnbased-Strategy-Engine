/// draw_self_ext();

// CARTESIAN VIEW (DEBUGGING)
if !(global.isometricView) {
    depth = -y;
    draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, colour, 1);
    
    draw_rectangle_colour(x, y, x+32, y+32, c_white, c_white, c_white, c_white, false);
    draw_rectangle_colour(x, y, x+32, y+32, c_teal, c_teal, c_teal, c_teal, true);
    
    if (MOVING) {
        // Draw the path
        draw_collision_mask();
        draw_set_alpha(1);
        
        var size = array_length_1d(pathNodes);
        var x1 = pathNodes[0, 0];
        var y1 = pathNodes[0, 0];
        var prevX = x1;
        var prevY = y1;
        
        for(var i=0; i<size; i++) {
            x1 = pathNodes[i, 0];
            y1 = pathNodes[i, 1];
            
            draw_line_colour(prevX, prevY, x1, y1, c_red, c_red);
            
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
        
    
    // DEBUG
    /*
    var xx = getIsometricXFromCell(column, row);
    var yy = getIsometricYFromCell(column, row);
    draw_set_alpha((1/room_height) * ((xx*0.5)+yy));
    //draw_text(xx,yy,depth);
    
    
    draw_text(xx, yy, "coords: " + string(column) + ":" +string(row));
    
    
    draw_text(xx, yy, "x:"+string(x)+"   y:"+ string(y));
    */
}
