/// face_target(source, target);
sout("facing target....");
var source = argument0;
var target = argument1;

dir = point_direction(source.x, source.y, target.x, target.y);
get_direction(dir);

// update the attacker's direction
source.direction = dir;
with (source) {
    get_direction(direction);
}
