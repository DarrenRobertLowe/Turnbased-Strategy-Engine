/// getMenuValues(selected unit or noone);

var selectedUnit = argument0;

draw_set_font(global.menu_font);
textXOffset = global.textXOffset;
textYOffset = global.textYOffset;
menuVerticalSeparation = global.menuVerticalSeparation;

menuWidth = (view_wview / 3);
menuSize  = 0;
lastIndex = 0;


if (selectedUnit != noone) {
    menuSize    = ds_list_size(tempMenu);//selected.menu);
    menuHeight  = ((menuSize+1) * global.menuVerticalSeparation);
    lastIndex   = (menuSize-1);
}
