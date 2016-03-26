var index = ds_map_find_first(global.power_grids);
var size = ds_map_size(global.power_grids);
for(var i = 0; i < size; i += 1){
    if(index != undefined && ds_exists(index,ds_type_map)){
        ds_map_clear(index);
    }
    
    index = ds_map_find_next(global.power_grids, index)
}
