/// add_new_hero(type, sex, "name", hp, mp, move, initiative, attack, defence, main weapon, off-hand, amulet, ring1, ring2, armour, hair, face, skin);

/********************************
heroStats layout
-----------------------------
Hero1       Hero2       Hero3
-----       -----       -----
type        type        type
sex         sex         sex
name        name        name
etc...      etc...      etc...
********************************/


var heroStats = global.heroStats;
ds_grid_resize(heroStats, (ds_grid_width(heroStats)+1), HEROSTATS.length);
var index = (ds_grid_width(heroStats)-1);

var i = 0;

var this_type       = argument[0];
var this_sex        = argument[1];
var this_name       = argument[2];
var this_hp         = argument[3];
var this_mp         = argument[4];
var this_move       = argument[5];
var this_initiative = argument[6];
var this_attack     = argument[7];
var this_defence    = argument[8];
var this_weapon     = argument[9];
var this_offhand    = argument[10];
var this_amulet     = argument[11];
var this_ring1      = argument[12];
var this_ring2      = argument[13];
var this_armour     = argument[14];
var this_hair       = argument[15];
var this_face       = argument[16];
var this_skin       = argument[17];


ds_grid_set(heroStats, index, HEROSTATS.type,       this_type);
ds_grid_set(heroStats, index, HEROSTATS.sex,        this_sex);
ds_grid_set(heroStats, index, HEROSTATS.name,       this_name);
ds_grid_set(heroStats, index, HEROSTATS.hp,         this_hp);
ds_grid_set(heroStats, index, HEROSTATS.mp,         this_mp);
ds_grid_set(heroStats, index, HEROSTATS.move,       this_move);
ds_grid_set(heroStats, index, HEROSTATS.initiative, this_initiative);
ds_grid_set(heroStats, index, HEROSTATS.attack,     this_attack);
ds_grid_set(heroStats, index, HEROSTATS.defence,    this_defence);
ds_grid_set(heroStats, index, HEROSTATS.weapon,     this_weapon);
ds_grid_set(heroStats, index, HEROSTATS.offhand,    this_offhand);
ds_grid_set(heroStats, index, HEROSTATS.amulet,     this_amulet);
ds_grid_set(heroStats, index, HEROSTATS.ring1,      this_ring1);
ds_grid_set(heroStats, index, HEROSTATS.ring2,      this_ring2);
ds_grid_set(heroStats, index, HEROSTATS.armour,     this_armour);
ds_grid_set(heroStats, index, HEROSTATS.hair,       this_hair);
ds_grid_set(heroStats, index, HEROSTATS.face,       this_face);
ds_grid_set(heroStats, index, HEROSTATS.skin,       this_skin);
