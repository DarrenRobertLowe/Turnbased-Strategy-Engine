///draw_menu();

// setup drawing
draw_set_color(c_white);

var textX = (menuX + textXOffset);
var textY = (menuY + textYOffset);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(menuX, menuY, menuX+menuWidth, menuY+menuHeight, false);

//draw_set_alpha(1);
draw_set_color(c_white);

/*
// already moved this turn?
if (selected.movedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "MOVE");
    //ds_list_delete(tempMenu, pos);
}


// already acted this turn?
if (selected.actedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "ATTACK");
    //ds_list_delete(tempMenu, pos);
}
if (selected.actedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "SKILLS");
    //ds_list_delete(tempMenu, pos);
}
*/

// draw the menu items
var i=0;
var size = ds_list_size(tempMenu);
for(; i<size; i++) {
    var item = ds_list_find_value(tempMenu, i);
    
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
}


// clean up
draw_reset();
