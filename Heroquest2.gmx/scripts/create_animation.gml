///create_animation(animation);
var type = argument0;

if (type == "heal") {
    var animation        = anim_bubbles;
    var colour           = c_lime;
    var alpha            = 0.5;
    var animTimeToLive   = room_speed;
    
    var spellAnim = instance_create(target.x, target.y, SPELL_ANIMATION);
    spellAnim.alpha = alpha;
    spellAnim.colour = colour;
    spellAnim.animation = animation;
    spellAnim.animSpeed = 1;
    spellAnim.timeToLive = animTimeToLive;
    spellAnim.direction = 90;
    spellAnim.speed = 1;
    
    with(spellAnim) {
        event_user(0);  // sets all the above
    }
}
