/// generateWeapon(Object, points)
/* @Returns The new weapon instance id
 * The Object is the object weapon we're making, or if we want
 *  we can choose the parent object, or the parent's parent, etc.
 * e.g. you could make a Rapier, or a SWORD that will randomly
 *   decide what it's exact form will be. Or, even a WEAPON.
 *
 * Idea:
 * Likely what we'll do is have randomized WEAPONs in chests with
 *  a given number of points, like based on the stage difficulty
 *  and maybe a TOTAL_EXP_EARNED bonus (so it scales with the
 *  player), and these points determine the stats of the weapon.
 *  
 */
var object  = argument0;
var points  = argument1;

// get a list of all child objects belonging to our weapon.
var rootInst            = instance_create(0, 0, object); // this is an abstract class but we need to instantiate to get values
var newWeapon           = rootInst;
var numberOfChildren    = 0;
var childClasses        = rootInst.childClasses;
var hierarchy           = rootInst.hierarchy;
var prevHierarchy       = 0;
var nextWeapon          = -1;

// drill down until we reach an instantiable level weapon
while (hierarchy > 0) {
    prevHierarchy = hierarchy;
    numberOfChildren = ds_list_size(childClasses);
    
    if (numberOfChildren > 0) {
        if exists(newWeapon) then instance_destroy(newWeapon);
        var choices = (numberOfChildren);
        var choice  = 0;
        
        // e.g. choose a random SWORD = Cutlass, Rapier, etc.
        for(var i=(numberOfChildren-1); i>=0; i--) {
            choice = irandom(i); // random chance of picking i.
        }
        
        nextWeapon = ds_list_find_value(childClasses, choice);
        newWeapon  = instance_create(0, 0, nextWeapon);
        
        hierarchy = newWeapon.hierarchy;
        childClasses = newWeapon.childClasses;
    }
    
    if (hierarchy >= prevHierarchy) {
        show_message("Error in weapon hierarchy logic: " +string(object_get_name(newWeapon.object_index)));
        break;
    }
}


var weightedChance;
weightedChance[0] = 100;
weightedChance[1] = 40;
weightedChance[2] = 15;
weightedChance[3] = 5;



var tier = 0;
for(i_tier=global.MAX_WEAPON_TIER; i_tier>0; i_tier--) {
    if (points >= global.LOOT_WEAPON_TIER_COST * i_tier) {
        var chance = (irandom(floor(100/weightedChance[i_tier])));
        if (chance <= 0) {
            points -= global.LOOT_WEAPON_TIER_COST * i_tier;
            newWeapon.tier = i_tier;
            break;
        }
    }
}

// enchantments / modifications e.g "Burning", "Rifled", "Tempered"
// NOTE! THIS SPENDS ALL THE REMAINING POINTS! IF YOU ADD SOMETHING THAT USES POINTS, ADD IT BEFORE THIS!
var tempList = ds_list_create();
ds_list_copy(tempList, object.possibleModifiers);

while((points >= global.LOOT_WEAPON_MODIFIER_COST) and (ds_list_size(tempList) > 0)) {
    points -= global.LOOT_WEAPON_MODIFIER_COST;
    var pos      = irandom(ds_list_size(tempList)-1);
    var modifier = ds_list_find_value(tempList, pos); // choose a modifier
    
    var chance = irandom(global.LOOT_WEAPON_MODIFIER_CHANCE); // roll for that modifier
    if (chance == 0) {
        ds_list_add(newWeapon.modifiers, modifier);
        ds_list_delete(tempList, pos);
    }
}


// clean up
instance_destroy(rootInst, false);

with(newWeapon) {
    event_user(0);
}

return newWeapon;
