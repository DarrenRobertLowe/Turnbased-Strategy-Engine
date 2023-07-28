///damage(target, dmg);
var target  = argument0;
var dmg     = argument1;


target.hp -= dmg;
sout(string(target) + " dealt " +string(dmg) +" damage!");

// REPORT
var xx = getIsometricXFromCell(target.column, target.row);
var yy = getIsometricYFromCell(target.column, target.row);

var counter      = instance_create(xx, yy, DamageCounter);
counter.value    = dmg;
counter.colour   = global.OPTIONS_COLOUR_DAMAGE;
//counter.colour   = global.OPTIONS_COLOUR_HEAL;


target.animTime     = (global.animation_hit_time); //* (1 + critical));
target.takingDamage = true;


// destroy enemy if health < 0
if (target.hp <= 0) then kill(target);
