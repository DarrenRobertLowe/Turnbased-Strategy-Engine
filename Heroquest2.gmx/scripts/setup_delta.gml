/// setup_delta();

global.actual_delta = (delta_time / MILLION);
global.target_delta = (1 / global.options_TargetFPS);
global.delta_multiplier = (global.actual_delta / global.target_delta);
global.deltaTimeScale = 1; // this can be manipulated to slowdown or speed up game.
