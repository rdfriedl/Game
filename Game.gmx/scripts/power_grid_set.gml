if(ds_map_exists(global.power_grids,argument0)){
    var g = ds_map_find_value(global.power_grids,argument0);
    if(ds_exists(g,ds_type_map)){
        //delete the old map
        ds_map_destroy(g);
    }
    ds_map_replace(global.power_grids,argument0,argument1);
}
else{
    ds_map_add_map(global.power_grids,argument0,argument1);
}
