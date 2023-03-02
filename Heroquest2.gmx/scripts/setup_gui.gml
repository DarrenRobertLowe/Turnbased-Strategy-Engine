/// setup_gui()
draw_set_font(global.menu_font);

global.menuVerticalSeparation = string_height("MENU");
global.menuWidth  = string_width("WIDEST POSSIBLE");//(view_wview / 3);
global.menuHeight = (view_wview / 2);


//global.menuVerticalSeparation = font_get_size(font;
global.textXOffset = 15;
global.textYOffset = 15;

global.menuX = ((view_wview - global.menuWidth) - (global.menuWidth/2));
global.menuY = ((view_hview - global.menuHeight) - (global.menuHeight/2));
