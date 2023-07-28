///AI_getOptionsQueue();
// create if it doesn't exist yet

if (variable_instance_exists(id, "options")) {
    if (ds_exists(options, ds_type_queue)) {
        ds_queue_clear(options);        // freshen the queue
    } else {
        options = ds_queue_create();    // else create the queue
    }
} else {
    options = ds_queue_create();        // else create the queue
}

 
// fill the "options" queue
var size = ds_list_size(AI_ActionOrder);

for(var i=0; i<size; i++) {
    var value = ds_list_find_value(AI_ActionOrder, i);
    ds_queue_enqueue(options, value);
}
