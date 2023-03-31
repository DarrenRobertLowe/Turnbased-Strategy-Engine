///get_direction(float direction)
// takes a direction and rounds it to the correct rounded value

var dir = argument0;

if (dir >= 0 && dir < 45) {
    direction = 0;
}

if (dir >= 45 && dir < 135) {
    direction = 90;
}

if (dir >= 135 && dir < 225) {
    direction = 180;
}

if (dir >= 225 && dir < 315) {
    direction = 270;
}

if (dir >= 315 && dir < 360) {
    direction = 0;   // because 360 = 0
}




update_sprite();
