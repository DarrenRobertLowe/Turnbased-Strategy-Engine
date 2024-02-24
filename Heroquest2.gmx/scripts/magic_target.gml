///magic_target(attacker id, target id, spell id)

attacker = argument0;
target   = argument1;
spell    = argument2;

sout("MAGIC! - " +string(attacker.name) +" is casting " +string(spell.name) + " on "+string(target.name));

face_target(attacker, target);  // face the target

// begin the animation
with (attacker) {
    attackAnim = weapon.animation;
    animStart = animation_slash_start;
    adjust_animation_for_direction();
    imageIndex = animStart;
}


// run the event
spell.target = target;
with (spell) {
    event_user(EFFECT_EVENT);
}
