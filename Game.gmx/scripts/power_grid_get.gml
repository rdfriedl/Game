if(ds_map_exists(global.power_grids,argument0)){
    return ds_map_find_value(global.power_grids,argument0);
}
else{
    var grid = ds_map_create();
    power_grid_set(argument0,grid);
    return grid;
}
