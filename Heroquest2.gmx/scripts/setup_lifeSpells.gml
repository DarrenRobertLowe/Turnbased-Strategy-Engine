///setup_lifeSpells

global.LIFE_SPELLS = ds_list_create();

var spells = global.LIFE_SPELLS;

ds_list_add(spells, Spell_Heal);
