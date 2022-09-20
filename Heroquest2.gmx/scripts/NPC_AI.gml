///NPC_AI()

if (global.TURN == id)
{
    if  (movedThisTurn == false)
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
                // can we attack anyone? // check adjacent cells for an enemy // attack them // no enemy? Let's move...
                show_debug_message("We're planning a melee attack");
                
                
                var includeDiagonals = false;               // if we're a spear user, includeDiagonals = true because we can attack diagonally
                
                listOfCells = sortTargetsAdjacentCellsByClosest(listOfTargets, true, false);
                
                
                if (ds_list_size(listOfCells) > 0)
                {
                    var index       = ds_list_find_value(listOfCells, 0);
                    targetColumn    = extractColumnFromListOfCells(listOfCells, index);
                    targetRow       = extractRowFromListOfCells(listOfCells, index);
                    
                    
                    // validate target cell
                    if (validCell(targetColumn, targetRow))
                    {
                        movedThisTurn = true;
                        goto_Square(targetColumn, targetRow);
                    }
                    else // invalid target 
                    { 
                        show_error("Error in NPC_AI()# Target cell is outside of the world!", false);
                    }
                }
                else
                {
                    show_debug_message("Couldn't find a target cell to walk to.");
                    endTurn();
                }
            }
        //} // not scared
    } // movedThisTurn == false
    else
    {
        endTurn();
    }
} // global.TURN == id
