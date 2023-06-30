/// spawn_fire(targetColumn, targetRow, hp);

var targetColumn = argument0;
var targetRow = argument1;
var hp = argument2;

var newFire = spawn(targetColumn, targetRow, FIRE, 0, true); // spawn a new FIRE


if (exists(newFire)) {
    newFire.hp = hp;   // setting the power of the flame
}
