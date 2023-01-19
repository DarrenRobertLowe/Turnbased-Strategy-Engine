///ENEMY_AI()
debug = true;

if (attackAnim == "") {
    if (global.TURN == id) {
        CAMERA.target = id;
        
        if !(MOVING) {
            // DEBUG 
            hpBase = 20;
            hp = 8;
            // 
            
            var option = ds_queue_dequeue(options);    // get the first preference
            debug_message("The next option in the queue is " + string(option));
            
            
            // if we did anything other than move, our turn is over
            if (actedThisTurn) 
            or (option == AI_OPTIONS.EndTurn) {
                debug_message("Ending our turn");
                endTurn();
            } else {
                /// setup
                var target      = -1;           // the target we want to attack
                var targetCell  = -1;           // the actual cell we're moving to
                ds_list_clear(listOfTargets);
                ds_list_clear(listOfCells);
                
                var diagonals = false;          // this will based on weapon
                
                
                /// Decide what action to take
                // Create a list of all valid targets
                if (listOfTargetsFilled == false) {
                    getEnemies();
                }
                
                // is this moving away from target? (e.g. for archers)
                /*
                if (option == AI_OPTIONS.Distance) {
                    show_debug_message("WE'RE GOING THE DISTANCE");
                    movedThisTurn = true;
                }
                */            
                
                // PERFORM AN ACTION
                debug_message("considering action...");
                
                
                // ADVANCE
                if (option == AI_OPTIONS.Advance) {
                    if (!movedThisTurn) {
                        debug_message("considering moving...");
                        
                        // pathfinding
                        listOfCells = sortTargetsAdjacentCellsByClosest(listOfTargets, true, weapon.diagonal);
                        if (ds_list_size(listOfCells) > 0) {
                            show_debug_message("list of cells has a size of " + string(ds_list_size(listOfCells)));
                            var index       = ds_list_find_value(listOfCells, 0);
                            targetColumn    = extractColumnFromListOfCells(listOfCells, index);
                            targetRow       = extractRowFromListOfCells(listOfCells, index);
                            
                            
                            if (validCell(targetColumn, targetRow)) {
                                debug_message("Valid cell found, moving towards : " +string(targetColumn) +"," +string(targetRow));
                                movementPoints = move;
                                startColumn = column;
                                startRow = row;
                                goto_Square(targetColumn, targetRow);
                                path_end(); // stop the path immediately
                            } else { // invalid target 
                                show_error("Error in NPC_AI()# Target cell is outside of the world!", false);
                            }
                        } else {
                            debug_message("Couldn't find a target cell to walk to.");
                            // whether or not we moved, consider us as having moved
                            movedThisTurn = true; 
                        }
                    }
                } 
                
                
                if (option == AI_OPTIONS.Attack) {
                    // Melee?
                    if (AI_AttackType == "Melee") { // probably base this on the weapon
                        debug_message("Planning a melee attack...");
                        
                        // is there someone next to us to attack?
                        var unit = checkEnemyAdjacent(diagonals);
                        
                        if (unit > -1) {
                            debug_message("Enemy " +string(unit) + " found within attack range!");
                            
                            // attack them
                            attack_target(id, target);
                            
                            actedThisTurn = true;
                        }
                    }
                    
                    
                    // ranged attack
                    // if (!actedThisTurn)
                    // and (we have a ranged weapon)
                    // and (distance to nearest enemy > 1) {...
                }
                
                
                if (option == AI_OPTIONS.HealSelf) {
                    debug_message("Deciding if we should heal or not...");
                    // allow some variation to the decision making
                        // EXAMPLE:
                        // global.variancePercentage = .1;
                        // hpBase = 20
                        // AI_Heal_HP_Percentage = .3
                        //
                        // CALCULATION:
                        // var threshold = (20 * .3);           = 6
                        // var modifier  = ceil(20 * .1);       = 2
                        // threshold -= modifier;               = 6-2   = 4 minimum
                        // threshold += round(random((modifier * 2)); += 0-4   = 4 min, 8 max
                        //
                        // RESULT:
                        // so healing can occur anywhere <= 8 hp and is guaranteed when hp <= 4
                    var threshold = (hpBase * AI_Heal_HP_Percentage);
                    var modifier  = ceil(hpBase * global.variancePercentage);
                    threshold -= modifier;
                    threshold += round(random(modifier * 2));
        
                    //debug_message("Decided threshold is " + string(threshold));
                    
                    
                    // is there an enemy next to us?
                    var unit = checkEnemyAdjacent(false);
                    
                    
                    if (hp <= threshold) {
                    // and (mp > requirement)
                    // or (inventory contains potion)
                        debug_message("Healing Self!");
                        hp = hpBase;
                        actedThisTurn = true;
                    }
                }
            }
        } // global.TURN == id
    
    
    
        // MOVEMENT
        if (MOVING) {
            CURSOR.MODE = MODES.waiting;                // make cursor wait while we move
            
            
            // FINISHED
            //if  ((column == targetColumn)
            //and (row == targetRow))
            if (movementPoints <= 0) {
                show_debug_message("we're done moving!");
                movementPoints = 0;
                CURSOR.MODE = MODES.finishing;          // return control to the cursor
                MOVING = false;
                distanceToNextCell = 0;
                updateGrid(id, startColumn, startRow, column, row); // targetColumn, targetRow);   // empty old coords and add id to new position.
            } else {
                /// NOT FINISHED
                
                // before moving to the next cell
                if (distanceToNextCell <= 0) {
                    show_debug_message("column: " +string(column) + "    row: " + string(row));
                    
                    
                    
                    // RECALCULATE THE ULTIMATE PATH
                    var index       = ds_list_find_value(listOfCells, 0);
                    targetColumn    = extractColumnFromListOfCells(listOfCells, index);
                    targetRow       = extractRowFromListOfCells(listOfCells, index);
                    goto_Square(targetColumn, targetRow);
                    path_end(); // stop the path immediately
                    
                    
                    // if we're already there, we can stop
                    if  (row    = targetRow)
                    and (column = targetColumn) {
                        show_debug_message("Final destination reached!");
                        movementPoints = 0;
                    } else {
                        show_debug_message("Not there yet...");
                        
                        
                        // calculate the direction we should go
                        var xx  = path_get_point_x(myPath, 1);
                        var yy  = path_get_point_y(myPath, 1);
                        var dir = point_direction(x,y,xx,yy);
                        
                        // take it one cell at a time
                        switch (dir) {
                            case 0:     // right
                                goto_Square(column+1, row);
                                break;
                            
                            case 180:   // left
                                goto_Square(column-1, row);
                                break;
                                
                            case 90:    // up
                                goto_Square(column, row-1);
                                break;
                                
                            case 270:   // down
                                goto_Square(column, row+1);
                        }
                        
                        
                        // start the new path
                        path_start(myPath, delta(global.movementSpeed), path_action_stop, true);
                        distanceToNextCell = 1;
                        
                        update_direction();
                        
                        show_debug_message("dir: " + string(dir));
                        show_debug_message("movementPoints: " + string(movementPoints));
                    }
                }
            }
        }
    }
}
