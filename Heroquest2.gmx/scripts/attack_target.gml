///attack_target(source id, target id)

attacker = argument0;
target   = argument1;

face_target(attacker, target);  // face the target

sout("attacker.weapon :" + string(attacker.weapon));

sout("attacker: " +string(attacker) + "    target: "+ string(target));


debug_message(string(attacker.name)
  + " is attacking "
  + string(target.name)
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
sout("Did " + string(dmg) + " damage to HP!");
if (critical) then sout("critical hit!");
