///reapplyAfflictions();
//hp      = hpBase;
//mp      = mpBase;
move        = moveBase;
attack      = attackBase;
defence     = defenceBase;
resistance  = resistanceBase;


/// apply afflictions
for(var i=0; i<ds_list_size(afflictions); i++) {
    var value = ds_list_find_value(afflictions, i);
    with(value) {
        event_user(EFFECT_EVENT);
    }
}
