///generateSpell(spell, level, power, range);

var spell   = argument0;
var level   = argument1;
var pwr     = argument2; // A value of 0 means randomised.
var range   = argument3; // A value of 0 means randomised.

if (spell <= 0) {
    spell = choose(Spell_Heal); // Spell_Bolt, Spell_Whatever
}

show_debug_message("spell: "+ string(spell));
var newSpell = instance_create(0, 0, spell);

// setting the pwr or range to anything but 0 will hard set that value regardless of level.
if (pwr > 0) {
    newSpell.pwr = pwr;
} else {
    /// random power based on level
    pwr = 1; // minimum
    pwr += floor(random(level));
}

if (range > 0) {
    newSpell.range = range;
} else {
    range = (level - pwr);
}

if (pwr < 1)   then pwr = 1;
if (range < 1) then range = 1;


// finish up
newSpell.level  = level;
newSpell.pwr    = pwr;
newSpell.range  = range;

return newSpell
