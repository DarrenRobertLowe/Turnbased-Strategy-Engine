///cursorTargetControls();

if (selected > -1) {
    
    // up or left
    if (global.controls_up)
    or (global.controls_left) {
        selected.targetIndex--;
        
        if (selected.targetIndex < 0)
          then selected.targetIndex = (ds_list_size(selected.listOfTargets)-1);
        
        sout("targetIndex is " + string(selected) + " : " + string(selected.id));
        for(var i=0; i<ds_list_size(selected.listOfTargets); i++){
            sout("list of targets:");
            sout(ds_list_find_value(selected.listOfTargets, i));
            sout("-----");
        }
        
        attackTarget = ds_list_find_value(selected.listOfTargets, selected.targetIndex);
    }
    
    
    // down or right
    if (global.controls_down)
    or (global.controls_right) {
        selected.targetIndex++;
        
        if (selected.targetIndex > (ds_list_size(selected.listOfTargets)-1))
          then selected.targetIndex = 0;
        
        sout("targetIndex is " + string(selected) + " : " + string(selected.id));
        for(var i=0; i<ds_list_size(selected.listOfTargets); i++){
            sout("list of targets:");
            sout(ds_list_find_value(selected.listOfTargets, i));
            sout("-----");
        }
        
        attackTarget = ds_list_find_value(selected.listOfTargets, selected.targetIndex);
    }
    
    
    // Always...
    if (attackTarget > -1) {
        CURSOR.column = attackTarget.column;
        CURSOR.row = attackTarget.row;
    } else {
        show_debug_message("no valid targets to attack");
        MODE = MODES.free;
    }
}
