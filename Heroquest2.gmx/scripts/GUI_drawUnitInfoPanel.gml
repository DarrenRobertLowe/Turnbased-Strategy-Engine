/// GUI_drawUnitInfoPanel(unit, draw on the rightside?);
/* This will draw the unit info for the given unit.
 * True or False must be specified for drawing side, false = left, true = right
 *
 * see create event for avatarWidth, avatarHeight, etc
 */

var unit        = argument0;
var rightSide   = argument1;
var margin      = 24;
var panelWidth  = sprite_get_width(spr_combat_panel);
var panelHeight = sprite_get_height(spr_combat_panel);
var panelX;     //(windowWidth - panelWidth);
var panelEndX;  // (panelX + panelWidth);
var panelEndY;  //   = (panelY + panelHeight);

var avatarX;    //(panelX + avatarWidth * 0.5);
var mirrored = -1; // either 0 or -1


// setup the positioning
if (rightSide) {                                        // target unit / right side
    mirrored    = 1;
    panelX      = (windowWidth - panelWidth);
    panelEndX   = (panelX + panelWidth);
    avatarX     = (panelEndX - (avatarWidth * 0.5));
} else {                                                // current unit / left side
    mirrored    = -1;
    panelX      = 0;
    panelEndX   = (panelX + panelWidth);
    avatarX     = (panelX + (avatarWidth * 0.5));
}

var panelEndY   = (panelY + panelHeight);
var avatarY     = (panelEndY - avatarHeight * 0.5);


// draw the panel
draw_sprite(spr_combat_panel, 0, panelX, panelY);

// draw the avatar
draw_sprite_ext(avatars, unit.avatar, avatarX, avatarY, mirrored, 1, 0, c_white, 1);


// draw the name and level.
// note: see setup_fonts()
draw_set_halign(fa_left);
var lineSeparation  = 30;
var nameColour      = c_white;
var outlineColour   = c_black;
var nameY = (panelY - (lineSeparation * 0.5));

if (rightSide) {    // right side / target unit
    draw_text_outlined(panelX, nameY, unit.name, outlineColour, nameColour, global.header_font);    // name
    draw_text_outlined(panelX, panelY + lineSeparation, "lvl " + string(unit.level), outlineColour, nameColour, global.menu_font);   // lvl
} else {            // left side / current unit
    draw_text_outlined(panelX + avatarWidth, nameY, unit.name, outlineColour, nameColour, global.header_font);  // name
    draw_text_outlined(panelX + avatarWidth, panelY + lineSeparation, "lvl " + string(unit.level), outlineColour, nameColour, global.menu_font); // lvl
}

    



// reset to default
draw_set_valign(fa_top);



// draw the stats
var columnWidth = (margin * 8);
var column1;


if (rightSide)
 then column1 = panelX;
   else column1 = (panelX + avatarWidth);
var column2 = (column1 + columnWidth);


// column 1
draw_set_halign(fa_left);
draw_text_outlined(column1, panelY + (lineSeparation * 2),  "HP: "       + string(unit.hp)   + "/" + string(unit.hpBase), c_black,c_white, global.menu_font);
draw_text_outlined(column1, panelY + (lineSeparation * 3),  "Status: "   + string(unit.move), c_black,c_white, global.menu_font);

// column 2
draw_set_halign(fa_right);
draw_text_outlined(column2, panelY + (lineSeparation * 2),  "Move: "     + string(unit.move) + "/" + string(unit.moveBase), c_black,c_white, global.menu_font);
