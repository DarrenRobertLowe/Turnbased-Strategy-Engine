///attack_target(source id, target id)

attacker = argument0;
target   = argument1;


face_target(attacker, target);  // face the target

dmg = roll(attacker.weapon.dice, attacker.weapon.pwr);

//critical = choose(0, 0, 0, 0, 1); // 20% chance of crit



// begin the animation
with (attacker) {
    attackAnim = weapon.animation;
    animStart = animation_slash_start;
    adjust_animation_for_direction();
    imageIndex = animStart;
}

// do the damage
damage(target, dmg);


