if(ds_exists(global.rooms_visited,ds_type_map)){
    if(ds_map_exists(global.rooms_visited,room_get_name(argument0))){
        return ds_map_find_value(global.rooms_visited,room_get_name(argument0));
    }
}
return false;
