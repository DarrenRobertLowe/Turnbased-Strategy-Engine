///generate_weapon_name(id);
var weapon = argument0;

//qualityTitle = ds_list_find_value(qualityTitlesList, quality);

// generate string from modifiers
var modifierString = "";
for (var i=0; i<ds_list_size(modifiers); i++) {
    var val = ds_list_find_value(modifiers, i);
    modifierString += string(val) + " ";
}

var tierString = tiers[tier];
if (tier != 1) then tierString += " ";

weapon.name = tierString + modifierString + clean_text(object_get_name(weapon.object_index));




