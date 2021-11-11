///get_direction()

var dir = point_direction(xprev, yprev, x, y);


if ((dir >= 0 && dir <= 45) || (dir <= 360 && dir >= (360-45)))
{
    direction = 0;
}

if (dir <= (180+45) && dir >= (180-45)) {
    direction = 180;
}

if (dir <= (90+45) && dir >= (90-45)) {
    direction = 90;
}

if (dir <= (270+45) && dir >= (270-45)) {
    direction = 270;
}


update_sprite();





/* 
//DEBUG
//show_debug_message("get_direction() says direction is "+string(direction));
if (direction != prevDir)
{
    show_message("Direction is now "+string(direction));
    prevDir = direction;
}
*/
