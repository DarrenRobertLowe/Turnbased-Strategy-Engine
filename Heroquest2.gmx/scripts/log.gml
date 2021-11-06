/// log(String, show as debug message?);
/* Writes to the log file.
 * Optionally shows the same message in the debugger.
 */

var message = argument0;
var debug = argument1;

if (debug)
{
    show_debug_message(message);
}
