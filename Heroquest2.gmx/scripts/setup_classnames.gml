/// setup_classnames();
/* NOTE: the order is important and needs to match
 * the order in the classes enum!
 * See setup_enums() 
*/


global.classnames = ds_list_create();
classnames = global.classnames;
ds_list_add(classnames, "None");
ds_list_add(classnames, "Pirate");      // uses cutlasses
ds_list_add(classnames, "Swabber");     // uses poles (poles can be used to push, attack diagonally and cross gaps)
ds_list_add(classnames, "Cavalier");    // uses smallswords / rapiers
ds_list_add(classnames, "Pistoleer");   // uses pistols (1-2 shots per pistol, then 1 turn reload per pistol)
ds_list_add(classnames, "Musketeer");   // uses muskets at range, smallsword up close (2 turns reload between shots)
//ds_list_add(classnames, "Grenadier");   // Grenades! :D Grenades damage multiple tiles, smoke can block line of sight, molotovs can ignite wood.


