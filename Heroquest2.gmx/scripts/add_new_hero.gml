/// add_new_hero(type, sex, "name", hp, mp, move, initiative, fortitude, attack, defence, main weapon, off-hand, amulet, ring1, ring2, armour, hair, face, skin);
// also see: setup_enums(), getHeroStats()
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

var this_type       = argument[i];
var this_sex        = argument[++i];
var this_name       = argument[++i];
var this_hp         = argument[++i];
var this_mp         = argument[++i];
var this_move       = argument[++i];
var this_initiative = argument[++i];
var this_fortitude  = argument[++i];
var this_attack     = argument[++i];
var this_defence    = argument[++i];
var this_weapon     = argument[++i];
var this_offhand    = argument[++i];
var this_amulet     = argument[++i];
var this_ring1      = argument[++i];
var this_ring2      = argument[++i];
var this_armour     = argument[++i];
var this_hair       = argument[++i];
var this_face       = argument[++i];
var this_skin       = argument[++i];


ds_grid_set(heroStats, index, HEROSTATS.type,       this_type);
ds_grid_set(heroStats, index, HEROSTATS.sex,        this_sex);
ds_grid_set(heroStats, index, HEROSTATS.name,       this_name);
ds_grid_set(heroStats, index, HEROSTATS.hp,         this_hp);
ds_grid_set(heroStats, index, HEROSTATS.mp,         this_mp);
ds_grid_set(heroStats, index, HEROSTATS.move,       this_move);
ds_grid_set(heroStats, index, HEROSTATS.initiative, this_initiative);
ds_grid_set(heroStats, index, HEROSTATS.fortitude,  this_fortitude);
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
