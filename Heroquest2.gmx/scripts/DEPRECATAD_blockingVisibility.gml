///blockingVisibility(instance a, instance b);
/* Returns boolean
 * Determines if a is blocking the player's visibility of b.
*/

var a = argument0;
var b = argument1;


if  (instance_exists(argument0))
and (instance_exists(argument1))
and (heightUnits > 1)
{
    if  ( a.column == (b.column))
    and ( a.row == (b.row))
    {  
        hue = c_yellow;
        return true;
    }
    
    
    
    if  ( a.column == (b.column + 1))
    and ( a.row == (b.row + 1))
    {  
        return true;
    }
    
    if  ( a.column == (b.column))
    and ( a.row == (b.row + 1))
    {  
        return true;
    }
    
    if  ( a.column == (b.column + 1))
    and ( a.row == (b.row))
    {  
        return true;
    }
    
    if  ( a.column == (b.column + 2))
    and ( a.row == (b.row +1))
    {  
        return true;
    }
}

return false
