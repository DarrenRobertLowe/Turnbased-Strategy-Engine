///draw_menu();

// setup drawing
draw_set_color(c_white);

var textX = (menuX + textXOffset);
var textY = (menuY + textYOffset);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(menuX, menuY, menuX+menuWidth, menuY+menuHeight, false);

draw_set_alpha(1);
draw_set_color(c_white);


// draw the menu items
var size = ds_list_size(displayMenu);
for(var i=0; i<size; i++) {
    var item = ds_list_find_value(displayMenu, i);
    
    draw_set_color(c_white);
    if ((item != "END TURN") and (selected.actedThisTurn == true)) {
        draw_set_color(c_gray);
    }
    
    if ((item == "MOVE") and (selected.movedThisTurn == true)) {
        draw_set_color(c_gray);
    }
    if ((item == "MOVE") and (selected.movedThisTurn == false)) {
        draw_set_color(c_white);
    }
    
    draw_text(textX, textY + (i * menuVerticalSeparation), item);
    
    
    
    // draw the item description
    if (menuPosition == i) {
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(menuX, menuY+menuHeight+2, menuX+menuWidth, menuY+menuHeight+menuVerticalSeparation+2, false);
        
        
        var item = ds_list_find_value(dataMenu, i);
        var description = "";
        if (object_is_ancestor(item.object_index, SPELL)) {
            description = item.description; 
        }
        
        draw_set_alpha(1);
        draw_set_color(c_white);
        
        description = string_upper(description);
        draw_text(textX, (menuY + menuHeight + 4), description);
    }
}


// clean up
draw_reset();
