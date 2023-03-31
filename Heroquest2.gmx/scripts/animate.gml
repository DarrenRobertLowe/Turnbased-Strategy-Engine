///animate();
/** see setup_animations()
 */
if (global.PAUSED == false) {
    
    animStart = 0;
    animEnd   = 0;
    var attackAnimSpeed = (global.animationSpeed * 0.5); // attack animations need to be slowed down
    
    
    if !(MOVING) { // standing 
        animStart = animation_stand_start;
        animEnd   = animation_stand_end;
        adjust_animation_for_direction();
        
        imageIndex += delta(attackAnimSpeed);       // 0.5 because standing animations are slower
    }
    
    if (MOVING) { // walking
        animStart = animation_walk_start;
        animEnd   = animation_walk_end;
        adjust_animation_for_direction();
        
        imageIndex += delta(global.animationSpeed);
    }
    
    
    // hurt
    if (takingDamage) {
        animStart = animation_hurt_start;
        animEnd   = animation_hurt_end;
        adjust_animation_for_direction();
        
        animTime -= delta(global.animationSpeed); // we require this because there's only 1 frame.
        
        if (animTime <= 0) then takingDamage = false;
    }
    
    
    // attacks / actions
    if (attackAnim != "") {
        switch attackAnim {
            case (attackAnimations.punch):
                animStart = animation_melee_start;
                animEnd = animation_melee_end;
                break;
            
            case (attackAnimations.slash):
                animStart = animation_slash_start;
                animEnd   = animation_slash_end;
                break;
                
            case (attackAnimations.bash):
                animStart = animation_heavy_start;
                animEnd = animation_heavy_end;
                break;
            
            case (attackAnimations.bow):
                animStart = animation_bow_start;
                animEnd = animation_bow_end;
                break;
            
            case (attackAnimations.pistol):
                animStart = animation_bow_start;
                animEnd = animation_bow_end;
            break;
            
            case (attackAnimations.rifle):
                animStart = animation_bow_start;
                animEnd = animation_bow_end;
            break;
            
            default :
                break;
        }
        
        
        // always run
        adjust_animation_for_direction();
        imageIndex += delta(attackAnimSpeed);
        if (imageIndex > animEnd) then attackAnim = "";
    }
    
    // use\cast anim
    if (attackAnim == attackAnimations.cast)
    or (attackAnim == attackAnimations.throw)
    or (attackAnim == attackAnimations.reloading) {
        animStart = animation_use_start;
        animEnd   = animation_use_end;
        adjust_animation_for_direction();
        
        animTime -= delta(global.animationSpeed); // we require this because there's only 1 frame.
        if (animTime <= 0) then attackAnim = "";
    }
    
    
    
    if (imageIndex < animStart) then imageIndex = animStart;
    if (imageIndex > animEnd)   then imageIndex = animStart;

} // not paused
