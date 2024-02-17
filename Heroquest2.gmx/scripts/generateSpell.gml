///generateSpell(spell, level, power, range, area);

var spell   = argument0;
var level   = argument1; // A value of 0 means default. -1 means randomized.
var pwr     = argument2; // A value of 0 means default. -1 means randomized.
var range   = argument3; // A value of 0 means default. -1 means randomized.
var area    = argument4; // A value of 0 means default. -1 means randomized.
var points  = level;


var tempSpells = ds_list_create();
ds_list_copy(tempSpells, global.LIFE_SPELLS);

var newSpell;

// choose a random spell within our level budget
if (spell <= 0) {
    while (spell <= 0) {
        var ind         = irandom(ds_list_size(tempSpells));
        var spell       = ds_list_find_value(tempSpells, ind);
        var tempSpell   = instance_create(x, y, spell);
        
        if (tempSpell.level > level) {
            spell = 0;
            ds_list_delete(tempSpells, ind);
        } else {
            newSpell = instance_create(0, 0, spell);
        }
    }
} else {
    // we are explicitely setting the spell instead
    newSpell = instance_create(0, 0, spell);
}

show_debug_message("spell: "+ string(spell));


// setting the stats to anything more than 0 will hard set that value regardless of level.
if (pwr > 0) {
    newSpell.pwr = pwr;
} else if (pwr == -1) {
    /// random power based on level
    pwr = 1; // minimum
    pwr += floor(random(points));
    points -= pwr;
}

if (range > 0) {
    newSpell.range = range;
} else if (pwr == -1) {
    range = 1; // minimum
    range += floor(random(points));
    points -= range;
}

if (area > 0) {
    newSpell.area = area;
} else if (area == -1) {
    area = 1; // minimum
    area += floor(random(points));
}


if (pwr < 1)   then pwr = 1;
if (range < 1) then range = 1;
if (area < 1)  then area = 1;


// finish up
newSpell.level  = level;
newSpell.pwr    = pwr;
newSpell.range  = range;
newSpell.area   = area;

return newSpell
