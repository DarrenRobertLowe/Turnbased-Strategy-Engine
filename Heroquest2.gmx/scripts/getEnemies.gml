///getEnemies();

// Create a list of all valid targets
with (ENTITY) {
    if (team != other.team) and (team != TEAMS.fire) {
        ds_list_add(other.listOfTargets, id);
        other.target = ds_list_find_value(other.listOfTargets, 0); // select the first target
    }
}
