///persistHero(id);

var hero = argument0;
var fname;
var file;

fname = "heroesPersist.ini";
file = ini_open(fname);
ini_write_string(hero, "name", hero.name);
ini_write_string(hero, "class", hero.class);
ini_write_string(hero, "level", hero.level);
ini_write_string(hero, "hpBase", hero.hpBase);
ini_write_string(hero, "mpBase", hero.mpBase);
ini_write_string(hero, "hp", hero.hpBase);
ini_write_string(hero, "mp", hero.mpBase);
ini_write_string(hero, "move", hero.move);
ini_write_string(hero, "attack", hero.attack);
ini_write_string(hero, "weapon", hero.weapon);
persistWeapon(hero.weapon);


// check that the ini file exists
if file_exists(fname) {
    show_debug_message(string(fname) + " exists!");
} else show_message(string(fname) + " does not exist!");
