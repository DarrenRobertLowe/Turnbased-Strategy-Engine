///blockingVisibility(instance a, instance b);
/* Returns boolean
 * Determines if a is blocking the player's visibility of b.
*/

var a = argument0;
var b = argument1;

if !exists(a) return false;
if !exists(b) return false;

var aX = getXFromColumn(a.column);
var aY = getYFromRow(a.row);
var bX = getXFromColumn(b.column);
var bY = getYFromRow(b.row);

var aCol = getColumnFromX(aX);
var aRow = getRowFromY(aY);
var bCol = getColumnFromX(bX);
var bRow = getRowFromY(bY);

if  (instance_exists(argument0))
and (instance_exists(argument1))
and (height > 1)
{
    if  ( aCol == bCol)
    and ( aRow == bRow)
    {  
        return true;
    }
    
    
    
    if  ( aCol == (b.column + 1))
    and ( aRow == (bRow + 1))
    {  
        return true;
    }
    
    if  ( aCol == bCol)
    and ( aRow == (bRow + 1))
    {  
        return true;
    }
    
    if  ( aCol == (b.column + 1))
    and ( aRow == (bRow))
    {  
        return true;
    }
    
    if  ( aCol == (b.column + 2))
    and ( aRow == (bRow +1))
    {  
        return true;
    }
}

return false;
