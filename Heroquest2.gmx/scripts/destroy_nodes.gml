/// destroy_nodes();
/* @Returns void
 * Destroys all existing NODE instances.
 */

for(var i=0; i<ds_map_size(global.NODES); i++) {
    var item = ds_map_find_first(global.NODES);
    ds_map_delete(global.NODES, item);
    
    with(item) {
        instance_destroy(item, false);
    }
}

ds_map_clear(global.NODES);
