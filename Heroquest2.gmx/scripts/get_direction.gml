///get_direction(float direction)
// takes a direction and rounds it to the correct rounded value

var dir = argument0;

sout("dir passed is : "+ string(dir));

if (dir >= 0 && dir < 45) {
    direction = 0;
    debug_message("direction set to " + string(direction));
}

if (dir >= 45 && dir < 135) {
    direction = 90;
    debug_message("direction set to " + string(direction));
}

if (dir >= 135 && dir < 225) {
    direction = 180;
    debug_message("direction set to " + string(direction));
}

if (dir >= 225 && dir < 315) {
    direction = 270;
    debug_message("direction set to " + string(direction));
}

if (dir >= 315 && dir < 360) {
    direction = 0;   // because 360 = 0
    debug_message("direction set to " + string(direction));
}




update_sprite();
