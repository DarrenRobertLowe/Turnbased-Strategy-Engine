///menu_cursor_controls();


if (global.controls_up) {
    menuPosition--;
    if (menuPosition < 0) then menuPosition = lastIndex;
}


if (global.controls_down) {
    menuPosition++;
    if (menuPosition > lastIndex) then menuPosition = 0;
}


if (global.controls_left) {
    menuPosition = lastIndex;
}

if (global.controls_right) {
    menuPosition = 0;
}

if (global.controls_cancel) {
    cursorMenuCancel();
    global.controls_cancel = 0;
}
