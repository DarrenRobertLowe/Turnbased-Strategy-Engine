///GUI_drawCombatCurrentUnitInfo()
/* Draws the info for the current turn's unit
 * while in combat mode.
*/


// draw the panel
draw_sprite(spr_combat_panel, 0, 154, panelY);


// draw the current turn's avatar
var hero = ds_list_find_value(global.TURNLIST, 0);
if (hero > 0) {
    draw_sprite_ext(avatars, hero.avatar, 0+(avatarWidth*0.5), (windowHeight - (avatarWidth*0.5)) , -1, 1, 0, c_white, 1);

    // draw the name. note: see setup_fonts()s
    var nameColour      = c_white;
    var outlineColour   = c_black;

    draw_set_valign(fa_middle); // draw in the middle so it is half-in the background area
    draw_text_outlined(avatarWidth, panelY, hero.name, outlineColour, nameColour, global.header_font);
    draw_set_valign(fa_top);    // return to default
}

