///draw_menu();

draw_set_color(c_white);


var textX = (menuX + textXOffset);
var textY = (menuY + textYOffset);


draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(menuX, menuY, menuX+menuWidth, menuY+menuHeight, false);

//draw_set_alpha(1);
draw_set_color(c_white);
var i=0;
var size = array_length_1d(selected.menu);

for(; i<size; i++) {
    draw_text(textX, textY + (i * menuVerticalSeparation),selected.menu[i]);
}


draw_reset();
