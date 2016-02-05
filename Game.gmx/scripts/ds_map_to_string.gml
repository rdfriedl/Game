///builds a string out of a map
var ds_map = argument0;
var size = ds_map_size(ds_map) - 1;
var first = ds_map_find_first(ds_map);
var str = '====='+string(ds_map)+'=====';
for (var i = 0; i < size; i++;){
    var value = ds_map_find_value(ds_map,first);
    
    if(ds_exists(value,ds_type_map)){
        str += '\n';
        var space = '     ';
        var strLvl2 = space+'====='+string(value)+'=====';
        var sizeLvl2 = ds_map_size(value) -1;
        var firstLvl2 = ds_map_find_first(value);
        for(var k = 0; k < sizeLvl2; k +=1){
            strLvl2 += '\n'+space+string(firstLvl2)+': '+string(ds_map_find_value(value,firstLvl2));
            firstLvl2 = ds_map_find_next(value, firstLvl2)
        }
        
        value = strLvl2;
    }
    
    str += '\n'+first + ': ' + value;
    first = ds_map_find_next(ds_map, first);
}
return str;
