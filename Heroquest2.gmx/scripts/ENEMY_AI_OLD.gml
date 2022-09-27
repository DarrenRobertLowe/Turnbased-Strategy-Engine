///ENEMY_AI()
debug = true;

if (global.TURN == id) 
and (MOVING == false) {

    /// setup
    var target      = -1;           // the target we want to attack
    var targetCell  = -1;           // the actual cell we're moving to
    ds_list_clear(listOfTargets);
    ds_list_clear(listOfCells);
    
    var diagonals = false;          // this will based on weapon
    
    /// Decide what action to take
    // Create a list of all valid targets
    if (listOfTargetsFilled == false) {
        debug_message("creating a list of targets...");
        with (ENTITY) {
            if (team != other.team) {
                ds_list_add(other.listOfTargets, id);
            }
        }
    }
    
    
    
    // if we did anything other than move, our turn is over
    if (actedThisTurn) {
        debug_message("Ending our turn");
        endTurn();
    } else if (!movedThisTurn) {    // MOVE ?
        debug_message("considering moving...");
        
        listOfCells = sortTargetsAdjacentCellsByClosest(listOfTargets, true, false);//weapon.diagonals);
        
        if (ds_list_size(listOfCells) > 0) {
            var index       = ds_list_find_value(listOfCells, 0);
            targetColumn    = extractColumnFromListOfCells(listOfCells, index);
            targetRow       = extractRowFromListOfCells(listOfCells, index);
            
            
            // validate target cell
            //if (isOurCell(targetColumn, targetRow)) {
            //    debug_message("Already in best position.");
            //    movedThisTurn = true;
            //} else {
                if (validCell(targetColumn, targetRow)) { // prevents needlessly "moving" to our own cell
                    debug_message("Valid cell found, moving towards : " +string(targetColumn) +"," +string(targetRow));
                    movedThisTurn = true;
                    goto_Square(targetColumn, targetRow);
                } else { // invalid target 
                    show_error("Error in NPC_AI()# Target cell is outside of the world!", false);
                }
            //}
        } else {
            debug_message("Couldn't find a target cell to walk to.");
        }
        
        // whether or not we moved, consider us as having moved
        movedThisTurn = true;
    } else {
        // PERFORM AN ACTION
        debug_message("considering what to do...");
        
        /// ATTACK?
        // Melee?
        if (AI_AttackType == "Melee") { // probably base this on the weapon
            debug_message("Planning a melee attack...");
            
            // can we attack anyone?
            var unit = checkEnemyAdjacent(diagonals);
            
            if (unit > -1) {
                debug_message("Enemy " +string(unit) + " found within attack range!");
                
                // attack them
                debug_message("Attacking!");
                actedThisTurn = true;
            }
        }
        
        // ranged attack
        // if (!actedThisTurn) {...
        
        // no matter what, set it so that we've acted
        actedThisTurn = true;
    }
} // global.TURN == id
