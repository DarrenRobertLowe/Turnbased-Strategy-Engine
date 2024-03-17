///setup_views();

var v = VIEWS.combat;
view_enabled[v] = true;
view_visible[v] = true;
view_hborder[v] = (global.isometricTileWidth * 4);
view_vborder[v] = (global.isometricTileHeight* 4);
view_hspeed[v]  = -1;
view_vspeed[v]  = -1;
view_xport[v]   = 0;
view_yport[v]   = 0;
view_wview[v]   = global.options_ResolutionWidth;
view_hview[v]   = global.options_ResolutionHeight;

view_object[v] = noone;
