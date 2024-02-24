///reapplyAfflictions();

if (exists(global.TURN)) {
    with (global.TURN) {
        reapplyAfflictions();
    }
} else sout("Attempted to set turn to non existant entity: " +string(global.TURN) + "!");

