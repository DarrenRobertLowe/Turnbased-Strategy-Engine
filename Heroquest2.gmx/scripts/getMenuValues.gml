/// getMenuValues(selected unit or noone);

var selectedUnit = argument0;
show_debug_message("selectedUnit = " + string(selectedUnit));

draw_set_font(global.menu_font);
textXOffset = global.textXOffset;
textYOffset = global.textYOffset;
menuVerticalSeparation = global.menuVerticalSeparation;

menuWidth = (view_wview / 3);
menuSize = 0;
lastIndex = 0;


if (selectedUnit != noone) {
    var size    = array_length_1d(selected.menu);
    menuHeight  = ((size+1) * global.menuVerticalSeparation);
    menuSize    = array_length_1d(selectedUnit.menu);
    lastIndex   = (menuSize-1);
}

/*
if (argument0 = noone) {
    menuWidth  = (view_wview / 3);
    menuHeight = (view_wview / 2);
}
else {
    //find the widest menu option
    var i = 0;
    var size = array_length_1d(selected.menu);
    for(; i<size; i++)
    {
        var wordLength = string_width(selected.menu[i]);
        // organize by word length
    }
    menuWidth = string_width()selected
}
