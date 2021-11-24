///NPC_AI()

if (global.TURN == id)
{
    if  (walkedThisTurn == false)
    and (MOVING == false)
    {
        show_debug_message("we're decided what to do...");
        /// setup
        var target = -1;                // the target we want to attack
        var targetCell = -1;            // the actual cell we're moving to
        ds_list_clear(listOfTargets);
        ds_list_clear(listOfCells);
        
        
        /// Decide what action to take
        
        /*
        // Are we scared?
        if (AI_getsScared == true)
        {
            AI_isScared = AI_check_getScared(); // calculation to see if we're scared because of low hp
        }
        
        // keep outside of above check so we can cast fear spells, etc.
        if (AI_isScared == true)
        {
            /// RUN AWAY!
            // create a path that's furthest from any enemy
            // not sure how we'll work that out.
            show_debug_message("enemy "+string(id)"+ is scared!");
            endTurn();
        }
        */
        //else // enemy not scared
        //{
            // Create a list of all valid targets
            if (listOfTargetsFilled == false)
            {
                show_debug_message("creating a list of targets");
                with (ENTITY)
                {
                    if (team != other.team)
                    {
                        ds_list_add(other.listOfTargets, id);
                    }
                }
            }
            
            // Melee?
            if (AI_AttackType == "Melee") // probably base this on the weapon
            {
                show_debug_message("We're planning a melee attack");
                // can we attack anyone?
                // check adjacent cells for an enemy
                // attack them
                // no enemy? Let's move...
                
                
                // try to move towards a target we can attack
                /*
                if (preferredTarget = AI_TARGET_CHOICES.lowestHP)
                {
                    sortTargetsByLowestHP(listOfTargets);
                    
                    if (ds_list_size(listOfTargets) > 0)
                    {
                        target = ds_list_find_value(listOfTargets,0);
                    }
                }
                
                if (preferredTarget = AI_TARGET_CHOICES.helpless)
                {
                    sortTargetsByHelplessness(listOfTargets);
                }
                */
                
                //if (target = -1)
                //{
                    var includeDiagonals = false;   // if we're a spear user, includeDiagonals = true;
                    
                    listOfCells = sortTargetsAdjacentCellsByClosest(listOfTargets, true, false);
                    
                    if (ds_list_size(listOfCells) > 0)
                        var cell = ds_list_find_value(listOfCells, 0);
                        targetColumn = extractColumnFromListOfCells(listOfCells, cell);
                        targetRow = extractRowFromListOfCells(listOfCells, cell);
                        
                        walkedThisTurn = true;
                        goto_Square(targetColumn, targetRow);
                    }
                    else
                    {
                        endTurn();
                    }
                //}
        //} // not scared
    } // walkedThisTurn == false
    else
    {
        endTurn();
    }
} // global.TURN == id
