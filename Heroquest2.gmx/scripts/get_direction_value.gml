///get_direction_value(direction)
// takes a direction and rounds it to the correct rounded value
var dir = argument0;

if (dir >= 0 && dir < 45) {
    return 0;
}

if (dir >= 45 && dir < 135) {
    return 90;
}

if (dir >= 135 && dir < 225) {
    return 180;
}

if (dir >= 225 && dir < 315) {
    return 270;
}

if (dir >= 315 && dir < 360) {
    return 0;   // because 360 = 0
}
