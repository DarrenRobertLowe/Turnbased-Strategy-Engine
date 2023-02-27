///getEnemies();

// Create a list of all valid targets
debug_message("creating a list of targets...");
with (ENTITY) {
    if (team != other.team) {
        ds_list_add(other.listOfTargets, id);
        other.target = ds_list_find_value(other.listOfTargets, 0); // select the first target
        
        //show_message("paused. Check targets for " + string(other.id));
    }
}
