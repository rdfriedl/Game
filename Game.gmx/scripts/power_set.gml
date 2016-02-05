if(ds_map_exists(power_room_grid(),argument0)){
    return ds_map_replace(power_room_grid(),argument0,argument1);
}
else{
    ds_map_add(power_room_grid(),argument0,argument1);
}
