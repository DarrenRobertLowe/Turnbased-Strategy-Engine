///entityIsUnit(id);

var entity = argument0;

if
  (entity.object_index == HERO)
    or
  (entity.object_index == ENEMY)
    or
  (entity.object_index == NPC)
    or
  (object_is_ancestor(entity.object_index, HERO)) 
    or
  (object_is_ancestor(entity.object_index, ENEMY))
    or
  (object_is_ancestor(entity.object_index, NPC)) {
    return true;
} else {
    return false;
}
