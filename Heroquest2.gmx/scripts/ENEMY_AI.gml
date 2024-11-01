///ENEMY_AI()
debug = true;

if (attackAnim == "") {
    if (global.TURN == id) {
        if (waitTime <= 0) {
            CAMERA.target = id;
            
            if !(MOVING) {
                var option = ds_queue_dequeue(options);     // get the first preference
                
                /// END TURN
                if (actedThisTurn)
                or (option == AI_OPTIONS.EndTurn)
                or (option == undefined) {
                    if (waitTime <= 0) {
                        sout("Ending turn");
                        if (actedThisTurn) {
                            sout("...because we already acted");
                        }
                        CURSOR.MODE = MODES.finishing;
                    }
                
                /// TURN
                } else {
                    // setup
                    var target      = -1;           // the target we want to attack
                    var targetCell  = -1;           // the actual cell we're moving to
                    ds_list_clear(listOfTargets);
                    ds_list_clear(listOfCells);
                    
                    /// Decide what action to take
                    // Create a list of all valid targets
                    if (listOfTargetsFilled == false) {
                        getEnemies();
                        other.target = ds_list_find_value(other.listOfTargets, 0); // select the first target
                    }
                    
                    
                    ///// PERFORM AN ACTION /////
                    
                    /// MOVEMENT
                    if (!movedThisTurn) {
                        if (option == AI_OPTIONS.EscapeFire) {
                            if (considerFireEscape()) {
                                AI_EscapeFire();    // ESCAPE FIRE
                            }
                        } else if (option == AI_OPTIONS.Advance) {
                            movedThisTurn = true;
                            AI_tryAdvance();    // ADVANCE
                        }
                    }

                    
                    // ATTACK
                    if (option == AI_OPTIONS.Attack) {
                        sout("Considering attacking...");
                        
                        if (ds_list_find_index(weapon.actions, "ATTACK") > -1) {

                            listOfTargets = getValidTargets(weapon.range, weapon.diagonal, listOfTargets);
                            
                            if (ds_list_size(listOfTargets) > 0) {
                                var unit = getTargetWithLowestHP(listOfTargets); // this could be dependant on the unit themselves, they might have a different preference
                                
                                if (unit > -1) {
                                    if !(attackDirectionIsBlocked(x, y, unit.x, unit.y, unit)) {    // check for a clear path and no obstacles
                                    
                                        attack_target(id, unit);
                                        actedThisTurn = true;
                                        
                                        // IF A FIREARM THEN REMOVE ATTACK AND ADD RELOAD
                                        if (weapon.type = "Musket" or weapon.type = "Pistol") {
                                            sout("******* replacing ATTACK with RELOAD ******");
                                            var ind = ds_list_find_index(weapon.actions, "ATTACK");
                                            if (ind > -1) then ds_list_delete(weapon.actions, ind);
                                            ds_list_add_unique(weapon.actions, "RELOAD");
                                        }
                                        
                                    } else {
                                        sout("Can't attack, that direction is blocked.");
                                    }
                                } else {
                                    sout("something went wrong while sorting units by lowest HP");
                                }
                            } else {
                                sout("No enemy within range of our attack.");
                            }
                        } // end of ATTACK is an option
                        
                        else {
                            // RELOAD
                            sout("Can't attack, will check if we need to reload");
                            
                            if (ds_list_find_index(weapon.actions, "RELOAD") > -1) {
                                actedThisTurn = true;
                                sout("Reloading...");
                                var ind = ds_list_find_index(weapon.actions, "RELOAD");
                                if (ind > -1) then ds_list_delete(weapon.actions, ind);
                                ds_list_add_unique(weapon.actions, "ATTACK");
                            }
                        }
                    } // end of attack
                    
                    
                    /*
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
                        
                        debug_message("Decided health threshold is " + string(threshold));
                        
                        
                        // is there an enemy next to us?
                        var unit = checkEnemyAdjacent(false);
                        
                        
                        if (hp <= threshold) {
                        // and (mp > requirement)
                        // or (inventory contains potion)
                         //   debug_message("Healing Self!");
                            hp = hpBase;
                            actedThisTurn = true;
                        }
                    } // end of heal
                    */
                    
                } // end of turn
            } // if !(MOVING)
            
            
        } // waitTime <= 0
    } // global.TURN == id
} // attackAnim == ""
