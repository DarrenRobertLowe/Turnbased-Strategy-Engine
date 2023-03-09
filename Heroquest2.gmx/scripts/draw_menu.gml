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


// Make a copy of the unit's menu options so we can
// remove options under certain circumstances.
// e.g. a unit has already moved, a unit is unable to attack, etc.
tempMenu = ds_list_create();
ds_list_copy(tempMenu, selected.menu);

// already moved this turn?
if (selected.movedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "MOVE");
    ds_list_delete(tempMenu, pos);
}


// already acted this turn?
if (selected.actedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "ATTACK");
    ds_list_delete(tempMenu, pos);
}
if (selected.actedThisTurn == true) {
    var pos = ds_list_find_index(tempMenu, "SKILLS");
    ds_list_delete(tempMenu, pos);
}


// draw the menu items
var i=0;
var size = ds_list_size(tempMenu); // array_length_1d(selected.menu);
for(; i<size; i++) {
    // only allow movement once per turn
    var item = ds_list_find_value(tempMenu, i);
    draw_text(textX, textY + (i * menuVerticalSeparation), item);
}


// clean up
draw_reset();
