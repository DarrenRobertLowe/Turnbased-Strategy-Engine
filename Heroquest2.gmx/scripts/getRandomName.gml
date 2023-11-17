///getRandomName(sex);

var sex  = argument0;
var name = "Unnamed";
var list = global.maleNames;

if (sex == "Female") then list = global.femaleNames;

name = ds_list_find_value(list, irandom(ds_list_size(list)-1));
return name;
