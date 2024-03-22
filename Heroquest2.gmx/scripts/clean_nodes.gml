/// clean_nodes();

var size = ds_map_size(global.NODES);

for(var i=0; i<size; i++) {
    var node = ds_map_find_first(global.NODES);
    instance_destroy(node, true);
}

