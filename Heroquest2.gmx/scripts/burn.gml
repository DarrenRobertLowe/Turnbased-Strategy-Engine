/// burn(object id, damage);

var target = argument0;
var damage = argument1;


if exists(target) {
    show_message("burning target: " +string(object_get_name(target)) + " for " + string(damage * target.fireMultiplier) + " damage!");
    target.hp -= (damage * target.fireMultiplier);
    if (target.hp <= 0) then kill(target);
}
