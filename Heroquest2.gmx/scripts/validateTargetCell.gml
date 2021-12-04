/// validateTargetCel(targetColumn, targetRow);

if (targetColumn  < 0)
or (targetRow     < 0) 
or (targetColumn  > (gridWidth  -1))
or (targetRow     > (gridHeight -1))
{
    return false;
}
else
{
    return true;    
}
