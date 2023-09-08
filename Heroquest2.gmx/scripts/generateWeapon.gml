/// generateWeapon(Object, level, points)
//  @Returns The new weapon instance id
var object  = argument0;
var level   = argument1;
var points  = argument2;

// get a list of all child objects belonging to our weapon.
var rootInst            = instance_create(0, 0, object); // we need to instantiate to get values
var newWeapon           = rootInst;
var numberOfChildren    = 0;
var childClasses        = rootInst.childClasses;
var hierarchy           = rootInst.hierarchy;
var prevHierarchy       = 0;
var nextWeapon              = -1;

// drill until we reach a top level weapon
while (hierarchy > 0) {
    prevHierarchy = hierarchy;
    numberOfChildren = ds_list_size(childClasses);
    
    if (numberOfChildren > 0) {
        if exists(newWeapon) then instance_destroy(newWeapon);
        var choices = (numberOfChildren);
        var choice = 0;
        
        for(var i=(numberOfChildren-1); i>=0; i--) {
            choice = irandom(i); // random chance of picking i.
            
            if (choice == i) {
                if (level >= (i*10)) { // there's a level requirement for higher tier items
                    break; // success
                }
            } else choice = 0;
        }
        
        nextWeapon = ds_list_find_value(childClasses, choice);
        newWeapon = instance_create(0, 0, nextWeapon);

        hierarchy = newWeapon.hierarchy;
        childClasses = newWeapon.childClasses;
    }
    
    if (hierarchy >= prevHierarchy) {
        show_message("Error in weapon hierarchy logic: " +string(object_get_name(newWeapon.object_index)));
        break;
    }
}

// point distribution
// quality
var qVal = irandom(75 + points); //choose(100);
var quality = 0;                  // Makeshift
if (qVal  >= 20) then quality = 1; // Common
if (qVal  >= 80) then quality = 2; // Quality
if (qVal  >= 98) then quality = 3; // Masterful

// enchantments


// apply attributes
newWeapon.level     = level;
newWeapon.quality   = quality;

// clean up
instance_destroy(rootInst,      false);

with(newWeapon) {
    event_user(0);
}

if (newWeapon.quality = 0) {
    var qualityTitle = ds_list_find_value(global.RapierQualityTitles, quality);
    show_debug_message(qualityTitle + " " + object_get_name(newWeapon.object_index));
}


return newWeapon;
