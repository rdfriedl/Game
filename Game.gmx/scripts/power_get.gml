if(ds_map_exists(power_room_grid(),argument0)){
    return ds_map_find_value(power_room_grid(),argument0);
}
else{
    ds_map_add(power_room_grid(),argument0,true);
    return true;
}
