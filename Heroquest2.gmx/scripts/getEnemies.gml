///getEnemies();

// Create a list of all valid targets
// note: "other" in this context is the caller of this script
with (ENTITY) {
    if (team != other.team) and (team != "fire") {
        ds_list_add(other.listOfTargets, id);
    }
}
