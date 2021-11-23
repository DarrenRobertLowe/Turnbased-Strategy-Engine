/// AI_check_getScared(instance id);
/* Returns boolean
*/

var unit = argument0;

if (hpInDanger(unit))
{
    if (roll(1, unit.fortitude) < global.hpScareThrowDifficulty)
    {
        return true;
    }
}

