///ENEMY_AI()
debug = true;
if (global.PAUSED == false) {
    if (attackAnim == "") {
        if (global.TURN == id) {
            if (waitTime <= 0) {
                CAMERA.target = id;
                
                
                if !(MOVING) {
                    /// END TURN
                    if (actedThisTurn) {
                        
                        actedThisTurn = false;
                        CURSOR.MODE = MODES.finishing;
                    /// TURN
                    } else {
                        // spread
                        if (hp > 1) {
                            FIRE_AI_trySpread(id);
                        }
                        
                        // damage stuff
                        var floortile = ds_grid_get(global.FLOOR_GRID, column, row);
                        var platform  = ds_grid_get(global.PLATFORM_GRID, column, row);
                        var unit      = ds_grid_get(global.GRID, column, row);
                        
                        if (unit > 0) {                 // damage units
                            burn(unit, 1);
                        }
                         
                        if (platform > 0) {             // hit any platform first
                            show_message("yep, burning a platform");
                            burn(platform, 1);
                        } else if (floortile > 0) {     // only if there's no platform burn the floor
                            ds_grid_set(global.FLOOR_GRID, column, row, floortile-1);
                        }
                        
                        actedThisTurn = true;
                        waitTime = delta(global.delay_short);
                        
                        // reduce lifespan
                        hp -= global.fireDieSpeed; // see setup_combat_rules();
                        floortile = ds_grid_get(global.FLOOR_GRID, column, row);
                        if ((hp <= 0) or (floortile <= 0)) {
                            kill(id);
                        }
                    } // turn
                    
                } // not moving
            } // waitTime <= 0
        } // global.TURN == id
    } // attackAnim == ""
} // not paused
