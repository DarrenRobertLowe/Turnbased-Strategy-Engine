///draw_self_ext();

// CARTESIAN VIEW
if !(global.isometricView) {
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);
}

// ISOMETRIC VIEW
else {
    var currentUnit = global.TURN;
    alpha = 1;
    var hue = c_white;
    var transparencyAlpha = global.transparencyAlpha;
    
    
    /* ground height consideration, not going to be this easy
    objList = ds_grid_get(GRID,column,row);
    size = objList.size;
    
    var height = 0; 
    
    for(i=0; i<size; i++)
    {
        obj = ds_list_find_value(objList, i);
        
        if !is_undefined(obj)
        and instance_exists(obj)
        {
            if obj.height > height
            then height = obj.height;
        }
    }
    */

    
    if (keepVisible == false)
    {
        if (blockingVisibility(id, CURSOR))
        {
            alpha = transparencyAlpha;
        }
        
        if  (currentUnit != id)
        and (currentUnit.keepVisible == true)
        {
            if (blockingVisibility(id, currentUnit))
            {
                alpha = transparencyAlpha;
            }
        }
    }
    
    
    draw_sprite_ext(
         isoSprite
        ,floor(imageIndex)
        ,getIsometricX(column, row)
        ,getIsometricY(column, row) //getIsometricY(column, row, height)
        ,image_xscale
        ,image_yscale
        ,0
        ,hue
        ,alpha
        );
}


