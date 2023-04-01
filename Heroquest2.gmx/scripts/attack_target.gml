///attack_target(source id, target id)

attacker = argument0;
target   = argument1;


face_target(attacker, target);  // face the target

dmg = roll(attacker.weapon.dice, attacker.weapon.pwr);

critical = choose(0, 0, 0, 0, 1); // 20% chance of crit

target.animTime     = (global.animation_hit_time * (1 + critical));
target.takingDamage = true;

// begin the animation
with (attacker) {
    attackAnim = weapon.animation;
    animStart = animation_slash_start;
    adjust_animation_for_direction();
    imageIndex = animStart;
}

// do the damage
target.hp -= dmg;


// REPORT
var xx = getIsometricXFromCell(target.column, target.row);
var yy = getIsometricYFromCell(target.column, target.row);

var counter      = instance_create(xx, yy, DamageCounter);
counter.value    = dmg;
counter.colour   = global.OPTIONS_COLOUR_DAMAGE;
//counter.colour   = global.OPTIONS_COLOUR_HEAL;

// destroy enemy if health < 0
if (target.hp <= 0) then kill(target);

