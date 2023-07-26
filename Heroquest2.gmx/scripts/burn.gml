/// burn(object id, damage);

var target = argument0;
var dmg = argument1;


if exists(target) {
    dmg *= target.fireMultiplier;
    damage(target, dmg);
}
