///persistWeapon(id);

var weapon = argument0;
var fname;
var file;

fname = "WeaponsPersist.ini";
file = ini_open(fname);
ini_write_string(weapon, "object", object_get_name(weapon.object_index));
ini_write_string(weapon, "name", weapon.name);
ini_write_string(weapon, "tier", weapon.tier);
ini_write_string(weapon, "pwr", weapon.pwr);
ini_write_string(weapon, "range", weapon.range);
ini_write_string(weapon, "diagonal", weapon.diagonal);

// now we need to save the lists of effects, modifiers and passives
var list;
var size = 0;
var val;

list = weapon.effects;
size = ds_list_size(list);
val = "";
for(var i=0; i<size; i++) {
    val += ds_list_find_value(list, i);
    if (size > (i+1)) then val += ",";
}
ini_write_string(weapon, "effects", val);


list = weapon.modifiers;
size = ds_list_size(list);
val = "";
for(var i=0; i<size; i++) {
    val += ds_list_find_value(list, i);
    if (size > (i+1)) then val += ",";
}
ini_write_string(weapon, "modifiers", val);


list = weapon.passives;
size = ds_list_size(list);
val = "";
for(var i=0; i<size; i++) {
    val += ds_list_find_value(list, i);
    if (size > (i+1)) then val += ",";
}
ini_write_string(weapon, "passives", val);

ini_close();


// check that the ini files exist
fname = "WeaponsPersist.ini";
if file_exists(fname) {
    show_debug_message(string(fname) + " exists!");
} else show_message(string(fname) + " does not exist!");

fname = "WeaponModifiers.ini";
if file_exists(fname) {
    show_debug_message(string(fname) + " exists!");
} else show_message(string(fname) + " does not exist!");


