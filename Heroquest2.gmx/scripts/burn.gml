/// burn(object id, damage);

var target = argument0;
var damage = argument1;


if exists(target) {
    target.hp -= (damage * target.fireMultiplier);
    if (target.hp <= 0) then kill(target);
}
