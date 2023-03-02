///draw_outlined_text(x, y, string, outline colour, colour, font);
/* 
 * Draws the given text with an outline in the given colours.
 * Note; this could be replaced with a custom font for speed optimization.
 */
var xx = argument0;
var yy = argument1;
var text = argument2;
var outlineColour = argument3;
var colour = argument4;
var font = argument5;

// back text
draw_set_font(font);
draw_set_valign(fa_middle);
draw_text_colour(xx+1, yy+1, text, outlineColour, outlineColour, outlineColour, outlineColour, 1);
draw_text_colour(xx-1, yy+1, text, outlineColour, outlineColour, outlineColour, outlineColour, 1);
draw_text_colour(xx+1, yy-1, text, outlineColour, outlineColour, outlineColour, outlineColour, 1);
draw_text_colour(xx-1, yy-1, text, outlineColour, outlineColour, outlineColour, outlineColour, 1);

// front text
draw_set_font(font_header);
draw_text_colour(xx, yy, text, colour, colour, colour, colour, 1);

draw_set_valign(fa_top); // return to default
