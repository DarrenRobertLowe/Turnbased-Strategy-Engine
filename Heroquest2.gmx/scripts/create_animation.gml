///create_animation(animation);
var effect = argument0;

if (effect == "heal") {
    var spellAnim           = instance_create(getXFromColumn(target.column), getYFromRow(target.row), SPELL_ANIMATION);
    
    // appearance
    spellAnim.isoSprite     = anim_bubbles;
    spellAnim.alpha         = 0.2;
    spellAnim.colour        = c_lime;
    
    // animation
    spellAnim.image_index   = 0;
    spellAnim.image_speed   = 1;
    
    // movement
    spellAnim.direction     = 90;   // we want the bubbles to rise
    spellAnim.speed         = 1;
    
    // lifespan
    spellAnim.timeToLive    = (room_speed * 3);
}
