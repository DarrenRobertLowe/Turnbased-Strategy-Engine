///draw_menu();

// setup drawing
draw_set_color(c_white);

var textX = (menuX + textXOffset);
var textY = (menuY + textYOffset);
var descriptionY1 = menuY+menuHeight+2;
var descriptionY2 = menuY+menuHeight+menuVerticalSeparation+2;
var descriptionTextY = (menuY + menuHeight + 4);
var iconWidth = 32;
var iconY = descriptionY2;

// menu background
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(menuX, menuY, menuX+menuWidth, menuY+menuHeight, false);

// description background
draw_rectangle(menuX, descriptionY1, menuX+menuWidth, descriptionY2, false);
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
    
    draw_text_outlined(textX, textY + (i * menuVerticalSeparation), item, c_black, c_white, global.menu_font);
    
    

    
    // draw the item info
    if (menuPosition == i) {
        if (item == "MOVE") {
            draw_text_outlined(textX, descriptionTextY, "MOVE UNIT TO A NEW POSITION", c_black, c_white, global.menu_font);
        }
        
        if (item == "END TURN") {
            draw_text_outlined(textX, descriptionTextY, "END THIS UNIT'S TURN", c_black, c_white, global.menu_font);
        }
        
        if (item == "ATTACK") {
            var item = selected.weapon;
            
            draw_text_outlined(textX, descriptionTextY, "ATTACK WITH " + string_upper(item.name), c_black, c_white, global.menu_font);
            
            // power
            draw_set_font(font_header_normal);
            draw_sprite(menu_icon_back, 0, menuX, iconY);
            draw_sprite(menu_icon_power, 0, menuX, iconY);
            draw_text_outlined(menuX + iconWidth, iconY, item.pwr, c_black, c_white, global.stats_font);
            
            // range
            draw_sprite(menu_icon_back, 0, menuX + (iconWidth*2), iconY);
            draw_sprite(menu_icon_range, 0, menuX + (iconWidth*2), iconY);
            draw_text_outlined(menuX + (iconWidth * 3), iconY, item.range, c_black, c_white, global.stats_font);
            
            // area
            draw_sprite(menu_icon_back, 0, menuX + (iconWidth*4), iconY);
            draw_sprite(menu_icon_area, 0, menuX + (iconWidth*4), iconY);
            draw_text_outlined(menuX + (iconWidth*5), iconY, item.area, c_black, c_white, global.stats_font);
        }
        
        
        // description
        var item = ds_list_find_value(dataMenu, i);
        var description = "";
        if (object_is_ancestor(item.object_index, SPELL)) {
            description = item.description; 
        }
        
        draw_set_alpha(1);
        draw_set_color(c_white);
        
        description = string_upper(description);
        draw_text_outlined(textX, (menuY + menuHeight + 4), description, c_black, c_white, global.menu_font);
        
        
        // spells
        if (object_is_ancestor(item.object_index, SPELL)) {
            // power
            draw_set_font(font_header_normal);
            draw_sprite(menu_icon_back, 0, menuX, iconY);
            draw_sprite(menu_icon_power, 0, menuX, iconY);
            draw_text_outlined(menuX + iconWidth, iconY, item.pwr, c_black, c_white, global.stats_font);
            
            // range
            draw_sprite(menu_icon_back, 0, menuX + (iconWidth*2), iconY);
            draw_sprite(menu_icon_range, 0, menuX + (iconWidth*2), iconY);
            draw_text_outlined(menuX + (iconWidth * 3), iconY, item.range, c_black, c_white, global.stats_font);
            
            // area
            draw_sprite(menu_icon_back, 0, menuX + (iconWidth*4), iconY);
            draw_sprite(menu_icon_area, 0, menuX + (iconWidth*4), iconY);
            draw_text_outlined(menuX + (iconWidth*5), iconY, item.area, c_black, c_white, global.stats_font);
        }
        
        draw_reset();
    }
    
    
    
}


// clean up
draw_reset();
