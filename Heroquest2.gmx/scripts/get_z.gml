/// get_z();
/* adjusts z value for standing on top of 
 * objects such as platforms.
 */

z = 0;


// check all PLATFORM objects for a collision
var list = floorCollisionList;
ds_list_clear(list);

with (PLATFORM)
{
    if collision_rectangle(bbox_left+8, bbox_top+8, bbox_right-8, bbox_bottom-8, other, false, true)
    {
        var listy = other.floorCollisionList;
        if (ds_list_find_index(list, id) == -1)
            then ds_list_add(list, id);
    }
}

for(var i=0; i<ds_list_size(list); i++)
{
    var floorObj = ds_list_find_value(list, i);
    
    if (floorObj.height > z) then z = (floorObj.height + z_offset); // +z_offset otherwise the unit appears to walk through the platform
}
