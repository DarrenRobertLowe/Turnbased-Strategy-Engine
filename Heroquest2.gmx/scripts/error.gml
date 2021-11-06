/// error(String, abort?)
/* Shows an error
 * adds it to the log
 * shows it in the debugger
 * optionally aborts the game
 */

var message = argument0;
var abort   = argument1

show_error(message, abort);
log(message, true);
