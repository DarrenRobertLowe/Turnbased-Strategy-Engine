///exists(id)

instance = argument0;

if  (!is_undefined(instance)
and instance > 0
and instance_exists(instance) ) {
    return true;
}
