/// gridpath_ignore_fire();

var ignoreList = argument0;

with (FIRE) {
    if ! (ds_list_find_index(ignoreList, id)) {
        ds_list_add(ignoreList, id);
    }
}

return ignoreList;
