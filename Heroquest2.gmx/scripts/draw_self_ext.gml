/// draw_self_ext();

// CARTESIAN VIEW
if !(global.isometricView) {
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);
}

// ISOMETRIC VIEW
else {
    // should we go transparent?
    alpha = 1;
    var currentUnit = global.TURN;
    
    if (keepVisible == false) {
        if (blockingVisibility(id, CURSOR)) {
            alpha = transparencyAlpha;
        }
        
        if (currentUnit != id) {
            //if (currentUnit.keepVisible == true)
            //or (currentUnit.MOVING == true) {
                if (blockingVisibility(id, currentUnit)) {
                    alpha = transparencyAlpha;
                }
            //}
        }
    }
    
    
    // draw the sprite
    draw_sprite_ext(
         isoSprite
        ,floor(imageIndex)
        ,getIsometricXFromCell(column, row)
        ,getIsometricYFromCell(column, row) - (z)
        ,imageMirror
        ,image_yscale
        ,0
        ,hue
        ,alpha
        );
}
