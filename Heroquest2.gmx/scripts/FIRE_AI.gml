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
                        if (hp > 1) {
                            FIRE_AI_trySpread(id);
                        }
                        
                        actedThisTurn = true;
                        waitTime = delta(global.delay_short);
                        
                        // reduce lifespan
                        hp -= global.fireDieSpeed; // see setup_combat_rules();
                        
                        if (hp <= 0) {
                            kill(id);
                        }
                    } // turn
                    
                } // not moving
            } // waitTime <= 0
        } // global.TURN == id
    } // attackAnim == ""
} // not paused
