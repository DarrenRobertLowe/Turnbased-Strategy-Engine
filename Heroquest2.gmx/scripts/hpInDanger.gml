///hpInDanger(instance id);
/* Returns boolean
 */
var unit = argument0;

if (AI_getsScared == false) then return false;


if (unit.hp < (unit.hpBase * global.hpDangerPercentage))
{
    return true;
}



// otherwise return false
return false;
