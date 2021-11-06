if keyboard_check_pressed(vk_up)
  then global.controls_up = 1;
  else global.controls_up = 0;
  
if keyboard_check_pressed(vk_down)
  then global.controls_down = 1;
  else global.controls_down = 0;
  
if keyboard_check_pressed(vk_left)
  then global.controls_left = 1;
  else global.controls_left = 0;
  
if keyboard_check_pressed(vk_right)
  then global.controls_right = 1;
  else global.controls_right = 0;

if keyboard_check_pressed(vk_enter)
  then global.controls_ok = 1;
  else global.controls_ok = 0;
  
if keyboard_check_pressed(vk_backspace)
  then global.controls_cancel = 1;
  else global.controls_cancel = 0;
