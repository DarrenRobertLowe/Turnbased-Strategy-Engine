///setup_lifeSpells

global.LIFE_SPELLS = ds_list_create();

var spells = global.LIFE_SPELLS;

ds_list_add(spells, Spell_Heal);
ds_list_add(spells, Spell_Heal2);
ds_list_add(spells, Spell_Heal3);
ds_list_add(spells, Spell_Shelter);
ds_list_add(spells, Spell_Aegis);
ds_list_add(spells, Spell_Cleanse);
