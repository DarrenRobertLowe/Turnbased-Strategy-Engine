///GUI_drawTurnList();
/* Draws the turnlist on the right side of the screen
 * while in combat mode.
*/

// setup
var turnAvatarX = ((windowWidth) - (sprite_get_width(avatars) * turnAvatarScale));
var size = ds_list_size(global.TURNLIST);               // needs to be updated because units can be dropped from the list
var turnAvatarSeparation = (turnOrderAreaHeight / size);
var current = ds_list_find_value(global.TURNLIST,0);


// draw the avatars and circles
for(var i=(size-1); i > -1; i--) {
    var unit = ds_list_find_value(global.TURNLIST, i);
    
    if (unit > 0) {
        var spr;
        if (unit.team == TEAMS.ally)    then spr = 0;
        if (unit.team == TEAMS.enemy)   then spr = 1;
        if (unit.team == TEAMS.neutral) then spr = 2;
        
        var alpha = (1 - ((i/size)*.5));
        var horizontalSeparation = 10*(logn(1.5,i+1)); // why am I doing this?
        
        // draw the avatar background
        draw_sprite_ext(
            avatar_bg,
            spr,
            (turnAvatarX + horizontalSeparation),
            turnAvatarY + (turnAvatarSeparation*i),
            turnAvatarScale,
            turnAvatarScale,
            0, c_white,
            (alpha * .8)
        );
        
        // draw the avatar
        draw_sprite_ext(
            avatars,
            unit.avatar,
            (turnAvatarX + horizontalSeparation),
            turnAvatarY + (turnAvatarSeparation*i),
            turnAvatarScale,
            turnAvatarScale,
            0, c_white,
            alpha
        );
    }
}


// draw the "ORDER" text
var orderString = "ORDER";
var orderX = windowWidth - (string_width(orderString)*3);

draw_text_outlined(orderX, 25, orderString, c_black, c_yellow, global.header_font);
// draw the bar under the order text
draw_set_color(c_yellow);
draw_rectangle(orderX, 56, windowWidth, 59, false);
draw_set_color(c_black);
draw_rectangle(orderX, 56, windowWidth, 59, true);