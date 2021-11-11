/// getFacingAsString(facing);

var facing = argument0;

switch(facing)
{
    case 0:
        return "north";
        break;
        
    case 1:
        return "west";
        break;
        
    case 2:
        return "south";
        break;
        
    case 3:
        return "east";
        break;
        
    default:
        return "invalid";
        break;
}
