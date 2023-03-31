///check_controls()
/* checks the controls to see if 
 * they're currently being pressed.
 */ 


if keyboard_check_pressed(global.controls_button_up)
  then global.controls_up = 1;
  else global.controls_up = 0;
  
if keyboard_check_pressed(global.controls_button_down)
  then global.controls_down = 1;
  else global.controls_down = 0;
  
if keyboard_check_pressed(global.controls_button_left)
  then global.controls_left = 1;
  else global.controls_left = 0;
  
if keyboard_check_pressed(global.controls_button_right)
  then global.controls_right = 1;
  else global.controls_right = 0;

if keyboard_check_pressed(global.controls_button_ok)
  then global.controls_ok = 1;
  else global.controls_ok = 0;
  
if keyboard_check_pressed(global.controls_button_cancel)
  then global.controls_cancel = 1;
  else global.controls_cancel = 0;

// access menu / pause
if keyboard_check_pressed(global.controls_button_pause)
  then global.controls_pause = 1;
  else global.controls_pause = 0;
