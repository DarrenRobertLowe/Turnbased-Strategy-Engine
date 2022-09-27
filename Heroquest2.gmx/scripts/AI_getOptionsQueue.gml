///AI_getOptionsQueue();

options = ds_queue_create();
var size = ds_list_size(AI_ActionOrder);

for(var i=0; i<size; i++) {
    var value = ds_list_find_value(AI_ActionOrder, i);
    ds_queue_enqueue(options, value);
}


