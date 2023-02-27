///attack_target(source id, target id)

attacker = argument0;
target   = argument1;

face_target(attacker, target);  // face the target
sout(string(attacker.name) + " is facing " + string(attacker.direction));
sout("attacker.weapon :" + string(attacker.weapon));

sout("attacker: " +string(attacker) + "    target: "+ string(target));


debug_message(
    string(attacker) 
  + ":" + string(attacker.name)
  + " is attacking "
  + string(target.id) + ":" +string(target.name)
  + " with their "
  + string(attacker.weapon.name)
  + "!");
  

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

sout("Setting attacker animation to " + string(attacker.attackAnim));



// REPORT

var xx = getIsometricXFromCell(target.column, target.row);
var yy = getIsometricYFromCell(target.column, target.row);

var counter      = instance_create(xx, yy, DamageCounter);
counter.value    = dmg;
counter.colour   = global.OPTIONS_COLOUR_DAMAGE;
//counter.colour   = global.OPTIONS_COLOUR_HEAL;

sout("Did " + string(dmg) + " damage to HP!");
if (critical) then sout("critical hit!");
